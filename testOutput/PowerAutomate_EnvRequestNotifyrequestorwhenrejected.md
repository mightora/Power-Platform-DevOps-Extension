# Power Automate Flow: EnvRequestNotifyrequestorwhenrejected

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A99E2C3
**Source File:** EnvRequestNotifyrequestorwhenrejected-A3B69137-40E3-EB11-BACB-000D3A99E2C3.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** EnvRequestNotifyrequestorwhenrejected
- **Triggers:** 1
- **Actions:** 1 1 1 1
- **Connections:** 2
- **Parameters:** 4

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: EnvRequestNotifyrequestorwhenrejected

start
:Trigger: When_an_Environment_Creation_Request_has_been_Rejected (OpenApiConnectionWebhook);\n:Initialize_emailGUID (InitializeVariable);
:Notify_requestor_scope (Scope);
 if (condition) then (yes)
  :Get_a_row_by_ID__Requestor (OpenApiConnection);
  :Get_Maker (Workflow);
  :Send_Email_if_User_Still_Exists_and_Prod_Envt (If);
   if (condition) then (yes)
    :Get_Row__Request_was_rejected (Scope);
     if (condition) then (yes)
      :emailGUID_to_enUS (Compose);
      :List_emails_for_preferred_language (OpenApiConnection);
      :Set_emailGUID_to_localized_row (SetVariable);
      :Get_a_row_by_ID (OpenApiConnection);
     endif
     partition "Get_Row__Request_was_rejected" {
      :emailGUID_to_enUS (Compose);
      :List_emails_for_preferred_language (OpenApiConnection);
      :Set_emailGUID_to_localized_row (SetVariable);
      :Get_a_row_by_ID (OpenApiConnection);
     }
    :Request_was_rejected (Workflow);
   endif
   else (no)
    :Get_Row__Request_was_rejected__admin (Scope);
     if (condition) then (yes)
      :emailGUID_to_enUS_2 (Compose);
      :List_emails_for_preferred_language_2 (OpenApiConnection);
      :Set_emailGUID_to_localized_row_2 (SetVariable);
      :Get_a_row_by_ID_2 (OpenApiConnection);
     endif
     partition "Get_Row__Request_was_rejected__admin" {
      :emailGUID_to_enUS_2 (Compose);
      :List_emails_for_preferred_language_2 (OpenApiConnection);
      :Set_emailGUID_to_localized_row_2 (SetVariable);
      :Get_a_row_by_ID_2 (OpenApiConnection);
     }
    :Request_was_rejected__admin (Workflow);
   endif
  :Update_a_row__Set_to_Inactive_Status (OpenApiConnection);
 endif
 partition "Notify_requestor_scope" {
  :Get_a_row_by_ID__Requestor (OpenApiConnection);
  :Get_Maker (Workflow);
  :Send_Email_if_User_Still_Exists_and_Prod_Envt (If);
   if (condition) then (yes)
    :Get_Row__Request_was_rejected (Scope);
     if (condition) then (yes)
      :emailGUID_to_enUS (Compose);
      :List_emails_for_preferred_language (OpenApiConnection);
      :Set_emailGUID_to_localized_row (SetVariable);
      :Get_a_row_by_ID (OpenApiConnection);
     endif
     partition "Get_Row__Request_was_rejected" {
      :emailGUID_to_enUS (Compose);
      :List_emails_for_preferred_language (OpenApiConnection);
      :Set_emailGUID_to_localized_row (SetVariable);
      :Get_a_row_by_ID (OpenApiConnection);
     }
    :Request_was_rejected (Workflow);
   endif
   else (no)
    :Get_Row__Request_was_rejected__admin (Scope);
     if (condition) then (yes)
      :emailGUID_to_enUS_2 (Compose);
      :List_emails_for_preferred_language_2 (OpenApiConnection);
      :Set_emailGUID_to_localized_row_2 (SetVariable);
      :Get_a_row_by_ID_2 (OpenApiConnection);
     endif
     partition "Get_Row__Request_was_rejected__admin" {
      :emailGUID_to_enUS_2 (Compose);
      :List_emails_for_preferred_language_2 (OpenApiConnection);
      :Set_emailGUID_to_localized_row_2 (SetVariable);
      :Get_a_row_by_ID_2 (OpenApiConnection);
     }
    :Request_was_rejected__admin (Workflow);
   endif
  :Update_a_row__Set_to_Inactive_Status (OpenApiConnection);
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

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| ProductionEnvironment (admin_ProductionEnvironment) | Bool | - | Inventory - Yes by default. Set to No if you are creating a dev type envt. This will allow some flows to set target users to the admin instead of resource owners |
| Admin eMail Preferred Language (admin_AdmineMailPreferredLanguage) | String | en-US | Inventory - The preferred language for the emails sent to the admin email alias, which is specified in theAdmin eMail environment variable. Default is en-US |
| Admin eMail (admin_AdminMail) | String | PowerPlatformAdmins@powercattools.onmicrosoft.com | Inventory - CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list |

## Triggers

### When_an_Environment_Creation_Request_has_been_Rejected
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_emailGUID | InitializeVariable | Operation ID: b4e25108-c242-418e-b83e-bca602c4286a |
| Notify_requestor_scope | Scope | Operation ID: 7a3ba3b8-81ca-4821-9b98-098d3eca4908 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
