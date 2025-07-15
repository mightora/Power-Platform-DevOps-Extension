# Power Automate Flow: DLPRequestSyncPolicytoDataverseChild

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 002248266489
**Source File:** DLPRequestSyncPolicytoDataverseChild-E55E412F-BF69-EC11-8943-002248266489.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** DLPRequestSyncPolicytoDataverseChild
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: DLPRequestSyncPolicytoDataverseChild

start
:Trigger: manual (Request);\n:Initialize_variable__Currently_Blocked_Connectors (InitializeVariable);
:Initialize_variable__Connectors_to_Relate (InitializeVariable);
:Initialize_variable__Connectors_to_Unrelate (InitializeVariable);
:Initialize_variable__Policy_Id (InitializeVariable);
:Scope__Sync_Policy (Scope);
 if (condition) then (yes)
  :Get_Data (Scope);
   if (condition) then (yes)
    :List_rows__PowerApps_Connectors (OpenApiConnection);
    :Get_Policy (OpenApiConnection);
    :Get_DLP_Policy_from_Power_Platform_API (OpenApiConnection);
    :Filter_Blocked_Connectors_group (Query);
    :Set_variable__Currently_Blocked_Connectors (SetVariable);
   endif
   partition "Get_Data" {
    :List_rows__PowerApps_Connectors (OpenApiConnection);
    :Get_Policy (OpenApiConnection);
    :Get_DLP_Policy_from_Power_Platform_API (OpenApiConnection);
    :Filter_Blocked_Connectors_group (Query);
    :Set_variable__Currently_Blocked_Connectors (SetVariable);
   }
  :Parse_JSON__DLP_Policies_with_Connectors (ParseJson);
  :Set_variable_3 (SetVariable);
  :Update_Policy_Connectors_in_Dataverse (Scope);
   if (condition) then (yes)
    :Relate_connectors_not_already_in_Policy (Scope);
     if (condition) then (yes)
      :Apply_to_each_Blocked_Connector (Foreach);
       if (condition) then (yes)
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       endif
       repeat
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       repeat while (more items)
     endif
     partition "Relate_connectors_not_already_in_Policy" {
      :Apply_to_each_Blocked_Connector (Foreach);
       if (condition) then (yes)
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       endif
       repeat
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       repeat while (more items)
     }
    :Unrelate_connectors_no_longer_in_Policy (Scope);
     if (condition) then (yes)
      :Apply_to_each_Connector_in_Dataverse_Policy (Foreach);
       if (condition) then (yes)
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
     endif
     partition "Unrelate_connectors_no_longer_in_Policy" {
      :Apply_to_each_Connector_in_Dataverse_Policy (Foreach);
       if (condition) then (yes)
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
     }
    :Compose_3 (Compose);
    :Compose_2 (Compose);
   endif
   partition "Update_Policy_Connectors_in_Dataverse" {
    :Relate_connectors_not_already_in_Policy (Scope);
     if (condition) then (yes)
      :Apply_to_each_Blocked_Connector (Foreach);
       if (condition) then (yes)
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       endif
       repeat
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       repeat while (more items)
     endif
     partition "Relate_connectors_not_already_in_Policy" {
      :Apply_to_each_Blocked_Connector (Foreach);
       if (condition) then (yes)
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       endif
       repeat
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       repeat while (more items)
     }
    :Unrelate_connectors_no_longer_in_Policy (Scope);
     if (condition) then (yes)
      :Apply_to_each_Connector_in_Dataverse_Policy (Foreach);
       if (condition) then (yes)
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
     endif
     partition "Unrelate_connectors_no_longer_in_Policy" {
      :Apply_to_each_Connector_in_Dataverse_Policy (Foreach);
       if (condition) then (yes)
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
     }
    :Compose_3 (Compose);
    :Compose_2 (Compose);
   }
 endif
 partition "Scope__Sync_Policy" {
  :Get_Data (Scope);
   if (condition) then (yes)
    :List_rows__PowerApps_Connectors (OpenApiConnection);
    :Get_Policy (OpenApiConnection);
    :Get_DLP_Policy_from_Power_Platform_API (OpenApiConnection);
    :Filter_Blocked_Connectors_group (Query);
    :Set_variable__Currently_Blocked_Connectors (SetVariable);
   endif
   partition "Get_Data" {
    :List_rows__PowerApps_Connectors (OpenApiConnection);
    :Get_Policy (OpenApiConnection);
    :Get_DLP_Policy_from_Power_Platform_API (OpenApiConnection);
    :Filter_Blocked_Connectors_group (Query);
    :Set_variable__Currently_Blocked_Connectors (SetVariable);
   }
  :Parse_JSON__DLP_Policies_with_Connectors (ParseJson);
  :Set_variable_3 (SetVariable);
  :Update_Policy_Connectors_in_Dataverse (Scope);
   if (condition) then (yes)
    :Relate_connectors_not_already_in_Policy (Scope);
     if (condition) then (yes)
      :Apply_to_each_Blocked_Connector (Foreach);
       if (condition) then (yes)
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       endif
       repeat
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       repeat while (more items)
     endif
     partition "Relate_connectors_not_already_in_Policy" {
      :Apply_to_each_Blocked_Connector (Foreach);
       if (condition) then (yes)
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       endif
       repeat
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       repeat while (more items)
     }
    :Unrelate_connectors_no_longer_in_Policy (Scope);
     if (condition) then (yes)
      :Apply_to_each_Connector_in_Dataverse_Policy (Foreach);
       if (condition) then (yes)
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
     endif
     partition "Unrelate_connectors_no_longer_in_Policy" {
      :Apply_to_each_Connector_in_Dataverse_Policy (Foreach);
       if (condition) then (yes)
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
     }
    :Compose_3 (Compose);
    :Compose_2 (Compose);
   endif
   partition "Update_Policy_Connectors_in_Dataverse" {
    :Relate_connectors_not_already_in_Policy (Scope);
     if (condition) then (yes)
      :Apply_to_each_Blocked_Connector (Foreach);
       if (condition) then (yes)
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       endif
       repeat
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       repeat while (more items)
     endif
     partition "Relate_connectors_not_already_in_Policy" {
      :Apply_to_each_Blocked_Connector (Foreach);
       if (condition) then (yes)
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       endif
       repeat
        :Find_connector_in_Dataverse_Policy (Query);
        :Check_if_blocked_connector_is_in_the_Dataverse_Policy (If);
         else (no)
          :Compose (Compose);
          :Filter_array (Query);
          :Compose_4 (Compose);
          :Condition (If);
           if (condition) then (yes)
            :Relate_rows (OpenApiConnection);
           endif
           else (no)
            :Append_to_array_variable (AppendToArrayVariable);
           endif
         endif
       repeat while (more items)
     }
    :Unrelate_connectors_no_longer_in_Policy (Scope);
     if (condition) then (yes)
      :Apply_to_each_Connector_in_Dataverse_Policy (Foreach);
       if (condition) then (yes)
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
     endif
     partition "Unrelate_connectors_no_longer_in_Policy" {
      :Apply_to_each_Connector_in_Dataverse_Policy (Foreach);
       if (condition) then (yes)
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Check_if_connector_still_in_Platform_Policy (Query);
        :Connector_is_still_in_Platform_Policy (If);
         else (no)
          :Append_to_array_variable_2 (AppendToArrayVariable);
          :Connector_no_longer_in_policy (Compose);
          :Find_connector_in_Dataverse_Policy_to_Unrelate (Query);
          :Check_if_connect_no_longer_in_policy_is_null (If);
           if (condition) then (yes)
            :Unrelate_rows (OpenApiConnection);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
     }
    :Compose_3 (Compose);
    :Compose_2 (Compose);
   }
 }
:Initialize_variable__Recorded_Blocked_Connectors (InitializeVariable);
:Initialize_variable__Status_Code (InitializeVariable);
:Set_variable__Status_Code__Failed (SetVariable);
:Compose_5 (Compose);
:Respond_to_a_PowerApp_or_flow (Response);
:If_passed_or_failed (If);
 if (condition) then (yes)
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
 endif
 else (no)
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

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_powerplatformforadmins_1 | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |

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
| Initialize_variable_-_Currently_Blocked_Connectors | InitializeVariable | Operation ID: 3192c57a-0311-4da8-884e-3721c221379e |
| Initialize_variable_-_Connectors_to_Relate | InitializeVariable | Operation ID: 8949b3b5-ffb3-4a8d-b653-683230b124b8 |
| Initialize_variable_-_Connectors_to_Unrelate | InitializeVariable | Operation ID: 06f4dbc2-5432-439c-9711-47801b575158 |
| Initialize_variable_-_Policy_Id | InitializeVariable | Operation ID: b2e6b686-8eca-4284-b57b-2f058cd0792b |
| Scope_-_Sync_Policy | Scope | Operation ID: 757bcfcd-6738-41e8-b7d5-4196f120a408 |
| Initialize_variable_-_Recorded_Blocked_Connectors | InitializeVariable | Operation ID: 490a863c-0978-45ad-87f0-78f1c2ae13d2 |
| Initialize_variable_-_Status_Code | InitializeVariable | Operation ID: 99970bdd-1b01-42e0-870e-79df17667aea |
| Set_variable_-_Status_Code_-_Failed | SetVariable | Operation ID: c89bbd05-d358-40cf-92eb-af15e39c7daf |
| Compose_5 | Compose | Operation ID: 457b963c-7ae0-4a5d-b1c8-667a3fc08425 |
| Respond_to_a_PowerApp_or_flow | Response | Operation ID: 1554c53b-8521-49fd-91a1-dd28d2f49f7c |
| If_passed_or_failed | If | Operation ID: 39ff2a5f-eb32-4553-88c5-c2e571e8b7dd |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
