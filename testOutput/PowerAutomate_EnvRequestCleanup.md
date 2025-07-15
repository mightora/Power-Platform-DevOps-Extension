# Power Automate Flow: EnvRequestCleanup

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A1F6A72
**Source File:** EnvRequestCleanup-E1C9B288-F98C-EB11-A812-000D3A1F6A72.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** EnvRequestCleanup
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 3
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: EnvRequestCleanup

start
:Trigger: Recurrence (Recurrence);\n:Initialize_emailGUID (InitializeVariable);
:Initialize_variable_for_testing (InitializeVariable);
:Cleanup_Environments_Scope (Scope);
 if (condition) then (yes)
  :Parallel_Start (Compose);
  :Delete_Expired_Environments (Scope);
   if (condition) then (yes)
    :Apply_to_each_Expired_Request (Foreach);
     if (condition) then (yes)
      :Update_a_row__Close_expired_Request (OpenApiConnection);
      :Delete_expired_Environment (OpenApiConnection);
     endif
     repeat
      :Update_a_row__Close_expired_Request (OpenApiConnection);
      :Delete_expired_Environment (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Delete_Expired_Environments" {
    :Apply_to_each_Expired_Request (Foreach);
     if (condition) then (yes)
      :Update_a_row__Close_expired_Request (OpenApiConnection);
      :Delete_expired_Environment (OpenApiConnection);
     endif
     repeat
      :Update_a_row__Close_expired_Request (OpenApiConnection);
      :Delete_expired_Environment (OpenApiConnection);
     repeat while (more items)
   }
  :Notify_Admins_of_Expiring_Environments (Scope);
   if (condition) then (yes)
    :Warning_Email_Send_Conditions (If);
     if (condition) then (yes)
      :Apply_to_each_Expiring_Request (Foreach);
       if (condition) then (yes)
        :Send_Warning_Email (Workflow);
        :UPNs (Select);
        :Warning_Email_To (Compose);
        :Join_UPNs_Warning (Join);
       endif
       repeat
        :Send_Warning_Email (Workflow);
        :UPNs (Select);
        :Warning_Email_To (Compose);
        :Join_UPNs_Warning (Join);
       repeat while (more items)
      :Send_Email_Values_Warning (Scope);
       if (condition) then (yes)
        :emailGUID_to_enUS_5 (Compose);
        :List_emails_for_preferred_language_5 (OpenApiConnection);
        :Localized_Email_Row (SetVariable);
        :Warning_Email (OpenApiConnection);
        :CC (Compose);
        :SendOnBehalf (Compose);
        :ReplyTo (Compose);
        :Importance (Compose);
       endif
       partition "Send_Email_Values_Warning" {
        :emailGUID_to_enUS_5 (Compose);
        :List_emails_for_preferred_language_5 (OpenApiConnection);
        :Localized_Email_Row (SetVariable);
        :Warning_Email (OpenApiConnection);
        :CC (Compose);
        :SendOnBehalf (Compose);
        :ReplyTo (Compose);
        :Importance (Compose);
       }
     endif
   endif
   partition "Notify_Admins_of_Expiring_Environments" {
    :Warning_Email_Send_Conditions (If);
     if (condition) then (yes)
      :Apply_to_each_Expiring_Request (Foreach);
       if (condition) then (yes)
        :Send_Warning_Email (Workflow);
        :UPNs (Select);
        :Warning_Email_To (Compose);
        :Join_UPNs_Warning (Join);
       endif
       repeat
        :Send_Warning_Email (Workflow);
        :UPNs (Select);
        :Warning_Email_To (Compose);
        :Join_UPNs_Warning (Join);
       repeat while (more items)
      :Send_Email_Values_Warning (Scope);
       if (condition) then (yes)
        :emailGUID_to_enUS_5 (Compose);
        :List_emails_for_preferred_language_5 (OpenApiConnection);
        :Localized_Email_Row (SetVariable);
        :Warning_Email (OpenApiConnection);
        :CC (Compose);
        :SendOnBehalf (Compose);
        :ReplyTo (Compose);
        :Importance (Compose);
       endif
       partition "Send_Email_Values_Warning" {
        :emailGUID_to_enUS_5 (Compose);
        :List_emails_for_preferred_language_5 (OpenApiConnection);
        :Localized_Email_Row (SetVariable);
        :Warning_Email (OpenApiConnection);
        :CC (Compose);
        :SendOnBehalf (Compose);
        :ReplyTo (Compose);
        :Importance (Compose);
       }
     endif
   }
  :Close_Request_for_Environments_that_were_manually_deleted (Scope);
   if (condition) then (yes)
    :Apply_to_each_Live_Environment_Creation_Request (Foreach);
     if (condition) then (yes)
      :Environment_exists_in_Power_Platform_API (If);
       else (no)
        :Close_Request_Manually_Deleted (OpenApiConnection);
       endif
      :Get_Environment_from_Power_Platform_response (Query);
     endif
     repeat
      :Environment_exists_in_Power_Platform_API (If);
       else (no)
        :Close_Request_Manually_Deleted (OpenApiConnection);
       endif
      :Get_Environment_from_Power_Platform_response (Query);
     repeat while (more items)
   endif
   partition "Close_Request_for_Environments_that_were_manually_deleted" {
    :Apply_to_each_Live_Environment_Creation_Request (Foreach);
     if (condition) then (yes)
      :Environment_exists_in_Power_Platform_API (If);
       else (no)
        :Close_Request_Manually_Deleted (OpenApiConnection);
       endif
      :Get_Environment_from_Power_Platform_response (Query);
     endif
     repeat
      :Environment_exists_in_Power_Platform_API (If);
       else (no)
        :Close_Request_Manually_Deleted (OpenApiConnection);
       endif
      :Get_Environment_from_Power_Platform_response (Query);
     repeat while (more items)
   }
  :Parallel_End (Compose);
 endif
 partition "Cleanup_Environments_Scope" {
  :Parallel_Start (Compose);
  :Delete_Expired_Environments (Scope);
   if (condition) then (yes)
    :Apply_to_each_Expired_Request (Foreach);
     if (condition) then (yes)
      :Update_a_row__Close_expired_Request (OpenApiConnection);
      :Delete_expired_Environment (OpenApiConnection);
     endif
     repeat
      :Update_a_row__Close_expired_Request (OpenApiConnection);
      :Delete_expired_Environment (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Delete_Expired_Environments" {
    :Apply_to_each_Expired_Request (Foreach);
     if (condition) then (yes)
      :Update_a_row__Close_expired_Request (OpenApiConnection);
      :Delete_expired_Environment (OpenApiConnection);
     endif
     repeat
      :Update_a_row__Close_expired_Request (OpenApiConnection);
      :Delete_expired_Environment (OpenApiConnection);
     repeat while (more items)
   }
  :Notify_Admins_of_Expiring_Environments (Scope);
   if (condition) then (yes)
    :Warning_Email_Send_Conditions (If);
     if (condition) then (yes)
      :Apply_to_each_Expiring_Request (Foreach);
       if (condition) then (yes)
        :Send_Warning_Email (Workflow);
        :UPNs (Select);
        :Warning_Email_To (Compose);
        :Join_UPNs_Warning (Join);
       endif
       repeat
        :Send_Warning_Email (Workflow);
        :UPNs (Select);
        :Warning_Email_To (Compose);
        :Join_UPNs_Warning (Join);
       repeat while (more items)
      :Send_Email_Values_Warning (Scope);
       if (condition) then (yes)
        :emailGUID_to_enUS_5 (Compose);
        :List_emails_for_preferred_language_5 (OpenApiConnection);
        :Localized_Email_Row (SetVariable);
        :Warning_Email (OpenApiConnection);
        :CC (Compose);
        :SendOnBehalf (Compose);
        :ReplyTo (Compose);
        :Importance (Compose);
       endif
       partition "Send_Email_Values_Warning" {
        :emailGUID_to_enUS_5 (Compose);
        :List_emails_for_preferred_language_5 (OpenApiConnection);
        :Localized_Email_Row (SetVariable);
        :Warning_Email (OpenApiConnection);
        :CC (Compose);
        :SendOnBehalf (Compose);
        :ReplyTo (Compose);
        :Importance (Compose);
       }
     endif
   endif
   partition "Notify_Admins_of_Expiring_Environments" {
    :Warning_Email_Send_Conditions (If);
     if (condition) then (yes)
      :Apply_to_each_Expiring_Request (Foreach);
       if (condition) then (yes)
        :Send_Warning_Email (Workflow);
        :UPNs (Select);
        :Warning_Email_To (Compose);
        :Join_UPNs_Warning (Join);
       endif
       repeat
        :Send_Warning_Email (Workflow);
        :UPNs (Select);
        :Warning_Email_To (Compose);
        :Join_UPNs_Warning (Join);
       repeat while (more items)
      :Send_Email_Values_Warning (Scope);
       if (condition) then (yes)
        :emailGUID_to_enUS_5 (Compose);
        :List_emails_for_preferred_language_5 (OpenApiConnection);
        :Localized_Email_Row (SetVariable);
        :Warning_Email (OpenApiConnection);
        :CC (Compose);
        :SendOnBehalf (Compose);
        :ReplyTo (Compose);
        :Importance (Compose);
       endif
       partition "Send_Email_Values_Warning" {
        :emailGUID_to_enUS_5 (Compose);
        :List_emails_for_preferred_language_5 (OpenApiConnection);
        :Localized_Email_Row (SetVariable);
        :Warning_Email (OpenApiConnection);
        :CC (Compose);
        :SendOnBehalf (Compose);
        :ReplyTo (Compose);
        :Importance (Compose);
       }
     endif
   }
  :Close_Request_for_Environments_that_were_manually_deleted (Scope);
   if (condition) then (yes)
    :Apply_to_each_Live_Environment_Creation_Request (Foreach);
     if (condition) then (yes)
      :Environment_exists_in_Power_Platform_API (If);
       else (no)
        :Close_Request_Manually_Deleted (OpenApiConnection);
       endif
      :Get_Environment_from_Power_Platform_response (Query);
     endif
     repeat
      :Environment_exists_in_Power_Platform_API (If);
       else (no)
        :Close_Request_Manually_Deleted (OpenApiConnection);
       endif
      :Get_Environment_from_Power_Platform_response (Query);
     repeat while (more items)
   endif
   partition "Close_Request_for_Environments_that_were_manually_deleted" {
    :Apply_to_each_Live_Environment_Creation_Request (Foreach);
     if (condition) then (yes)
      :Environment_exists_in_Power_Platform_API (If);
       else (no)
        :Close_Request_Manually_Deleted (OpenApiConnection);
       endif
      :Get_Environment_from_Power_Platform_response (Query);
     endif
     repeat
      :Environment_exists_in_Power_Platform_API (If);
       else (no)
        :Close_Request_Manually_Deleted (OpenApiConnection);
       endif
      :Get_Environment_from_Power_Platform_response (Query);
     repeat while (more items)
   }
  :Parallel_End (Compose);
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
:Data (Scope);
 if (condition) then (yes)
  :Get_future_time__1_month (Expression);
  :Active_Environment_Creation_Requests (OpenApiConnection);
  :List_Environments_as_Admin (OpenApiConnection);
  :Linked_Requests (Query);
  :Expired_Requests (Query);
  :Expiring_Requests (Query);
  :Live_Requests (Query);
 endif
 partition "Data" {
  :Get_future_time__1_month (Expression);
  :Active_Environment_Creation_Requests (OpenApiConnection);
  :List_Environments_as_Admin (OpenApiConnection);
  :Linked_Requests (Query);
  :Expired_Requests (Query);
  :Expiring_Requests (Query);
  :Live_Requests (Query);
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Admin eMail Preferred Language (admin_AdmineMailPreferredLanguage) | String | en-US | Inventory - The preferred language for the emails sent to the admin email alias, which is specified in theAdmin eMail environment variable. Default is en-US |
| ProductionEnvironment (admin_ProductionEnvironment) | Bool | True | Inventory - Yes by default. Set to No if you are creating a dev type envt. This will allow some flows to set target users to the admin instead of resource owners |
| Admin eMail (admin_AdminMail) | String | PowerPlatformAdmins@powercattools.onmicrosoft.com | Inventory - CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| PowerApp Maker Environment Variable (admin_PowerAppEnvironmentVariable) | String | https://make.powerapps.com/ | Inventory - REQUIRED. The maker URL used by PowerApps for your cloud. Ex https://make.powerapps.com/ |

## Triggers

### Recurrence
- **Type:** Recurrence
- **Recurrence:** Frequency: Day, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_emailGUID | InitializeVariable | Operation ID: dad8eca6-7937-47c0-aa57-f2d48dd1c5a2 |
| Initialize_variable_for_testing | InitializeVariable | Operation ID: 47476d04-d2eb-4800-b003-8c1cb4ef55b2 |
| Cleanup_Environments_Scope | Scope | Operation ID: 69e7b923-a9c0-4606-8976-6d691eeebb0f |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Data | Scope | Operation ID: 22afb031-d289-48e0-b275-e67c1f7ff798 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
