# Power Automate Flow: CLEANUPHELPER-CheckDeletedv4CustomConnectors

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A3411D9
**Source File:** CLEANUPHELPER-CheckDeletedv4CustomConnectors-2B878801-21AC-EE11-BE37-000D3A3411D9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUPHELPER-CheckDeletedv4CustomConnectors
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 5
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUPHELPER-CheckDeletedv4CustomConnectors

start
:Trigger: manual (Request);\n:Initialize_returnValue (InitializeVariable);
:Check_Deleted_Scope (Scope);
 if (condition) then (yes)
  :List_Inventory_Custom_Connectors (OpenApiConnection);
  :Recheck_envt_still_exists_exit_if_not (Scope);
   if (condition) then (yes)
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_envtExists_false (SetVariable);
    :If_evnt_does_not_exist_exit (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow__early_exit (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
   endif
   partition "Recheck_envt_still_exists_exit_if_not" {
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_envtExists_false (SetVariable);
    :If_evnt_does_not_exist_exit (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow__early_exit (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
   }
  :List_ccs_not_yet_marked_deleted (OpenApiConnection);
  :Build_array_of_custom_connectors_that_still_exist (Scope);
   if (condition) then (yes)
    :Get_Custom_Connectors_as_Admin (OpenApiConnection);
    :Get_Connectors (OpenApiConnection);
    :Filter_to_custom_connectors (Query);
    :Apply_to_each_Connector_1 (Foreach);
     if (condition) then (yes)
      :Set_ConnObject_Type_1 (SetVariable);
      :Append_to_array_variable (AppendToArrayVariable);
     endif
     repeat
      :Set_ConnObject_Type_1 (SetVariable);
      :Append_to_array_variable (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_Connector_2 (Foreach);
     if (condition) then (yes)
      :Set_ConnObject_Type_2 (SetVariable);
      :Append_to_array_variable_2 (AppendToArrayVariable);
     endif
     repeat
      :Set_ConnObject_Type_2 (SetVariable);
      :Append_to_array_variable_2 (AppendToArrayVariable);
     repeat while (more items)
    :Parse_JSON (ParseJson);
   endif
   partition "Build_array_of_custom_connectors_that_still_exist" {
    :Get_Custom_Connectors_as_Admin (OpenApiConnection);
    :Get_Connectors (OpenApiConnection);
    :Filter_to_custom_connectors (Query);
    :Apply_to_each_Connector_1 (Foreach);
     if (condition) then (yes)
      :Set_ConnObject_Type_1 (SetVariable);
      :Append_to_array_variable (AppendToArrayVariable);
     endif
     repeat
      :Set_ConnObject_Type_1 (SetVariable);
      :Append_to_array_variable (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_Connector_2 (Foreach);
     if (condition) then (yes)
      :Set_ConnObject_Type_2 (SetVariable);
      :Append_to_array_variable_2 (AppendToArrayVariable);
     endif
     repeat
      :Set_ConnObject_Type_2 (SetVariable);
      :Append_to_array_variable_2 (AppendToArrayVariable);
     repeat while (more items)
    :Parse_JSON (ParseJson);
   }
  :Filter_to_this_custom_connector (Foreach);
   if (condition) then (yes)
    :Filter_array (Query);
    :If_not_found_in_tenant_delete_or_mark_deleted (If);
     if (condition) then (yes)
      :Mark_this_cc_as_deleted_today (OpenApiConnection);
     endif
     else (no)
      :found (Compose);
     endif
   endif
   repeat
    :Filter_array (Query);
    :If_not_found_in_tenant_delete_or_mark_deleted (If);
     if (condition) then (yes)
      :Mark_this_cc_as_deleted_today (OpenApiConnection);
     endif
     else (no)
      :found (Compose);
     endif
   repeat while (more items)
  :Get_Envt_Properties (Scope);
   if (condition) then (yes)
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
   endif
   partition "Get_Envt_Properties" {
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
   }
  :Check_for_early_exit (Scope);
   if (condition) then (yes)
    :If_need_early_exit (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow__early_exit_2 (Response);
      :Terminate_for_environments_recently_deleted_2 (Terminate);
     endif
   endif
   partition "Check_for_early_exit" {
    :If_need_early_exit (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow__early_exit_2 (Response);
      :Terminate_for_environments_recently_deleted_2 (Terminate);
     endif
   }
 endif
 partition "Check_Deleted_Scope" {
  :List_Inventory_Custom_Connectors (OpenApiConnection);
  :Recheck_envt_still_exists_exit_if_not (Scope);
   if (condition) then (yes)
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_envtExists_false (SetVariable);
    :If_evnt_does_not_exist_exit (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow__early_exit (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
   endif
   partition "Recheck_envt_still_exists_exit_if_not" {
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_envtExists_false (SetVariable);
    :If_evnt_does_not_exist_exit (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow__early_exit (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
   }
  :List_ccs_not_yet_marked_deleted (OpenApiConnection);
  :Build_array_of_custom_connectors_that_still_exist (Scope);
   if (condition) then (yes)
    :Get_Custom_Connectors_as_Admin (OpenApiConnection);
    :Get_Connectors (OpenApiConnection);
    :Filter_to_custom_connectors (Query);
    :Apply_to_each_Connector_1 (Foreach);
     if (condition) then (yes)
      :Set_ConnObject_Type_1 (SetVariable);
      :Append_to_array_variable (AppendToArrayVariable);
     endif
     repeat
      :Set_ConnObject_Type_1 (SetVariable);
      :Append_to_array_variable (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_Connector_2 (Foreach);
     if (condition) then (yes)
      :Set_ConnObject_Type_2 (SetVariable);
      :Append_to_array_variable_2 (AppendToArrayVariable);
     endif
     repeat
      :Set_ConnObject_Type_2 (SetVariable);
      :Append_to_array_variable_2 (AppendToArrayVariable);
     repeat while (more items)
    :Parse_JSON (ParseJson);
   endif
   partition "Build_array_of_custom_connectors_that_still_exist" {
    :Get_Custom_Connectors_as_Admin (OpenApiConnection);
    :Get_Connectors (OpenApiConnection);
    :Filter_to_custom_connectors (Query);
    :Apply_to_each_Connector_1 (Foreach);
     if (condition) then (yes)
      :Set_ConnObject_Type_1 (SetVariable);
      :Append_to_array_variable (AppendToArrayVariable);
     endif
     repeat
      :Set_ConnObject_Type_1 (SetVariable);
      :Append_to_array_variable (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_Connector_2 (Foreach);
     if (condition) then (yes)
      :Set_ConnObject_Type_2 (SetVariable);
      :Append_to_array_variable_2 (AppendToArrayVariable);
     endif
     repeat
      :Set_ConnObject_Type_2 (SetVariable);
      :Append_to_array_variable_2 (AppendToArrayVariable);
     repeat while (more items)
    :Parse_JSON (ParseJson);
   }
  :Filter_to_this_custom_connector (Foreach);
   if (condition) then (yes)
    :Filter_array (Query);
    :If_not_found_in_tenant_delete_or_mark_deleted (If);
     if (condition) then (yes)
      :Mark_this_cc_as_deleted_today (OpenApiConnection);
     endif
     else (no)
      :found (Compose);
     endif
   endif
   repeat
    :Filter_array (Query);
    :If_not_found_in_tenant_delete_or_mark_deleted (If);
     if (condition) then (yes)
      :Mark_this_cc_as_deleted_today (OpenApiConnection);
     endif
     else (no)
      :found (Compose);
     endif
   repeat while (more items)
  :Get_Envt_Properties (Scope);
   if (condition) then (yes)
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
   endif
   partition "Get_Envt_Properties" {
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
   }
  :Check_for_early_exit (Scope);
   if (condition) then (yes)
    :If_need_early_exit (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow__early_exit_2 (Response);
      :Terminate_for_environments_recently_deleted_2 (Terminate);
     endif
   endif
   partition "Check_for_early_exit" {
    :If_need_early_exit (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow__early_exit_2 (Response);
      :Terminate_for_environments_recently_deleted_2 (Terminate);
     endif
   }
 }
:Initialize_arrayOfConnectors (InitializeVariable);
:Initialize_ConnObject (InitializeVariable);
:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Set_returnValue_to_fail (SetVariable);
  :Respond_to_a_PowerApp_or_flow_failed (Response);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Set_returnValue_to_fail (SetVariable);
  :Respond_to_a_PowerApp_or_flow_failed (Response);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
 }
:Initialize_envtExists_true (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdmins | embedded |
| shared_powerappsforadmins_1 | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |
| shared_powerappsforappmakers | shared_powerappsforappmakers | admin_CoECorePowerAppsMakers | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |

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
| Initialize_returnValue | InitializeVariable | Operation ID: 5b0e82ff-2beb-45e5-ad3e-356b5954d046 |
| Check_Deleted_Scope | Scope | Operation ID: 9b4358be-7f0d-46f2-bbe8-f43648039b5d |
| Initialize_arrayOfConnectors | InitializeVariable | Operation ID: a56ed85d-b1df-4167-b2cf-02df46a3e231 |
| Initialize_ConnObject | InitializeVariable | Operation ID: b2c6a9be-7ea9-42ab-97cf-859e89f49091 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_envtExists_true | InitializeVariable | Operation ID: a8dd420b-cffa-46e8-8dd6-051717aa07c3 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
