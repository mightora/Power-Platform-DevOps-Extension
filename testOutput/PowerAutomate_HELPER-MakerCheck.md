# Power Automate Flow: HELPER-MakerCheck

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 00224829B4C1
**Source File:** HELPER-MakerCheck-9301F01A-CB40-EC11-8C62-00224829B4C1.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** HELPER-MakerCheck
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 4
- **Parameters:** 3

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: HELPER-MakerCheck

start
:Trigger: manual (Request);\n:Initialize_isOrphan (InitializeVariable);
:early_short_circuit (Scope);
 if (condition) then (yes)
  :If_not_system_Check_for_Short_Circuit (If);
   if (condition) then (yes)
    :If_so_exit_now_with_existing_values (If);
     if (condition) then (yes)
      :Respond_via_short_circuit (Response);
      :Terminate (Terminate);
      :not_writing_completion_to_coe_metadata_table_for_API_reasons (Compose);
     endif
    :Maker_checked_today (OpenApiConnection);
   endif
 endif
 partition "early_short_circuit" {
  :If_not_system_Check_for_Short_Circuit (If);
   if (condition) then (yes)
    :If_so_exit_now_with_existing_values (If);
     if (condition) then (yes)
      :Respond_via_short_circuit (Response);
      :Terminate (Terminate);
      :not_writing_completion_to_coe_metadata_table_for_API_reasons (Compose);
     endif
    :Maker_checked_today (OpenApiConnection);
   endif
 }
:Maker_Check_Scope (Scope);
 if (condition) then (yes)
  :If_System (If);
   if (condition) then (yes)
    :Get_System_User_GUID_for_ID (Scope);
     if (condition) then (yes)
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Compose_isSystem_true (Compose);
        :Compose_System_Id (Compose);
        :update_variable__isSystem_true (SetVariable);
        :update_variable__System_Id (SetVariable);
        :Compose_System_DisplayName (Compose);
        :update_variable__System_DisplayName (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     endif
     partition "Get_System_User_GUID_for_ID" {
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Compose_isSystem_true (Compose);
        :Compose_System_Id (Compose);
        :update_variable__isSystem_true (SetVariable);
        :update_variable__System_Id (SetVariable);
        :Compose_System_DisplayName (Compose);
        :update_variable__System_DisplayName (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     }
   endif
   else (no)
    :If_MakerID_is_null_or_empty (If);
     if (condition) then (yes)
      :Compose_isOrphan_to_true (Compose);
      :Set_isOrphan_to_true (SetVariable);
     endif
     else (no)
      :Short_Circuit_Check__if_maker_already_updated_today_use_its_properties (If);
       if (condition) then (yes)
        :Set_varMakerArray_second_short_circuit (SetVariable);
       endif
       else (no)
        :Switch (Switch);
        :Get_user_profile_V2 (OpenApiConnection);
       endif
      :See_if_maker_exists_and_updated_already_today (OpenApiConnection);
     endif
   endif
  :Respond_to_a_PowerApp_or_flow (Response);
  :Parse_JSON (ParseJson);
 endif
 partition "Maker_Check_Scope" {
  :If_System (If);
   if (condition) then (yes)
    :Get_System_User_GUID_for_ID (Scope);
     if (condition) then (yes)
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Compose_isSystem_true (Compose);
        :Compose_System_Id (Compose);
        :update_variable__isSystem_true (SetVariable);
        :update_variable__System_Id (SetVariable);
        :Compose_System_DisplayName (Compose);
        :update_variable__System_DisplayName (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     endif
     partition "Get_System_User_GUID_for_ID" {
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Compose_isSystem_true (Compose);
        :Compose_System_Id (Compose);
        :update_variable__isSystem_true (SetVariable);
        :update_variable__System_Id (SetVariable);
        :Compose_System_DisplayName (Compose);
        :update_variable__System_DisplayName (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     }
   endif
   else (no)
    :If_MakerID_is_null_or_empty (If);
     if (condition) then (yes)
      :Compose_isOrphan_to_true (Compose);
      :Set_isOrphan_to_true (SetVariable);
     endif
     else (no)
      :Short_Circuit_Check__if_maker_already_updated_today_use_its_properties (If);
       if (condition) then (yes)
        :Set_varMakerArray_second_short_circuit (SetVariable);
       endif
       else (no)
        :Switch (Switch);
        :Get_user_profile_V2 (OpenApiConnection);
       endif
      :See_if_maker_exists_and_updated_already_today (OpenApiConnection);
     endif
   endif
  :Respond_to_a_PowerApp_or_flow (Response);
  :Parse_JSON (ParseJson);
 }
:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate_2 (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate_2 (Terminate);
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
:Initialize_Maker_Object (InitializeVariable);
:Initialize_isApp (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_office365users | shared_office365users | admin_CoECoreO365Users | embedded |
| shared_webcontents | shared_webcontents | admin_CoECoreHTTPWithAzureAD | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Graph URL Environment Variable (admin_GraphURLEnvironmentVariable) | String | https://graph.microsoft.com/ | Inventory - REQUIRED. The URL used to get graph information for your cloud. Ex https://graph.microsoft.com/ |
| Disabled Users are Orphaned (admin_DisabledUsersareOrphaned) | Bool | - | Inventory - If true (Yes), then when an AD User is marked as disabled (Account enabled = false), they will be considered as orphaned. Default is false (No) |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_isOrphan | InitializeVariable | Operation ID: dfd6c5fa-821e-4a60-9cab-793104b90f9f |
| early_short_circuit | Scope | Operation ID: 28b58849-1279-4745-8c4e-1f3204169f86 |
| Maker_Check_Scope | Scope | Operation ID: 1922c61a-8c20-4c2a-b6a3-d3f37a7f1f71 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_Maker_Object | InitializeVariable | Operation ID: 2e3f87ca-2d74-4935-85ca-bcde30edfb14 |
| Initialize_isApp | InitializeVariable | Operation ID: b3a22be1-146d-4a93-b34a-3396a9bacba3 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
