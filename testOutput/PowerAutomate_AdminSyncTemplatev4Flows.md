# Power Automate Flow: AdminSyncTemplatev4Flows

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 0022480813FF
**Source File:** AdminSyncTemplatev4Flows-38613E1A-02DA-ED11-A7C7-0022480813FF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4Flows
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 3
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4Flows

start
:Trigger: When_a_record_is_created_or_updated (OpenApiConnectionWebhook);\n:Check_if_Environment_Deleted_or_Excused_or_BYODL_ (If);
 if (condition) then (yes)
  :Terminate_for_environments_marked_deleted (Terminate);
 endif
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
:Initialize_flowsToInventory (InitializeVariable);
:Inventory_flows_for_this_envt (Scope);
 if (condition) then (yes)
  :Get_Basics (Scope);
   if (condition) then (yes)
    :List_Flows_as_Admin_V2 (OpenApiConnection);
    :CurrentFlowInventory (OpenApiConnection);
    :Filter_out_unpublished_flows (Query);
   endif
   partition "Get_Basics" {
    :List_Flows_as_Admin_V2 (OpenApiConnection);
    :CurrentFlowInventory (OpenApiConnection);
    :Filter_out_unpublished_flows (Query);
   }
  :Get_List_of_Flows_to_Update_and_Insert (Scope);
   if (condition) then (yes)
    :Look_for_modified_flows (Scope);
     if (condition) then (yes)
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_flows (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_flows" {
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_flow_in_CurrentFlowInventory_to_flowToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_with_state_changes (Scope);
         if (condition) then (yes)
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_state_changes" {
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Get_past_time (Expression);
       endif
     endif
     partition "Look_for_modified_flows" {
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_flows (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_flows" {
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_flow_in_CurrentFlowInventory_to_flowToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_with_state_changes (Scope);
         if (condition) then (yes)
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_state_changes" {
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Get_past_time (Expression);
       endif
     }
    :raw (Compose);
    :Complete_List_FlowToInventory (Compose);
    :Look_for_flows_with_estimated_suspension_data (Scope);
     if (condition) then (yes)
      :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
      :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
      :Select_Tenant__Pending_Suspension (Select);
      :Select_Inventory__Pending_Suspension (Select);
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
      :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       endif
       partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       }
     endif
     partition "Look_for_flows_with_estimated_suspension_data" {
      :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
      :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
      :Select_Tenant__Pending_Suspension (Select);
      :Select_Inventory__Pending_Suspension (Select);
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
      :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       endif
       partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
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
   endif
   partition "Get_List_of_Flows_to_Update_and_Insert" {
    :Look_for_modified_flows (Scope);
     if (condition) then (yes)
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_flows (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_flows" {
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_flow_in_CurrentFlowInventory_to_flowToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_with_state_changes (Scope);
         if (condition) then (yes)
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_state_changes" {
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Get_past_time (Expression);
       endif
     endif
     partition "Look_for_modified_flows" {
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_flows (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_flows" {
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_flow_in_CurrentFlowInventory_to_flowToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_with_state_changes (Scope);
         if (condition) then (yes)
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_state_changes" {
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Get_past_time (Expression);
       endif
     }
    :raw (Compose);
    :Complete_List_FlowToInventory (Compose);
    :Look_for_flows_with_estimated_suspension_data (Scope);
     if (condition) then (yes)
      :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
      :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
      :Select_Tenant__Pending_Suspension (Select);
      :Select_Inventory__Pending_Suspension (Select);
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
      :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       endif
       partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       }
     endif
     partition "Look_for_flows_with_estimated_suspension_data" {
      :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
      :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
      :Select_Tenant__Pending_Suspension (Select);
      :Select_Inventory__Pending_Suspension (Select);
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
      :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       endif
       partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
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
   }
  :Inventory_all_targetted_flows (Foreach);
   if (condition) then (yes)
    :Run_a_Child_Flow (Workflow);
   endif
   repeat
    :Run_a_Child_Flow (Workflow);
   repeat while (more items)
 endif
 partition "Inventory_flows_for_this_envt" {
  :Get_Basics (Scope);
   if (condition) then (yes)
    :List_Flows_as_Admin_V2 (OpenApiConnection);
    :CurrentFlowInventory (OpenApiConnection);
    :Filter_out_unpublished_flows (Query);
   endif
   partition "Get_Basics" {
    :List_Flows_as_Admin_V2 (OpenApiConnection);
    :CurrentFlowInventory (OpenApiConnection);
    :Filter_out_unpublished_flows (Query);
   }
  :Get_List_of_Flows_to_Update_and_Insert (Scope);
   if (condition) then (yes)
    :Look_for_modified_flows (Scope);
     if (condition) then (yes)
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_flows (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_flows" {
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_flow_in_CurrentFlowInventory_to_flowToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_with_state_changes (Scope);
         if (condition) then (yes)
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_state_changes" {
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Get_past_time (Expression);
       endif
     endif
     partition "Look_for_modified_flows" {
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_flows (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_flows" {
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_flow_in_CurrentFlowInventory_to_flowToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_with_state_changes (Scope);
         if (condition) then (yes)
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_state_changes" {
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Get_past_time (Expression);
       endif
     }
    :raw (Compose);
    :Complete_List_FlowToInventory (Compose);
    :Look_for_flows_with_estimated_suspension_data (Scope);
     if (condition) then (yes)
      :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
      :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
      :Select_Tenant__Pending_Suspension (Select);
      :Select_Inventory__Pending_Suspension (Select);
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
      :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       endif
       partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       }
     endif
     partition "Look_for_flows_with_estimated_suspension_data" {
      :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
      :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
      :Select_Tenant__Pending_Suspension (Select);
      :Select_Inventory__Pending_Suspension (Select);
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
      :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       endif
       partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
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
   endif
   partition "Get_List_of_Flows_to_Update_and_Insert" {
    :Look_for_modified_flows (Scope);
     if (condition) then (yes)
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_flows (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_flows" {
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_flow_in_CurrentFlowInventory_to_flowToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_with_state_changes (Scope);
         if (condition) then (yes)
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_state_changes" {
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Get_past_time (Expression);
       endif
     endif
     partition "Look_for_modified_flows" {
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_flows (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_flows" {
          :Get_Inventory__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           endif
           partition "Get_Inventory__New_Flows" {
            :Select_Inventory__New_Flows (Select);
            :Parse_Inventory__New_Flows (ParseJson);
           }
          :Get_Actual__New_Flows (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           endif
           partition "Get_Actual__New_Flows" {
            :Select_Actual__New_Flows (Select);
            :Parse_Actual__New_Flows (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_flows_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__new_flows (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_flow_in_CurrentFlowInventory_to_flowToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_flowsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_with_state_changes (Scope);
         if (condition) then (yes)
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_state_changes" {
          :Get_Inventory__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           endif
           partition "Get_Inventory__Flow_State" {
            :Select_Inventory__Flow_State (Select);
            :Parse_Inventory__Flow_State (ParseJson);
           }
          :Get_Actual__Flow_State (Scope);
           if (condition) then (yes)
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           endif
           partition "Get_Actual__Flow_State" {
            :Select_Actual__Flow_State (Select);
            :Parse_Actual__Flow_State (ParseJson);
           }
          :Add_changed_state_to_flowsToInventory (Scope);
           if (condition) then (yes)
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_changed_state_to_flowsToInventory" {
            :StateChangedToInventory (Query);
            :Add_changed_state_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             endif
             repeat
              :Append_to_flowsToInventory__changed_state (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_flows_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_flow_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Get_past_time (Expression);
       endif
     }
    :raw (Compose);
    :Complete_List_FlowToInventory (Compose);
    :Look_for_flows_with_estimated_suspension_data (Scope);
     if (condition) then (yes)
      :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
      :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
      :Select_Tenant__Pending_Suspension (Select);
      :Select_Inventory__Pending_Suspension (Select);
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
      :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       endif
       partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       }
     endif
     partition "Look_for_flows_with_estimated_suspension_data" {
      :Filter_to_tenant_flows_with_estimated_suspension_data (Query);
      :List_inventory_flows_with_estimated_suspension_data (OpenApiConnection);
      :Select_Tenant__Pending_Suspension (Select);
      :Select_Inventory__Pending_Suspension (Select);
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
      :Flag_to_inventory_things_whos_pending_suspension_reason_has_changed (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
         repeat while (more items)
       endif
       partition "Flag_to_inventory_things_whos_pending_suspension_reason_has_changed" {
        :Filter_to_tenant_flows_whos_reason_or_date_has_changed_ (Query);
        :Apply_to_tenant_flow_with_new_estimated_suspension (Foreach);
         if (condition) then (yes)
          :Update_pending_suspension (OpenApiConnection);
         endif
         repeat
          :Update_pending_suspension (OpenApiConnection);
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
   }
  :Inventory_all_targetted_flows (Foreach);
   if (condition) then (yes)
    :Run_a_Child_Flow (Workflow);
   endif
   repeat
    :Run_a_Child_Flow (Workflow);
   repeat while (more items)
 }
:Delay_Object_Inventory (If);
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
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_flowmanagement_1 | shared_flowmanagement | admin_CoECorePowerAutomateManagement | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| FullInventory (admin_FullInventory) | Bool | - | Inventory - Determines if you want to only update objects that have changed, or all objects. Defaults to No. Switching to Yes will cause the flows to inventory every single app/flow/etc in the tenant and make the flows long running  |
| Inventory and Telemetry in Azure Data Storage account (admin_InventoryandTelemetryinAzureDataStorageaccount) | Bool | - | Inventory - Have you set up data export in PPAC and is your inventory and telemetry in an Azure Data Storage folder (also referred to as Bring your own Datalake, self-serve analytics feature). Default no |
| InventoryFilter_DaysToLookBack (admin_InventoryFilter_DaysToLookBack) | Int | 7 | Inventory - When not running a full inventory, we filter back this number of days and then see if the object needs updated in order to save API calls. Default 7 |
| DelayObjectInventory (admin_DelayObjectInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse throttling. Things like solutions, apps, flows, will have delays in the individual envt runs. Default No. |

## Triggers

### When_a_record_is_created_or_updated
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Check_if_Environment_Deleted_or_Excused_or_BYODL._ | If | Operation ID: 0f37f758-6ead-4a0d-abfd-75336cc84aa2 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_flowsToInventory | InitializeVariable | Operation ID: e62ec4d2-a0ec-4fa6-952c-316178fd25d7 |
| Inventory_flows_for_this_envt | Scope | Operation ID: a61d4c0c-2a4d-4e5d-8cf5-b3d0a9ddf4aa |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
