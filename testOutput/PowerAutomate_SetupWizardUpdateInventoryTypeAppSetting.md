# Power Automate Flow: SetupWizardUpdateInventoryTypeAppSetting

**Generated on:** 2025-07-15 19:14:49
**Flow ID:** 0022480813FF
**Source File:** SetupWizardUpdateInventoryTypeAppSetting-EA05B390-A3B6-ED11-83FE-0022480813FF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** SetupWizardUpdateInventoryTypeAppSetting
- **Triggers:** 1
- **Actions:** 1 1 1 1
- **Connections:** 3
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: SetupWizardUpdateInventoryTypeAppSetting

start
:Trigger: When_a_row_is_added,_modified_or_deleted (OpenApiConnectionWebhook);\n:Update_Inventory_Type_App_Setting (Scope);
 if (condition) then (yes)
  :update_app_settings_based_on_result (If);
   if (condition) then (yes)
    :update_settings_for_byodl_true (Scope);
     if (condition) then (yes)
      :Perform_an_unbound_action__is_byodl_true (OpenApiConnection);
      :Perform_an_unbound_action__is_sync_flow_false (OpenApiConnection);
     endif
     partition "update_settings_for_byodl_true" {
      :Perform_an_unbound_action__is_byodl_true (OpenApiConnection);
      :Perform_an_unbound_action__is_sync_flow_false (OpenApiConnection);
     }
    :turn_off_flows_where_usedforbyodlcoe_is_false (Scope);
     if (condition) then (yes)
      :List_flows_where_usedforbyodlcoe_is_false (OpenApiConnection);
      :Apply_to_each_usedforbyodlcoe_is_false (Foreach);
       if (condition) then (yes)
        :Filter_to_this_flow__usedforbyodlcoe_false (Query);
        :if_found_turn_off_usedforbyodlcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforbyodlcoe_false (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_to_this_flow__usedforbyodlcoe_false (Query);
        :if_found_turn_off_usedforbyodlcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforbyodlcoe_false (OpenApiConnection);
         endif
       repeat while (more items)
      :Filter_array__usedforbyodlcoe_is_false (Query);
     endif
     partition "turn_off_flows_where_usedforbyodlcoe_is_false" {
      :List_flows_where_usedforbyodlcoe_is_false (OpenApiConnection);
      :Apply_to_each_usedforbyodlcoe_is_false (Foreach);
       if (condition) then (yes)
        :Filter_to_this_flow__usedforbyodlcoe_false (Query);
        :if_found_turn_off_usedforbyodlcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforbyodlcoe_false (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_to_this_flow__usedforbyodlcoe_false (Query);
        :if_found_turn_off_usedforbyodlcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforbyodlcoe_false (OpenApiConnection);
         endif
       repeat while (more items)
      :Filter_array__usedforbyodlcoe_is_false (Query);
     }
   endif
   else (no)
    :update_settings_for_sync_flows_true (Scope);
     if (condition) then (yes)
      :Perform_an_unbound_action__is_byodl_false (OpenApiConnection);
      :Perform_an_unbound_action__is_sync_flow_true (OpenApiConnection);
     endif
     partition "update_settings_for_sync_flows_true" {
      :Perform_an_unbound_action__is_byodl_false (OpenApiConnection);
      :Perform_an_unbound_action__is_sync_flow_true (OpenApiConnection);
     }
    :turn_off_flows_where_usedforsyncflowcoe_is_false (Scope);
     if (condition) then (yes)
      :List_flows_where_usedforsyncflowcoe_is_false (OpenApiConnection);
      :Apply_to_each_usedforsyncflowcoe_is_false (Foreach);
       if (condition) then (yes)
        :Filter_to_this_flow__usedforsyncflowcoe_false (Query);
        :if_found_turn_off_usedforsyncflowcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforsyncflowcoe_false (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_to_this_flow__usedforsyncflowcoe_false (Query);
        :if_found_turn_off_usedforsyncflowcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforsyncflowcoe_false (OpenApiConnection);
         endif
       repeat while (more items)
      :Filter_out_unpublished__usedforsyncflowcoe_is_false (Query);
     endif
     partition "turn_off_flows_where_usedforsyncflowcoe_is_false" {
      :List_flows_where_usedforsyncflowcoe_is_false (OpenApiConnection);
      :Apply_to_each_usedforsyncflowcoe_is_false (Foreach);
       if (condition) then (yes)
        :Filter_to_this_flow__usedforsyncflowcoe_false (Query);
        :if_found_turn_off_usedforsyncflowcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforsyncflowcoe_false (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_to_this_flow__usedforsyncflowcoe_false (Query);
        :if_found_turn_off_usedforsyncflowcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforsyncflowcoe_false (OpenApiConnection);
         endif
       repeat while (more items)
      :Filter_out_unpublished__usedforsyncflowcoe_is_false (Query);
     }
   endif
  :Set_env_var_inventoryIsBYODL (Scope);
   if (condition) then (yes)
    :inventoryIsBYODL__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_inventoryIsBYODL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_inventoryIsBYODL__DefaultValue (SetVariable);
     endif
    :Get_ID_from_inventoryIsBYODL (Compose);
    :ListCurrentsinventoryIsBYODL (OpenApiConnection);
    :ListDefnsinventoryIsBYODL (OpenApiConnection);
   endif
   partition "Set_env_var_inventoryIsBYODL" {
    :inventoryIsBYODL__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_inventoryIsBYODL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_inventoryIsBYODL__DefaultValue (SetVariable);
     endif
    :Get_ID_from_inventoryIsBYODL (Compose);
    :ListCurrentsinventoryIsBYODL (OpenApiConnection);
    :ListDefnsinventoryIsBYODL (OpenApiConnection);
   }
  :Get_Current_Envronment (Workflow);
  :Respond_to_a_PowerApp_or_flow__return_early (Response);
  :CoE_Envt (Compose);
  :List_Flows_in_CoE_Envt (OpenApiConnection);
 endif
 partition "Update_Inventory_Type_App_Setting" {
  :update_app_settings_based_on_result (If);
   if (condition) then (yes)
    :update_settings_for_byodl_true (Scope);
     if (condition) then (yes)
      :Perform_an_unbound_action__is_byodl_true (OpenApiConnection);
      :Perform_an_unbound_action__is_sync_flow_false (OpenApiConnection);
     endif
     partition "update_settings_for_byodl_true" {
      :Perform_an_unbound_action__is_byodl_true (OpenApiConnection);
      :Perform_an_unbound_action__is_sync_flow_false (OpenApiConnection);
     }
    :turn_off_flows_where_usedforbyodlcoe_is_false (Scope);
     if (condition) then (yes)
      :List_flows_where_usedforbyodlcoe_is_false (OpenApiConnection);
      :Apply_to_each_usedforbyodlcoe_is_false (Foreach);
       if (condition) then (yes)
        :Filter_to_this_flow__usedforbyodlcoe_false (Query);
        :if_found_turn_off_usedforbyodlcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforbyodlcoe_false (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_to_this_flow__usedforbyodlcoe_false (Query);
        :if_found_turn_off_usedforbyodlcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforbyodlcoe_false (OpenApiConnection);
         endif
       repeat while (more items)
      :Filter_array__usedforbyodlcoe_is_false (Query);
     endif
     partition "turn_off_flows_where_usedforbyodlcoe_is_false" {
      :List_flows_where_usedforbyodlcoe_is_false (OpenApiConnection);
      :Apply_to_each_usedforbyodlcoe_is_false (Foreach);
       if (condition) then (yes)
        :Filter_to_this_flow__usedforbyodlcoe_false (Query);
        :if_found_turn_off_usedforbyodlcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforbyodlcoe_false (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_to_this_flow__usedforbyodlcoe_false (Query);
        :if_found_turn_off_usedforbyodlcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforbyodlcoe_false (OpenApiConnection);
         endif
       repeat while (more items)
      :Filter_array__usedforbyodlcoe_is_false (Query);
     }
   endif
   else (no)
    :update_settings_for_sync_flows_true (Scope);
     if (condition) then (yes)
      :Perform_an_unbound_action__is_byodl_false (OpenApiConnection);
      :Perform_an_unbound_action__is_sync_flow_true (OpenApiConnection);
     endif
     partition "update_settings_for_sync_flows_true" {
      :Perform_an_unbound_action__is_byodl_false (OpenApiConnection);
      :Perform_an_unbound_action__is_sync_flow_true (OpenApiConnection);
     }
    :turn_off_flows_where_usedforsyncflowcoe_is_false (Scope);
     if (condition) then (yes)
      :List_flows_where_usedforsyncflowcoe_is_false (OpenApiConnection);
      :Apply_to_each_usedforsyncflowcoe_is_false (Foreach);
       if (condition) then (yes)
        :Filter_to_this_flow__usedforsyncflowcoe_false (Query);
        :if_found_turn_off_usedforsyncflowcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforsyncflowcoe_false (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_to_this_flow__usedforsyncflowcoe_false (Query);
        :if_found_turn_off_usedforsyncflowcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforsyncflowcoe_false (OpenApiConnection);
         endif
       repeat while (more items)
      :Filter_out_unpublished__usedforsyncflowcoe_is_false (Query);
     endif
     partition "turn_off_flows_where_usedforsyncflowcoe_is_false" {
      :List_flows_where_usedforsyncflowcoe_is_false (OpenApiConnection);
      :Apply_to_each_usedforsyncflowcoe_is_false (Foreach);
       if (condition) then (yes)
        :Filter_to_this_flow__usedforsyncflowcoe_false (Query);
        :if_found_turn_off_usedforsyncflowcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforsyncflowcoe_false (OpenApiConnection);
         endif
       endif
       repeat
        :Filter_to_this_flow__usedforsyncflowcoe_false (Query);
        :if_found_turn_off_usedforsyncflowcoe_false (If);
         if (condition) then (yes)
          :Turn_Off_Flow__usedforsyncflowcoe_false (OpenApiConnection);
         endif
       repeat while (more items)
      :Filter_out_unpublished__usedforsyncflowcoe_is_false (Query);
     }
   endif
  :Set_env_var_inventoryIsBYODL (Scope);
   if (condition) then (yes)
    :inventoryIsBYODL__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_inventoryIsBYODL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_inventoryIsBYODL__DefaultValue (SetVariable);
     endif
    :Get_ID_from_inventoryIsBYODL (Compose);
    :ListCurrentsinventoryIsBYODL (OpenApiConnection);
    :ListDefnsinventoryIsBYODL (OpenApiConnection);
   endif
   partition "Set_env_var_inventoryIsBYODL" {
    :inventoryIsBYODL__if_no_Current_use_Default (If);
     if (condition) then (yes)
      :Set_inventoryIsBYODL__CurrentValue (SetVariable);
     endif
     else (no)
      :Set_inventoryIsBYODL__DefaultValue (SetVariable);
     endif
    :Get_ID_from_inventoryIsBYODL (Compose);
    :ListCurrentsinventoryIsBYODL (OpenApiConnection);
    :ListDefnsinventoryIsBYODL (OpenApiConnection);
   }
  :Get_Current_Envronment (Workflow);
  :Respond_to_a_PowerApp_or_flow__return_early (Response);
  :CoE_Envt (Compose);
  :List_Flows_in_CoE_Envt (OpenApiConnection);
 }
:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate_2 (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__fail (Response);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate_2 (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__fail (Response);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Get_ID_Pass (OpenApiConnection);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Get_ID_Pass (OpenApiConnection);
 }
:Initialize_inventoryIsBYODL_as_false (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_flowmanagement | shared_flowmanagement | admin_CoECorePowerAutomateManagement | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### When_a_row_is_added,_modified_or_deleted
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Update_Inventory_Type_App_Setting | Scope | Operation ID: 437cfced-1516-4a45-b841-7597f38e118f |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_inventoryIsBYODL_as_false | InitializeVariable | Operation ID: 9cb22a33-79de-4aab-a664-d8fcdbb84977 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
