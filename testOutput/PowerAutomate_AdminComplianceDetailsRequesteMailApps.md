# Power Automate Flow: AdminComplianceDetailsRequesteMailApps

**Generated on:** 2025-07-15 19:14:46
**Flow ID:** 000D3A55C6FA
**Source File:** AdminComplianceDetailsRequesteMailApps-7B26C0AC-7CBA-EC11-983F-000D3A55C6FA.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminComplianceDetailsRequesteMailApps
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminComplianceDetailsRequesteMailApps

start
:Trigger: When_Power_Apps_Admin_Risk_Assessment_-_State_is_modified (OpenApiConnectionWebhook);\n:If_Admin_Risk_Assessment_State_is_Requested (If);
 if (condition) then (yes)
  :Get_Row__Send_Audit_Mail_to_Owner__Apps (Scope);
   if (condition) then (yes)
    :Get_a_row_by_ID (OpenApiConnection);
    :List_emails_for_preferred_language (OpenApiConnection);
    :Set_emailGUID_to_localized_row (SetVariable);
    :emailGUID_to_enUS (Compose);
   endif
   partition "Get_Row__Send_Audit_Mail_to_Owner__Apps" {
    :Get_a_row_by_ID (OpenApiConnection);
    :List_emails_for_preferred_language (OpenApiConnection);
    :Set_emailGUID_to_localized_row (SetVariable);
    :emailGUID_to_enUS (Compose);
   }
  :Check_maker_and_set_eMail_assignee (Scope);
   if (condition) then (yes)
    :Check_Maker_status (Workflow);
    :Check_if_Maker_is_orphaned (If);
     if (condition) then (yes)
      :Set_variable_to_Admin_eMail (SetVariable);
      :Set_assigneeLanguage_to_admins (SetVariable);
     endif
     else (no)
      :Set_variable_to_Maker_eMail (SetVariable);
      :Set_assigneeLanguage_to_Makers (SetVariable);
     endif
   endif
   partition "Check_maker_and_set_eMail_assignee" {
    :Check_Maker_status (Workflow);
    :Check_if_Maker_is_orphaned (If);
     if (condition) then (yes)
      :Set_variable_to_Admin_eMail (SetVariable);
      :Set_assigneeLanguage_to_admins (SetVariable);
     endif
     else (no)
      :Set_variable_to_Maker_eMail (SetVariable);
      :Set_assigneeLanguage_to_Makers (SetVariable);
     endif
   }
  :Send_eMail (Scope);
   if (condition) then (yes)
    :Send_Audit_Mail_to_Owner_Apps (Workflow);
    :Send_Audit_Mail_to_Admin_Apps (Workflow);
   endif
   partition "Send_eMail" {
    :Send_Audit_Mail_to_Owner_Apps (Workflow);
    :Send_Audit_Mail_to_Admin_Apps (Workflow);
   }
  :List_BPFs_for_this_App (OpenApiConnection);
  :If_BPF_not_already_started_for_this_app_start_it (If);
   if (condition) then (yes)
    :Start_App_Audit_BPF (OpenApiConnection);
   endif
 endif
:Initialize_assignee (InitializeVariable);
:Initialize_emailGUID (InitializeVariable);
:Get_a_row_by_ID_2 (OpenApiConnection);
:Initialize_assigneeLanguage (InitializeVariable);
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
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Developer Compliance Center URL (admin_DeveloperComplianceCenterURL) | String | - | Compliance â€“ LEAVE EMPTY ON IMPORT.  URL to Developer Compliance Center Canvas App.  |
| Admin eMail (admin_AdminMail) | String | PowerPlatformAdmins@powercattools.onmicrosoft.com | Inventory - CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list |
| ProductionEnvironment (admin_ProductionEnvironment) | Bool | True | Inventory - Yes by default. Set to No if you are creating a dev type envt. This will allow some flows to set target users to the admin instead of resource owners |
| Admin eMail Preferred Language (admin_AdmineMailPreferredLanguage) | String | en-US | Inventory - The preferred language for the emails sent to the admin email alias, which is specified in theAdmin eMail environment variable. Default is en-US |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### When_Power_Apps_Admin_Risk_Assessment_-_State_is_modified
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| If_Admin_Risk_Assessment_State_is_Requested | If | Operation ID: 8d48ef52-baa1-44d0-aeb1-acd2f84670b1 |
| Initialize_assignee | InitializeVariable | Operation ID: 7bfd9f17-3c4d-444a-b175-d896b3fc6866 |
| Initialize_emailGUID | InitializeVariable | Operation ID: 8243356f-c7ff-48f5-9126-da25fe595e3d |
| Get_a_row_by_ID_2 | OpenApiConnection | Operation ID: ed2f8b5f-bec9-44be-8e44-b2f4accc77d9 |
| Initialize_assigneeLanguage | InitializeVariable | Operation ID: edda4790-6f7d-48d3-a7f4-54b8cc8816e7 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
