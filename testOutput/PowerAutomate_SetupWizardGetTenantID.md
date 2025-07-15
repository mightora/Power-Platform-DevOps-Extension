# Power Automate Flow: SetupWizardGetTenantID

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 00224820C3E4
**Source File:** SetupWizardGetTenantID-CB1B637C-443E-ED11-9DB0-00224820C3E4.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** SetupWizardGetTenantID
- **Triggers:** 1
- **Actions:** 1 1 1 1
- **Connections:** 3
- **Parameters:** 0

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: SetupWizardGetTenantID

start
:Trigger: manual (Request);\n:Get_Tenant_ID_Scope (Scope);
 if (condition) then (yes)
  :Parse_JSON (ParseJson);
  :Compose (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
  :Get_Graph_API_URL (Scope);
   if (condition) then (yes)
    :Set_to_current_or_default__GraphURL (If);
     if (condition) then (yes)
      :Set_GraphURL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_GraphURL__DefaultValue (SetVariable);
     endif
    :ListCurrentsGraphURL (OpenApiConnection);
    :Get_ID_from_GraphURL (Compose);
    :ListDefnsGraphURL (OpenApiConnection);
    :If_GraphURL_still_empty_set_as_commercial (If);
     if (condition) then (yes)
      :Set_GraphURL_to_commercial_url (SetVariable);
     endif
   endif
   partition "Get_Graph_API_URL" {
    :Set_to_current_or_default__GraphURL (If);
     if (condition) then (yes)
      :Set_GraphURL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_GraphURL__DefaultValue (SetVariable);
     endif
    :ListCurrentsGraphURL (OpenApiConnection);
    :Get_ID_from_GraphURL (Compose);
    :ListDefnsGraphURL (OpenApiConnection);
    :If_GraphURL_still_empty_set_as_commercial (If);
     if (condition) then (yes)
      :Set_GraphURL_to_commercial_url (SetVariable);
     endif
   }
  :Invoke_an_HTTP_request (OpenApiConnection);
 endif
 partition "Get_Tenant_ID_Scope" {
  :Parse_JSON (ParseJson);
  :Compose (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
  :Get_Graph_API_URL (Scope);
   if (condition) then (yes)
    :Set_to_current_or_default__GraphURL (If);
     if (condition) then (yes)
      :Set_GraphURL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_GraphURL__DefaultValue (SetVariable);
     endif
    :ListCurrentsGraphURL (OpenApiConnection);
    :Get_ID_from_GraphURL (Compose);
    :ListDefnsGraphURL (OpenApiConnection);
    :If_GraphURL_still_empty_set_as_commercial (If);
     if (condition) then (yes)
      :Set_GraphURL_to_commercial_url (SetVariable);
     endif
   endif
   partition "Get_Graph_API_URL" {
    :Set_to_current_or_default__GraphURL (If);
     if (condition) then (yes)
      :Set_GraphURL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_GraphURL__DefaultValue (SetVariable);
     endif
    :ListCurrentsGraphURL (OpenApiConnection);
    :Get_ID_from_GraphURL (Compose);
    :ListDefnsGraphURL (OpenApiConnection);
    :If_GraphURL_still_empty_set_as_commercial (If);
     if (condition) then (yes)
      :Set_GraphURL_to_commercial_url (SetVariable);
     endif
   }
  :Invoke_an_HTTP_request (OpenApiConnection);
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
:Initialize_GraphURL (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_webcontents_1 | shared_webcontents | admin_CoECoreHTTPWithAzureAD | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseForApps | embedded |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Get_Tenant_ID_Scope | Scope | Operation ID: bc13dbfd-f643-4b1a-8c03-68c0796169a1 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_GraphURL | InitializeVariable | Operation ID: 69def583-4d5a-4236-b629-ccf7495158a2 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
