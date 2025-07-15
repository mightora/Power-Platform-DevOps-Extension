# Power Automate Flow: CLEANUPHELPER-PowerAppsUserSharedWith

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A1C26F9
**Source File:** CLEANUPHELPER-PowerAppsUserSharedWith-1F3F24FF-C717-EC11-B6E6-000D3A1C26F9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUPHELPER-PowerAppsUserSharedWith
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 8
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUPHELPER-PowerAppsUserSharedWith

start
:Trigger: manual (Request);\n:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow_fail (Response);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow_fail (Response);
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
   endif
   partition "Get_Envt_Names" {
    :envtGUID (Compose);
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
   }
  :Get_Tenant_Size (Scope);
   if (condition) then (yes)
    :Get_Tenant (OpenApiConnection);
    :Tenant_Size (Compose);
    :Tenant_Has_Guests (Compose);
    :Tenant_User_ID (Compose);
   endif
   partition "Get_Tenant_Size" {
    :Get_Tenant (OpenApiConnection);
    :Tenant_Size (Compose);
    :Tenant_Has_Guests (Compose);
    :Tenant_User_ID (Compose);
   }
  :Get_Apps_as_Admin (OpenApiConnection);
  :Filter_To_Non_Embedded_Apps (Query);
  :Walk_the_Apps_in_this_Envt (Foreach);
   if (condition) then (yes)
    :catch_not_yet_in_inventory (Compose);
    :Update_Roles_Information (Scope);
     if (condition) then (yes)
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       endif
       partition "Roles_exist" {
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       }
      :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
     endif
     partition "Update_Roles_Information" {
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       endif
       partition "Roles_exist" {
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       }
      :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
     }
    :Get_a_record (OpenApiConnection);
   endif
   repeat
    :catch_not_yet_in_inventory (Compose);
    :Update_Roles_Information (Scope);
     if (condition) then (yes)
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       endif
       partition "Roles_exist" {
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       }
      :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
     endif
     partition "Update_Roles_Information" {
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       endif
       partition "Roles_exist" {
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       }
      :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
     }
    :Get_a_record (OpenApiConnection);
   repeat while (more items)
  :Get_All_Other_Users_Types (Scope);
   if (condition) then (yes)
    :Get_Groups (OpenApiConnection);
    :Get_Users (OpenApiConnection);
    :Get_ServicePrincipals (OpenApiConnection);
    :Get_Non_Tenant_Users (OpenApiConnection);
    :Inventory_Users (Select);
   endif
   partition "Get_All_Other_Users_Types" {
    :Get_Groups (OpenApiConnection);
    :Get_Users (OpenApiConnection);
    :Get_ServicePrincipals (OpenApiConnection);
    :Get_Non_Tenant_Users (OpenApiConnection);
    :Inventory_Users (Select);
   }
  :Cleanup__Delete_records_without_lookups (Scope);
   if (condition) then (yes)
    :Delete_all_roles_without_lookups (Foreach);
     if (condition) then (yes)
      :Delete_roles_without_lookups (OpenApiConnection);
     endif
     repeat
      :Delete_roles_without_lookups (OpenApiConnection);
     repeat while (more items)
    :List_roles_without_lookups (OpenApiConnection);
   endif
   partition "Cleanup__Delete_records_without_lookups" {
    :Delete_all_roles_without_lookups (Foreach);
     if (condition) then (yes)
      :Delete_roles_without_lookups (OpenApiConnection);
     endif
     repeat
      :Delete_roles_without_lookups (OpenApiConnection);
     repeat while (more items)
    :List_roles_without_lookups (OpenApiConnection);
   }
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
   endif
   partition "Get_Envt_Names" {
    :envtGUID (Compose);
    :Get_Envt_from_CoE_inventory (OpenApiConnection);
    :EnvtDisplayName (Compose);
   }
  :Get_Tenant_Size (Scope);
   if (condition) then (yes)
    :Get_Tenant (OpenApiConnection);
    :Tenant_Size (Compose);
    :Tenant_Has_Guests (Compose);
    :Tenant_User_ID (Compose);
   endif
   partition "Get_Tenant_Size" {
    :Get_Tenant (OpenApiConnection);
    :Tenant_Size (Compose);
    :Tenant_Has_Guests (Compose);
    :Tenant_User_ID (Compose);
   }
  :Get_Apps_as_Admin (OpenApiConnection);
  :Filter_To_Non_Embedded_Apps (Query);
  :Walk_the_Apps_in_this_Envt (Foreach);
   if (condition) then (yes)
    :catch_not_yet_in_inventory (Compose);
    :Update_Roles_Information (Scope);
     if (condition) then (yes)
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       endif
       partition "Roles_exist" {
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       }
      :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
     endif
     partition "Update_Roles_Information" {
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       endif
       partition "Roles_exist" {
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       }
      :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
     }
    :Get_a_record (OpenApiConnection);
   endif
   repeat
    :catch_not_yet_in_inventory (Compose);
    :Update_Roles_Information (Scope);
     if (condition) then (yes)
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       endif
       partition "Roles_exist" {
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       }
      :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
     endif
     partition "Update_Roles_Information" {
      :Roles_exist (Scope);
       if (condition) then (yes)
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       endif
       partition "Roles_exist" {
        :Ensure_all_Users_exist (Scope);
         if (condition) then (yes)
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         endif
         partition "Ensure_all_Users_exist" {
          :Actual_Users (Select);
          :New_Users_to_Add (Query);
          :Apply_to_each_New_User_to_Add (Foreach);
           if (condition) then (yes)
            :Switch_on_new_user_to_add_type (Switch);
           endif
           repeat
            :Switch_on_new_user_to_add_type (Switch);
           repeat while (more items)
          :Filter_out_Viral_User (Query);
          :Filter_out_Tenant_User (Query);
         }
        :Ensure_all_other_User_Roles_exist (Scope);
         if (condition) then (yes)
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         endif
         partition "Ensure_all_other_User_Roles_exist" {
          :Find_new_roles_to_add (Query);
          :Find_removed_roles_to_delete (Query);
          :Apply_to_each_role_to_add (Foreach);
           if (condition) then (yes)
            :Add_a_new_role (OpenApiConnection);
           endif
           repeat
            :Add_a_new_role (OpenApiConnection);
           repeat while (more items)
          :Apply_to_each_role_to_delete (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_the_role (OpenApiConnection);
           repeat while (more items)
          :Select_actual_roles (Select);
          :Filter_out_actual_tenant_roles (Query);
         }
        :Get_Counts_for_Apps (Scope);
         if (condition) then (yes)
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         endif
         partition "Get_Counts_for_Apps" {
          :Update_app_sharing_counts (OpenApiConnection);
          :Total_user_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
            :List_updated_role_list_for_this_app (OpenApiConnection);
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
          :Editor_count (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
            :List_updated_role_list_for_this_app_editors (OpenApiConnection);
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
          :Owner_info (Scope);
           if (condition) then (yes)
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           endif
           partition "Owner_info" {
            :List_updated_role_list_for_this_app_owner (OpenApiConnection);
            :Filter_to_Guests_Owner (Query);
           }
         }
        :Add_Remove_Tenant_Role (Scope);
         if (condition) then (yes)
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         endif
         partition "Add_Remove_Tenant_Role" {
          :Filter_to_actual_tenant_roles (Query);
          :Actual_shows_Shared_with_Tenant (Compose);
          :If_Actual_Shared_with_Tenant (If);
           if (condition) then (yes)
            :If_already_in_Inventory (If);
             if (condition) then (yes)
              :No_Op_Tenant_already_in_Role_List (Compose);
             endif
             else (no)
              :Add_Tenant_User (OpenApiConnection);
             endif
           endif
           else (no)
            :If_in_Inventory (If);
             if (condition) then (yes)
              :Delete_All_Tenant_User_Roles (Foreach);
               if (condition) then (yes)
                :Delete_Tenant_User_Role (OpenApiConnection);
               endif
               repeat
                :Delete_Tenant_User_Role (OpenApiConnection);
               repeat while (more items)
             endif
             else (no)
             endif
           endif
         }
       }
      :No_Roles_Exist (Scope);
       if (condition) then (yes)
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       endif
       partition "No_Roles_Exist" {
        :Delete_all_the_roles (Scope);
         if (condition) then (yes)
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Delete_all_the_roles" {
          :List_all_roles_for_this_app (OpenApiConnection);
          :Delete_all_roles_for_this_app (Foreach);
           if (condition) then (yes)
            :Delete_roles_for_this_app (OpenApiConnection);
           endif
           repeat
            :Delete_roles_for_this_app (OpenApiConnection);
           repeat while (more items)
         }
        :Update_app_sharing_counts_to_zero (OpenApiConnection);
       }
      :Get_Inventoried_Roles (Scope);
       if (condition) then (yes)
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       endif
       partition "Get_Inventoried_Roles" {
        :List_inventoried_roles (OpenApiConnection);
        :Select_inventoried_roles (Select);
        :Filter_to_non_tenant_inventoried_roles (Query);
        :Filter_to_tenant_inventoried_roles (Query);
        :Inventory_Shows_Shared_With_Tenant (Compose);
       }
      :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
     }
    :Get_a_record (OpenApiConnection);
   repeat while (more items)
  :Get_All_Other_Users_Types (Scope);
   if (condition) then (yes)
    :Get_Groups (OpenApiConnection);
    :Get_Users (OpenApiConnection);
    :Get_ServicePrincipals (OpenApiConnection);
    :Get_Non_Tenant_Users (OpenApiConnection);
    :Inventory_Users (Select);
   endif
   partition "Get_All_Other_Users_Types" {
    :Get_Groups (OpenApiConnection);
    :Get_Users (OpenApiConnection);
    :Get_ServicePrincipals (OpenApiConnection);
    :Get_Non_Tenant_Users (OpenApiConnection);
    :Inventory_Users (Select);
   }
  :Cleanup__Delete_records_without_lookups (Scope);
   if (condition) then (yes)
    :Delete_all_roles_without_lookups (Foreach);
     if (condition) then (yes)
      :Delete_roles_without_lookups (OpenApiConnection);
     endif
     repeat
      :Delete_roles_without_lookups (OpenApiConnection);
     repeat while (more items)
    :List_roles_without_lookups (OpenApiConnection);
   endif
   partition "Cleanup__Delete_records_without_lookups" {
    :Delete_all_roles_without_lookups (Foreach);
     if (condition) then (yes)
      :Delete_roles_without_lookups (OpenApiConnection);
     endif
     repeat
      :Delete_roles_without_lookups (OpenApiConnection);
     repeat while (more items)
    :List_roles_without_lookups (OpenApiConnection);
   }
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | invoker |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_powerappsforadmins_1 | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | invoker |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_office365groups | shared_office365groups | admin_CoECoreO365Groups | invoker |
| shared_office365users_1 | shared_office365users | admin_CoECoreO365Users | invoker |
| shared_webcontents | shared_webcontents | admin_CoECoreHTTPWithAzureAD | invoker |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Graph URL Environment Variable (admin_GraphURLEnvironmentVariable) | String | https://graph.microsoft.com/ | Inventory - REQUIRED. The URL used to get graph information for your cloud. Ex https://graph.microsoft.com/ |

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
