# Power Automate Flow: CLEANUP-AdminSyncTemplatev3PVAUsage

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 00224805CBE4
**Source File:** CLEANUP-AdminSyncTemplatev3PVAUsage-58738DCC-755C-ED11-9561-00224805CBE4.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUP-AdminSyncTemplatev3PVAUsage
- **Triggers:** 1
- **Actions:** 1 1 1 1
- **Connections:** 
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUP-AdminSyncTemplatev3PVAUsage

start
:Trigger: Every_Month (Recurrence);\n:Update_Environment_AddOns (Scope);
 if (condition) then (yes)
  :List_environments_with_PVA_bots (OpenApiConnection);
  :Apply_to_each_environment (Foreach);
   if (condition) then (yes)
    :Sum_PVA_bot_usage_for_previous_month_per_environment (OpenApiConnection);
    :Parse_JSON_for_returned_PVA_bot_usage_sums (ParseJson);
    :List_PVA_Environment_AddOns (OpenApiConnection);
    :Check_if_PVA_Environment_AddOn_record_already_exists (If);
     if (condition) then (yes)
      :Update_Environment_AddOn (OpenApiConnection);
     endif
     else (no)
      :Add_Environment_AddOn (OpenApiConnection);
     endif
   endif
   repeat
    :Sum_PVA_bot_usage_for_previous_month_per_environment (OpenApiConnection);
    :Parse_JSON_for_returned_PVA_bot_usage_sums (ParseJson);
    :List_PVA_Environment_AddOns (OpenApiConnection);
    :Check_if_PVA_Environment_AddOn_record_already_exists (If);
     if (condition) then (yes)
      :Update_Environment_AddOn (OpenApiConnection);
     endif
     else (no)
      :Add_Environment_AddOn (OpenApiConnection);
     endif
   repeat while (more items)
 endif
 partition "Update_Environment_AddOns" {
  :List_environments_with_PVA_bots (OpenApiConnection);
  :Apply_to_each_environment (Foreach);
   if (condition) then (yes)
    :Sum_PVA_bot_usage_for_previous_month_per_environment (OpenApiConnection);
    :Parse_JSON_for_returned_PVA_bot_usage_sums (ParseJson);
    :List_PVA_Environment_AddOns (OpenApiConnection);
    :Check_if_PVA_Environment_AddOn_record_already_exists (If);
     if (condition) then (yes)
      :Update_Environment_AddOn (OpenApiConnection);
     endif
     else (no)
      :Add_Environment_AddOn (OpenApiConnection);
     endif
   endif
   repeat
    :Sum_PVA_bot_usage_for_previous_month_per_environment (OpenApiConnection);
    :Parse_JSON_for_returned_PVA_bot_usage_sums (ParseJson);
    :List_PVA_Environment_AddOns (OpenApiConnection);
    :Check_if_PVA_Environment_AddOn_record_already_exists (If);
     if (condition) then (yes)
      :Update_Environment_AddOn (OpenApiConnection);
     endif
     else (no)
      :Add_Environment_AddOn (OpenApiConnection);
     endif
   repeat while (more items)
 }
:Update_PVA_Bots (Scope);
 if (condition) then (yes)
  :List_PVA_Bots (OpenApiConnection);
  :Apply_to_each_PVA_Bot (Foreach);
   if (condition) then (yes)
    :Sum_PVA_bot_usage_for_previous_month_per_bot (OpenApiConnection);
    :Parse_JSON_for_returned_PVA_bot_usage_sums_for_the_bot (ParseJson);
    :Update_a_row (OpenApiConnection);
   endif
   repeat
    :Sum_PVA_bot_usage_for_previous_month_per_bot (OpenApiConnection);
    :Parse_JSON_for_returned_PVA_bot_usage_sums_for_the_bot (ParseJson);
    :Update_a_row (OpenApiConnection);
   repeat while (more items)
 endif
 partition "Update_PVA_Bots" {
  :List_PVA_Bots (OpenApiConnection);
  :Apply_to_each_PVA_Bot (Foreach);
   if (condition) then (yes)
    :Sum_PVA_bot_usage_for_previous_month_per_bot (OpenApiConnection);
    :Parse_JSON_for_returned_PVA_bot_usage_sums_for_the_bot (ParseJson);
    :Update_a_row (OpenApiConnection);
   endif
   repeat
    :Sum_PVA_bot_usage_for_previous_month_per_bot (OpenApiConnection);
    :Parse_JSON_for_returned_PVA_bot_usage_sums_for_the_bot (ParseJson);
    :Update_a_row (OpenApiConnection);
   repeat while (more items)
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
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### Every_Month
- **Type:** Recurrence
- **Recurrence:** Frequency: Month, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Update_Environment_Add-Ons | Scope | Operation ID: 45a59840-99bf-4a2a-a7a8-e28970073b25 |
| Update_PVA_Bots | Scope | Operation ID: 30831c61-f678-449d-acca-ef994a5abd44 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
