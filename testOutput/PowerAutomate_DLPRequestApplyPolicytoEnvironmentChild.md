# Power Automate Flow: DLPRequestApplyPolicytoEnvironmentChild

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 00224828FB29
**Source File:** DLPRequestApplyPolicytoEnvironmentChild-309DCCC8-A76B-EC11-8943-00224828FB29.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** DLPRequestApplyPolicytoEnvironmentChild
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: DLPRequestApplyPolicytoEnvironmentChild

start
:Trigger: manual (Request);\n:Initialize_variable__Policy_Id (InitializeVariable);
:Initialize_variable__Environment_Id (InitializeVariable);
:Initialize_variable__Status_Code (InitializeVariable);
:Initialize_variable__New_Environment_List (InitializeVariable);
:Initialize_variable__Status_Reason (InitializeVariable);
:Initialize_variable__Replace_All_Include_Policies (InitializeVariable);
:Initialize_variable__Skipped_Policies_List (InitializeVariable);
:Initialize_variable (InitializeVariable);
:Apply_policy_scope (Scope);
 if (condition) then (yes)
  :List_DLP_Policies_V2 (OpenApiConnection);
  :Get_Data (Scope);
   if (condition) then (yes)
    :Get_DLP_Policy_V2 (OpenApiConnection);
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_variable__Policy_Environments (SetVariable);
    :OnlyEnvironments_Policies (Query);
    :ExceptEnvironments_Policies (Query);
   endif
   partition "Get_Data" {
    :Get_DLP_Policy_V2 (OpenApiConnection);
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_variable__Policy_Environments (SetVariable);
    :OnlyEnvironments_Policies (Query);
    :ExceptEnvironments_Policies (Query);
   }
  :Add_Environment_to_target_Policys_list (Scope);
   if (condition) then (yes)
    :Filter_array (Query);
    :Check_if_Environment_already_in_Policy (If);
     else (no)
      :Append_to_array_variable (AppendToArrayVariable);
      :Update_DLP_Policy_V2 (OpenApiConnection);
     endif
    :Reset_Environments_Variable (SetVariable);
   endif
   partition "Add_Environment_to_target_Policys_list" {
    :Filter_array (Query);
    :Check_if_Environment_already_in_Policy (If);
     else (no)
      :Append_to_array_variable (AppendToArrayVariable);
      :Update_DLP_Policy_V2 (OpenApiConnection);
     endif
    :Reset_Environments_Variable (SetVariable);
   }
  :Check_input_to_Remove_Environment_from_other_Only_Environment_Policies (If);
   if (condition) then (yes)
    :Remove_Environment_from_other_Include_Policies (Scope);
     if (condition) then (yes)
      :Apply_to_each_Include_Policy (Foreach);
       if (condition) then (yes)
        :Updated_Environments_list_length (Compose);
        :Initial_Environments_list_length (Compose);
        :Filter_array__Remove_Environment (Query);
        :Display_conditional_values (Compose);
        :Skip_Policy_if_it_is_the_last_Environment (If);
         if (condition) then (yes)
          :Add_Policy_to_skippedPolicies_list (AppendToArrayVariable);
         endif
         else (no)
          :Remove_Environment_from_Policy_if_found (If);
           if (condition) then (yes)
            :Update_DLP_Policy_V2_2 (OpenApiConnection);
           endif
           else (no)
            :Path_Do_not_update_Policy (Compose);
           endif
         endif
       endif
       repeat
        :Updated_Environments_list_length (Compose);
        :Initial_Environments_list_length (Compose);
        :Filter_array__Remove_Environment (Query);
        :Display_conditional_values (Compose);
        :Skip_Policy_if_it_is_the_last_Environment (If);
         if (condition) then (yes)
          :Add_Policy_to_skippedPolicies_list (AppendToArrayVariable);
         endif
         else (no)
          :Remove_Environment_from_Policy_if_found (If);
           if (condition) then (yes)
            :Update_DLP_Policy_V2_2 (OpenApiConnection);
           endif
           else (no)
            :Path_Do_not_update_Policy (Compose);
           endif
         endif
       repeat while (more items)
      :Condition (If);
       if (condition) then (yes)
        :Append_to_array_variable_2 (AppendToArrayVariable);
       endif
     endif
     partition "Remove_Environment_from_other_Include_Policies" {
      :Apply_to_each_Include_Policy (Foreach);
       if (condition) then (yes)
        :Updated_Environments_list_length (Compose);
        :Initial_Environments_list_length (Compose);
        :Filter_array__Remove_Environment (Query);
        :Display_conditional_values (Compose);
        :Skip_Policy_if_it_is_the_last_Environment (If);
         if (condition) then (yes)
          :Add_Policy_to_skippedPolicies_list (AppendToArrayVariable);
         endif
         else (no)
          :Remove_Environment_from_Policy_if_found (If);
           if (condition) then (yes)
            :Update_DLP_Policy_V2_2 (OpenApiConnection);
           endif
           else (no)
            :Path_Do_not_update_Policy (Compose);
           endif
         endif
       endif
       repeat
        :Updated_Environments_list_length (Compose);
        :Initial_Environments_list_length (Compose);
        :Filter_array__Remove_Environment (Query);
        :Display_conditional_values (Compose);
        :Skip_Policy_if_it_is_the_last_Environment (If);
         if (condition) then (yes)
          :Add_Policy_to_skippedPolicies_list (AppendToArrayVariable);
         endif
         else (no)
          :Remove_Environment_from_Policy_if_found (If);
           if (condition) then (yes)
            :Update_DLP_Policy_V2_2 (OpenApiConnection);
           endif
           else (no)
            :Path_Do_not_update_Policy (Compose);
           endif
         endif
       repeat while (more items)
      :Condition (If);
       if (condition) then (yes)
        :Append_to_array_variable_2 (AppendToArrayVariable);
       endif
     }
   endif
  :Check_input_to_Exclude_Environment_from_all_Except_Environment_Policies (If);
   if (condition) then (yes)
    :Exclude_from_all_Exclude_Policies (Scope);
     if (condition) then (yes)
      :Apply_to_each_Exclude_Policy (Foreach);
       if (condition) then (yes)
        :Filter_array__Check_if_Environment_is_in_list (Query);
        :Check_if_Environments_list_already_had_this_environment (If);
         else (no)
          :Add_to_Exception_Environments_list (Compose);
          :Update_DLP_Policy_V2_3 (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_array__Check_if_Environment_is_in_list (Query);
        :Check_if_Environments_list_already_had_this_environment (If);
         else (no)
          :Add_to_Exception_Environments_list (Compose);
          :Update_DLP_Policy_V2_3 (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Exclude_from_all_Exclude_Policies" {
      :Apply_to_each_Exclude_Policy (Foreach);
       if (condition) then (yes)
        :Filter_array__Check_if_Environment_is_in_list (Query);
        :Check_if_Environments_list_already_had_this_environment (If);
         else (no)
          :Add_to_Exception_Environments_list (Compose);
          :Update_DLP_Policy_V2_3 (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_array__Check_if_Environment_is_in_list (Query);
        :Check_if_Environments_list_already_had_this_environment (If);
         else (no)
          :Add_to_Exception_Environments_list (Compose);
          :Update_DLP_Policy_V2_3 (OpenApiConnection);
         endif
       repeat while (more items)
     }
   endif
  :Compose (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
 endif
 partition "Apply_policy_scope" {
  :List_DLP_Policies_V2 (OpenApiConnection);
  :Get_Data (Scope);
   if (condition) then (yes)
    :Get_DLP_Policy_V2 (OpenApiConnection);
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_variable__Policy_Environments (SetVariable);
    :OnlyEnvironments_Policies (Query);
    :ExceptEnvironments_Policies (Query);
   endif
   partition "Get_Data" {
    :Get_DLP_Policy_V2 (OpenApiConnection);
    :Get_Environment_as_Admin (OpenApiConnection);
    :Set_variable__Policy_Environments (SetVariable);
    :OnlyEnvironments_Policies (Query);
    :ExceptEnvironments_Policies (Query);
   }
  :Add_Environment_to_target_Policys_list (Scope);
   if (condition) then (yes)
    :Filter_array (Query);
    :Check_if_Environment_already_in_Policy (If);
     else (no)
      :Append_to_array_variable (AppendToArrayVariable);
      :Update_DLP_Policy_V2 (OpenApiConnection);
     endif
    :Reset_Environments_Variable (SetVariable);
   endif
   partition "Add_Environment_to_target_Policys_list" {
    :Filter_array (Query);
    :Check_if_Environment_already_in_Policy (If);
     else (no)
      :Append_to_array_variable (AppendToArrayVariable);
      :Update_DLP_Policy_V2 (OpenApiConnection);
     endif
    :Reset_Environments_Variable (SetVariable);
   }
  :Check_input_to_Remove_Environment_from_other_Only_Environment_Policies (If);
   if (condition) then (yes)
    :Remove_Environment_from_other_Include_Policies (Scope);
     if (condition) then (yes)
      :Apply_to_each_Include_Policy (Foreach);
       if (condition) then (yes)
        :Updated_Environments_list_length (Compose);
        :Initial_Environments_list_length (Compose);
        :Filter_array__Remove_Environment (Query);
        :Display_conditional_values (Compose);
        :Skip_Policy_if_it_is_the_last_Environment (If);
         if (condition) then (yes)
          :Add_Policy_to_skippedPolicies_list (AppendToArrayVariable);
         endif
         else (no)
          :Remove_Environment_from_Policy_if_found (If);
           if (condition) then (yes)
            :Update_DLP_Policy_V2_2 (OpenApiConnection);
           endif
           else (no)
            :Path_Do_not_update_Policy (Compose);
           endif
         endif
       endif
       repeat
        :Updated_Environments_list_length (Compose);
        :Initial_Environments_list_length (Compose);
        :Filter_array__Remove_Environment (Query);
        :Display_conditional_values (Compose);
        :Skip_Policy_if_it_is_the_last_Environment (If);
         if (condition) then (yes)
          :Add_Policy_to_skippedPolicies_list (AppendToArrayVariable);
         endif
         else (no)
          :Remove_Environment_from_Policy_if_found (If);
           if (condition) then (yes)
            :Update_DLP_Policy_V2_2 (OpenApiConnection);
           endif
           else (no)
            :Path_Do_not_update_Policy (Compose);
           endif
         endif
       repeat while (more items)
      :Condition (If);
       if (condition) then (yes)
        :Append_to_array_variable_2 (AppendToArrayVariable);
       endif
     endif
     partition "Remove_Environment_from_other_Include_Policies" {
      :Apply_to_each_Include_Policy (Foreach);
       if (condition) then (yes)
        :Updated_Environments_list_length (Compose);
        :Initial_Environments_list_length (Compose);
        :Filter_array__Remove_Environment (Query);
        :Display_conditional_values (Compose);
        :Skip_Policy_if_it_is_the_last_Environment (If);
         if (condition) then (yes)
          :Add_Policy_to_skippedPolicies_list (AppendToArrayVariable);
         endif
         else (no)
          :Remove_Environment_from_Policy_if_found (If);
           if (condition) then (yes)
            :Update_DLP_Policy_V2_2 (OpenApiConnection);
           endif
           else (no)
            :Path_Do_not_update_Policy (Compose);
           endif
         endif
       endif
       repeat
        :Updated_Environments_list_length (Compose);
        :Initial_Environments_list_length (Compose);
        :Filter_array__Remove_Environment (Query);
        :Display_conditional_values (Compose);
        :Skip_Policy_if_it_is_the_last_Environment (If);
         if (condition) then (yes)
          :Add_Policy_to_skippedPolicies_list (AppendToArrayVariable);
         endif
         else (no)
          :Remove_Environment_from_Policy_if_found (If);
           if (condition) then (yes)
            :Update_DLP_Policy_V2_2 (OpenApiConnection);
           endif
           else (no)
            :Path_Do_not_update_Policy (Compose);
           endif
         endif
       repeat while (more items)
      :Condition (If);
       if (condition) then (yes)
        :Append_to_array_variable_2 (AppendToArrayVariable);
       endif
     }
   endif
  :Check_input_to_Exclude_Environment_from_all_Except_Environment_Policies (If);
   if (condition) then (yes)
    :Exclude_from_all_Exclude_Policies (Scope);
     if (condition) then (yes)
      :Apply_to_each_Exclude_Policy (Foreach);
       if (condition) then (yes)
        :Filter_array__Check_if_Environment_is_in_list (Query);
        :Check_if_Environments_list_already_had_this_environment (If);
         else (no)
          :Add_to_Exception_Environments_list (Compose);
          :Update_DLP_Policy_V2_3 (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_array__Check_if_Environment_is_in_list (Query);
        :Check_if_Environments_list_already_had_this_environment (If);
         else (no)
          :Add_to_Exception_Environments_list (Compose);
          :Update_DLP_Policy_V2_3 (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Exclude_from_all_Exclude_Policies" {
      :Apply_to_each_Exclude_Policy (Foreach);
       if (condition) then (yes)
        :Filter_array__Check_if_Environment_is_in_list (Query);
        :Check_if_Environments_list_already_had_this_environment (If);
         else (no)
          :Add_to_Exception_Environments_list (Compose);
          :Update_DLP_Policy_V2_3 (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_array__Check_if_Environment_is_in_list (Query);
        :Check_if_Environments_list_already_had_this_environment (If);
         else (no)
          :Add_to_Exception_Environments_list (Compose);
          :Update_DLP_Policy_V2_3 (OpenApiConnection);
         endif
       repeat while (more items)
     }
   endif
  :Compose (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
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
| shared_powerplatformforadmins_1 | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |
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
| Initialize_variable_-_Policy_Id | InitializeVariable | Operation ID: af133f1f-d881-425f-abb5-994d1f3e7fa8 |
| Initialize_variable_-_Environment_Id | InitializeVariable | Operation ID: 1d940939-5d76-425f-939d-6b89c5ecb2a9 |
| Initialize_variable_-_Status_Code | InitializeVariable | Operation ID: 3253630b-a7ca-4867-b459-06735cb05b9b |
| Initialize_variable_-_New_Environment_List | InitializeVariable | Operation ID: 1346fa96-8be3-4e39-8db2-5feecdc8b7c4 |
| Initialize_variable_-_Status_Reason | InitializeVariable | Operation ID: 981c092b-9ac7-43ca-ad02-74af18cbb122 |
| Initialize_variable_-_Replace_All_Include_Policies | InitializeVariable | Operation ID: a34be372-1602-4315-8214-0c7962233673 |
| Initialize_variable_-_Skipped_Policies_List | InitializeVariable | Operation ID: 56212822-3761-4825-86f6-830ef12020d6 |
| Initialize_variable | InitializeVariable | Operation ID: a52f037b-a344-4aa0-954f-e5af4e0bb0c0 |
| Apply_policy_scope | Scope | Operation ID: ac162a16-9a4e-4424-91a1-afb1d909a285 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
