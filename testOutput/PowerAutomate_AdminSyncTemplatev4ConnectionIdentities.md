# Power Automate Flow: AdminSyncTemplatev4ConnectionIdentities

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A3411D9
**Source File:** AdminSyncTemplatev4ConnectionIdentities-919D34D1-A8AC-EE11-A569-000D3A3411D9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4ConnectionIdentities
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 7
- **Parameters:** 3

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4ConnectionIdentities

start
:Trigger: When_a_row_is_created_or_updated (OpenApiConnectionWebhook);\n:Get_Connection_Identities_and_store_them_in_CoE_CDS_Entity (Scope);
 if (condition) then (yes)
  :GetCurrentActual (Scope);
   if (condition) then (yes)
    :Select_connection_and_name (Select);
    :Get_distinct_set (Compose);
    :Parsed_Current (ParseJson);
    :Filter_to_connections_with_accountName (Query);
    :Get_Connections_as_Admin (OpenApiConnection);
   endif
   partition "GetCurrentActual" {
    :Select_connection_and_name (Select);
    :Get_distinct_set (Compose);
    :Parsed_Current (ParseJson);
    :Filter_to_connections_with_accountName (Query);
    :Get_Connections_as_Admin (OpenApiConnection);
   }
  :Remove_deleted_ones_from_inventory (Scope);
   if (condition) then (yes)
    :RemoveFromInventory (Query);
    :Apply_to_each_identified_to_delete (Foreach);
     if (condition) then (yes)
      :Delete_it (OpenApiConnection);
      :RemoveSpecialChars (Compose);
      :Find_it_for_ID (OpenApiConnection);
     endif
     repeat
      :Delete_it (OpenApiConnection);
      :RemoveSpecialChars (Compose);
      :Find_it_for_ID (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Remove_deleted_ones_from_inventory" {
    :RemoveFromInventory (Query);
    :Apply_to_each_identified_to_delete (Foreach);
     if (condition) then (yes)
      :Delete_it (OpenApiConnection);
      :RemoveSpecialChars (Compose);
      :Find_it_for_ID (OpenApiConnection);
     endif
     repeat
      :Delete_it (OpenApiConnection);
      :RemoveSpecialChars (Compose);
      :Find_it_for_ID (OpenApiConnection);
     repeat while (more items)
   }
  :Add_new_ones_to_inventory (Scope);
   if (condition) then (yes)
    :AddToInventory (Query);
    :List_PowerApps_Connectors (OpenApiConnection);
    :Apply_to_each (Foreach);
     if (condition) then (yes)
      :xTenant_check (Compose);
      :GetConnectorGUID (Query);
      :ConnectorGUID (Compose);
      :RemoveSpecialChars_for_Add (Compose);
      :Get_user_profile_V2 (OpenApiConnection);
      :Switch_on_result (Switch);
     endif
     repeat
      :xTenant_check (Compose);
      :GetConnectorGUID (Query);
      :ConnectorGUID (Compose);
      :RemoveSpecialChars_for_Add (Compose);
      :Get_user_profile_V2 (OpenApiConnection);
      :Switch_on_result (Switch);
     repeat while (more items)
   endif
   partition "Add_new_ones_to_inventory" {
    :AddToInventory (Query);
    :List_PowerApps_Connectors (OpenApiConnection);
    :Apply_to_each (Foreach);
     if (condition) then (yes)
      :xTenant_check (Compose);
      :GetConnectorGUID (Query);
      :ConnectorGUID (Compose);
      :RemoveSpecialChars_for_Add (Compose);
      :Get_user_profile_V2 (OpenApiConnection);
      :Switch_on_result (Switch);
     endif
     repeat
      :xTenant_check (Compose);
      :GetConnectorGUID (Query);
      :ConnectorGUID (Compose);
      :RemoveSpecialChars_for_Add (Compose);
      :Get_user_profile_V2 (OpenApiConnection);
      :Switch_on_result (Switch);
     repeat while (more items)
   }
  :GetCurrentInventory (Scope);
   if (condition) then (yes)
    :List_existing_connection_reference_identities (OpenApiConnection);
    :Inventory (Select);
    :Parsed_Inventory (ParseJson);
   endif
   partition "GetCurrentInventory" {
    :List_existing_connection_reference_identities (OpenApiConnection);
    :Inventory (Select);
    :Parsed_Inventory (ParseJson);
   }
  :Check_if_inventory_still_exists_and_is_not_excused_from_inventory (Scope);
   if (condition) then (yes)
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_EnvtExists (SetVariable);
    :Check_if_Environment_Deleted_terminate_if_true (If);
     if (condition) then (yes)
      :Terminate_for_environments_marked_deleted (Terminate);
     endif
   endif
   partition "Check_if_inventory_still_exists_and_is_not_excused_from_inventory" {
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_EnvtExists (SetVariable);
    :Check_if_Environment_Deleted_terminate_if_true (If);
     if (condition) then (yes)
      :Terminate_for_environments_marked_deleted (Terminate);
     endif
   }
  :Get_Hosts_considered_as_Local_Tenant_ (Scope);
   if (condition) then (yes)
    :Get_Host_Domains_EnvVar (Scope);
     if (condition) then (yes)
      :Set_to_current_or_default__HostDomain (If);
       if (condition) then (yes)
        :Set_HostDomain__CurrentValue (SetVariable);
       endif
       else (no)
        :Set_HostDomain__DefaultValue (SetVariable);
       endif
      :ListCurrentsHostDomain (OpenApiConnection);
      :Get_ID_from_HostDomain (Compose);
      :ListDefnsHostDomain (OpenApiConnection);
     endif
     partition "Get_Host_Domains_EnvVar" {
      :Set_to_current_or_default__HostDomain (If);
       if (condition) then (yes)
        :Set_HostDomain__CurrentValue (SetVariable);
       endif
       else (no)
        :Set_HostDomain__DefaultValue (SetVariable);
       endif
      :ListCurrentsHostDomain (OpenApiConnection);
      :Get_ID_from_HostDomain (Compose);
      :ListDefnsHostDomain (OpenApiConnection);
     }
    :Append_Admin_Emails_Tenant (Scope);
     if (condition) then (yes)
      :adminEmailsHost (Compose);
      :Append_or_replace (If);
       if (condition) then (yes)
        :Append_admin_emails_host (SetVariable);
        :currentHostString (Compose);
       endif
       else (no)
        :Set_to_admin_emails_host (SetVariable);
       endif
     endif
     partition "Append_Admin_Emails_Tenant" {
      :adminEmailsHost (Compose);
      :Append_or_replace (If);
       if (condition) then (yes)
        :Append_admin_emails_host (SetVariable);
        :currentHostString (Compose);
       endif
       else (no)
        :Set_to_admin_emails_host (SetVariable);
       endif
     }
   endif
   partition "Get_Hosts_considered_as_Local_Tenant_" {
    :Get_Host_Domains_EnvVar (Scope);
     if (condition) then (yes)
      :Set_to_current_or_default__HostDomain (If);
       if (condition) then (yes)
        :Set_HostDomain__CurrentValue (SetVariable);
       endif
       else (no)
        :Set_HostDomain__DefaultValue (SetVariable);
       endif
      :ListCurrentsHostDomain (OpenApiConnection);
      :Get_ID_from_HostDomain (Compose);
      :ListDefnsHostDomain (OpenApiConnection);
     endif
     partition "Get_Host_Domains_EnvVar" {
      :Set_to_current_or_default__HostDomain (If);
       if (condition) then (yes)
        :Set_HostDomain__CurrentValue (SetVariable);
       endif
       else (no)
        :Set_HostDomain__DefaultValue (SetVariable);
       endif
      :ListCurrentsHostDomain (OpenApiConnection);
      :Get_ID_from_HostDomain (Compose);
      :ListDefnsHostDomain (OpenApiConnection);
     }
    :Append_Admin_Emails_Tenant (Scope);
     if (condition) then (yes)
      :adminEmailsHost (Compose);
      :Append_or_replace (If);
       if (condition) then (yes)
        :Append_admin_emails_host (SetVariable);
        :currentHostString (Compose);
       endif
       else (no)
        :Set_to_admin_emails_host (SetVariable);
       endif
     endif
     partition "Append_Admin_Emails_Tenant" {
      :adminEmailsHost (Compose);
      :Append_or_replace (If);
       if (condition) then (yes)
        :Append_admin_emails_host (SetVariable);
        :currentHostString (Compose);
       endif
       else (no)
        :Set_to_admin_emails_host (SetVariable);
       endif
     }
   }
 endif
 partition "Get_Connection_Identities_and_store_them_in_CoE_CDS_Entity" {
  :GetCurrentActual (Scope);
   if (condition) then (yes)
    :Select_connection_and_name (Select);
    :Get_distinct_set (Compose);
    :Parsed_Current (ParseJson);
    :Filter_to_connections_with_accountName (Query);
    :Get_Connections_as_Admin (OpenApiConnection);
   endif
   partition "GetCurrentActual" {
    :Select_connection_and_name (Select);
    :Get_distinct_set (Compose);
    :Parsed_Current (ParseJson);
    :Filter_to_connections_with_accountName (Query);
    :Get_Connections_as_Admin (OpenApiConnection);
   }
  :Remove_deleted_ones_from_inventory (Scope);
   if (condition) then (yes)
    :RemoveFromInventory (Query);
    :Apply_to_each_identified_to_delete (Foreach);
     if (condition) then (yes)
      :Delete_it (OpenApiConnection);
      :RemoveSpecialChars (Compose);
      :Find_it_for_ID (OpenApiConnection);
     endif
     repeat
      :Delete_it (OpenApiConnection);
      :RemoveSpecialChars (Compose);
      :Find_it_for_ID (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Remove_deleted_ones_from_inventory" {
    :RemoveFromInventory (Query);
    :Apply_to_each_identified_to_delete (Foreach);
     if (condition) then (yes)
      :Delete_it (OpenApiConnection);
      :RemoveSpecialChars (Compose);
      :Find_it_for_ID (OpenApiConnection);
     endif
     repeat
      :Delete_it (OpenApiConnection);
      :RemoveSpecialChars (Compose);
      :Find_it_for_ID (OpenApiConnection);
     repeat while (more items)
   }
  :Add_new_ones_to_inventory (Scope);
   if (condition) then (yes)
    :AddToInventory (Query);
    :List_PowerApps_Connectors (OpenApiConnection);
    :Apply_to_each (Foreach);
     if (condition) then (yes)
      :xTenant_check (Compose);
      :GetConnectorGUID (Query);
      :ConnectorGUID (Compose);
      :RemoveSpecialChars_for_Add (Compose);
      :Get_user_profile_V2 (OpenApiConnection);
      :Switch_on_result (Switch);
     endif
     repeat
      :xTenant_check (Compose);
      :GetConnectorGUID (Query);
      :ConnectorGUID (Compose);
      :RemoveSpecialChars_for_Add (Compose);
      :Get_user_profile_V2 (OpenApiConnection);
      :Switch_on_result (Switch);
     repeat while (more items)
   endif
   partition "Add_new_ones_to_inventory" {
    :AddToInventory (Query);
    :List_PowerApps_Connectors (OpenApiConnection);
    :Apply_to_each (Foreach);
     if (condition) then (yes)
      :xTenant_check (Compose);
      :GetConnectorGUID (Query);
      :ConnectorGUID (Compose);
      :RemoveSpecialChars_for_Add (Compose);
      :Get_user_profile_V2 (OpenApiConnection);
      :Switch_on_result (Switch);
     endif
     repeat
      :xTenant_check (Compose);
      :GetConnectorGUID (Query);
      :ConnectorGUID (Compose);
      :RemoveSpecialChars_for_Add (Compose);
      :Get_user_profile_V2 (OpenApiConnection);
      :Switch_on_result (Switch);
     repeat while (more items)
   }
  :GetCurrentInventory (Scope);
   if (condition) then (yes)
    :List_existing_connection_reference_identities (OpenApiConnection);
    :Inventory (Select);
    :Parsed_Inventory (ParseJson);
   endif
   partition "GetCurrentInventory" {
    :List_existing_connection_reference_identities (OpenApiConnection);
    :Inventory (Select);
    :Parsed_Inventory (ParseJson);
   }
  :Check_if_inventory_still_exists_and_is_not_excused_from_inventory (Scope);
   if (condition) then (yes)
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_EnvtExists (SetVariable);
    :Check_if_Environment_Deleted_terminate_if_true (If);
     if (condition) then (yes)
      :Terminate_for_environments_marked_deleted (Terminate);
     endif
   endif
   partition "Check_if_inventory_still_exists_and_is_not_excused_from_inventory" {
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_EnvtExists (SetVariable);
    :Check_if_Environment_Deleted_terminate_if_true (If);
     if (condition) then (yes)
      :Terminate_for_environments_marked_deleted (Terminate);
     endif
   }
  :Get_Hosts_considered_as_Local_Tenant_ (Scope);
   if (condition) then (yes)
    :Get_Host_Domains_EnvVar (Scope);
     if (condition) then (yes)
      :Set_to_current_or_default__HostDomain (If);
       if (condition) then (yes)
        :Set_HostDomain__CurrentValue (SetVariable);
       endif
       else (no)
        :Set_HostDomain__DefaultValue (SetVariable);
       endif
      :ListCurrentsHostDomain (OpenApiConnection);
      :Get_ID_from_HostDomain (Compose);
      :ListDefnsHostDomain (OpenApiConnection);
     endif
     partition "Get_Host_Domains_EnvVar" {
      :Set_to_current_or_default__HostDomain (If);
       if (condition) then (yes)
        :Set_HostDomain__CurrentValue (SetVariable);
       endif
       else (no)
        :Set_HostDomain__DefaultValue (SetVariable);
       endif
      :ListCurrentsHostDomain (OpenApiConnection);
      :Get_ID_from_HostDomain (Compose);
      :ListDefnsHostDomain (OpenApiConnection);
     }
    :Append_Admin_Emails_Tenant (Scope);
     if (condition) then (yes)
      :adminEmailsHost (Compose);
      :Append_or_replace (If);
       if (condition) then (yes)
        :Append_admin_emails_host (SetVariable);
        :currentHostString (Compose);
       endif
       else (no)
        :Set_to_admin_emails_host (SetVariable);
       endif
     endif
     partition "Append_Admin_Emails_Tenant" {
      :adminEmailsHost (Compose);
      :Append_or_replace (If);
       if (condition) then (yes)
        :Append_admin_emails_host (SetVariable);
        :currentHostString (Compose);
       endif
       else (no)
        :Set_to_admin_emails_host (SetVariable);
       endif
     }
   endif
   partition "Get_Hosts_considered_as_Local_Tenant_" {
    :Get_Host_Domains_EnvVar (Scope);
     if (condition) then (yes)
      :Set_to_current_or_default__HostDomain (If);
       if (condition) then (yes)
        :Set_HostDomain__CurrentValue (SetVariable);
       endif
       else (no)
        :Set_HostDomain__DefaultValue (SetVariable);
       endif
      :ListCurrentsHostDomain (OpenApiConnection);
      :Get_ID_from_HostDomain (Compose);
      :ListDefnsHostDomain (OpenApiConnection);
     endif
     partition "Get_Host_Domains_EnvVar" {
      :Set_to_current_or_default__HostDomain (If);
       if (condition) then (yes)
        :Set_HostDomain__CurrentValue (SetVariable);
       endif
       else (no)
        :Set_HostDomain__DefaultValue (SetVariable);
       endif
      :ListCurrentsHostDomain (OpenApiConnection);
      :Get_ID_from_HostDomain (Compose);
      :ListDefnsHostDomain (OpenApiConnection);
     }
    :Append_Admin_Emails_Tenant (Scope);
     if (condition) then (yes)
      :adminEmailsHost (Compose);
      :Append_or_replace (If);
       if (condition) then (yes)
        :Append_admin_emails_host (SetVariable);
        :currentHostString (Compose);
       endif
       else (no)
        :Set_to_admin_emails_host (SetVariable);
       endif
     endif
     partition "Append_Admin_Emails_Tenant" {
      :adminEmailsHost (Compose);
      :Append_or_replace (If);
       if (condition) then (yes)
        :Append_admin_emails_host (SetVariable);
        :currentHostString (Compose);
       endif
       else (no)
        :Set_to_admin_emails_host (SetVariable);
       endif
     }
   }
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
:Initialize_EnvtExists_to_true (InitializeVariable);
:Initialize_HostDomainString (InitializeVariable);
:Delay_Object_Inventory (If);
 if (condition) then (yes)
  :Delay_1_to_300_minutes (Wait);
 endif
:Check_if_Connection_Identities_can_and_should_be_retrieved_for_this_environment (If);
 if (condition) then (yes)
  :Terminate_inquiry_not_supported (Terminate);
 endif

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_powerappsforadmins | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_office365users | shared_office365users | admin_CoECoreOffice365Users | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Admin eMail (admin_AdminMail) | String | PPAdmin@powercattools25q2.onmicrosoft.com | Inventory - CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list |
| DelayObjectInventory (admin_DelayObjectInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse throttling. Things like solutions, apps, flows, will have delays in the individual envt runs. Default No. |

## Triggers

### When_a_row_is_created_or_updated
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Get_Connection_Identities_and_store_them_in_CoE_CDS_Entity | Scope | Operation ID: f019ff79-eb04-49cc-96a3-a63d560e993c |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_EnvtExists_to_true | InitializeVariable | Operation ID: e70aa1c3-efb5-415b-96ed-90961b85e008 |
| Initialize_HostDomainString | InitializeVariable | Operation ID: eb9f0b98-975e-4cf9-9e79-62c636f4fa53 |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |
| Check_if_Connection_Identities_can_and_should_be_retrieved_for_this_environment | If | Operation ID: 9b6688e4-c25b-4e40-9deb-fcf181094357 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
