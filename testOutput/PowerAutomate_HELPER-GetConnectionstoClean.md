# Power Automate Flow: HELPER-GetConnectionstoClean

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A3411D9
**Source File:** HELPER-GetConnectionstoClean-4D38705E-20DB-EE11-904D-000D3A3411D9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** HELPER-GetConnectionstoClean
- **Triggers:** 1
- **Actions:** 1 1 1 1
- **Connections:** 5
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: HELPER-GetConnectionstoClean

start
:Trigger: manual (Request);\n:Initialize_returnArray (InitializeVariable);
:Get_Connections_to_Clean (Scope);
 if (condition) then (yes)
  :Input_Parameters (Scope);
   if (condition) then (yes)
    :User (Compose);
    :showAllUsers (Compose);
    :connector (Compose);
    :showAllConnectors (Compose);
    :showOnlyErrors (Compose);
    :showOnlyNoAccount (Compose);
   endif
   partition "Input_Parameters" {
    :User (Compose);
    :showAllUsers (Compose);
    :connector (Compose);
    :showAllConnectors (Compose);
    :showOnlyErrors (Compose);
    :showOnlyNoAccount (Compose);
   }
  :Get_Envt_List (Scope);
   if (condition) then (yes)
    :If_all_envts (If);
     if (condition) then (yes)
      :List_Environments_as_Admin (OpenApiConnection);
      :Select_Envts_All (Select);
     endif
     else (no)
      :Get_Environment_as_Admin (OpenApiConnection);
      :Select_Envts_One (Compose);
      :Select_Envts_Empty (Compose);
     endif
    :EnvtsToCollect (Compose);
   endif
   partition "Get_Envt_List" {
    :If_all_envts (If);
     if (condition) then (yes)
      :List_Environments_as_Admin (OpenApiConnection);
      :Select_Envts_All (Select);
     endif
     else (no)
      :Get_Environment_as_Admin (OpenApiConnection);
      :Select_Envts_One (Compose);
      :Select_Envts_Empty (Compose);
     endif
    :EnvtsToCollect (Compose);
   }
  :Send_in_Email_if_Requested (Scope);
   if (condition) then (yes)
    :If_sendToCSV_true (If);
     if (condition) then (yes)
      :Get_user_profile_V2 (OpenApiConnection);
      :Send_an_email_V2 (OpenApiConnection);
      :Create_CSV_table (Table);
     endif
   endif
   partition "Send_in_Email_if_Requested" {
    :If_sendToCSV_true (If);
     if (condition) then (yes)
      :Get_user_profile_V2 (OpenApiConnection);
      :Send_an_email_V2 (OpenApiConnection);
      :Create_CSV_table (Table);
     endif
   }
  :Fetch_and_return_data_to_app (Scope);
   if (condition) then (yes)
    :If_envt_exists (If);
     if (condition) then (yes)
      :Apply_to_each_envt (Foreach);
       if (condition) then (yes)
        :Get_Connections_as_Admin_for_this_Envt (OpenApiConnection);
        :Select (Select);
        :Filter_Account_Present_or_Not (Query);
        :Filter_to_User (Query);
        :Filter_to_Connector (Query);
        :Filter_to_Errors_Or_Not (Query);
        :Apply_to_each_connection (Foreach);
         if (condition) then (yes)
          :Append_to_array_variable (AppendToArrayVariable);
         endif
         repeat
          :Append_to_array_variable (AppendToArrayVariable);
         repeat while (more items)
        :Filter_to_nonnull_api_id (Query);
       endif
       repeat
        :Get_Connections_as_Admin_for_this_Envt (OpenApiConnection);
        :Select (Select);
        :Filter_Account_Present_or_Not (Query);
        :Filter_to_User (Query);
        :Filter_to_Connector (Query);
        :Filter_to_Errors_Or_Not (Query);
        :Apply_to_each_connection (Foreach);
         if (condition) then (yes)
          :Append_to_array_variable (AppendToArrayVariable);
         endif
         repeat
          :Append_to_array_variable (AppendToArrayVariable);
         repeat while (more items)
        :Filter_to_nonnull_api_id (Query);
       repeat while (more items)
      :Compose (Compose);
      :Response (Response);
     endif
     else (no)
      :Return_null_array (Response);
     endif
   endif
   partition "Fetch_and_return_data_to_app" {
    :If_envt_exists (If);
     if (condition) then (yes)
      :Apply_to_each_envt (Foreach);
       if (condition) then (yes)
        :Get_Connections_as_Admin_for_this_Envt (OpenApiConnection);
        :Select (Select);
        :Filter_Account_Present_or_Not (Query);
        :Filter_to_User (Query);
        :Filter_to_Connector (Query);
        :Filter_to_Errors_Or_Not (Query);
        :Apply_to_each_connection (Foreach);
         if (condition) then (yes)
          :Append_to_array_variable (AppendToArrayVariable);
         endif
         repeat
          :Append_to_array_variable (AppendToArrayVariable);
         repeat while (more items)
        :Filter_to_nonnull_api_id (Query);
       endif
       repeat
        :Get_Connections_as_Admin_for_this_Envt (OpenApiConnection);
        :Select (Select);
        :Filter_Account_Present_or_Not (Query);
        :Filter_to_User (Query);
        :Filter_to_Connector (Query);
        :Filter_to_Errors_Or_Not (Query);
        :Apply_to_each_connection (Foreach);
         if (condition) then (yes)
          :Append_to_array_variable (AppendToArrayVariable);
         endif
         repeat
          :Append_to_array_variable (AppendToArrayVariable);
         repeat while (more items)
        :Filter_to_nonnull_api_id (Query);
       repeat while (more items)
      :Compose (Compose);
      :Response (Response);
     endif
     else (no)
      :Return_null_array (Response);
     endif
   }
 endif
 partition "Get_Connections_to_Clean" {
  :Input_Parameters (Scope);
   if (condition) then (yes)
    :User (Compose);
    :showAllUsers (Compose);
    :connector (Compose);
    :showAllConnectors (Compose);
    :showOnlyErrors (Compose);
    :showOnlyNoAccount (Compose);
   endif
   partition "Input_Parameters" {
    :User (Compose);
    :showAllUsers (Compose);
    :connector (Compose);
    :showAllConnectors (Compose);
    :showOnlyErrors (Compose);
    :showOnlyNoAccount (Compose);
   }
  :Get_Envt_List (Scope);
   if (condition) then (yes)
    :If_all_envts (If);
     if (condition) then (yes)
      :List_Environments_as_Admin (OpenApiConnection);
      :Select_Envts_All (Select);
     endif
     else (no)
      :Get_Environment_as_Admin (OpenApiConnection);
      :Select_Envts_One (Compose);
      :Select_Envts_Empty (Compose);
     endif
    :EnvtsToCollect (Compose);
   endif
   partition "Get_Envt_List" {
    :If_all_envts (If);
     if (condition) then (yes)
      :List_Environments_as_Admin (OpenApiConnection);
      :Select_Envts_All (Select);
     endif
     else (no)
      :Get_Environment_as_Admin (OpenApiConnection);
      :Select_Envts_One (Compose);
      :Select_Envts_Empty (Compose);
     endif
    :EnvtsToCollect (Compose);
   }
  :Send_in_Email_if_Requested (Scope);
   if (condition) then (yes)
    :If_sendToCSV_true (If);
     if (condition) then (yes)
      :Get_user_profile_V2 (OpenApiConnection);
      :Send_an_email_V2 (OpenApiConnection);
      :Create_CSV_table (Table);
     endif
   endif
   partition "Send_in_Email_if_Requested" {
    :If_sendToCSV_true (If);
     if (condition) then (yes)
      :Get_user_profile_V2 (OpenApiConnection);
      :Send_an_email_V2 (OpenApiConnection);
      :Create_CSV_table (Table);
     endif
   }
  :Fetch_and_return_data_to_app (Scope);
   if (condition) then (yes)
    :If_envt_exists (If);
     if (condition) then (yes)
      :Apply_to_each_envt (Foreach);
       if (condition) then (yes)
        :Get_Connections_as_Admin_for_this_Envt (OpenApiConnection);
        :Select (Select);
        :Filter_Account_Present_or_Not (Query);
        :Filter_to_User (Query);
        :Filter_to_Connector (Query);
        :Filter_to_Errors_Or_Not (Query);
        :Apply_to_each_connection (Foreach);
         if (condition) then (yes)
          :Append_to_array_variable (AppendToArrayVariable);
         endif
         repeat
          :Append_to_array_variable (AppendToArrayVariable);
         repeat while (more items)
        :Filter_to_nonnull_api_id (Query);
       endif
       repeat
        :Get_Connections_as_Admin_for_this_Envt (OpenApiConnection);
        :Select (Select);
        :Filter_Account_Present_or_Not (Query);
        :Filter_to_User (Query);
        :Filter_to_Connector (Query);
        :Filter_to_Errors_Or_Not (Query);
        :Apply_to_each_connection (Foreach);
         if (condition) then (yes)
          :Append_to_array_variable (AppendToArrayVariable);
         endif
         repeat
          :Append_to_array_variable (AppendToArrayVariable);
         repeat while (more items)
        :Filter_to_nonnull_api_id (Query);
       repeat while (more items)
      :Compose (Compose);
      :Response (Response);
     endif
     else (no)
      :Return_null_array (Response);
     endif
   endif
   partition "Fetch_and_return_data_to_app" {
    :If_envt_exists (If);
     if (condition) then (yes)
      :Apply_to_each_envt (Foreach);
       if (condition) then (yes)
        :Get_Connections_as_Admin_for_this_Envt (OpenApiConnection);
        :Select (Select);
        :Filter_Account_Present_or_Not (Query);
        :Filter_to_User (Query);
        :Filter_to_Connector (Query);
        :Filter_to_Errors_Or_Not (Query);
        :Apply_to_each_connection (Foreach);
         if (condition) then (yes)
          :Append_to_array_variable (AppendToArrayVariable);
         endif
         repeat
          :Append_to_array_variable (AppendToArrayVariable);
         repeat while (more items)
        :Filter_to_nonnull_api_id (Query);
       endif
       repeat
        :Get_Connections_as_Admin_for_this_Envt (OpenApiConnection);
        :Select (Select);
        :Filter_Account_Present_or_Not (Query);
        :Filter_to_User (Query);
        :Filter_to_Connector (Query);
        :Filter_to_Errors_Or_Not (Query);
        :Apply_to_each_connection (Foreach);
         if (condition) then (yes)
          :Append_to_array_variable (AppendToArrayVariable);
         endif
         repeat
          :Append_to_array_variable (AppendToArrayVariable);
         repeat while (more items)
        :Filter_to_nonnull_api_id (Query);
       repeat while (more items)
      :Compose (Compose);
      :Response (Response);
     endif
     else (no)
      :Return_null_array (Response);
     endif
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

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |
| shared_office365users | shared_office365users | admin_CoECoreOffice365Users | invoker |
| shared_office365 | shared_office365 | admin_CoECoreO365Outlook | invoker |
| shared_powerappsforadmins | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

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
| Initialize_returnArray | InitializeVariable | Operation ID: 8d331410-deea-44f6-ac80-86394813d73d |
| Get_Connections_to_Clean | Scope | Operation ID: 3f7955e7-06d4-4cc2-99fb-e33775f1389d |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
