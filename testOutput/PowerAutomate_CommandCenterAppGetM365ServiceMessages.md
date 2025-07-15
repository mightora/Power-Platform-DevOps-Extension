# Power Automate Flow: CommandCenterAppGetM365ServiceMessages

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 002248237D7D
**Source File:** CommandCenterAppGetM365ServiceMessages-B38B49EE-41FC-EB11-94EF-002248237D7D.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CommandCenterAppGetM365ServiceMessages
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CommandCenterAppGetM365ServiceMessages

start
:Trigger: manual (Request);\n:Initialize_theTextSecret (InitializeVariable);
:Initialize_Secret_AzureType_to_true (InitializeVariable);
:Initialize_appID (InitializeVariable);
:Get_Messages (Scope);
 if (condition) then (yes)
  :Set_env_var_from_AppID (Scope);
   if (condition) then (yes)
    :ListDefnsAppID (OpenApiConnection);
    :Get_ID_from_AppID (Compose);
    :Set_to_current_or_default__AppID (If);
     if (condition) then (yes)
      :Set_AppID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AppID__DefaultValue (SetVariable);
     endif
    :ListCurrentsAppID (OpenApiConnection);
   endif
   partition "Set_env_var_from_AppID" {
    :ListDefnsAppID (OpenApiConnection);
    :Get_ID_from_AppID (Compose);
    :Set_to_current_or_default__AppID (If);
     if (condition) then (yes)
      :Set_AppID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AppID__DefaultValue (SetVariable);
     endif
    :ListCurrentsAppID (OpenApiConnection);
   }
  :Set_Secret_value_from_text_Secret (Scope);
   if (condition) then (yes)
    :ListDefnsTextSecret (OpenApiConnection);
    :Get_ID_from_text_secret (Compose);
    :Set_to_current_or_default__TextSecret (If);
     if (condition) then (yes)
      :Set_theTextSecret__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_theTextSecret__DefaultValue (SetVariable);
     endif
    :ListCurrentsTextSecret (OpenApiConnection);
   endif
   partition "Set_Secret_value_from_text_Secret" {
    :ListDefnsTextSecret (OpenApiConnection);
    :Get_ID_from_text_secret (Compose);
    :Set_to_current_or_default__TextSecret (If);
     if (condition) then (yes)
      :Set_theTextSecret__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_theTextSecret__DefaultValue (SetVariable);
     endif
    :ListCurrentsTextSecret (OpenApiConnection);
   }
  :Set_env_var_Azure_Secret (Scope);
   if (condition) then (yes)
    :Get_Azure_Secret (OpenApiConnection);
    :Set_Secret_AzureType_to_false_if_failed (SetVariable);
   endif
   partition "Set_env_var_Azure_Secret" {
    :Get_Azure_Secret (OpenApiConnection);
    :Set_Secret_AzureType_to_false_if_failed (SetVariable);
   }
  :List_serviceAnnouncements_from_Graph (Http);
  :catch__not_configured (Compose);
  :Parse_and_respond (Scope);
   if (condition) then (yes)
    :Parse_Response (ParseJson);
    :Select_Response_fields (Select);
    :Response (Response);
   endif
   partition "Parse_and_respond" {
    :Parse_Response (ParseJson);
    :Select_Response_fields (Select);
    :Response (Response);
   }
 endif
 partition "Get_Messages" {
  :Set_env_var_from_AppID (Scope);
   if (condition) then (yes)
    :ListDefnsAppID (OpenApiConnection);
    :Get_ID_from_AppID (Compose);
    :Set_to_current_or_default__AppID (If);
     if (condition) then (yes)
      :Set_AppID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AppID__DefaultValue (SetVariable);
     endif
    :ListCurrentsAppID (OpenApiConnection);
   endif
   partition "Set_env_var_from_AppID" {
    :ListDefnsAppID (OpenApiConnection);
    :Get_ID_from_AppID (Compose);
    :Set_to_current_or_default__AppID (If);
     if (condition) then (yes)
      :Set_AppID__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_AppID__DefaultValue (SetVariable);
     endif
    :ListCurrentsAppID (OpenApiConnection);
   }
  :Set_Secret_value_from_text_Secret (Scope);
   if (condition) then (yes)
    :ListDefnsTextSecret (OpenApiConnection);
    :Get_ID_from_text_secret (Compose);
    :Set_to_current_or_default__TextSecret (If);
     if (condition) then (yes)
      :Set_theTextSecret__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_theTextSecret__DefaultValue (SetVariable);
     endif
    :ListCurrentsTextSecret (OpenApiConnection);
   endif
   partition "Set_Secret_value_from_text_Secret" {
    :ListDefnsTextSecret (OpenApiConnection);
    :Get_ID_from_text_secret (Compose);
    :Set_to_current_or_default__TextSecret (If);
     if (condition) then (yes)
      :Set_theTextSecret__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_theTextSecret__DefaultValue (SetVariable);
     endif
    :ListCurrentsTextSecret (OpenApiConnection);
   }
  :Set_env_var_Azure_Secret (Scope);
   if (condition) then (yes)
    :Get_Azure_Secret (OpenApiConnection);
    :Set_Secret_AzureType_to_false_if_failed (SetVariable);
   endif
   partition "Set_env_var_Azure_Secret" {
    :Get_Azure_Secret (OpenApiConnection);
    :Set_Secret_AzureType_to_false_if_failed (SetVariable);
   }
  :List_serviceAnnouncements_from_Graph (Http);
  :catch__not_configured (Compose);
  :Parse_and_respond (Scope);
   if (condition) then (yes)
    :Parse_Response (ParseJson);
    :Select_Response_fields (Select);
    :Response (Response);
   endif
   partition "Parse_and_respond" {
    :Parse_Response (ParseJson);
    :Select_Response_fields (Select);
    :Response (Response);
   }
 }
:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Response_if_failed (Response);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Response_if_failed (Response);
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
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseForApps | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| TenantID (admin_TenantID) | String | 67c96cd6-4a95-46ee-ac9b-8ee13ae256c4 | Inventory - REQUIRED. Azure Tenant ID |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_theTextSecret | InitializeVariable | Operation ID: 8b1e1654-f936-473c-95f8-fcd9869e2f72 |
| Initialize_Secret_AzureType_to_true | InitializeVariable | Operation ID: 4fb2b304-6d7c-407e-a2c1-782ba52b4567 |
| Initialize_appID | InitializeVariable | Operation ID: 4fb2b304-6d7c-407e-a2c1-782ba52b4567 |
| Get_Messages | Scope | Operation ID: 5b2dd07e-a81a-4782-aa0d-3670573c5eed |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
