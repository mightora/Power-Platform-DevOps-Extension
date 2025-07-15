# Power Automate Flow: AdminComplianceDetailsRequesteMailChatbots

**Generated on:** 2025-07-15 19:14:46
**Flow ID:** 000D3A571551
**Source File:** AdminComplianceDetailsRequesteMailChatbots-D7582303-21BB-EC11-983F-000D3A571551.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminComplianceDetailsRequesteMailChatbots
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminComplianceDetailsRequesteMailChatbots

start
:Trigger: When_Chatbot_Risk_Assessment_-_State_is_modified (OpenApiConnectionWebhook);\n:Initialize_emailGUID (InitializeVariable);
:Initialize_assignee (InitializeVariable);
:If_Admin_Risk_Assessment_State_is_Requested (If);
 if (condition) then (yes)
  :Send_Audit_Mail_to_Owner_Bots (Workflow);
  :Send_Audit_Mail_to_Admin_Bots (Workflow);
  :Check_maker_and_set_eMail_assignee (Scope);
   if (condition) then (yes)
    :Get_Maker (OpenApiConnection);
    :Check_if_Maker_is_orphaned (If);
     if (condition) then (yes)
      :Set_variable_to_Admin_eMail (SetVariable);
      :Set_assigneeLanguage_to_admins (SetVariable);
     endif
     else (no)
      :Set_variable_to_Maker_eMail (SetVariable);
      :Set_assigneeLanguage_to_Makers (SetVariable);
     endif
    :Check_Maker_status (Workflow);
   endif
   partition "Check_maker_and_set_eMail_assignee" {
    :Get_Maker (OpenApiConnection);
    :Check_if_Maker_is_orphaned (If);
     if (condition) then (yes)
      :Set_variable_to_Admin_eMail (SetVariable);
      :Set_assigneeLanguage_to_admins (SetVariable);
     endif
     else (no)
      :Set_variable_to_Maker_eMail (SetVariable);
      :Set_assigneeLanguage_to_Makers (SetVariable);
     endif
    :Check_Maker_status (Workflow);
   }
  :Get_Row__Send_Audit_Mail_to_Owner__Bots (Scope);
   if (condition) then (yes)
    :Get_a_row_by_ID_3 (OpenApiConnection);
    :List_emails_for_preferred_language_3 (OpenApiConnection);
    :Set_emailGUID_to_localized_row_3 (SetVariable);
    :emailGUID_to_enUS_3 (Compose);
   endif
   partition "Get_Row__Send_Audit_Mail_to_Owner__Bots" {
    :Get_a_row_by_ID_3 (OpenApiConnection);
    :List_emails_for_preferred_language_3 (OpenApiConnection);
    :Set_emailGUID_to_localized_row_3 (SetVariable);
    :emailGUID_to_enUS_3 (Compose);
   }
  :If_BPF_not_already_started_for_this_app_start_it (If);
   if (condition) then (yes)
    :Start_App_Audit_BPF (OpenApiConnection);
   endif
  :List_BPFs_for_this_App (OpenApiConnection);
 endif
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
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
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

### When_Chatbot_Risk_Assessment_-_State_is_modified
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_emailGUID | InitializeVariable | Operation ID: 8243356f-c7ff-48f5-9126-da25fe595e3d |
| Initialize_assignee | InitializeVariable | Operation ID: 7bfd9f17-3c4d-444a-b175-d896b3fc6866 |
| If_Admin_Risk_Assessment_State_is_Requested | If | Operation ID: 8d48ef52-baa1-44d0-aeb1-acd2f84670b1 |
| Initialize_assigneeLanguage | InitializeVariable | Operation ID: 21e4971f-ed16-4ab0-889b-94f2dd630d67 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
