# Power Automate Flow: EnvRequestCreateApprovedEnvironment

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A573ECC
**Source File:** EnvRequestCreateApprovedEnvironment-043D28D9-9288-EB11-A812-000D3A573ECC.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** EnvRequestCreateApprovedEnvironment
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
- **Connections:** 3
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: EnvRequestCreateApprovedEnvironment

start
:Trigger: When_a_row_is_added,_modified_or_deleted (OpenApiConnectionWebhook);\n:Get_a_record__environment_request (OpenApiConnection);
:Parse_JSON (ParseJson);
:Initialize_variable__varEnvAdmins (InitializeVariable);
:Get_a_row_by_ID__requestor_user (OpenApiConnection);
:Append_to_array_variable__varEnvAdmins (AppendToArrayVariable);
:Initialize_variable__varEnvAdminEmails (InitializeVariable);
:Initialize_variable__varDlpChangeRequests (InitializeVariable);
:Initialize_variable__varErrorMessage (InitializeVariable);
:Scope__Provision_environment (Scope);
 if (condition) then (yes)
  :Create_Environment (OpenApiConnection);
  :Get_Environment_as_Admin (OpenApiConnection);
  :Set_variable__varErrorMessage (SetVariable);
  :Apply_to_each__Grant_access_to_System_Admins (Foreach);
   if (condition) then (yes)
    :Make_User_an_Environment_Admin (OpenApiConnection);
    :Append_to_string_variable (AppendToStringVariable);
   endif
   repeat
    :Make_User_an_Environment_Admin (OpenApiConnection);
    :Append_to_string_variable (AppendToStringVariable);
   repeat while (more items)
  :Condition__Provision_Database (If);
   if (condition) then (yes)
    :Create_Database (OpenApiConnection);
   endif
   else (no)
   endif
  :Add_a_new_row__Environments_table (OpenApiConnection);
  :Condition__Expiration_date (If);
   if (condition) then (yes)
    :Set_variable__Expiration_message (SetVariable);
    :Calculate_expiration_date (Expression);
    :Set_variable__varHasExpirationDate (SetVariable);
   endif
   else (no)
   endif
  :Condition__Security_Group_ID (If);
   if (condition) then (yes)
    :Update_Environment_with_security_group (OpenApiConnection);
   endif
   else (no)
   endif
  :Check_that_maker_not_orphaned_and_prod_envt (If);
   if (condition) then (yes)
    :Get_Row__Send_email_Environment_is_live (Scope);
     if (condition) then (yes)
      :emailGUID_to_enUS (Compose);
      :List_emails_for_preferred_language (OpenApiConnection);
      :Set_emailGUID_to_localized_row (SetVariable);
      :Get_a_row_by_ID (OpenApiConnection);
     endif
     partition "Get_Row__Send_email_Environment_is_live" {
      :emailGUID_to_enUS (Compose);
      :List_emails_for_preferred_language (OpenApiConnection);
      :Set_emailGUID_to_localized_row (SetVariable);
      :Get_a_row_by_ID (OpenApiConnection);
     }
    :Send_email_Environment_is_live (Workflow);
   endif
   else (no)
    :Get_Row__Send_email_Environment_is_live_2 (Scope);
     if (condition) then (yes)
      :emailGUID_to_enUS_3 (Compose);
      :List_emails_for_preferred_language_3 (OpenApiConnection);
      :Set_emailGUID_to_localized_row_3 (SetVariable);
      :Get_a_row_by_ID_3 (OpenApiConnection);
     endif
     partition "Get_Row__Send_email_Environment_is_live_2" {
      :emailGUID_to_enUS_3 (Compose);
      :List_emails_for_preferred_language_3 (OpenApiConnection);
      :Set_emailGUID_to_localized_row_3 (SetVariable);
      :Get_a_row_by_ID_3 (OpenApiConnection);
     }
    :Send_email_Environment_is_live__admin (Workflow);
   endif
  :Apply_to_each__DLP_Policy_Change_Request (Foreach);
   if (condition) then (yes)
    :Update_a_row__DLP_Policy_Change_Request (OpenApiConnection);
   endif
   repeat
    :Update_a_row__DLP_Policy_Change_Request (OpenApiConnection);
   repeat while (more items)
  :Update_a_record__Environment_is_Live (OpenApiConnection);
  :Condition__If_PCF_Enabled (If);
   if (condition) then (yes)
    :Update_iscustomcontrolsincanvasappsenabled_in_new_environment (OpenApiConnection);
    :Update_a_row_in_selected_environment (OpenApiConnection);
   endif
   else (no)
   endif
  :EnvtURL (Compose);
  :EnvtNameFriendly (Compose);
  :Org_ID (Compose);
 endif
 partition "Scope__Provision_environment" {
  :Create_Environment (OpenApiConnection);
  :Get_Environment_as_Admin (OpenApiConnection);
  :Set_variable__varErrorMessage (SetVariable);
  :Apply_to_each__Grant_access_to_System_Admins (Foreach);
   if (condition) then (yes)
    :Make_User_an_Environment_Admin (OpenApiConnection);
    :Append_to_string_variable (AppendToStringVariable);
   endif
   repeat
    :Make_User_an_Environment_Admin (OpenApiConnection);
    :Append_to_string_variable (AppendToStringVariable);
   repeat while (more items)
  :Condition__Provision_Database (If);
   if (condition) then (yes)
    :Create_Database (OpenApiConnection);
   endif
   else (no)
   endif
  :Add_a_new_row__Environments_table (OpenApiConnection);
  :Condition__Expiration_date (If);
   if (condition) then (yes)
    :Set_variable__Expiration_message (SetVariable);
    :Calculate_expiration_date (Expression);
    :Set_variable__varHasExpirationDate (SetVariable);
   endif
   else (no)
   endif
  :Condition__Security_Group_ID (If);
   if (condition) then (yes)
    :Update_Environment_with_security_group (OpenApiConnection);
   endif
   else (no)
   endif
  :Check_that_maker_not_orphaned_and_prod_envt (If);
   if (condition) then (yes)
    :Get_Row__Send_email_Environment_is_live (Scope);
     if (condition) then (yes)
      :emailGUID_to_enUS (Compose);
      :List_emails_for_preferred_language (OpenApiConnection);
      :Set_emailGUID_to_localized_row (SetVariable);
      :Get_a_row_by_ID (OpenApiConnection);
     endif
     partition "Get_Row__Send_email_Environment_is_live" {
      :emailGUID_to_enUS (Compose);
      :List_emails_for_preferred_language (OpenApiConnection);
      :Set_emailGUID_to_localized_row (SetVariable);
      :Get_a_row_by_ID (OpenApiConnection);
     }
    :Send_email_Environment_is_live (Workflow);
   endif
   else (no)
    :Get_Row__Send_email_Environment_is_live_2 (Scope);
     if (condition) then (yes)
      :emailGUID_to_enUS_3 (Compose);
      :List_emails_for_preferred_language_3 (OpenApiConnection);
      :Set_emailGUID_to_localized_row_3 (SetVariable);
      :Get_a_row_by_ID_3 (OpenApiConnection);
     endif
     partition "Get_Row__Send_email_Environment_is_live_2" {
      :emailGUID_to_enUS_3 (Compose);
      :List_emails_for_preferred_language_3 (OpenApiConnection);
      :Set_emailGUID_to_localized_row_3 (SetVariable);
      :Get_a_row_by_ID_3 (OpenApiConnection);
     }
    :Send_email_Environment_is_live__admin (Workflow);
   endif
  :Apply_to_each__DLP_Policy_Change_Request (Foreach);
   if (condition) then (yes)
    :Update_a_row__DLP_Policy_Change_Request (OpenApiConnection);
   endif
   repeat
    :Update_a_row__DLP_Policy_Change_Request (OpenApiConnection);
   repeat while (more items)
  :Update_a_record__Environment_is_Live (OpenApiConnection);
  :Condition__If_PCF_Enabled (If);
   if (condition) then (yes)
    :Update_iscustomcontrolsincanvasappsenabled_in_new_environment (OpenApiConnection);
    :Update_a_row_in_selected_environment (OpenApiConnection);
   endif
   else (no)
   endif
  :EnvtURL (Compose);
  :EnvtNameFriendly (Compose);
  :Org_ID (Compose);
 }
:Scope__Environment_provisioning_failed (Scope);
 if (condition) then (yes)
  :Apply_to_each__DLP_Policy_Change_Request__Environment_provisioning_failed (Foreach);
   if (condition) then (yes)
    :Update_a_record__DLP_Policy_Change_Requests_failed (OpenApiConnection);
   endif
   repeat
    :Update_a_record__DLP_Policy_Change_Requests_failed (OpenApiConnection);
   repeat while (more items)
  :Update_a_record__Environment_provisioning_failed (OpenApiConnection);
  :Get_Row__Environment_provisioning_failed (Scope);
   if (condition) then (yes)
    :emailGUID_to_enUS_2 (Compose);
    :List_emails_for_preferred_language_2 (OpenApiConnection);
    :Set_emailGUID_to_localized_row_2 (SetVariable);
    :Get_a_row_by_ID_2 (OpenApiConnection);
   endif
   partition "Get_Row__Environment_provisioning_failed" {
    :emailGUID_to_enUS_2 (Compose);
    :List_emails_for_preferred_language_2 (OpenApiConnection);
    :Set_emailGUID_to_localized_row_2 (SetVariable);
    :Get_a_row_by_ID_2 (OpenApiConnection);
   }
  :Environment_provisioning_failed (Workflow);
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
 endif
 partition "Scope__Environment_provisioning_failed" {
  :Apply_to_each__DLP_Policy_Change_Request__Environment_provisioning_failed (Foreach);
   if (condition) then (yes)
    :Update_a_record__DLP_Policy_Change_Requests_failed (OpenApiConnection);
   endif
   repeat
    :Update_a_record__DLP_Policy_Change_Requests_failed (OpenApiConnection);
   repeat while (more items)
  :Update_a_record__Environment_provisioning_failed (OpenApiConnection);
  :Get_Row__Environment_provisioning_failed (Scope);
   if (condition) then (yes)
    :emailGUID_to_enUS_2 (Compose);
    :List_emails_for_preferred_language_2 (OpenApiConnection);
    :Set_emailGUID_to_localized_row_2 (SetVariable);
    :Get_a_row_by_ID_2 (OpenApiConnection);
   endif
   partition "Get_Row__Environment_provisioning_failed" {
    :emailGUID_to_enUS_2 (Compose);
    :List_emails_for_preferred_language_2 (OpenApiConnection);
    :Set_emailGUID_to_localized_row_2 (SetVariable);
    :Get_a_row_by_ID_2 (OpenApiConnection);
   }
  :Environment_provisioning_failed (Workflow);
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
 }
:Initialize_variable__varExpriationEmailCard (InitializeVariable);
:Initialize_variable__varSecurityGroupId (InitializeVariable);
:Initialize_variable_varMakerPortalUrl (InitializeVariable);
:Condition__Update_varMakerPortalUrl_with_Env_Var_value (If);
 if (condition) then (yes)
  :Set_variable_varMakerPortalUrl (SetVariable);
 endif
 else (no)
 endif
:Get_Maker (Workflow);
:Initialize_emailGUID (InitializeVariable);
:Initialize_variable__varHasExpirationDate (InitializeVariable);
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
:Environment_Status_is_Approved (If);
 else (no)
  :Terminate__Not_Approved_Status (Terminate);
 endif

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_powerplatformforadmins_1 | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Admin eMail Preferred Language (admin_AdmineMailPreferredLanguage) | String | en-US | Inventory - The preferred language for the emails sent to the admin email alias, which is specified in theAdmin eMail environment variable. Default is en-US |
| PowerApp Maker Environment Variable (admin_PowerAppEnvironmentVariable) | String | https://make.powerapps.com/ | Inventory - REQUIRED. The maker URL used by PowerApps for your cloud. Ex https://make.powerapps.com/ |
| Admin eMail (admin_AdminMail) | String | hannescoeadmins@powercattools.onmicrosoft.com | Inventory - CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list |
| ProductionEnvironment (admin_ProductionEnvironment) | Bool | - | Inventory - Yes by default. Set to No if you are creating a dev type envt. This will allow some flows to set target users to the admin instead of resource owners |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### When_a_row_is_added,_modified_or_deleted
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Get_a_record_-_environment_request | OpenApiConnection | Operation ID: a665e0d9-ee48-49e7-af53-00cce41744a3 |
| Parse_JSON | ParseJson | Operation ID: dc74818f-f5e8-4323-a2ed-0e5403e47ac6 |
| Initialize_variable_-_varEnvAdmins | InitializeVariable | Operation ID: 8af00f83-675f-4e3f-b2d0-0fa56849d72a |
| Get_a_row_by_ID_-_requestor_user | OpenApiConnection | Operation ID: dc6f8af8-3cd3-4c86-9b44-c9d6fe42e443 |
| Append_to_array_variable_-_varEnvAdmins | AppendToArrayVariable | Operation ID: d02b0eeb-f8a4-4a7b-b8ed-7a51a6728f8d |
| Initialize_variable_-_varEnvAdminEmails | InitializeVariable | Operation ID: 556300ac-6fd5-4ecc-8e94-6f8eba66d675 |
| Initialize_variable_-_varDlpChangeRequests | InitializeVariable | Operation ID: 76d0d11f-b492-4774-a132-5ec02d499e57 |
| Initialize_variable_-_varErrorMessage | InitializeVariable | Operation ID: 1f8cf0e3-8df7-4016-b7de-59626c90dbfe |
| Scope_-_Provision_environment | Scope | Operation ID: 50a80b78-48b4-44c7-960a-0a8818be628e |
| Scope_-_Environment_provisioning_failed | Scope | Operation ID: 92499082-e95b-473e-b085-73bc606c84bd |
| Initialize_variable_-_varExpriationEmailCard | InitializeVariable | Operation ID: 046500c3-a4f9-441d-9c7f-d06ee9c6cfa6 |
| Initialize_variable_-_varSecurityGroupId | InitializeVariable | Operation ID: f4e404a2-52ad-419d-aba3-b4d67c2f0127 |
| Initialize_variable_varMakerPortalUrl | InitializeVariable | Operation ID: 11c2c7d9-aff9-4e13-a044-89bd615eb1de |
| Condition_-_Update_varMakerPortalUrl_with_Env_Var_value | If | Operation ID: deb0897e-0811-4cac-b3ed-57444dec7f0a |
| Get_Maker | Workflow | Operation ID: 99dfd02a-9e16-4f2c-a277-ee6141ece7ab |
| Initialize_emailGUID | InitializeVariable | Operation ID: dad8eca6-7937-47c0-aa57-f2d48dd1c5a2 |
| Initialize_variable_-_varHasExpirationDate | InitializeVariable | Operation ID: a070aab6-e3d4-415a-99f4-2bfcc149f646 |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Environment_Status_is_Approved | If | Operation ID: e3480793-f9ac-4083-9e5d-cdad75b13357 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
