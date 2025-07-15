# Power Automate Flow: HELPER-ObjectOperations

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 00224826A4D2
**Source File:** HELPER-ObjectOperations-6FDA1B2D-3904-EC11-94EF-00224826A4D2.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** HELPER-ObjectOperations
- **Triggers:** 1
- **Actions:** 1 1 1 1 1
- **Connections:** 
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: HELPER-ObjectOperations

start
:Trigger: manual (Request);\n:Initialize_ReturnString (InitializeVariable);
:call_child_flow (Scope);
 if (condition) then (yes)
  :Respond_to_a_PowerApp_or_flow (Response);
  :Group_or_User (Scope);
   if (condition) then (yes)
    :Set_isGroup_variable_to_input_parameter (SetVariable);
    :Catch_paramater_missing__default_is_false (Compose);
   endif
   partition "Group_or_User" {
    :Set_isGroup_variable_to_input_parameter (SetVariable);
    :Catch_paramater_missing__default_is_false (Compose);
   }
  :see_if_app_or_flow (If);
   if (condition) then (yes)
    :Run_App_Helper_Flow (Workflow);
    :Set_ReturnString_to_fail_as_Run_App_Helper_Flow_failed (SetVariable);
    :check_if_Run_App_Helper_flow_failed (If);
     if (condition) then (yes)
      :Set_ReturnString_to_return_value_from_Run_App_Helper_Flow (SetVariable);
     endif
   endif
   else (no)
    :Run_Flow_Helper_Flow (Workflow);
    :Set_ReturnString_to_fail_as_Run_Flow_Helper_Flow_failed (SetVariable);
    :check_if_Run_Flow_Helper_flow_failed (If);
     if (condition) then (yes)
      :Set_ReturnString_to_return_value_from_Run_Flow_Helper_Flow (SetVariable);
     endif
   endif
 endif
 partition "call_child_flow" {
  :Respond_to_a_PowerApp_or_flow (Response);
  :Group_or_User (Scope);
   if (condition) then (yes)
    :Set_isGroup_variable_to_input_parameter (SetVariable);
    :Catch_paramater_missing__default_is_false (Compose);
   endif
   partition "Group_or_User" {
    :Set_isGroup_variable_to_input_parameter (SetVariable);
    :Catch_paramater_missing__default_is_false (Compose);
   }
  :see_if_app_or_flow (If);
   if (condition) then (yes)
    :Run_App_Helper_Flow (Workflow);
    :Set_ReturnString_to_fail_as_Run_App_Helper_Flow_failed (SetVariable);
    :check_if_Run_App_Helper_flow_failed (If);
     if (condition) then (yes)
      :Set_ReturnString_to_return_value_from_Run_App_Helper_Flow (SetVariable);
     endif
   endif
   else (no)
    :Run_Flow_Helper_Flow (Workflow);
    :Set_ReturnString_to_fail_as_Run_Flow_Helper_Flow_failed (SetVariable);
    :check_if_Run_Flow_Helper_flow_failed (If);
     if (condition) then (yes)
      :Set_ReturnString_to_return_value_from_Run_Flow_Helper_Flow (SetVariable);
     endif
   endif
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
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
 }
:Initialize_isGroup (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
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
| Initialize_ReturnString | InitializeVariable | Operation ID: a4d712c9-0c85-44f2-bbc1-7001be729cac |
| call_child_flow | Scope | Operation ID: 1356436e-8e40-4ba8-8d02-59ffbfee4790 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_isGroup | InitializeVariable | Operation ID: 4ac73d57-2ed1-4cd7-908e-9a568570e14e |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
