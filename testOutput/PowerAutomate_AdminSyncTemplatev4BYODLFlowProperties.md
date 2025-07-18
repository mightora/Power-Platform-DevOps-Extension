# Power Automate Flow: AdminSyncTemplatev4BYODLFlowProperties

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 0022480813FF
**Source File:** AdminSyncTemplatev4BYODLFlowProperties-3A430A74-19E6-ED11-A7C7-0022480813FF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4BYODLFlowProperties
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 3
- **Parameters:** 3

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4BYODLFlowProperties

start
:Trigger: manual (Request);\n:Respond_to_a_PowerApp_or_flow (Response);
:Check_if_Inventory_in_sync_flow_architecture_terminate_if_true (If);
 if (condition) then (yes)
  :Terminate_for_environments_marked_deleted (Terminate);
 endif
:Error_Handling (Scope);
 if (condition) then (yes)
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
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
:Initialize_flowsToInventory (InitializeVariable);
:Get_extra_flow_properties_for_this_envt (Scope);
 if (condition) then (yes)
  :Get_Basics (Scope);
   if (condition) then (yes)
    :CurrentFlowInventory (OpenApiConnection);
    :Ensure_Envt_Inventoried (Scope);
     if (condition) then (yes)
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Ensure_Envt_Inventoried" {
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
    :List_Flows_as_Admin_V2 (OpenApiConnection);
    :Filter_out_unpublished_flows (Query);
   endif
   partition "Get_Basics" {
    :CurrentFlowInventory (OpenApiConnection);
    :Ensure_Envt_Inventoried (Scope);
     if (condition) then (yes)
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Ensure_Envt_Inventoried" {
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
    :List_Flows_as_Admin_V2 (OpenApiConnection);
    :Filter_out_unpublished_flows (Query);
   }
  :Inventory_all_targetted_flows (Foreach);
   if (condition) then (yes)
    :Run_a_Child_Flow (Workflow);
   endif
   repeat
    :Run_a_Child_Flow (Workflow);
   repeat while (more items)
  :Look_for_flows_with_estimated_suspension_data (Scope);
   if (condition) then (yes)
    :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
    :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
    :Select_Tenant__Pending_Suspension (Select);
    :Select_Inventory__Pending_Suspension (Select);
    :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
     if (condition) then (yes)
      :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
      :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
       if (condition) then (yes)
        :Update_pending_suspension_2 (OpenApiConnection);
       endif
       repeat
        :Update_pending_suspension_2 (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
      :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
      :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
       if (condition) then (yes)
        :Update_pending_suspension_2 (OpenApiConnection);
       endif
       repeat
        :Update_pending_suspension_2 (OpenApiConnection);
       repeat while (more items)
     }
    :Clear_things_no_longer_pending_suspension (Scope);
     if (condition) then (yes)
      :Apply_to_each_inventory_flow_with_estimated_suspension (Foreach);
       if (condition) then (yes)
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       endif
       repeat
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Clear_things_no_longer_pending_suspension" {
      :Apply_to_each_inventory_flow_with_estimated_suspension (Foreach);
       if (condition) then (yes)
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       endif
       repeat
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       repeat while (more items)
     }
   endif
   partition "Look_for_flows_with_estimated_suspension_data" {
    :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
    :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
    :Select_Tenant__Pending_Suspension (Select);
    :Select_Inventory__Pending_Suspension (Select);
    :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
     if (condition) then (yes)
      :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
      :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
       if (condition) then (yes)
        :Update_pending_suspension_2 (OpenApiConnection);
       endif
       repeat
        :Update_pending_suspension_2 (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
      :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
      :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
       if (condition) then (yes)
        :Update_pending_suspension_2 (OpenApiConnection);
       endif
       repeat
        :Update_pending_suspension_2 (OpenApiConnection);
       repeat while (more items)
     }
    :Clear_things_no_longer_pending_suspension (Scope);
     if (condition) then (yes)
      :Apply_to_each_inventory_flow_with_estimated_suspension (Foreach);
       if (condition) then (yes)
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       endif
       repeat
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Clear_things_no_longer_pending_suspension" {
      :Apply_to_each_inventory_flow_with_estimated_suspension (Foreach);
       if (condition) then (yes)
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       endif
       repeat
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       repeat while (more items)
     }
   }
  :Look_for_flows_manually_flagged_for_inventory (Scope);
   if (condition) then (yes)
    :FlowsToInventory__ManualRequest (OpenApiConnection);
    :Add_manual_requests_to_array (Foreach);
     if (condition) then (yes)
      :Append_to_flowsToInventory__manual_requests (AppendToArrayVariable);
     endif
     repeat
      :Append_to_flowsToInventory__manual_requests (AppendToArrayVariable);
     repeat while (more items)
   endif
   partition "Look_for_flows_manually_flagged_for_inventory" {
    :FlowsToInventory__ManualRequest (OpenApiConnection);
    :Add_manual_requests_to_array (Foreach);
     if (condition) then (yes)
      :Append_to_flowsToInventory__manual_requests (AppendToArrayVariable);
     endif
     repeat
      :Append_to_flowsToInventory__manual_requests (AppendToArrayVariable);
     repeat while (more items)
   }
  :Look_for_flows_with_broken_connections (Scope);
   if (condition) then (yes)
    :FlowsToInventory__BrokenConnections (OpenApiConnection);
    :Add_broken_connections_to_array (Foreach);
     if (condition) then (yes)
      :Append_to_flowsToInventory__broken_connections (AppendToArrayVariable);
     endif
     repeat
      :Append_to_flowsToInventory__broken_connections (AppendToArrayVariable);
     repeat while (more items)
   endif
   partition "Look_for_flows_with_broken_connections" {
    :FlowsToInventory__BrokenConnections (OpenApiConnection);
    :Add_broken_connections_to_array (Foreach);
     if (condition) then (yes)
      :Append_to_flowsToInventory__broken_connections (AppendToArrayVariable);
     endif
     repeat
      :Append_to_flowsToInventory__broken_connections (AppendToArrayVariable);
     repeat while (more items)
   }
  :raw (Compose);
  :Complete_List_FlowToInventory (Compose);
 endif
 partition "Get_extra_flow_properties_for_this_envt" {
  :Get_Basics (Scope);
   if (condition) then (yes)
    :CurrentFlowInventory (OpenApiConnection);
    :Ensure_Envt_Inventoried (Scope);
     if (condition) then (yes)
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Ensure_Envt_Inventoried" {
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
    :List_Flows_as_Admin_V2 (OpenApiConnection);
    :Filter_out_unpublished_flows (Query);
   endif
   partition "Get_Basics" {
    :CurrentFlowInventory (OpenApiConnection);
    :Ensure_Envt_Inventoried (Scope);
     if (condition) then (yes)
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Ensure_Envt_Inventoried" {
      :Get_Evnt_Details (OpenApiConnection);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
    :List_Flows_as_Admin_V2 (OpenApiConnection);
    :Filter_out_unpublished_flows (Query);
   }
  :Inventory_all_targetted_flows (Foreach);
   if (condition) then (yes)
    :Run_a_Child_Flow (Workflow);
   endif
   repeat
    :Run_a_Child_Flow (Workflow);
   repeat while (more items)
  :Look_for_flows_with_estimated_suspension_data (Scope);
   if (condition) then (yes)
    :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
    :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
    :Select_Tenant__Pending_Suspension (Select);
    :Select_Inventory__Pending_Suspension (Select);
    :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
     if (condition) then (yes)
      :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
      :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
       if (condition) then (yes)
        :Update_pending_suspension_2 (OpenApiConnection);
       endif
       repeat
        :Update_pending_suspension_2 (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
      :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
      :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
       if (condition) then (yes)
        :Update_pending_suspension_2 (OpenApiConnection);
       endif
       repeat
        :Update_pending_suspension_2 (OpenApiConnection);
       repeat while (more items)
     }
    :Clear_things_no_longer_pending_suspension (Scope);
     if (condition) then (yes)
      :Apply_to_each_inventory_flow_with_estimated_suspension (Foreach);
       if (condition) then (yes)
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       endif
       repeat
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Clear_things_no_longer_pending_suspension" {
      :Apply_to_each_inventory_flow_with_estimated_suspension (Foreach);
       if (condition) then (yes)
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       endif
       repeat
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       repeat while (more items)
     }
   endif
   partition "Look_for_flows_with_estimated_suspension_data" {
    :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
    :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
    :Select_Tenant__Pending_Suspension (Select);
    :Select_Inventory__Pending_Suspension (Select);
    :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
     if (condition) then (yes)
      :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
      :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
       if (condition) then (yes)
        :Update_pending_suspension_2 (OpenApiConnection);
       endif
       repeat
        :Update_pending_suspension_2 (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
      :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
      :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
       if (condition) then (yes)
        :Update_pending_suspension_2 (OpenApiConnection);
       endif
       repeat
        :Update_pending_suspension_2 (OpenApiConnection);
       repeat while (more items)
     }
    :Clear_things_no_longer_pending_suspension (Scope);
     if (condition) then (yes)
      :Apply_to_each_inventory_flow_with_estimated_suspension (Foreach);
       if (condition) then (yes)
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       endif
       repeat
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Clear_things_no_longer_pending_suspension" {
      :Apply_to_each_inventory_flow_with_estimated_suspension (Foreach);
       if (condition) then (yes)
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       endif
       repeat
        :See_if_still_has_estimated_suspension (Query);
        :If_no_longer_has_estimated_suspension_then_clear (If);
         if (condition) then (yes)
          :Clear_estimated_suspension_data (OpenApiConnection);
         endif
       repeat while (more items)
     }
   }
  :Look_for_flows_manually_flagged_for_inventory (Scope);
   if (condition) then (yes)
    :FlowsToInventory__ManualRequest (OpenApiConnection);
    :Add_manual_requests_to_array (Foreach);
     if (condition) then (yes)
      :Append_to_flowsToInventory__manual_requests (AppendToArrayVariable);
     endif
     repeat
      :Append_to_flowsToInventory__manual_requests (AppendToArrayVariable);
     repeat while (more items)
   endif
   partition "Look_for_flows_manually_flagged_for_inventory" {
    :FlowsToInventory__ManualRequest (OpenApiConnection);
    :Add_manual_requests_to_array (Foreach);
     if (condition) then (yes)
      :Append_to_flowsToInventory__manual_requests (AppendToArrayVariable);
     endif
     repeat
      :Append_to_flowsToInventory__manual_requests (AppendToArrayVariable);
     repeat while (more items)
   }
  :Look_for_flows_with_broken_connections (Scope);
   if (condition) then (yes)
    :FlowsToInventory__BrokenConnections (OpenApiConnection);
    :Add_broken_connections_to_array (Foreach);
     if (condition) then (yes)
      :Append_to_flowsToInventory__broken_connections (AppendToArrayVariable);
     endif
     repeat
      :Append_to_flowsToInventory__broken_connections (AppendToArrayVariable);
     repeat while (more items)
   endif
   partition "Look_for_flows_with_broken_connections" {
    :FlowsToInventory__BrokenConnections (OpenApiConnection);
    :Add_broken_connections_to_array (Foreach);
     if (condition) then (yes)
      :Append_to_flowsToInventory__broken_connections (AppendToArrayVariable);
     endif
     repeat
      :Append_to_flowsToInventory__broken_connections (AppendToArrayVariable);
     repeat while (more items)
   }
  :raw (Compose);
  :Complete_List_FlowToInventory (Compose);
 }
:Delay_Inventory (If);
 if (condition) then (yes)
  :Delay_1_to_300_minutes (Wait);
 endif

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_flowmanagement_1 | shared_flowmanagement | admin_CoECorePowerAutomateManagement | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Inventory and Telemetry in Azure Data Storage account (admin_InventoryandTelemetryinAzureDataStorageaccount) | Bool | - | Inventory - Have you set up data export in PPAC and is your inventory and telemetry in an Azure Data Storage folder (also referred to as Bring your own Datalake, self-serve analytics feature). Default no |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| DelayInventory (admin_DelayInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse health. Only turn to No for debugging.  |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Respond_to_a_PowerApp_or_flow | Response | Operation ID: 888a4ba5-9b3a-4fb4-aa45-19c8ff849d81 |
| Check_if_Inventory_in_sync_flow_architecture,_terminate_if_true | If | Operation ID: 0bf354ac-4265-4bbe-9fed-996958d038bd |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_flowsToInventory | InitializeVariable | Operation ID: e62ec4d2-a0ec-4fa6-952c-316178fd25d7 |
| Get_extra_flow_properties_for_this_envt | Scope | Operation ID: a61d4c0c-2a4d-4e5d-8cf5-b3d0a9ddf4aa |
| Delay_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
