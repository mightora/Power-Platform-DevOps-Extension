# Power Automate Flow: AdminSyncTemplatev3FlowActionDetails

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A8F4AD6
**Source File:** AdminSyncTemplatev3FlowActionDetails-7EBB10A6-5041-EB11-A813-000D3A8F4AD6.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev3FlowActionDetails
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1 1 1 1 1
- **Connections:** 4
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev3FlowActionDetails

start
:Trigger: When_a_row_is_added,_modified (OpenApiConnectionWebhook);\n:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail_and_Clear_Last_Run_Started (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail_and_Clear_Last_Run_Started (OpenApiConnection);
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
:Existing_Flow_Action_Details (InitializeVariable);
:Actual_Flow_Action_Details (InitializeVariable);
:Flows_with_Specialty_Actions (InitializeVariable);
:HTTP_URLs (InitializeVariable);
:HTTPWEBHOOK_URLs (InitializeVariable);
:Initialize_needPermissions_to_false (InitializeVariable);
:Initialize_filterString (InitializeVariable);
:Update_flow_action_details (Scope);
 if (condition) then (yes)
  :GetCurrentInventory (Scope);
   if (condition) then (yes)
    :Add_existing_flow_actions_to_ExistingFlowActionDetails (Foreach);
     if (condition) then (yes)
      :List_this_flows_existing_flow_action_details (OpenApiConnection);
      :Append_each_to_ExistingFlowActionDetails (Foreach);
       if (condition) then (yes)
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       endif
       repeat
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       repeat while (more items)
      :Select (Select);
     endif
     repeat
      :List_this_flows_existing_flow_action_details (OpenApiConnection);
      :Append_each_to_ExistingFlowActionDetails (Foreach);
       if (condition) then (yes)
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       endif
       repeat
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       repeat while (more items)
      :Select (Select);
     repeat while (more items)
    :Parse_ExistingFlowActionDetails (ParseJson);
   endif
   partition "GetCurrentInventory" {
    :Add_existing_flow_actions_to_ExistingFlowActionDetails (Foreach);
     if (condition) then (yes)
      :List_this_flows_existing_flow_action_details (OpenApiConnection);
      :Append_each_to_ExistingFlowActionDetails (Foreach);
       if (condition) then (yes)
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       endif
       repeat
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       repeat while (more items)
      :Select (Select);
     endif
     repeat
      :List_this_flows_existing_flow_action_details (OpenApiConnection);
      :Append_each_to_ExistingFlowActionDetails (Foreach);
       if (condition) then (yes)
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       endif
       repeat
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       repeat while (more items)
      :Select (Select);
     repeat while (more items)
    :Parse_ExistingFlowActionDetails (ParseJson);
   }
  :GetCurrentActual (Scope);
   if (condition) then (yes)
    :Apply_to_each_flow (Foreach);
     if (condition) then (yes)
      :Get_Flow_Details (Scope);
       if (condition) then (yes)
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       endif
       partition "Get_Flow_Details" {
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       }
      :Append_new_flow_action_details (Scope);
       if (condition) then (yes)
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       endif
       partition "Append_new_flow_action_details" {
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       }
     endif
     repeat
      :Get_Flow_Details (Scope);
       if (condition) then (yes)
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       endif
       partition "Get_Flow_Details" {
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       }
      :Append_new_flow_action_details (Scope);
       if (condition) then (yes)
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       endif
       partition "Append_new_flow_action_details" {
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       }
     repeat while (more items)
    :Get_Specialty_Action_Details (Scope);
     if (condition) then (yes)
      :final_delimeter (Compose);
      :Apply_to_each_flow_with_specialty_connectors (Foreach);
       if (condition) then (yes)
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       endif
       repeat
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       repeat while (more items)
     endif
     partition "Get_Specialty_Action_Details" {
      :final_delimeter (Compose);
      :Apply_to_each_flow_with_specialty_connectors (Foreach);
       if (condition) then (yes)
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       endif
       repeat
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       repeat while (more items)
     }
    :Clear_Specialty_Flags (Scope);
     if (condition) then (yes)
      :Flows_to_iterate_with_specialty_flags (OpenApiConnection);
      :Clear_each_flow (Foreach);
       if (condition) then (yes)
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       endif
       repeat
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Clear_Specialty_Flags" {
      :Flows_to_iterate_with_specialty_flags (OpenApiConnection);
      :Clear_each_flow (Foreach);
       if (condition) then (yes)
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       endif
       repeat
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       repeat while (more items)
     }
    :Parse_ActualFlowActionDetails (ParseJson);
    :Clear_Inventory_My_FlowActionDetails_flag (Scope);
     if (condition) then (yes)
      :Clear_each_flows_flag (Foreach);
       if (condition) then (yes)
        :Clear_this_flows_flag (OpenApiConnection);
       endif
       repeat
        :Clear_this_flows_flag (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Clear_Inventory_My_FlowActionDetails_flag" {
      :Clear_each_flows_flag (Foreach);
       if (condition) then (yes)
        :Clear_this_flows_flag (OpenApiConnection);
       endif
       repeat
        :Clear_this_flows_flag (OpenApiConnection);
       repeat while (more items)
     }
   endif
   partition "GetCurrentActual" {
    :Apply_to_each_flow (Foreach);
     if (condition) then (yes)
      :Get_Flow_Details (Scope);
       if (condition) then (yes)
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       endif
       partition "Get_Flow_Details" {
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       }
      :Append_new_flow_action_details (Scope);
       if (condition) then (yes)
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       endif
       partition "Append_new_flow_action_details" {
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       }
     endif
     repeat
      :Get_Flow_Details (Scope);
       if (condition) then (yes)
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       endif
       partition "Get_Flow_Details" {
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       }
      :Append_new_flow_action_details (Scope);
       if (condition) then (yes)
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       endif
       partition "Append_new_flow_action_details" {
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       }
     repeat while (more items)
    :Get_Specialty_Action_Details (Scope);
     if (condition) then (yes)
      :final_delimeter (Compose);
      :Apply_to_each_flow_with_specialty_connectors (Foreach);
       if (condition) then (yes)
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       endif
       repeat
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       repeat while (more items)
     endif
     partition "Get_Specialty_Action_Details" {
      :final_delimeter (Compose);
      :Apply_to_each_flow_with_specialty_connectors (Foreach);
       if (condition) then (yes)
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       endif
       repeat
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       repeat while (more items)
     }
    :Clear_Specialty_Flags (Scope);
     if (condition) then (yes)
      :Flows_to_iterate_with_specialty_flags (OpenApiConnection);
      :Clear_each_flow (Foreach);
       if (condition) then (yes)
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       endif
       repeat
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Clear_Specialty_Flags" {
      :Flows_to_iterate_with_specialty_flags (OpenApiConnection);
      :Clear_each_flow (Foreach);
       if (condition) then (yes)
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       endif
       repeat
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       repeat while (more items)
     }
    :Parse_ActualFlowActionDetails (ParseJson);
    :Clear_Inventory_My_FlowActionDetails_flag (Scope);
     if (condition) then (yes)
      :Clear_each_flows_flag (Foreach);
       if (condition) then (yes)
        :Clear_this_flows_flag (OpenApiConnection);
       endif
       repeat
        :Clear_this_flows_flag (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Clear_Inventory_My_FlowActionDetails_flag" {
      :Clear_each_flows_flag (Foreach);
       if (condition) then (yes)
        :Clear_this_flows_flag (OpenApiConnection);
       endif
       repeat
        :Clear_this_flows_flag (OpenApiConnection);
       repeat while (more items)
     }
   }
  :Remove_deleted_ones_from_inventory (Scope);
   if (condition) then (yes)
    :RemoveFromInventory (Query);
    :Apply_to_each_identified_to_delete (Foreach);
     if (condition) then (yes)
      :Start_of_filterString_ (SetVariable);
      :Find_it_for_ID (OpenApiConnection);
      :Append_actioninformation (If);
       if (condition) then (yes)
        :Append_null_for_actioninformation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_actioninformation (AppendToStringVariable);
       endif
      :Append_operation (If);
       if (condition) then (yes)
        :Append_null_for_operation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_operation (AppendToStringVariable);
       endif
      :Append_metadata (If);
       if (condition) then (yes)
        :Append_null_for_metadata (AppendToStringVariable);
       endif
       else (no)
        :RemoveSpecialChars__metadata (Compose);
        :Append_string_for_metadata (AppendToStringVariable);
       endif
      :Avoid_failure_for_symultaneous_run (If);
       if (condition) then (yes)
        :Delete_it (OpenApiConnection);
       endif
       else (no)
       endif
     endif
     repeat
      :Start_of_filterString_ (SetVariable);
      :Find_it_for_ID (OpenApiConnection);
      :Append_actioninformation (If);
       if (condition) then (yes)
        :Append_null_for_actioninformation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_actioninformation (AppendToStringVariable);
       endif
      :Append_operation (If);
       if (condition) then (yes)
        :Append_null_for_operation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_operation (AppendToStringVariable);
       endif
      :Append_metadata (If);
       if (condition) then (yes)
        :Append_null_for_metadata (AppendToStringVariable);
       endif
       else (no)
        :RemoveSpecialChars__metadata (Compose);
        :Append_string_for_metadata (AppendToStringVariable);
       endif
      :Avoid_failure_for_symultaneous_run (If);
       if (condition) then (yes)
        :Delete_it (OpenApiConnection);
       endif
       else (no)
       endif
     repeat while (more items)
   endif
   partition "Remove_deleted_ones_from_inventory" {
    :RemoveFromInventory (Query);
    :Apply_to_each_identified_to_delete (Foreach);
     if (condition) then (yes)
      :Start_of_filterString_ (SetVariable);
      :Find_it_for_ID (OpenApiConnection);
      :Append_actioninformation (If);
       if (condition) then (yes)
        :Append_null_for_actioninformation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_actioninformation (AppendToStringVariable);
       endif
      :Append_operation (If);
       if (condition) then (yes)
        :Append_null_for_operation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_operation (AppendToStringVariable);
       endif
      :Append_metadata (If);
       if (condition) then (yes)
        :Append_null_for_metadata (AppendToStringVariable);
       endif
       else (no)
        :RemoveSpecialChars__metadata (Compose);
        :Append_string_for_metadata (AppendToStringVariable);
       endif
      :Avoid_failure_for_symultaneous_run (If);
       if (condition) then (yes)
        :Delete_it (OpenApiConnection);
       endif
       else (no)
       endif
     endif
     repeat
      :Start_of_filterString_ (SetVariable);
      :Find_it_for_ID (OpenApiConnection);
      :Append_actioninformation (If);
       if (condition) then (yes)
        :Append_null_for_actioninformation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_actioninformation (AppendToStringVariable);
       endif
      :Append_operation (If);
       if (condition) then (yes)
        :Append_null_for_operation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_operation (AppendToStringVariable);
       endif
      :Append_metadata (If);
       if (condition) then (yes)
        :Append_null_for_metadata (AppendToStringVariable);
       endif
       else (no)
        :RemoveSpecialChars__metadata (Compose);
        :Append_string_for_metadata (AppendToStringVariable);
       endif
      :Avoid_failure_for_symultaneous_run (If);
       if (condition) then (yes)
        :Delete_it (OpenApiConnection);
       endif
       else (no)
       endif
     repeat while (more items)
   }
  :Add_new_ones_to_inventory (Scope);
   if (condition) then (yes)
    :AddToInventory (Query);
    :Add_each_new_flow_action_detail (Foreach);
     if (condition) then (yes)
      :Add_new_flow_action_detail (OpenApiConnection);
     endif
     repeat
      :Add_new_flow_action_detail (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Add_new_ones_to_inventory" {
    :AddToInventory (Query);
    :Add_each_new_flow_action_detail (Foreach);
     if (condition) then (yes)
      :Add_new_flow_action_detail (OpenApiConnection);
     endif
     repeat
      :Add_new_flow_action_detail (OpenApiConnection);
     repeat while (more items)
   }
  :Get_identity_for_permission_updates (Scope);
   if (condition) then (yes)
    :Get_my_id (OpenApiConnection);
   endif
   partition "Get_identity_for_permission_updates" {
    :Get_my_id (OpenApiConnection);
   }
  :Get_flows_to_update (Scope);
   if (condition) then (yes)
    :Flows_to_iterate (OpenApiConnection);
   endif
   partition "Get_flows_to_update" {
    :Flows_to_iterate (OpenApiConnection);
   }
 endif
 partition "Update_flow_action_details" {
  :GetCurrentInventory (Scope);
   if (condition) then (yes)
    :Add_existing_flow_actions_to_ExistingFlowActionDetails (Foreach);
     if (condition) then (yes)
      :List_this_flows_existing_flow_action_details (OpenApiConnection);
      :Append_each_to_ExistingFlowActionDetails (Foreach);
       if (condition) then (yes)
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       endif
       repeat
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       repeat while (more items)
      :Select (Select);
     endif
     repeat
      :List_this_flows_existing_flow_action_details (OpenApiConnection);
      :Append_each_to_ExistingFlowActionDetails (Foreach);
       if (condition) then (yes)
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       endif
       repeat
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       repeat while (more items)
      :Select (Select);
     repeat while (more items)
    :Parse_ExistingFlowActionDetails (ParseJson);
   endif
   partition "GetCurrentInventory" {
    :Add_existing_flow_actions_to_ExistingFlowActionDetails (Foreach);
     if (condition) then (yes)
      :List_this_flows_existing_flow_action_details (OpenApiConnection);
      :Append_each_to_ExistingFlowActionDetails (Foreach);
       if (condition) then (yes)
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       endif
       repeat
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       repeat while (more items)
      :Select (Select);
     endif
     repeat
      :List_this_flows_existing_flow_action_details (OpenApiConnection);
      :Append_each_to_ExistingFlowActionDetails (Foreach);
       if (condition) then (yes)
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       endif
       repeat
        :Append_to_ExistingFlowActionDetails (AppendToArrayVariable);
       repeat while (more items)
      :Select (Select);
     repeat while (more items)
    :Parse_ExistingFlowActionDetails (ParseJson);
   }
  :GetCurrentActual (Scope);
   if (condition) then (yes)
    :Apply_to_each_flow (Foreach);
     if (condition) then (yes)
      :Get_Flow_Details (Scope);
       if (condition) then (yes)
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       endif
       partition "Get_Flow_Details" {
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       }
      :Append_new_flow_action_details (Scope);
       if (condition) then (yes)
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       endif
       partition "Append_new_flow_action_details" {
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       }
     endif
     repeat
      :Get_Flow_Details (Scope);
       if (condition) then (yes)
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       endif
       partition "Get_Flow_Details" {
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       }
      :Append_new_flow_action_details (Scope);
       if (condition) then (yes)
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       endif
       partition "Append_new_flow_action_details" {
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       }
     repeat while (more items)
    :Get_Specialty_Action_Details (Scope);
     if (condition) then (yes)
      :final_delimeter (Compose);
      :Apply_to_each_flow_with_specialty_connectors (Foreach);
       if (condition) then (yes)
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       endif
       repeat
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       repeat while (more items)
     endif
     partition "Get_Specialty_Action_Details" {
      :final_delimeter (Compose);
      :Apply_to_each_flow_with_specialty_connectors (Foreach);
       if (condition) then (yes)
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       endif
       repeat
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       repeat while (more items)
     }
    :Clear_Specialty_Flags (Scope);
     if (condition) then (yes)
      :Flows_to_iterate_with_specialty_flags (OpenApiConnection);
      :Clear_each_flow (Foreach);
       if (condition) then (yes)
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       endif
       repeat
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Clear_Specialty_Flags" {
      :Flows_to_iterate_with_specialty_flags (OpenApiConnection);
      :Clear_each_flow (Foreach);
       if (condition) then (yes)
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       endif
       repeat
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       repeat while (more items)
     }
    :Parse_ActualFlowActionDetails (ParseJson);
    :Clear_Inventory_My_FlowActionDetails_flag (Scope);
     if (condition) then (yes)
      :Clear_each_flows_flag (Foreach);
       if (condition) then (yes)
        :Clear_this_flows_flag (OpenApiConnection);
       endif
       repeat
        :Clear_this_flows_flag (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Clear_Inventory_My_FlowActionDetails_flag" {
      :Clear_each_flows_flag (Foreach);
       if (condition) then (yes)
        :Clear_this_flows_flag (OpenApiConnection);
       endif
       repeat
        :Clear_this_flows_flag (OpenApiConnection);
       repeat while (more items)
     }
   endif
   partition "GetCurrentActual" {
    :Apply_to_each_flow (Foreach);
     if (condition) then (yes)
      :Get_Flow_Details (Scope);
       if (condition) then (yes)
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       endif
       partition "Get_Flow_Details" {
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       }
      :Append_new_flow_action_details (Scope);
       if (condition) then (yes)
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       endif
       partition "Append_new_flow_action_details" {
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       }
     endif
     repeat
      :Get_Flow_Details (Scope);
       if (condition) then (yes)
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       endif
       partition "Get_Flow_Details" {
        :Get_Flow_as_Admin (OpenApiConnection);
        :parse_results (Scope);
         if (condition) then (yes)
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         endif
         partition "parse_results" {
          :Parse_trigger (ParseJson);
          :Parse_actions (ParseJson);
         }
        :catch_flow_no_longer_exists (Compose);
       }
      :Append_new_flow_action_details (Scope);
       if (condition) then (yes)
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       endif
       partition "Append_new_flow_action_details" {
        :if_triggers_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_trigger (Foreach);
           if (condition) then (yes)
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           endif
           repeat
            :action_type__trigger (Compose);
            :operation__trigger (Compose);
            :flowTrigger (Compose);
            :update_trigger_if_changed (If);
             if (condition) then (yes)
              :Update_flow_trigger (OpenApiConnection);
             endif
             else (no)
             endif
            :Append_trigger_to_ActualFlowActionDetails (AppendToArrayVariable);
           repeat while (more items)
         endif
         else (no)
         endif
        :if_actions_exist_then_add_them (If);
         if (condition) then (yes)
          :Apply_to_each_action (Foreach);
           if (condition) then (yes)
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           endif
           repeat
            :action_type__action (Compose);
            :operation__action (Compose);
            :If_specialty_action_then_add_to_array_for_later_else_add_it_now (If);
             if (condition) then (yes)
              :Append_to_FlowsWithSpecialtyActions (AppendToArrayVariable);
             endif
             else (no)
              :Append_action_to_ActualFlowActionDetails (AppendToArrayVariable);
             endif
           repeat while (more items)
          :Reset_the_FlowWithSpecialityActions (SetVariable);
          :Remove_duplicates_in_FlowsWithSpecialtyActions (SetVariable);
          :Remove_duplicates_in_FlowsWithActions (SetVariable);
          :Reset_the_FlowWithActions (SetVariable);
         endif
         else (no)
         endif
       }
     repeat while (more items)
    :Get_Specialty_Action_Details (Scope);
     if (condition) then (yes)
      :final_delimeter (Compose);
      :Apply_to_each_flow_with_specialty_connectors (Foreach);
       if (condition) then (yes)
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       endif
       repeat
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       repeat while (more items)
     endif
     partition "Get_Specialty_Action_Details" {
      :final_delimeter (Compose);
      :Apply_to_each_flow_with_specialty_connectors (Foreach);
       if (condition) then (yes)
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       endif
       repeat
        :http (Scope);
         if (condition) then (yes)
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http" {
          :Split_on_type_Http (Compose);
          :if_it_had_an_http (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Http_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri (Compose);
              :if_had_a_uri (If);
               if (condition) then (yes)
                :split_the_uri_off (Compose);
                :Append_uri_to_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_Http_Action (Foreach);
           if (condition) then (yes)
            :Append_http_action (AppendToArrayVariable);
           endif
           repeat
            :Append_http_action (AppendToArrayVariable);
           repeat while (more items)
         }
        :http_webhook (Scope);
         if (condition) then (yes)
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "http_webhook" {
          :Split_on_type_Http_webhook (Compose);
          :if_it_had_an_http_webhook (If);
           if (condition) then (yes)
            :Apply_to_each_item_from_Httpwebhook_split (Foreach);
             if (condition) then (yes)
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             endif
             repeat
              :Split_on_uri_webhook (Compose);
              :if_had_a_uri_webhook (If);
               if (condition) then (yes)
                :split_the_uri_off_webhook (Compose);
                :Append_uri_to_webhook_array_variable (AppendToArrayVariable);
               endif
               else (no)
               endif
             repeat while (more items)
           endif
           else (no)
           endif
          :Append_each_http_webhook_Action (Foreach);
           if (condition) then (yes)
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           endif
           repeat
            :Append_HttpWebhook_Action (AppendToArrayVariable);
           repeat while (more items)
         }
        :check_for_password (Scope);
         if (condition) then (yes)
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         endif
         partition "check_for_password" {
          :Split_on_type_password (Compose);
          :if_it_had_a_password_flag_the_flow_as_having_password (If);
           if (condition) then (yes)
            :Mark_as_Contains_Plain_Text_Password__Yes (OpenApiConnection);
           endif
           else (no)
           endif
         }
        :Reset_needPermissions_to_false (SetVariable);
        :get_flow_defn (Scope);
         if (condition) then (yes)
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         endif
         partition "get_flow_defn" {
          :permissions_check (Scope);
           if (condition) then (yes)
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           endif
           partition "permissions_check" {
            :Set_needPermissions_true (SetVariable);
            :if_need_permissions_add_them (If);
             if (condition) then (yes)
              :Old_Owner (Compose);
              :Add_Permissions (Workflow);
             endif
             else (no)
             endif
            :Get_Flow_Permissions_Check (OpenApiConnection);
           }
          :reset_permissions (Scope);
           if (condition) then (yes)
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           endif
           partition "reset_permissions" {
            :if_needed_permissions_set_them_back (If);
             if (condition) then (yes)
              :Reset_Owner (Workflow);
              :Remove_Admin (Workflow);
             endif
             else (no)
             endif
           }
          :Get_Flow (OpenApiConnection);
          :Parse_Flow_Definition (ParseJson);
         }
        :Reset_HTTP_URLs (SetVariable);
        :Reset_HTTP_Web_Hook_URLs (SetVariable);
       repeat while (more items)
     }
    :Clear_Specialty_Flags (Scope);
     if (condition) then (yes)
      :Flows_to_iterate_with_specialty_flags (OpenApiConnection);
      :Clear_each_flow (Foreach);
       if (condition) then (yes)
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       endif
       repeat
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Clear_Specialty_Flags" {
      :Flows_to_iterate_with_specialty_flags (OpenApiConnection);
      :Clear_each_flow (Foreach);
       if (condition) then (yes)
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       endif
       repeat
        :Update_flow_to_clear_specialty_flags (OpenApiConnection);
       repeat while (more items)
     }
    :Parse_ActualFlowActionDetails (ParseJson);
    :Clear_Inventory_My_FlowActionDetails_flag (Scope);
     if (condition) then (yes)
      :Clear_each_flows_flag (Foreach);
       if (condition) then (yes)
        :Clear_this_flows_flag (OpenApiConnection);
       endif
       repeat
        :Clear_this_flows_flag (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Clear_Inventory_My_FlowActionDetails_flag" {
      :Clear_each_flows_flag (Foreach);
       if (condition) then (yes)
        :Clear_this_flows_flag (OpenApiConnection);
       endif
       repeat
        :Clear_this_flows_flag (OpenApiConnection);
       repeat while (more items)
     }
   }
  :Remove_deleted_ones_from_inventory (Scope);
   if (condition) then (yes)
    :RemoveFromInventory (Query);
    :Apply_to_each_identified_to_delete (Foreach);
     if (condition) then (yes)
      :Start_of_filterString_ (SetVariable);
      :Find_it_for_ID (OpenApiConnection);
      :Append_actioninformation (If);
       if (condition) then (yes)
        :Append_null_for_actioninformation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_actioninformation (AppendToStringVariable);
       endif
      :Append_operation (If);
       if (condition) then (yes)
        :Append_null_for_operation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_operation (AppendToStringVariable);
       endif
      :Append_metadata (If);
       if (condition) then (yes)
        :Append_null_for_metadata (AppendToStringVariable);
       endif
       else (no)
        :RemoveSpecialChars__metadata (Compose);
        :Append_string_for_metadata (AppendToStringVariable);
       endif
      :Avoid_failure_for_symultaneous_run (If);
       if (condition) then (yes)
        :Delete_it (OpenApiConnection);
       endif
       else (no)
       endif
     endif
     repeat
      :Start_of_filterString_ (SetVariable);
      :Find_it_for_ID (OpenApiConnection);
      :Append_actioninformation (If);
       if (condition) then (yes)
        :Append_null_for_actioninformation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_actioninformation (AppendToStringVariable);
       endif
      :Append_operation (If);
       if (condition) then (yes)
        :Append_null_for_operation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_operation (AppendToStringVariable);
       endif
      :Append_metadata (If);
       if (condition) then (yes)
        :Append_null_for_metadata (AppendToStringVariable);
       endif
       else (no)
        :RemoveSpecialChars__metadata (Compose);
        :Append_string_for_metadata (AppendToStringVariable);
       endif
      :Avoid_failure_for_symultaneous_run (If);
       if (condition) then (yes)
        :Delete_it (OpenApiConnection);
       endif
       else (no)
       endif
     repeat while (more items)
   endif
   partition "Remove_deleted_ones_from_inventory" {
    :RemoveFromInventory (Query);
    :Apply_to_each_identified_to_delete (Foreach);
     if (condition) then (yes)
      :Start_of_filterString_ (SetVariable);
      :Find_it_for_ID (OpenApiConnection);
      :Append_actioninformation (If);
       if (condition) then (yes)
        :Append_null_for_actioninformation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_actioninformation (AppendToStringVariable);
       endif
      :Append_operation (If);
       if (condition) then (yes)
        :Append_null_for_operation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_operation (AppendToStringVariable);
       endif
      :Append_metadata (If);
       if (condition) then (yes)
        :Append_null_for_metadata (AppendToStringVariable);
       endif
       else (no)
        :RemoveSpecialChars__metadata (Compose);
        :Append_string_for_metadata (AppendToStringVariable);
       endif
      :Avoid_failure_for_symultaneous_run (If);
       if (condition) then (yes)
        :Delete_it (OpenApiConnection);
       endif
       else (no)
       endif
     endif
     repeat
      :Start_of_filterString_ (SetVariable);
      :Find_it_for_ID (OpenApiConnection);
      :Append_actioninformation (If);
       if (condition) then (yes)
        :Append_null_for_actioninformation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_actioninformation (AppendToStringVariable);
       endif
      :Append_operation (If);
       if (condition) then (yes)
        :Append_null_for_operation (AppendToStringVariable);
       endif
       else (no)
        :Append_string_for_operation (AppendToStringVariable);
       endif
      :Append_metadata (If);
       if (condition) then (yes)
        :Append_null_for_metadata (AppendToStringVariable);
       endif
       else (no)
        :RemoveSpecialChars__metadata (Compose);
        :Append_string_for_metadata (AppendToStringVariable);
       endif
      :Avoid_failure_for_symultaneous_run (If);
       if (condition) then (yes)
        :Delete_it (OpenApiConnection);
       endif
       else (no)
       endif
     repeat while (more items)
   }
  :Add_new_ones_to_inventory (Scope);
   if (condition) then (yes)
    :AddToInventory (Query);
    :Add_each_new_flow_action_detail (Foreach);
     if (condition) then (yes)
      :Add_new_flow_action_detail (OpenApiConnection);
     endif
     repeat
      :Add_new_flow_action_detail (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Add_new_ones_to_inventory" {
    :AddToInventory (Query);
    :Add_each_new_flow_action_detail (Foreach);
     if (condition) then (yes)
      :Add_new_flow_action_detail (OpenApiConnection);
     endif
     repeat
      :Add_new_flow_action_detail (OpenApiConnection);
     repeat while (more items)
   }
  :Get_identity_for_permission_updates (Scope);
   if (condition) then (yes)
    :Get_my_id (OpenApiConnection);
   endif
   partition "Get_identity_for_permission_updates" {
    :Get_my_id (OpenApiConnection);
   }
  :Get_flows_to_update (Scope);
   if (condition) then (yes)
    :Flows_to_iterate (OpenApiConnection);
   endif
   partition "Get_flows_to_update" {
    :Flows_to_iterate (OpenApiConnection);
   }
 }
:Delay_Object_Inventory (If);
 if (condition) then (yes)
  :Delay_1_to_300_minutes (Wait);
 endif
 else (no)
 endif
:Initialize_Collection_FlowsWithSpecialtyActions_Temporary (InitializeVariable);
:Initialize_Collection_FlowsWithActions_Temporary (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_flowmanagement | shared_flowmanagement | admin_CoECorePowerAutomateManagement | embedded |
| shared_office365users_1 | shared_office365users | admin_CoECoreO365Users | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| DelayObjectInventory (admin_DelayObjectInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse throttling. Things like solutions, apps, flows, will have delays in the individual envt runs. Default No. |

## Triggers

### When_a_row_is_added,_modified
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Existing_Flow_Action_Details | InitializeVariable | Operation ID: ce258a96-0eb6-451a-9477-ce1a830bc792 |
| Actual_Flow_Action_Details | InitializeVariable | Operation ID: ce258a96-0eb6-451a-9477-ce1a830bc792 |
| Flows_with_Specialty_Actions | InitializeVariable | Operation ID: 41079b45-3829-4499-8f18-bc495ae3be01 |
| HTTP_URLs | InitializeVariable | Operation ID: f64a82fd-22c1-4b8f-878b-eda745526f2c |
| HTTPWEBHOOK_URLs | InitializeVariable | Operation ID: 95c1f7b6-7fb4-40cd-a1db-a4541dc48d2a |
| Initialize_needPermissions_to_false | InitializeVariable | Operation ID: d5725a24-c684-4ced-95c7-aaa0e496de7a |
| Initialize_filterString | InitializeVariable | Operation ID: eea95b16-ed62-4342-b531-29c385655b82 |
| Update_flow_action_details | Scope | Operation ID: 09955f7d-25e8-498e-9385-10a046ca3a2e |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |
| Initialize_Collection_FlowsWithSpecialtyActions_Temporary | InitializeVariable | Operation ID: 1a5c8df6-c822-4275-9dd1-a4cbce5090c6 |
| Initialize_Collection_FlowsWithActions_Temporary | InitializeVariable | - |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
