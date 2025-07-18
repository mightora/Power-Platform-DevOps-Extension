# Power Automate Flow: AdminSyncTemplatev4DesktopFlow-Runs

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A3411D9
**Source File:** AdminSyncTemplatev4DesktopFlow-Runs-C46211B3-017D-EE11-8179-000D3A3411D9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4DesktopFlow-Runs
- **Triggers:** 1
- **Actions:** 1 1 1 1
- **Connections:** 4
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4DesktopFlow-Runs

start
:Trigger: Recurrence (Recurrence);\n:Get_RPA_Sessions (Scope);
 if (condition) then (yes)
  :Apply_to_each_environment (Foreach);
   if (condition) then (yes)
    :Continue_if_supporting_envt_type (If);
     if (condition) then (yes)
      :Catch_Org_not_found (Compose);
      :Apply_to_each_session (Foreach);
       if (condition) then (yes)
        :UniqueNameString (Compose);
        :List_Desktop_Flows_that_match_by_Unique_Name (OpenApiConnection);
        :If_exists_get_GUID_and_insert (If);
         if (condition) then (yes)
          :flowGUID (Compose);
          :if_run_orphaned (If);
           if (condition) then (yes)
            :Upsert_RPA_Session_Record_Orphan (OpenApiConnection);
           endif
           else (no)
            :Upsert_RPA_Session_Record (OpenApiConnection);
           endif
         endif
        :Get_User_Details (Scope);
         if (condition) then (yes)
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         endif
         partition "Get_User_Details" {
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         }
       endif
       repeat
        :UniqueNameString (Compose);
        :List_Desktop_Flows_that_match_by_Unique_Name (OpenApiConnection);
        :If_exists_get_GUID_and_insert (If);
         if (condition) then (yes)
          :flowGUID (Compose);
          :if_run_orphaned (If);
           if (condition) then (yes)
            :Upsert_RPA_Session_Record_Orphan (OpenApiConnection);
           endif
           else (no)
            :Upsert_RPA_Session_Record (OpenApiConnection);
           endif
         endif
        :Get_User_Details (Scope);
         if (condition) then (yes)
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         endif
         partition "Get_User_Details" {
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         }
       repeat while (more items)
      :List_RPA_Flow_Sessions (OpenApiConnection);
     endif
   endif
   repeat
    :Continue_if_supporting_envt_type (If);
     if (condition) then (yes)
      :Catch_Org_not_found (Compose);
      :Apply_to_each_session (Foreach);
       if (condition) then (yes)
        :UniqueNameString (Compose);
        :List_Desktop_Flows_that_match_by_Unique_Name (OpenApiConnection);
        :If_exists_get_GUID_and_insert (If);
         if (condition) then (yes)
          :flowGUID (Compose);
          :if_run_orphaned (If);
           if (condition) then (yes)
            :Upsert_RPA_Session_Record_Orphan (OpenApiConnection);
           endif
           else (no)
            :Upsert_RPA_Session_Record (OpenApiConnection);
           endif
         endif
        :Get_User_Details (Scope);
         if (condition) then (yes)
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         endif
         partition "Get_User_Details" {
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         }
       endif
       repeat
        :UniqueNameString (Compose);
        :List_Desktop_Flows_that_match_by_Unique_Name (OpenApiConnection);
        :If_exists_get_GUID_and_insert (If);
         if (condition) then (yes)
          :flowGUID (Compose);
          :if_run_orphaned (If);
           if (condition) then (yes)
            :Upsert_RPA_Session_Record_Orphan (OpenApiConnection);
           endif
           else (no)
            :Upsert_RPA_Session_Record (OpenApiConnection);
           endif
         endif
        :Get_User_Details (Scope);
         if (condition) then (yes)
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         endif
         partition "Get_User_Details" {
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         }
       repeat while (more items)
      :List_RPA_Flow_Sessions (OpenApiConnection);
     endif
   repeat while (more items)
  :List_Environments_from_CoE (OpenApiConnection);
 endif
 partition "Get_RPA_Sessions" {
  :Apply_to_each_environment (Foreach);
   if (condition) then (yes)
    :Continue_if_supporting_envt_type (If);
     if (condition) then (yes)
      :Catch_Org_not_found (Compose);
      :Apply_to_each_session (Foreach);
       if (condition) then (yes)
        :UniqueNameString (Compose);
        :List_Desktop_Flows_that_match_by_Unique_Name (OpenApiConnection);
        :If_exists_get_GUID_and_insert (If);
         if (condition) then (yes)
          :flowGUID (Compose);
          :if_run_orphaned (If);
           if (condition) then (yes)
            :Upsert_RPA_Session_Record_Orphan (OpenApiConnection);
           endif
           else (no)
            :Upsert_RPA_Session_Record (OpenApiConnection);
           endif
         endif
        :Get_User_Details (Scope);
         if (condition) then (yes)
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         endif
         partition "Get_User_Details" {
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         }
       endif
       repeat
        :UniqueNameString (Compose);
        :List_Desktop_Flows_that_match_by_Unique_Name (OpenApiConnection);
        :If_exists_get_GUID_and_insert (If);
         if (condition) then (yes)
          :flowGUID (Compose);
          :if_run_orphaned (If);
           if (condition) then (yes)
            :Upsert_RPA_Session_Record_Orphan (OpenApiConnection);
           endif
           else (no)
            :Upsert_RPA_Session_Record (OpenApiConnection);
           endif
         endif
        :Get_User_Details (Scope);
         if (condition) then (yes)
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         endif
         partition "Get_User_Details" {
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         }
       repeat while (more items)
      :List_RPA_Flow_Sessions (OpenApiConnection);
     endif
   endif
   repeat
    :Continue_if_supporting_envt_type (If);
     if (condition) then (yes)
      :Catch_Org_not_found (Compose);
      :Apply_to_each_session (Foreach);
       if (condition) then (yes)
        :UniqueNameString (Compose);
        :List_Desktop_Flows_that_match_by_Unique_Name (OpenApiConnection);
        :If_exists_get_GUID_and_insert (If);
         if (condition) then (yes)
          :flowGUID (Compose);
          :if_run_orphaned (If);
           if (condition) then (yes)
            :Upsert_RPA_Session_Record_Orphan (OpenApiConnection);
           endif
           else (no)
            :Upsert_RPA_Session_Record (OpenApiConnection);
           endif
         endif
        :Get_User_Details (Scope);
         if (condition) then (yes)
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         endif
         partition "Get_User_Details" {
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         }
       endif
       repeat
        :UniqueNameString (Compose);
        :List_Desktop_Flows_that_match_by_Unique_Name (OpenApiConnection);
        :If_exists_get_GUID_and_insert (If);
         if (condition) then (yes)
          :flowGUID (Compose);
          :if_run_orphaned (If);
           if (condition) then (yes)
            :Upsert_RPA_Session_Record_Orphan (OpenApiConnection);
           endif
           else (no)
            :Upsert_RPA_Session_Record (OpenApiConnection);
           endif
         endif
        :Get_User_Details (Scope);
         if (condition) then (yes)
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         endif
         partition "Get_User_Details" {
          :UserID (Compose);
          :See_if_already_in_User_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :Upsert_Power_Platform_User (OpenApiConnection);
           endif
          :Get_User (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
          :Get_User_From_SystemUsers (OpenApiConnection);
         }
       repeat while (more items)
      :List_RPA_Flow_Sessions (OpenApiConnection);
     endif
   repeat while (more items)
  :List_Environments_from_CoE (OpenApiConnection);
 }
:Initialize_today_variable (InitializeVariable);
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
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| CoE System User ID (admin_CoESystemUserID) | String | f039b642-ad47-ee11-be6d-000d3a3411d9 | in the maker table we store a user for system with an id. Storing here so that it can be referenced without having to look it up all the time. |

## Triggers

### Recurrence
- **Type:** Recurrence
- **Recurrence:** Frequency: Day, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Get_RPA_Sessions | Scope | Operation ID: bc9837c5-7dd6-4ec6-8170-9dfca182071c |
| Initialize_today_variable | InitializeVariable | Operation ID: 37475e4e-6ac2-486a-a1bf-8856ab9ac197 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
