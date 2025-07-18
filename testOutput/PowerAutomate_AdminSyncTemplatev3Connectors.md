# Power Automate Flow: AdminSyncTemplatev3Connectors

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A8F4AD6
**Source File:** AdminSyncTemplatev3Connectors-7E1DDB35-613D-EB11-A813-000D3A8F4AD6.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev3Connectors
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1
- **Connections:** 4
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev3Connectors

start
:Trigger: manual (Request);\n:Get_Connectors_and_store_in_CoE_CDS_Entity (Scope);
 if (condition) then (yes)
  :Apply_to_each_Standard_Connector (Foreach);
   if (condition) then (yes)
    :validate_standard (If);
     if (condition) then (yes)
      :Get_Connector_Record (OpenApiConnection);
      :insert_or_update (If);
       if (condition) then (yes)
        :Update_a_record (OpenApiConnection);
       endif
       else (no)
        :Create_a_new_record (OpenApiConnection);
        :Update_RecordGUIDasString (OpenApiConnection);
       endif
     endif
   endif
   repeat
    :validate_standard (If);
     if (condition) then (yes)
      :Get_Connector_Record (OpenApiConnection);
      :insert_or_update (If);
       if (condition) then (yes)
        :Update_a_record (OpenApiConnection);
       endif
       else (no)
        :Create_a_new_record (OpenApiConnection);
        :Update_RecordGUIDasString (OpenApiConnection);
       endif
     endif
   repeat while (more items)
  :Get_Connectors (OpenApiConnection);
  :List_initial_Connector_records (OpenApiConnection);
  :Select (Select);
  :Specialty_Connectors (Scope);
   if (condition) then (yes)
    :List_Http (OpenApiConnection);
    :insert_or_update_Http (If);
     if (condition) then (yes)
      :Update_HTTP (OpenApiConnection);
     endif
     else (no)
      :Add_HTTP (OpenApiConnection);
      :Update_RecordGUIDasString__HTTP (OpenApiConnection);
     endif
    :List_HttpWebhook (OpenApiConnection);
    :List_HttpRequestReceived (OpenApiConnection);
    :List_MicrosoftSpatialServices (OpenApiConnection);
    :insert_or_update_HttpWebhook (If);
     if (condition) then (yes)
      :Update_HttpWebhook (OpenApiConnection);
     endif
     else (no)
      :Add_HttpWebhook (OpenApiConnection);
      :Update_RecordGUIDasString__HttpWebhook (OpenApiConnection);
     endif
    :insert_or_update_HttpRequestReceived (If);
     if (condition) then (yes)
      :Update_HttpRequestReceived (OpenApiConnection);
     endif
     else (no)
      :Add_HttpRequestReceived (OpenApiConnection);
      :Update_RecordGUIDasString__HttpRequestReceived (OpenApiConnection);
     endif
    :insert_or_update_MicrosoftSpatialServices (If);
     if (condition) then (yes)
      :Update_MicrosoftSpatialServices (OpenApiConnection);
     endif
     else (no)
      :Add_MicrosoftSpatialServices (OpenApiConnection);
      :Update_RecordGUIDasString__MicrosoftSpatialServices (OpenApiConnection);
     endif
    :List_TeamsWebhook (OpenApiConnection);
    :insert_or_update_TeamsWebhook (If);
     if (condition) then (yes)
      :Update_TeamsWebhook (OpenApiConnection);
     endif
     else (no)
      :Add_TeamsWebhook (OpenApiConnection);
      :Update_RecordGUIDasString__TeamsWebhook (OpenApiConnection);
     endif
   endif
   partition "Specialty_Connectors" {
    :List_Http (OpenApiConnection);
    :insert_or_update_Http (If);
     if (condition) then (yes)
      :Update_HTTP (OpenApiConnection);
     endif
     else (no)
      :Add_HTTP (OpenApiConnection);
      :Update_RecordGUIDasString__HTTP (OpenApiConnection);
     endif
    :List_HttpWebhook (OpenApiConnection);
    :List_HttpRequestReceived (OpenApiConnection);
    :List_MicrosoftSpatialServices (OpenApiConnection);
    :insert_or_update_HttpWebhook (If);
     if (condition) then (yes)
      :Update_HttpWebhook (OpenApiConnection);
     endif
     else (no)
      :Add_HttpWebhook (OpenApiConnection);
      :Update_RecordGUIDasString__HttpWebhook (OpenApiConnection);
     endif
    :insert_or_update_HttpRequestReceived (If);
     if (condition) then (yes)
      :Update_HttpRequestReceived (OpenApiConnection);
     endif
     else (no)
      :Add_HttpRequestReceived (OpenApiConnection);
      :Update_RecordGUIDasString__HttpRequestReceived (OpenApiConnection);
     endif
    :insert_or_update_MicrosoftSpatialServices (If);
     if (condition) then (yes)
      :Update_MicrosoftSpatialServices (OpenApiConnection);
     endif
     else (no)
      :Add_MicrosoftSpatialServices (OpenApiConnection);
      :Update_RecordGUIDasString__MicrosoftSpatialServices (OpenApiConnection);
     endif
    :List_TeamsWebhook (OpenApiConnection);
    :insert_or_update_TeamsWebhook (If);
     if (condition) then (yes)
      :Update_TeamsWebhook (OpenApiConnection);
     endif
     else (no)
      :Add_TeamsWebhook (OpenApiConnection);
      :Update_RecordGUIDasString__TeamsWebhook (OpenApiConnection);
     endif
   }
 endif
 partition "Get_Connectors_and_store_in_CoE_CDS_Entity" {
  :Apply_to_each_Standard_Connector (Foreach);
   if (condition) then (yes)
    :validate_standard (If);
     if (condition) then (yes)
      :Get_Connector_Record (OpenApiConnection);
      :insert_or_update (If);
       if (condition) then (yes)
        :Update_a_record (OpenApiConnection);
       endif
       else (no)
        :Create_a_new_record (OpenApiConnection);
        :Update_RecordGUIDasString (OpenApiConnection);
       endif
     endif
   endif
   repeat
    :validate_standard (If);
     if (condition) then (yes)
      :Get_Connector_Record (OpenApiConnection);
      :insert_or_update (If);
       if (condition) then (yes)
        :Update_a_record (OpenApiConnection);
       endif
       else (no)
        :Create_a_new_record (OpenApiConnection);
        :Update_RecordGUIDasString (OpenApiConnection);
       endif
     endif
   repeat while (more items)
  :Get_Connectors (OpenApiConnection);
  :List_initial_Connector_records (OpenApiConnection);
  :Select (Select);
  :Specialty_Connectors (Scope);
   if (condition) then (yes)
    :List_Http (OpenApiConnection);
    :insert_or_update_Http (If);
     if (condition) then (yes)
      :Update_HTTP (OpenApiConnection);
     endif
     else (no)
      :Add_HTTP (OpenApiConnection);
      :Update_RecordGUIDasString__HTTP (OpenApiConnection);
     endif
    :List_HttpWebhook (OpenApiConnection);
    :List_HttpRequestReceived (OpenApiConnection);
    :List_MicrosoftSpatialServices (OpenApiConnection);
    :insert_or_update_HttpWebhook (If);
     if (condition) then (yes)
      :Update_HttpWebhook (OpenApiConnection);
     endif
     else (no)
      :Add_HttpWebhook (OpenApiConnection);
      :Update_RecordGUIDasString__HttpWebhook (OpenApiConnection);
     endif
    :insert_or_update_HttpRequestReceived (If);
     if (condition) then (yes)
      :Update_HttpRequestReceived (OpenApiConnection);
     endif
     else (no)
      :Add_HttpRequestReceived (OpenApiConnection);
      :Update_RecordGUIDasString__HttpRequestReceived (OpenApiConnection);
     endif
    :insert_or_update_MicrosoftSpatialServices (If);
     if (condition) then (yes)
      :Update_MicrosoftSpatialServices (OpenApiConnection);
     endif
     else (no)
      :Add_MicrosoftSpatialServices (OpenApiConnection);
      :Update_RecordGUIDasString__MicrosoftSpatialServices (OpenApiConnection);
     endif
    :List_TeamsWebhook (OpenApiConnection);
    :insert_or_update_TeamsWebhook (If);
     if (condition) then (yes)
      :Update_TeamsWebhook (OpenApiConnection);
     endif
     else (no)
      :Add_TeamsWebhook (OpenApiConnection);
      :Update_RecordGUIDasString__TeamsWebhook (OpenApiConnection);
     endif
   endif
   partition "Specialty_Connectors" {
    :List_Http (OpenApiConnection);
    :insert_or_update_Http (If);
     if (condition) then (yes)
      :Update_HTTP (OpenApiConnection);
     endif
     else (no)
      :Add_HTTP (OpenApiConnection);
      :Update_RecordGUIDasString__HTTP (OpenApiConnection);
     endif
    :List_HttpWebhook (OpenApiConnection);
    :List_HttpRequestReceived (OpenApiConnection);
    :List_MicrosoftSpatialServices (OpenApiConnection);
    :insert_or_update_HttpWebhook (If);
     if (condition) then (yes)
      :Update_HttpWebhook (OpenApiConnection);
     endif
     else (no)
      :Add_HttpWebhook (OpenApiConnection);
      :Update_RecordGUIDasString__HttpWebhook (OpenApiConnection);
     endif
    :insert_or_update_HttpRequestReceived (If);
     if (condition) then (yes)
      :Update_HttpRequestReceived (OpenApiConnection);
     endif
     else (no)
      :Add_HttpRequestReceived (OpenApiConnection);
      :Update_RecordGUIDasString__HttpRequestReceived (OpenApiConnection);
     endif
    :insert_or_update_MicrosoftSpatialServices (If);
     if (condition) then (yes)
      :Update_MicrosoftSpatialServices (OpenApiConnection);
     endif
     else (no)
      :Add_MicrosoftSpatialServices (OpenApiConnection);
      :Update_RecordGUIDasString__MicrosoftSpatialServices (OpenApiConnection);
     endif
    :List_TeamsWebhook (OpenApiConnection);
    :insert_or_update_TeamsWebhook (If);
     if (condition) then (yes)
      :Update_TeamsWebhook (OpenApiConnection);
     endif
     else (no)
      :Add_TeamsWebhook (OpenApiConnection);
      :Update_RecordGUIDasString__TeamsWebhook (OpenApiConnection);
     endif
   }
 }
:Get_Default_Environments_Connectors (Scope);
 if (condition) then (yes)
  :Filter_to_Default (Query);
  :Get_Default_Envt_if_have_Permissions_else_get_first_envt (If);
   if (condition) then (yes)
    :Set_to_default (SetVariable);
   endif
   else (no)
    :Set_to_first (SetVariable);
   endif
  :Get_Environment_as_Admin (OpenApiConnection);
  :List_Environments_as_Admin (OpenApiConnection);
 endif
 partition "Get_Default_Environments_Connectors" {
  :Filter_to_Default (Query);
  :Get_Default_Envt_if_have_Permissions_else_get_first_envt (If);
   if (condition) then (yes)
    :Set_to_default (SetVariable);
   endif
   else (no)
    :Set_to_first (SetVariable);
   endif
  :Get_Environment_as_Admin (OpenApiConnection);
  :List_Environments_as_Admin (OpenApiConnection);
 }
:Initialize_varEnvtNameForConnectors (InitializeVariable);
:Initialize_variable_flowEnvironment (InitializeVariable);
:Initialize_variable_today (InitializeVariable);
:Respond_to_a_PowerApp_or_flow (Response);
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
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_powerappsforappmakers | shared_powerappsforappmakers | admin_CoECorePowerAppsMakers | embedded |
| shared_powerplatformforadmins_1 | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdmins | embedded |

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
| Get_Connectors_and_store_in_CoE_CDS_Entity | Scope | Operation ID: 73a0e3ae-7efd-4b20-aed3-6cec4d49b5bd |
| Get_Default_Environments_Connectors | Scope | Operation ID: 16e9e62c-2669-4298-806d-1d24256b3567 |
| Initialize_varEnvtNameForConnectors | InitializeVariable | Operation ID: e9f61408-d566-492a-9690-3011564608e5 |
| Initialize_variable_flowEnvironment | InitializeVariable | Operation ID: a2d4ceae-cf2d-42f7-8a5b-b2e0ad365232 |
| Initialize_variable_today | InitializeVariable | Operation ID: de21beb6-df8d-4221-b54c-4bbdb9face33 |
| Respond_to_a_PowerApp_or_flow | Response | Operation ID: dec0f704-eeef-4fa0-be14-9656b36a1fe1 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
