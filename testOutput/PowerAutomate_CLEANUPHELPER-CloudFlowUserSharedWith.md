# Power Automate Flow: CLEANUPHELPER-CloudFlowUserSharedWith

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A322446
**Source File:** CLEANUPHELPER-CloudFlowUserSharedWith-5F164DC7-8D1A-EF11-840A-000D3A322446.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUPHELPER-CloudFlowUserSharedWith
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 9
- **Parameters:** 3

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUPHELPER-CloudFlowUserSharedWith

start
:Trigger: manual (Request);\n:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow_fail (Response);
  :not_in_metadata_yet_2 (Compose);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow_fail (Response);
  :not_in_metadata_yet_2 (Compose);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow (Response);
  :Catch_here (Compose);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow (Response);
  :Catch_here (Compose);
 }
:Get_Power_Apps_User_Shared_With_Data (Scope);
 if (condition) then (yes)
  :Recheck_envt_still_exists_exit_if_not (Scope);
   if (condition) then (yes)
    :Get_Environment_as_Admin (OpenApiConnection);
    :Envt_Deleted_so_Exit (Scope);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_2 (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
     partition "Envt_Deleted_so_Exit" {
      :Respond_to_a_PowerApp_or_flow_2 (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     }
   endif
   partition "Recheck_envt_still_exists_exit_if_not" {
    :Get_Environment_as_Admin (OpenApiConnection);
    :Envt_Deleted_so_Exit (Scope);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_2 (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
     partition "Envt_Deleted_so_Exit" {
      :Respond_to_a_PowerApp_or_flow_2 (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     }
   }
  :Get_Envt_Names (Scope);
   if (condition) then (yes)
    :envtGUID (Compose);
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
    :EnvtCDSURL (Compose);
   endif
   partition "Get_Envt_Names" {
    :envtGUID (Compose);
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
    :EnvtCDSURL (Compose);
   }
  :Walk_the_Flows_in_this_Envt (Foreach);
   if (condition) then (yes)
    :catch_not_yet_in_inventory (Compose);
    :Update_Roles_Information (Scope);
     if (condition) then (yes)
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       endif
       partition "Roles_exist" {
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       }
      :Get_Flow_Shared_With_Actual (Scope);
       if (condition) then (yes)
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       endif
       partition "Get_Flow_Shared_With_Actual" {
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       }
     endif
     partition "Update_Roles_Information" {
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       endif
       partition "Roles_exist" {
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       }
      :Get_Flow_Shared_With_Actual (Scope);
       if (condition) then (yes)
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       endif
       partition "Get_Flow_Shared_With_Actual" {
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       }
     }
    :Get_a_record (OpenApiConnection);
   endif
   repeat
    :catch_not_yet_in_inventory (Compose);
    :Update_Roles_Information (Scope);
     if (condition) then (yes)
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       endif
       partition "Roles_exist" {
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       }
      :Get_Flow_Shared_With_Actual (Scope);
       if (condition) then (yes)
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       endif
       partition "Get_Flow_Shared_With_Actual" {
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       }
     endif
     partition "Update_Roles_Information" {
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       endif
       partition "Roles_exist" {
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       }
      :Get_Flow_Shared_With_Actual (Scope);
       if (condition) then (yes)
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       endif
       partition "Get_Flow_Shared_With_Actual" {
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       }
     }
    :Get_a_record (OpenApiConnection);
   repeat while (more items)
  :Get_User_Types (Scope);
   if (condition) then (yes)
    :Get_Groups (OpenApiConnection);
    :Get_Users (OpenApiConnection);
    :Get_ServicePrincipals (OpenApiConnection);
    :Get_Non_Tenant_Users (OpenApiConnection);
    :Inventory_Users (Select);
   endif
   partition "Get_User_Types" {
    :Get_Groups (OpenApiConnection);
    :Get_Users (OpenApiConnection);
    :Get_ServicePrincipals (OpenApiConnection);
    :Get_Non_Tenant_Users (OpenApiConnection);
    :Inventory_Users (Select);
   }
  :List_Flows_as_Admin_V2 (OpenApiConnection);
  :Filter_out_unpublished (Query);
 endif
 partition "Get_Power_Apps_User_Shared_With_Data" {
  :Recheck_envt_still_exists_exit_if_not (Scope);
   if (condition) then (yes)
    :Get_Environment_as_Admin (OpenApiConnection);
    :Envt_Deleted_so_Exit (Scope);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_2 (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
     partition "Envt_Deleted_so_Exit" {
      :Respond_to_a_PowerApp_or_flow_2 (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     }
   endif
   partition "Recheck_envt_still_exists_exit_if_not" {
    :Get_Environment_as_Admin (OpenApiConnection);
    :Envt_Deleted_so_Exit (Scope);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_2 (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     endif
     partition "Envt_Deleted_so_Exit" {
      :Respond_to_a_PowerApp_or_flow_2 (Response);
      :Terminate_for_environments_recently_deleted (Terminate);
     }
   }
  :Get_Envt_Names (Scope);
   if (condition) then (yes)
    :envtGUID (Compose);
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
    :EnvtCDSURL (Compose);
   endif
   partition "Get_Envt_Names" {
    :envtGUID (Compose);
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
    :EnvtCDSURL (Compose);
   }
  :Walk_the_Flows_in_this_Envt (Foreach);
   if (condition) then (yes)
    :catch_not_yet_in_inventory (Compose);
    :Update_Roles_Information (Scope);
     if (condition) then (yes)
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       endif
       partition "Roles_exist" {
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       }
      :Get_Flow_Shared_With_Actual (Scope);
       if (condition) then (yes)
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       endif
       partition "Get_Flow_Shared_With_Actual" {
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       }
     endif
     partition "Update_Roles_Information" {
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       endif
       partition "Roles_exist" {
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       }
      :Get_Flow_Shared_With_Actual (Scope);
       if (condition) then (yes)
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       endif
       partition "Get_Flow_Shared_With_Actual" {
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       }
     }
    :Get_a_record (OpenApiConnection);
   endif
   repeat
    :catch_not_yet_in_inventory (Compose);
    :Update_Roles_Information (Scope);
     if (condition) then (yes)
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       endif
       partition "Roles_exist" {
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       }
      :Get_Flow_Shared_With_Actual (Scope);
       if (condition) then (yes)
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       endif
       partition "Get_Flow_Shared_With_Actual" {
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       }
     endif
     partition "Update_Roles_Information" {
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       endif
       partition "Roles_exist" {
        :Get_Counts_for_Flows (Scope);
         if (condition) then (yes)
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Flows" {
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           endif
           partition "Editor_count" {
            :List_updated_role_list_for_this_flows_editors (OpenApiConnection);
            :Filter_to_Group_Editors (Query);
            :Filter_to_Guests_Editors (Query);
            :Get_Total_User_Count_Editors (Scope);
             if (condition) then (yes)
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             endif
             partition "Get_Total_User_Count_Editors" {
              :Select_GroupSize_Editors (Select);
              :JSON_group_size_Editors (Compose);
              :XML_group_size_Editors (Compose);
              :Sum_total_users_Editors (Compose);
             }
           }
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           endif
           partition "Total_user_count" {
            :List_updated_role_list_for_this_flow (OpenApiConnection);
            :Filter_to_Groups (Query);
            :Filter_to_Guests (Query);
            :Get_Total_User_Count (Scope);
             if (condition) then (yes)
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             endif
             partition "Get_Total_User_Count" {
              :Select_GroupSize (Select);
              :JSON_group_size (Compose);
              :XML_group_size (Compose);
              :Sum_total_users (Compose);
             }
           }
          :If_need_to_update_owner (If);
           if (condition) then (yes)
            :Update_flow_sharing_counts_and_owner (OpenApiConnection);
           endif
           else (no)
            :Update_flow_sharing_counts (OpenApiConnection);
           endif
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_flows_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Find_new_roles_to_add (Query);
          :Select_actual_roles (Select);
         }
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_flow (OpenApiConnection);
          :Delete_all_roles_for_this_flow (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_flow (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_flow (OpenApiConnection);
           repeat while (more items)
         }
        :Update_flow_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
       }
      :Get_Flow_Shared_With_Actual (Scope);
       if (condition) then (yes)
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       endif
       partition "Get_Flow_Shared_With_Actual" {
        :Full_Permissions (Compose);
        :Owner_Object (Compose);
        :Primary_Owner (Compose);
        :if_no_owner_listed (If);
         if (condition) then (yes)
          :Get_owner_from_System_User (OpenApiConnection);
          :Get_actual_object_for_owner (OpenApiConnection);
         endif
        :Filter_to_not_owner (Query);
        :Filter_to_owner (Query);
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Ownership_Changed_from_Inventory (Compose);
        :Primary_Owner_Type (Compose);
        :Filter_to_permissionType_Principal (Query);
        :Non_Null_Full_Permissions (Query);
       }
     }
    :Get_a_record (OpenApiConnection);
   repeat while (more items)
  :Get_User_Types (Scope);
   if (condition) then (yes)
    :Get_Groups (OpenApiConnection);
    :Get_Users (OpenApiConnection);
    :Get_ServicePrincipals (OpenApiConnection);
    :Get_Non_Tenant_Users (OpenApiConnection);
    :Inventory_Users (Select);
   endif
   partition "Get_User_Types" {
    :Get_Groups (OpenApiConnection);
    :Get_Users (OpenApiConnection);
    :Get_ServicePrincipals (OpenApiConnection);
    :Get_Non_Tenant_Users (OpenApiConnection);
    :Inventory_Users (Select);
   }
  :List_Flows_as_Admin_V2 (OpenApiConnection);
  :Filter_out_unpublished (Query);
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_office365groups | shared_office365groups | admin_CoECoreO365Groups | embedded |
| shared_office365users_1 | shared_office365users | admin_CoECoreO365Users | embedded |
| shared_webcontents | shared_webcontents | admin_CoECoreHTTPWithAzureAD | embedded |
| shared_microsoftflowforadmins | shared_microsoftflowforadmins | admin_CoECorePowerAutomateAdmin | embedded |
| shared_flowmanagement | shared_flowmanagement | admin_CoECorePowerAutomateManagement | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Graph URL Environment Variable (admin_GraphURLEnvironmentVariable) | String | https://graph.microsoft.com/ | Inventory - REQUIRED. The URL used to get graph information for your cloud. Ex https://graph.microsoft.com/ |
| CoE System User ID (admin_CoESystemUserID) | String | 6f018471-30d7-ef11-8ee9-000d3a328366 | in the maker table we store a user for system with an id. Storing here so that it can be referenced without having to look it up all the time. |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Get_Power_Apps_User_Shared_With_Data | Scope | Operation ID: 866325b8-169b-4d4f-83f9-45e4f7cf1ce7 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
