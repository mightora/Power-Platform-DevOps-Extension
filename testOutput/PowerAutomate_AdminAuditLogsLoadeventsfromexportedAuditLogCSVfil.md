# Power Automate Flow: AdminAuditLogsLoadeventsfromexportedAuditLogCSVfil

**Generated on:** 2025-07-15 19:14:46
**Flow ID:** 002248081470
**Source File:** AdminAuditLogsLoadeventsfromexportedAuditLogCSVfil-A6875DF5-55E8-ED11-A7C6-002248081470.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminAuditLogsLoadeventsfromexportedAuditLogCSVfil
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 2
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminAuditLogsLoadeventsfromexportedAuditLogCSVfil

start
:Trigger: manual (Request);\n:Load_csv_data (Scope);
 if (condition) then (yes)
  :Select (Select);
  :Data (Compose);
  :NewLine (Compose);
  :LoopFileRows (Foreach);
   if (condition) then (yes)
    :if_auditentry_not_empty (If);
     if (condition) then (yes)
      :removeslash (Compose);
      :split_to_see_if_new_format (Compose);
      :if_new_format (If);
       if (condition) then (yes)
        :AppID (Compose);
        :LaunchPowerApp_only (If);
         if (condition) then (yes)
          :GetAppInfo (OpenApiConnection);
          :DoesAppExists (If);
           if (condition) then (yes)
            :UpsertAuditLogEvent (OpenApiConnection);
            :Compose (Compose);
            :if_newer_launch_than_last_launch_then_update (If);
             if (condition) then (yes)
              :UpdateAppLastLaunchDate (OpenApiConnection);
             endif
           endif
         endif
       endif
       else (no)
        :dont_add_so_we_dont_double_count (Compose);
       endif
      :isNewFormat (Compose);
      :AuditLogID (Compose);
      :CreatedOn (Compose);
      :Operation (Compose);
      :UPN (Compose);
      :Workload (Compose);
     endif
   endif
   repeat
    :if_auditentry_not_empty (If);
     if (condition) then (yes)
      :removeslash (Compose);
      :split_to_see_if_new_format (Compose);
      :if_new_format (If);
       if (condition) then (yes)
        :AppID (Compose);
        :LaunchPowerApp_only (If);
         if (condition) then (yes)
          :GetAppInfo (OpenApiConnection);
          :DoesAppExists (If);
           if (condition) then (yes)
            :UpsertAuditLogEvent (OpenApiConnection);
            :Compose (Compose);
            :if_newer_launch_than_last_launch_then_update (If);
             if (condition) then (yes)
              :UpdateAppLastLaunchDate (OpenApiConnection);
             endif
           endif
         endif
       endif
       else (no)
        :dont_add_so_we_dont_double_count (Compose);
       endif
      :isNewFormat (Compose);
      :AuditLogID (Compose);
      :CreatedOn (Compose);
      :Operation (Compose);
      :UPN (Compose);
      :Workload (Compose);
     endif
   repeat while (more items)
 endif
 partition "Load_csv_data" {
  :Select (Select);
  :Data (Compose);
  :NewLine (Compose);
  :LoopFileRows (Foreach);
   if (condition) then (yes)
    :if_auditentry_not_empty (If);
     if (condition) then (yes)
      :removeslash (Compose);
      :split_to_see_if_new_format (Compose);
      :if_new_format (If);
       if (condition) then (yes)
        :AppID (Compose);
        :LaunchPowerApp_only (If);
         if (condition) then (yes)
          :GetAppInfo (OpenApiConnection);
          :DoesAppExists (If);
           if (condition) then (yes)
            :UpsertAuditLogEvent (OpenApiConnection);
            :Compose (Compose);
            :if_newer_launch_than_last_launch_then_update (If);
             if (condition) then (yes)
              :UpdateAppLastLaunchDate (OpenApiConnection);
             endif
           endif
         endif
       endif
       else (no)
        :dont_add_so_we_dont_double_count (Compose);
       endif
      :isNewFormat (Compose);
      :AuditLogID (Compose);
      :CreatedOn (Compose);
      :Operation (Compose);
      :UPN (Compose);
      :Workload (Compose);
     endif
   endif
   repeat
    :if_auditentry_not_empty (If);
     if (condition) then (yes)
      :removeslash (Compose);
      :split_to_see_if_new_format (Compose);
      :if_new_format (If);
       if (condition) then (yes)
        :AppID (Compose);
        :LaunchPowerApp_only (If);
         if (condition) then (yes)
          :GetAppInfo (OpenApiConnection);
          :DoesAppExists (If);
           if (condition) then (yes)
            :UpsertAuditLogEvent (OpenApiConnection);
            :Compose (Compose);
            :if_newer_launch_than_last_launch_then_update (If);
             if (condition) then (yes)
              :UpdateAppLastLaunchDate (OpenApiConnection);
             endif
           endif
         endif
       endif
       else (no)
        :dont_add_so_we_dont_double_count (Compose);
       endif
      :isNewFormat (Compose);
      :AuditLogID (Compose);
      :CreatedOn (Compose);
      :Operation (Compose);
      :UPN (Compose);
      :Workload (Compose);
     endif
   repeat while (more items)
 }
:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Get_ID_Pass (OpenApiConnection);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Get_ID_Pass (OpenApiConnection);
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Load_csv_data | Scope | Operation ID: 5b2dd07e-a81a-4782-aa0d-3670573c5eed |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
