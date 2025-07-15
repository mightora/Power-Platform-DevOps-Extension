# Power Automate Flow: AdminSyncTemplatev4Apps

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 0022480813FF
**Source File:** AdminSyncTemplatev4Apps-4BE120F4-CCE2-ED11-A7C7-0022480813FF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4Apps
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4Apps

start
:Trigger: When_a_record_is_created_or_updated (OpenApiConnectionWebhook);\n:Check_if_Environment_Deleted_or_Inventory_in_BYODL_terminate_if_true (If);
 if (condition) then (yes)
  :Terminate_for_environments_marked_deleted (Terminate);
 endif
 else (no)
 endif
:Initialize_appsToInventory (InitializeVariable);
:Inventory_apps_for_this_envt (Scope);
 if (condition) then (yes)
  :Get_Basics (Scope);
   if (condition) then (yes)
    :CurrentAppInventory (OpenApiConnection);
    :Get_Apps_as_Admin (OpenApiConnection);
   endif
   partition "Get_Basics" {
    :CurrentAppInventory (OpenApiConnection);
    :Get_Apps_as_Admin (OpenApiConnection);
   }
  :Get_List_of_Apps_to_Update_and_Insert (Scope);
   if (condition) then (yes)
    :Look_for_Apps_to_Inventory (Scope);
     if (condition) then (yes)
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_apps (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_apps" {
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_app_in_CurrentAppInventory_to_appsToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
         if (condition) then (yes)
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         }
        :Get_past_time (Expression);
        :Look_for_ones_with_updates_or_new (Scope);
         if (condition) then (yes)
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_updates_or_new" {
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         }
       endif
     endif
     partition "Look_for_Apps_to_Inventory" {
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_apps (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_apps" {
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_app_in_CurrentAppInventory_to_appsToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
         if (condition) then (yes)
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         }
        :Get_past_time (Expression);
        :Look_for_ones_with_updates_or_new (Scope);
         if (condition) then (yes)
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_updates_or_new" {
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         }
       endif
     }
    :raw (Compose);
    :Complete_List_AppsToInventory (Compose);
   endif
   partition "Get_List_of_Apps_to_Update_and_Insert" {
    :Look_for_Apps_to_Inventory (Scope);
     if (condition) then (yes)
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_apps (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_apps" {
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_app_in_CurrentAppInventory_to_appsToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
         if (condition) then (yes)
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         }
        :Get_past_time (Expression);
        :Look_for_ones_with_updates_or_new (Scope);
         if (condition) then (yes)
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_updates_or_new" {
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         }
       endif
     endif
     partition "Look_for_Apps_to_Inventory" {
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_apps (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_apps" {
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_app_in_CurrentAppInventory_to_appsToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
         if (condition) then (yes)
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         }
        :Get_past_time (Expression);
        :Look_for_ones_with_updates_or_new (Scope);
         if (condition) then (yes)
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_updates_or_new" {
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         }
       endif
     }
    :raw (Compose);
    :Complete_List_AppsToInventory (Compose);
   }
  :Inventory_all_targetted_apps (Foreach);
   if (condition) then (yes)
    :Run_a_Child_Flow (Workflow);
   endif
   repeat
    :Run_a_Child_Flow (Workflow);
   repeat while (more items)
 endif
 partition "Inventory_apps_for_this_envt" {
  :Get_Basics (Scope);
   if (condition) then (yes)
    :CurrentAppInventory (OpenApiConnection);
    :Get_Apps_as_Admin (OpenApiConnection);
   endif
   partition "Get_Basics" {
    :CurrentAppInventory (OpenApiConnection);
    :Get_Apps_as_Admin (OpenApiConnection);
   }
  :Get_List_of_Apps_to_Update_and_Insert (Scope);
   if (condition) then (yes)
    :Look_for_Apps_to_Inventory (Scope);
     if (condition) then (yes)
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_apps (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_apps" {
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_app_in_CurrentAppInventory_to_appsToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
         if (condition) then (yes)
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         }
        :Get_past_time (Expression);
        :Look_for_ones_with_updates_or_new (Scope);
         if (condition) then (yes)
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_updates_or_new" {
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         }
       endif
     endif
     partition "Look_for_Apps_to_Inventory" {
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_apps (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_apps" {
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_app_in_CurrentAppInventory_to_appsToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
         if (condition) then (yes)
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         }
        :Get_past_time (Expression);
        :Look_for_ones_with_updates_or_new (Scope);
         if (condition) then (yes)
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_updates_or_new" {
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         }
       endif
     }
    :raw (Compose);
    :Complete_List_AppsToInventory (Compose);
   endif
   partition "Get_List_of_Apps_to_Update_and_Insert" {
    :Look_for_Apps_to_Inventory (Scope);
     if (condition) then (yes)
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_apps (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_apps" {
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_app_in_CurrentAppInventory_to_appsToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
         if (condition) then (yes)
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         }
        :Get_past_time (Expression);
        :Look_for_ones_with_updates_or_new (Scope);
         if (condition) then (yes)
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_updates_or_new" {
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         }
       endif
     endif
     partition "Look_for_Apps_to_Inventory" {
      :If_full_inventory_run (If);
       if (condition) then (yes)
        :Look_for_new_apps (Scope);
         if (condition) then (yes)
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_new_apps" {
          :Get_Inventory__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           endif
           partition "Get_Inventory__New_Apps" {
            :Select_Inventory__New_Apps (Select);
            :Parse_Inventory__New_Apps (ParseJson);
           }
          :Get_Actual__New_Apps (Scope);
           if (condition) then (yes)
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           endif
           partition "Get_Actual__New_Apps" {
            :Select_Actual__New_Apps (Select);
            :Parse_Actual__New_Apps (ParseJson);
           }
          :Add_new_ones_to_inventory (Scope);
           if (condition) then (yes)
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_new_ones_to_inventory" {
            :AddToInventory (Query);
            :Add_new_apps_to_array (Foreach);
             if (condition) then (yes)
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             endif
             repeat
              :Append_to_appsToInventory__new_apps (AppendToArrayVariable);
             repeat while (more items)
           }
         }
        :Add_every_app_in_CurrentAppInventory_to_appsToInventory (Foreach);
         if (condition) then (yes)
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         endif
         repeat
          :Append_to_appsToInventory__full_inventory (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Look_for_ones_modified_since_date (Scope);
         if (condition) then (yes)
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         endif
         partition "Look_for_ones_modified_since_date" {
          :Filter_to_apps_modified_since_Get_past_time (Query);
          :Add_each_recently_modified_to_array (Foreach);
           if (condition) then (yes)
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
           repeat
            :Get_app_from_CoE_Inventory (OpenApiConnection);
            :CATH_AND_IGNORE__not_yet_in_inventory (Compose);
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModfiedCoE (Compose);
             }
           repeat while (more items)
         }
        :Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections (Scope);
         if (condition) then (yes)
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         endif
         partition "Look_for_apps_manually_flagged_for_inventory_or_with_broken_connections" {
          :AppsToInventory__ManualRequest (OpenApiConnection);
          :Add_manual_requests_to_array (Foreach);
           if (condition) then (yes)
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           endif
           repeat
            :Append_to_appsToInventory__manual_requests (AppendToArrayVariable);
           repeat while (more items)
         }
        :Get_past_time (Expression);
        :Look_for_ones_with_updates_or_new (Scope);
         if (condition) then (yes)
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         endif
         partition "Look_for_ones_with_updates_or_new" {
          :Get_Inventory__Updates (Scope);
           if (condition) then (yes)
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           endif
           partition "Get_Inventory__Updates" {
            :Select_Inventory__Updates (Select);
            :Parse_Inventory__Updates (ParseJson);
           }
          :Get_Actual__Updates (Scope);
           if (condition) then (yes)
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           endif
           partition "Get_Actual__Updates" {
            :Select_Actual__Updates (Select);
            :Parse_Actual__Updates (ParseJson);
           }
          :Add_Updates_to_appsToInventory (Scope);
           if (condition) then (yes)
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           endif
           partition "Add_Updates_to_appsToInventory" {
            :UpdatesToInventory (Query);
            :Add_Updates_to_array (Foreach);
             if (condition) then (yes)
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             endif
             repeat
              :Append_Updates_to_appsToInventory (AppendToArrayVariable);
             repeat while (more items)
           }
         }
       endif
     }
    :raw (Compose);
    :Complete_List_AppsToInventory (Compose);
   }
  :Inventory_all_targetted_apps (Foreach);
   if (condition) then (yes)
    :Run_a_Child_Flow (Workflow);
   endif
   repeat
    :Run_a_Child_Flow (Workflow);
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
:Delay_Object_Inventory (If);
 if (condition) then (yes)
  :Delay_1_to_300_minutes (Wait);
 endif
 else (no)
 endif

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_powerappsforadmins_1 | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Inventory and Telemetry in Azure Data Storage account (admin_InventoryandTelemetryinAzureDataStorageaccount) | Bool | - | Inventory - Have you set up data export in PPAC and is your inventory and telemetry in an Azure Data Storage folder (also referred to as Bring your own Datalake, self-serve analytics feature). Default no |
| InventoryFilter_DaysToLookBack (admin_InventoryFilter_DaysToLookBack) | Int | 7 | Inventory - When not running a full inventory, we filter back this number of days and then see if the object needs updated in order to save API calls. Default 7 |
| FullInventory (admin_FullInventory) | Bool | - | Inventory - Determines if you want to only update objects that have changed, or all objects. Defaults to No. Switching to Yes will cause the flows to inventory every single app/flow/etc in the tenant and make the flows long running  |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| DelayObjectInventory (admin_DelayObjectInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse throttling. Things like solutions, apps, flows, will have delays in the individual envt runs. Default No. |

## Triggers

### When_a_record_is_created_or_updated
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Check_if_Environment_Deleted_or_Inventory_in_BYODL,_terminate_if_true | If | Operation ID: 0bf354ac-4265-4bbe-9fed-996958d038bd |
| Initialize_appsToInventory | InitializeVariable | Operation ID: e62ec4d2-a0ec-4fa6-952c-316178fd25d7 |
| Inventory_apps_for_this_envt | Scope | Operation ID: a61d4c0c-2a4d-4e5d-8cf5-b3d0a9ddf4aa |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
