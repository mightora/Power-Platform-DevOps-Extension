# Power Automate Flow: AdminAuditLogsOffice365ManagementAPISubscription

**Generated on:** 2025-07-15 19:14:46
**Flow ID:** 0022480813FF
**Source File:** AdminAuditLogsOffice365ManagementAPISubscription-CCCA4A5C-21E8-ED11-A7C6-0022480813FF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminAuditLogsOffice365ManagementAPISubscription
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 4

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminAuditLogsOffice365ManagementAPISubscription

start
:Trigger: manual (Request);\n:Initialize_appID (InitializeVariable);
:Initialize_theTextSecret (InitializeVariable);
:Initialize_Secret_AzureType_to_true (InitializeVariable);
:Perform_subscription_operation (Scope);
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
  :Switch_on_operation (Switch);
 endif
 partition "Perform_subscription_operation" {
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
  :Switch_on_operation (Switch);
 }
:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__failed (Response);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__failed (Response);
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
:Initialize_Response (InitializeVariable);

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
| Audit Logs - Audience (admin_AuditLogsAudience) | String | https://manage.office.com | AuditLogs - The audience for the HTTP connector. Set by Setup wizard based on tenant type |
| Audit Logs - Authority (admin_AuditLogsAuthority) | String | https://login.windows.net | AuditLogs - The authority for the HTTP connector. Set by Setup wizard based on tenant type |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_appID | InitializeVariable | Operation ID: 4fb2b304-6d7c-407e-a2c1-782ba52b4567 |
| Initialize_theTextSecret | InitializeVariable | Operation ID: 8b1e1654-f936-473c-95f8-fcd9869e2f72 |
| Initialize_Secret_AzureType_to_true | InitializeVariable | Operation ID: 4fb2b304-6d7c-407e-a2c1-782ba52b4567 |
| Perform_subscription_operation | Scope | Operation ID: 5b2dd07e-a81a-4782-aa0d-3670573c5eed |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_Response | InitializeVariable | Operation ID: 26a85880-4080-4827-bb86-fac064445343 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
