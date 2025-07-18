# Power Automate Flow: SYNCHELPER-GetSecurityRoleUsers

**Generated on:** 2025-07-15 19:14:49
**Flow ID:** 0022480813FF
**Source File:** SYNCHELPER-GetSecurityRoleUsers-5C248F24-F7C9-ED11-B597-0022480813FF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** SYNCHELPER-GetSecurityRoleUsers
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1
- **Connections:** 3
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: SYNCHELPER-GetSecurityRoleUsers

start
:Trigger: manual (Request);\n:Get_Security_Role_Users (Scope);
 if (condition) then (yes)
  :Get_Inventory_SR_membership (Scope);
   if (condition) then (yes)
    :Select_inventory (Select);
    :Parse_inventory (ParseJson);
    :Filter_inventory (Query);
    :List_Inventoried_SR_Members (OpenApiConnection);
   endif
   partition "Get_Inventory_SR_membership" {
    :Select_inventory (Select);
    :Parse_inventory (ParseJson);
    :Filter_inventory (Query);
    :List_Inventoried_SR_Members (OpenApiConnection);
   }
  :Remove_deleted_ones_from_inventory (Scope);
   if (condition) then (yes)
    :RemoveFromInventory (Query);
    :Remove_deleted_from_inventory (Foreach);
     if (condition) then (yes)
      :Delete_it (OpenApiConnection);
      :Find_it_for_ID (OpenApiConnection);
      :Remove_It_Filter__Direct (Compose);
      :Remove_It_filter (Compose);
      :RemoveSpecialChars (Compose);
      :Remove_It_Filter__Group (Compose);
     endif
     repeat
      :Delete_it (OpenApiConnection);
      :Find_it_for_ID (OpenApiConnection);
      :Remove_It_Filter__Direct (Compose);
      :Remove_It_filter (Compose);
      :RemoveSpecialChars (Compose);
      :Remove_It_Filter__Group (Compose);
     repeat while (more items)
   endif
   partition "Remove_deleted_ones_from_inventory" {
    :RemoveFromInventory (Query);
    :Remove_deleted_from_inventory (Foreach);
     if (condition) then (yes)
      :Delete_it (OpenApiConnection);
      :Find_it_for_ID (OpenApiConnection);
      :Remove_It_Filter__Direct (Compose);
      :Remove_It_filter (Compose);
      :RemoveSpecialChars (Compose);
      :Remove_It_Filter__Group (Compose);
     endif
     repeat
      :Delete_it (OpenApiConnection);
      :Find_it_for_ID (OpenApiConnection);
      :Remove_It_Filter__Direct (Compose);
      :Remove_It_filter (Compose);
      :RemoveSpecialChars (Compose);
      :Remove_It_Filter__Group (Compose);
     repeat while (more items)
   }
  :Add_new_ones_to_inventory (Scope);
   if (condition) then (yes)
    :AddToInventory (Query);
    :Add_new_to_inventory (Foreach);
     if (condition) then (yes)
      :Add_new_SR_User (OpenApiConnection);
     endif
     repeat
      :Add_new_SR_User (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Add_new_ones_to_inventory" {
    :AddToInventory (Query);
    :Add_new_to_inventory (Foreach);
     if (condition) then (yes)
      :Add_new_SR_User (OpenApiConnection);
     endif
     repeat
      :Add_new_SR_User (OpenApiConnection);
     repeat while (more items)
   }
  :Get_Actual_SR_membership (Scope);
   if (condition) then (yes)
    :Apply_to_each_Direct_Access (Foreach);
     if (condition) then (yes)
      :Append_to_array_variable (AppendToArrayVariable);
     endif
     repeat
      :Append_to_array_variable (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_Team (Foreach);
     if (condition) then (yes)
      :List_group_members (OpenApiConnection);
      :continue_if_group_exists (Scope);
       if (condition) then (yes)
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       endif
       partition "continue_if_group_exists" {
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       }
      :catch__for_now_aad_groups_only (Compose);
     endif
     repeat
      :List_group_members (OpenApiConnection);
      :continue_if_group_exists (Scope);
       if (condition) then (yes)
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       endif
       partition "continue_if_group_exists" {
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       }
      :catch__for_now_aad_groups_only (Compose);
     repeat while (more items)
    :Parse_actual (ParseJson);
    :Select_actual (Select);
    :Filter_actual (Query);
    :Direct_System_User_Access (OpenApiConnection);
    :Teams_with_Access (OpenApiConnection);
   endif
   partition "Get_Actual_SR_membership" {
    :Apply_to_each_Direct_Access (Foreach);
     if (condition) then (yes)
      :Append_to_array_variable (AppendToArrayVariable);
     endif
     repeat
      :Append_to_array_variable (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_Team (Foreach);
     if (condition) then (yes)
      :List_group_members (OpenApiConnection);
      :continue_if_group_exists (Scope);
       if (condition) then (yes)
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       endif
       partition "continue_if_group_exists" {
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       }
      :catch__for_now_aad_groups_only (Compose);
     endif
     repeat
      :List_group_members (OpenApiConnection);
      :continue_if_group_exists (Scope);
       if (condition) then (yes)
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       endif
       partition "continue_if_group_exists" {
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       }
      :catch__for_now_aad_groups_only (Compose);
     repeat while (more items)
    :Parse_actual (ParseJson);
    :Select_actual (Select);
    :Filter_actual (Query);
    :Direct_System_User_Access (OpenApiConnection);
    :Teams_with_Access (OpenApiConnection);
   }
  :get_basics_and_early_exit_if_inaccessible (Scope);
   if (condition) then (yes)
    :Get_EnvtMetadataName (OpenApiConnection);
    :if_no_or_inaccessible_tables_ (If);
     if (condition) then (yes)
      :Set_SRsInaccessible_true__envt_properties (SetVariable);
     endif
    :Security_Role_Display_Name (Compose);
    :Security_Role_ID (Compose);
    :Set_SRsInaccessible_true__failed_to_get_SR (SetVariable);
    :see_if_need_to_exit_early (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_early_exit (Response);
      :Terminate__cannot_get_values (Terminate);
     endif
    :Set_SRsInaccessible_true__failed_to_get_BU (SetVariable);
    :Business_Unit_Name (Compose);
    :RemoveSpecialCharactersBU (Compose);
    :Get_SR (OpenApiConnection);
    :Get_BU (OpenApiConnection);
    :Get_Role_based_on_Type (If);
     if (condition) then (yes)
      :Get_SR_by_TID (OpenApiConnection);
      :Set_SRsInaccessible_true__failed_to_get_SR_by_TID (SetVariable);
     endif
     else (no)
      :Get_SR_by_Name (OpenApiConnection);
      :Set_SRsInaccessible_true__failed_to_get_SR_by_Name (SetVariable);
     endif
    :SRID_for_fetch (Compose);
    :SecurityRoleTemplateID (Compose);
   endif
   partition "get_basics_and_early_exit_if_inaccessible" {
    :Get_EnvtMetadataName (OpenApiConnection);
    :if_no_or_inaccessible_tables_ (If);
     if (condition) then (yes)
      :Set_SRsInaccessible_true__envt_properties (SetVariable);
     endif
    :Security_Role_Display_Name (Compose);
    :Security_Role_ID (Compose);
    :Set_SRsInaccessible_true__failed_to_get_SR (SetVariable);
    :see_if_need_to_exit_early (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_early_exit (Response);
      :Terminate__cannot_get_values (Terminate);
     endif
    :Set_SRsInaccessible_true__failed_to_get_BU (SetVariable);
    :Business_Unit_Name (Compose);
    :RemoveSpecialCharactersBU (Compose);
    :Get_SR (OpenApiConnection);
    :Get_BU (OpenApiConnection);
    :Get_Role_based_on_Type (If);
     if (condition) then (yes)
      :Get_SR_by_TID (OpenApiConnection);
      :Set_SRsInaccessible_true__failed_to_get_SR_by_TID (SetVariable);
     endif
     else (no)
      :Get_SR_by_Name (OpenApiConnection);
      :Set_SRsInaccessible_true__failed_to_get_SR_by_Name (SetVariable);
     endif
    :SRID_for_fetch (Compose);
    :SecurityRoleTemplateID (Compose);
   }
  :assumes_all_records_have_a_BU_and_a_user_name (Compose);
 endif
 partition "Get_Security_Role_Users" {
  :Get_Inventory_SR_membership (Scope);
   if (condition) then (yes)
    :Select_inventory (Select);
    :Parse_inventory (ParseJson);
    :Filter_inventory (Query);
    :List_Inventoried_SR_Members (OpenApiConnection);
   endif
   partition "Get_Inventory_SR_membership" {
    :Select_inventory (Select);
    :Parse_inventory (ParseJson);
    :Filter_inventory (Query);
    :List_Inventoried_SR_Members (OpenApiConnection);
   }
  :Remove_deleted_ones_from_inventory (Scope);
   if (condition) then (yes)
    :RemoveFromInventory (Query);
    :Remove_deleted_from_inventory (Foreach);
     if (condition) then (yes)
      :Delete_it (OpenApiConnection);
      :Find_it_for_ID (OpenApiConnection);
      :Remove_It_Filter__Direct (Compose);
      :Remove_It_filter (Compose);
      :RemoveSpecialChars (Compose);
      :Remove_It_Filter__Group (Compose);
     endif
     repeat
      :Delete_it (OpenApiConnection);
      :Find_it_for_ID (OpenApiConnection);
      :Remove_It_Filter__Direct (Compose);
      :Remove_It_filter (Compose);
      :RemoveSpecialChars (Compose);
      :Remove_It_Filter__Group (Compose);
     repeat while (more items)
   endif
   partition "Remove_deleted_ones_from_inventory" {
    :RemoveFromInventory (Query);
    :Remove_deleted_from_inventory (Foreach);
     if (condition) then (yes)
      :Delete_it (OpenApiConnection);
      :Find_it_for_ID (OpenApiConnection);
      :Remove_It_Filter__Direct (Compose);
      :Remove_It_filter (Compose);
      :RemoveSpecialChars (Compose);
      :Remove_It_Filter__Group (Compose);
     endif
     repeat
      :Delete_it (OpenApiConnection);
      :Find_it_for_ID (OpenApiConnection);
      :Remove_It_Filter__Direct (Compose);
      :Remove_It_filter (Compose);
      :RemoveSpecialChars (Compose);
      :Remove_It_Filter__Group (Compose);
     repeat while (more items)
   }
  :Add_new_ones_to_inventory (Scope);
   if (condition) then (yes)
    :AddToInventory (Query);
    :Add_new_to_inventory (Foreach);
     if (condition) then (yes)
      :Add_new_SR_User (OpenApiConnection);
     endif
     repeat
      :Add_new_SR_User (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Add_new_ones_to_inventory" {
    :AddToInventory (Query);
    :Add_new_to_inventory (Foreach);
     if (condition) then (yes)
      :Add_new_SR_User (OpenApiConnection);
     endif
     repeat
      :Add_new_SR_User (OpenApiConnection);
     repeat while (more items)
   }
  :Get_Actual_SR_membership (Scope);
   if (condition) then (yes)
    :Apply_to_each_Direct_Access (Foreach);
     if (condition) then (yes)
      :Append_to_array_variable (AppendToArrayVariable);
     endif
     repeat
      :Append_to_array_variable (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_Team (Foreach);
     if (condition) then (yes)
      :List_group_members (OpenApiConnection);
      :continue_if_group_exists (Scope);
       if (condition) then (yes)
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       endif
       partition "continue_if_group_exists" {
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       }
      :catch__for_now_aad_groups_only (Compose);
     endif
     repeat
      :List_group_members (OpenApiConnection);
      :continue_if_group_exists (Scope);
       if (condition) then (yes)
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       endif
       partition "continue_if_group_exists" {
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       }
      :catch__for_now_aad_groups_only (Compose);
     repeat while (more items)
    :Parse_actual (ParseJson);
    :Select_actual (Select);
    :Filter_actual (Query);
    :Direct_System_User_Access (OpenApiConnection);
    :Teams_with_Access (OpenApiConnection);
   endif
   partition "Get_Actual_SR_membership" {
    :Apply_to_each_Direct_Access (Foreach);
     if (condition) then (yes)
      :Append_to_array_variable (AppendToArrayVariable);
     endif
     repeat
      :Append_to_array_variable (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_Team (Foreach);
     if (condition) then (yes)
      :List_group_members (OpenApiConnection);
      :continue_if_group_exists (Scope);
       if (condition) then (yes)
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       endif
       partition "continue_if_group_exists" {
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       }
      :catch__for_now_aad_groups_only (Compose);
     endif
     repeat
      :List_group_members (OpenApiConnection);
      :continue_if_group_exists (Scope);
       if (condition) then (yes)
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       endif
       partition "continue_if_group_exists" {
        :Filter_array_to_Group_Memebers (Query);
        :if_no_sub_groups_add_group_here (If);
         if (condition) then (yes)
          :Append_to_GroupsToAdd_no_sub_groups (AppendToArrayVariable);
          :List_group_members_no_sub_groups (OpenApiConnection);
          :Add_each_user_no_sub_groups (Foreach);
           if (condition) then (yes)
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           endif
           repeat
            :Append_to_ActualSrMembers_no_sub_groups (AppendToArrayVariable);
           repeat while (more items)
          :Append_to_naming_map_no_sub_groups (AppendToArrayVariable);
         endif
        :Append_to_add_and_check_variables (Foreach);
         if (condition) then (yes)
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         endif
         repeat
          :Append_to_GroupsToAdd (AppendToArrayVariable);
          :Append_to_GroupsToCheck (AppendToArrayVariable);
          :Append_to_Map (AppendToArrayVariable);
         repeat while (more items)
        :Do_until (Until);
         if (condition) then (yes)
          :Copy_GroupsToCheck_to_tempVar (SetVariable);
          :Clear_GroupsToCheck (SetVariable);
          :Apply_to_each_group__loop (Foreach);
           if (condition) then (yes)
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           endif
           repeat
            :Filter_array_to_Group_Members__loop (Query);
            :List_group_members__loop (OpenApiConnection);
            :Filter_array_to_Groups_not_already_in_Add_list (Query);
            :Append_to_add_and_check_variables__loop (Foreach);
             if (condition) then (yes)
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             endif
             repeat
              :Append_to_GroupsToAdd__loop (AppendToArrayVariable);
              :Append_to_GroupsToCheck__loop (AppendToArrayVariable);
              :Append_to_Map__loop (AppendToArrayVariable);
             repeat while (more items)
            :Filter_array_to_non_Group_Members (Query);
            :Add_each_user_in_group (Foreach);
             if (condition) then (yes)
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             endif
             repeat
              :Append_to_ActualSrMembers_this_group (AppendToArrayVariable);
             repeat while (more items)
            :Get_Team_for_Name (Query);
            :This_Team_Name (Compose);
           repeat while (more items)
         endif
       }
      :catch__for_now_aad_groups_only (Compose);
     repeat while (more items)
    :Parse_actual (ParseJson);
    :Select_actual (Select);
    :Filter_actual (Query);
    :Direct_System_User_Access (OpenApiConnection);
    :Teams_with_Access (OpenApiConnection);
   }
  :get_basics_and_early_exit_if_inaccessible (Scope);
   if (condition) then (yes)
    :Get_EnvtMetadataName (OpenApiConnection);
    :if_no_or_inaccessible_tables_ (If);
     if (condition) then (yes)
      :Set_SRsInaccessible_true__envt_properties (SetVariable);
     endif
    :Security_Role_Display_Name (Compose);
    :Security_Role_ID (Compose);
    :Set_SRsInaccessible_true__failed_to_get_SR (SetVariable);
    :see_if_need_to_exit_early (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_early_exit (Response);
      :Terminate__cannot_get_values (Terminate);
     endif
    :Set_SRsInaccessible_true__failed_to_get_BU (SetVariable);
    :Business_Unit_Name (Compose);
    :RemoveSpecialCharactersBU (Compose);
    :Get_SR (OpenApiConnection);
    :Get_BU (OpenApiConnection);
    :Get_Role_based_on_Type (If);
     if (condition) then (yes)
      :Get_SR_by_TID (OpenApiConnection);
      :Set_SRsInaccessible_true__failed_to_get_SR_by_TID (SetVariable);
     endif
     else (no)
      :Get_SR_by_Name (OpenApiConnection);
      :Set_SRsInaccessible_true__failed_to_get_SR_by_Name (SetVariable);
     endif
    :SRID_for_fetch (Compose);
    :SecurityRoleTemplateID (Compose);
   endif
   partition "get_basics_and_early_exit_if_inaccessible" {
    :Get_EnvtMetadataName (OpenApiConnection);
    :if_no_or_inaccessible_tables_ (If);
     if (condition) then (yes)
      :Set_SRsInaccessible_true__envt_properties (SetVariable);
     endif
    :Security_Role_Display_Name (Compose);
    :Security_Role_ID (Compose);
    :Set_SRsInaccessible_true__failed_to_get_SR (SetVariable);
    :see_if_need_to_exit_early (If);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_early_exit (Response);
      :Terminate__cannot_get_values (Terminate);
     endif
    :Set_SRsInaccessible_true__failed_to_get_BU (SetVariable);
    :Business_Unit_Name (Compose);
    :RemoveSpecialCharactersBU (Compose);
    :Get_SR (OpenApiConnection);
    :Get_BU (OpenApiConnection);
    :Get_Role_based_on_Type (If);
     if (condition) then (yes)
      :Get_SR_by_TID (OpenApiConnection);
      :Set_SRsInaccessible_true__failed_to_get_SR_by_TID (SetVariable);
     endif
     else (no)
      :Get_SR_by_Name (OpenApiConnection);
      :Set_SRsInaccessible_true__failed_to_get_SR_by_Name (SetVariable);
     endif
    :SRID_for_fetch (Compose);
    :SecurityRoleTemplateID (Compose);
   }
  :assumes_all_records_have_a_BU_and_a_user_name (Compose);
 }
:Initialize_ActualSrMembers (InitializeVariable);
:Initialize_GroupsToAdd (InitializeVariable);
:Initialize_GroupsToCheck (InitializeVariable);
:Initialize_GroupID_Name_Map (InitializeVariable);
:Initialize_tempVar (InitializeVariable);
:Error_Handling (Scope);
 if (condition) then (yes)
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__failed (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__failed (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
  :Get_ID_Pass (OpenApiConnection);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
  :Get_ID_Pass (OpenApiConnection);
 }
:Initialize_SRsInaccessible (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_office365groups | shared_office365groups | admin_CoECoreO365Groups | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

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
| Get_Security_Role_Users | Scope | Operation ID: 8e197d49-aa41-483b-8e2c-8456d51260cb |
| Initialize_ActualSrMembers | InitializeVariable | Operation ID: 62b42c59-3fb6-4053-93b9-b9b663d36172 |
| Initialize_GroupsToAdd | InitializeVariable | Operation ID: e9686eff-0c33-4fc3-aa39-10545d96b361 |
| Initialize_GroupsToCheck | InitializeVariable | Operation ID: 661fb040-faba-454a-a399-eb9b078341d2 |
| Initialize_GroupID_Name_Map | InitializeVariable | Operation ID: 6bce275b-d3b2-48e9-b714-025a3798b93c |
| Initialize_tempVar | InitializeVariable | Operation ID: 108b214a-e423-4992-932d-18527c54ec63 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_SRsInaccessible | InitializeVariable | Operation ID: 5ec710c0-ca66-4549-897c-3b6138c8b21a |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
