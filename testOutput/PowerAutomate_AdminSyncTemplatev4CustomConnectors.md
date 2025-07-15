# Power Automate Flow: AdminSyncTemplatev4CustomConnectors

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A8F4AD6
**Source File:** AdminSyncTemplatev4CustomConnectors-AE1EF367-1B3E-EB11-A813-000D3A8F4AD6.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4CustomConnectors
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1
- **Connections:** 5
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4CustomConnectors

start
:Trigger: When_a_record_is_created_or_updated (OpenApiConnectionWebhook);\n:Check_if_Environment_supports_inquiry (If);
 if (condition) then (yes)
  :Terminate_for_environments_that_do_not_support_inquiry (Terminate);
 endif
:Get_Custom_Connectors_and_store_them_in_CoE_CDS_Entity (Scope);
 if (condition) then (yes)
  :Filter_to_custom_connectors (Query);
  :Apply_to_each_custom_connector (Foreach);
   if (condition) then (yes)
    :Get_Custom_Connector_Record (OpenApiConnection);
    :Compose_custom_connector_guid (Compose);
    :Insert_or_Update_Custom_Connector (If);
     if (condition) then (yes)
      :Maker_Check__Edit (Workflow);
      :Check_if_Orphan__Edit (If);
       if (condition) then (yes)
        :Update_Custom_Connector_record__orphan (OpenApiConnection);
       endif
       else (no)
        :Update_Custom_Connector_record (OpenApiConnection);
       endif
     endif
     else (no)
      :Maker_Check__New (Workflow);
      :Check_if_Orphan__New (If);
       if (condition) then (yes)
        :Insert_Custom_Connector_record__orphan (OpenApiConnection);
        :Update_Record_GUID_as_String__orphan (OpenApiConnection);
       endif
       else (no)
        :Insert_Custom_Connector_record (OpenApiConnection);
        :Update_Record_GUID_as_String (OpenApiConnection);
       endif
     endif
    :Compose_isHTTP_2 (Compose);
   endif
   repeat
    :Get_Custom_Connector_Record (OpenApiConnection);
    :Compose_custom_connector_guid (Compose);
    :Insert_or_Update_Custom_Connector (If);
     if (condition) then (yes)
      :Maker_Check__Edit (Workflow);
      :Check_if_Orphan__Edit (If);
       if (condition) then (yes)
        :Update_Custom_Connector_record__orphan (OpenApiConnection);
       endif
       else (no)
        :Update_Custom_Connector_record (OpenApiConnection);
       endif
     endif
     else (no)
      :Maker_Check__New (Workflow);
      :Check_if_Orphan__New (If);
       if (condition) then (yes)
        :Insert_Custom_Connector_record__orphan (OpenApiConnection);
        :Update_Record_GUID_as_String__orphan (OpenApiConnection);
       endif
       else (no)
        :Insert_Custom_Connector_record (OpenApiConnection);
        :Update_Record_GUID_as_String (OpenApiConnection);
       endif
     endif
    :Compose_isHTTP_2 (Compose);
   repeat while (more items)
  :Get_Connectors (OpenApiConnection);
  :Apply_to_each_Connector (Foreach);
   if (condition) then (yes)
    :Get_Connector_Record (OpenApiConnection);
    :Compose_connector_upsert_guid (Compose);
    :See_if_already_in_CoE (If);
     if (condition) then (yes)
      :Maker_Check__Edit_Connector (Workflow);
      :Check_if_Orphan__Edit_Connector (If);
       if (condition) then (yes)
        :Update_Custom_Connector_orphaned (OpenApiConnection);
       endif
       else (no)
        :Update_Custom_Connector (OpenApiConnection);
       endif
     endif
     else (no)
      :Maker_Check__New_Connector (Workflow);
      :Check_if_Orphan__New_Connector (If);
       if (condition) then (yes)
        :Create_Custom_Connector_orphaned (OpenApiConnection);
       endif
       else (no)
        :Create_Custom_Connector (OpenApiConnection);
       endif
     endif
    :Compose_isHTTP (Compose);
   endif
   repeat
    :Get_Connector_Record (OpenApiConnection);
    :Compose_connector_upsert_guid (Compose);
    :See_if_already_in_CoE (If);
     if (condition) then (yes)
      :Maker_Check__Edit_Connector (Workflow);
      :Check_if_Orphan__Edit_Connector (If);
       if (condition) then (yes)
        :Update_Custom_Connector_orphaned (OpenApiConnection);
       endif
       else (no)
        :Update_Custom_Connector (OpenApiConnection);
       endif
     endif
     else (no)
      :Maker_Check__New_Connector (Workflow);
      :Check_if_Orphan__New_Connector (If);
       if (condition) then (yes)
        :Create_Custom_Connector_orphaned (OpenApiConnection);
       endif
       else (no)
        :Create_Custom_Connector (OpenApiConnection);
       endif
     endif
    :Compose_isHTTP (Compose);
   repeat while (more items)
  :Recheck_envt_still_exists_exit_if_not (Scope);
   if (condition) then (yes)
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_envtExists_false (SetVariable);
    :If_evnt_does_not_exist_exit (If);
     if (condition) then (yes)
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
   endif
   partition "Recheck_envt_still_exists_exit_if_not" {
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_envtExists_false (SetVariable);
    :If_evnt_does_not_exist_exit (If);
     if (condition) then (yes)
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
   }
  :Get_Custom_Connectors_as_Admin (OpenApiConnection);
 endif
 partition "Get_Custom_Connectors_and_store_them_in_CoE_CDS_Entity" {
  :Filter_to_custom_connectors (Query);
  :Apply_to_each_custom_connector (Foreach);
   if (condition) then (yes)
    :Get_Custom_Connector_Record (OpenApiConnection);
    :Compose_custom_connector_guid (Compose);
    :Insert_or_Update_Custom_Connector (If);
     if (condition) then (yes)
      :Maker_Check__Edit (Workflow);
      :Check_if_Orphan__Edit (If);
       if (condition) then (yes)
        :Update_Custom_Connector_record__orphan (OpenApiConnection);
       endif
       else (no)
        :Update_Custom_Connector_record (OpenApiConnection);
       endif
     endif
     else (no)
      :Maker_Check__New (Workflow);
      :Check_if_Orphan__New (If);
       if (condition) then (yes)
        :Insert_Custom_Connector_record__orphan (OpenApiConnection);
        :Update_Record_GUID_as_String__orphan (OpenApiConnection);
       endif
       else (no)
        :Insert_Custom_Connector_record (OpenApiConnection);
        :Update_Record_GUID_as_String (OpenApiConnection);
       endif
     endif
    :Compose_isHTTP_2 (Compose);
   endif
   repeat
    :Get_Custom_Connector_Record (OpenApiConnection);
    :Compose_custom_connector_guid (Compose);
    :Insert_or_Update_Custom_Connector (If);
     if (condition) then (yes)
      :Maker_Check__Edit (Workflow);
      :Check_if_Orphan__Edit (If);
       if (condition) then (yes)
        :Update_Custom_Connector_record__orphan (OpenApiConnection);
       endif
       else (no)
        :Update_Custom_Connector_record (OpenApiConnection);
       endif
     endif
     else (no)
      :Maker_Check__New (Workflow);
      :Check_if_Orphan__New (If);
       if (condition) then (yes)
        :Insert_Custom_Connector_record__orphan (OpenApiConnection);
        :Update_Record_GUID_as_String__orphan (OpenApiConnection);
       endif
       else (no)
        :Insert_Custom_Connector_record (OpenApiConnection);
        :Update_Record_GUID_as_String (OpenApiConnection);
       endif
     endif
    :Compose_isHTTP_2 (Compose);
   repeat while (more items)
  :Get_Connectors (OpenApiConnection);
  :Apply_to_each_Connector (Foreach);
   if (condition) then (yes)
    :Get_Connector_Record (OpenApiConnection);
    :Compose_connector_upsert_guid (Compose);
    :See_if_already_in_CoE (If);
     if (condition) then (yes)
      :Maker_Check__Edit_Connector (Workflow);
      :Check_if_Orphan__Edit_Connector (If);
       if (condition) then (yes)
        :Update_Custom_Connector_orphaned (OpenApiConnection);
       endif
       else (no)
        :Update_Custom_Connector (OpenApiConnection);
       endif
     endif
     else (no)
      :Maker_Check__New_Connector (Workflow);
      :Check_if_Orphan__New_Connector (If);
       if (condition) then (yes)
        :Create_Custom_Connector_orphaned (OpenApiConnection);
       endif
       else (no)
        :Create_Custom_Connector (OpenApiConnection);
       endif
     endif
    :Compose_isHTTP (Compose);
   endif
   repeat
    :Get_Connector_Record (OpenApiConnection);
    :Compose_connector_upsert_guid (Compose);
    :See_if_already_in_CoE (If);
     if (condition) then (yes)
      :Maker_Check__Edit_Connector (Workflow);
      :Check_if_Orphan__Edit_Connector (If);
       if (condition) then (yes)
        :Update_Custom_Connector_orphaned (OpenApiConnection);
       endif
       else (no)
        :Update_Custom_Connector (OpenApiConnection);
       endif
     endif
     else (no)
      :Maker_Check__New_Connector (Workflow);
      :Check_if_Orphan__New_Connector (If);
       if (condition) then (yes)
        :Create_Custom_Connector_orphaned (OpenApiConnection);
       endif
       else (no)
        :Create_Custom_Connector (OpenApiConnection);
       endif
     endif
    :Compose_isHTTP (Compose);
   repeat while (more items)
  :Recheck_envt_still_exists_exit_if_not (Scope);
   if (condition) then (yes)
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_envtExists_false (SetVariable);
    :If_evnt_does_not_exist_exit (If);
     if (condition) then (yes)
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
   endif
   partition "Recheck_envt_still_exists_exit_if_not" {
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_envtExists_false (SetVariable);
    :If_evnt_does_not_exist_exit (If);
     if (condition) then (yes)
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
   }
  :Get_Custom_Connectors_as_Admin (OpenApiConnection);
 }
:Initialize_variable_flowEnvironment (InitializeVariable);
:Initialize_variable_today (InitializeVariable);
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
:Initialize_envtExists_true (InitializeVariable);
:Delay_Object_Inventory (If);
 if (condition) then (yes)
  :Delay_1_to_300_minutes (Wait);
 endif

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_powerappsforappmakers | shared_powerappsforappmakers | admin_CoECorePowerAppsMakers | embedded |
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdmins | embedded |
| shared_powerappsforadmins | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| DelayObjectInventory (admin_DelayObjectInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse throttling. Things like solutions, apps, flows, will have delays in the individual envt runs. Default No. |

## Triggers

### When_a_record_is_created_or_updated
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Check_if_Environment_supports_inquiry | If | Operation ID: 63dea944-5e5f-41f8-afd4-50360d37b9d5 |
| Get_Custom_Connectors_and_store_them_in_CoE_CDS_Entity | Scope | Operation ID: 246a6196-0b55-46a2-a98f-7f57b68b3ed6 |
| Initialize_variable_flowEnvironment | InitializeVariable | Operation ID: b1869c0d-3d55-41d2-aba9-9ccff7c0ce47 |
| Initialize_variable_today | InitializeVariable | Operation ID: da089250-9915-4fb8-84cb-c9d3909a1cb6 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_envtExists_true | InitializeVariable | Operation ID: a8dd420b-cffa-46e8-8dd6-051717aa07c3 |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
