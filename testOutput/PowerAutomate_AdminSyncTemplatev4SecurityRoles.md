# Power Automate Flow: AdminSyncTemplatev4SecurityRoles

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A341FFF
**Source File:** AdminSyncTemplatev4SecurityRoles-743F2F81-A6AC-EE11-A569-000D3A341FFF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4SecurityRoles
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 5
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4SecurityRoles

start
:Trigger: When_a_row_is_added,_modified_or_deleted (OpenApiConnectionWebhook);\n:Check_if_Environment_Deleted_or_Excused_terminate_if_true (If);
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
:Get_Security_Roles (Scope);
 if (condition) then (yes)
  :List_SRs_to_track (OpenApiConnection);
  :Apply_to_each_SR (Foreach);
   if (condition) then (yes)
    :if_has_TID (If);
     if (condition) then (yes)
      :TID (Compose);
      :Get_SRs_by_TID (OpenApiConnection);
      :CATCH__Cannot_gather_due_to_GDS_issue (Compose);
      :Call_for_SRs (Scope);
       if (condition) then (yes)
        :See_if_want_to_gather_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU (Compose);
          :Run_a_Child_Flow__Parent_BU (Workflow);
          :Get_Parent_BU (OpenApiConnection);
         endif
       endif
       partition "Call_for_SRs" {
        :See_if_want_to_gather_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU (Compose);
          :Run_a_Child_Flow__Parent_BU (Workflow);
          :Get_Parent_BU (OpenApiConnection);
         endif
       }
     endif
     else (no)
      :Name (Compose);
      :Get_SRs_by_Name (OpenApiConnection);
      :CATCH__Cannot_gather_by_name_due_to_GDS_issue (Compose);
      :Call_for_SRs_by_Name (Scope);
       if (condition) then (yes)
        :See_if_want_to_gather_by_name_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR_by_Name (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU_by_Name (Compose);
          :Run_a_Child_Flow__Parent_BU_By_Name (Workflow);
          :Get_Parent_BU_by_Name (OpenApiConnection);
         endif
       endif
       partition "Call_for_SRs_by_Name" {
        :See_if_want_to_gather_by_name_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR_by_Name (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU_by_Name (Compose);
          :Run_a_Child_Flow__Parent_BU_By_Name (Workflow);
          :Get_Parent_BU_by_Name (OpenApiConnection);
         endif
       }
     endif
   endif
   repeat
    :if_has_TID (If);
     if (condition) then (yes)
      :TID (Compose);
      :Get_SRs_by_TID (OpenApiConnection);
      :CATCH__Cannot_gather_due_to_GDS_issue (Compose);
      :Call_for_SRs (Scope);
       if (condition) then (yes)
        :See_if_want_to_gather_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU (Compose);
          :Run_a_Child_Flow__Parent_BU (Workflow);
          :Get_Parent_BU (OpenApiConnection);
         endif
       endif
       partition "Call_for_SRs" {
        :See_if_want_to_gather_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU (Compose);
          :Run_a_Child_Flow__Parent_BU (Workflow);
          :Get_Parent_BU (OpenApiConnection);
         endif
       }
     endif
     else (no)
      :Name (Compose);
      :Get_SRs_by_Name (OpenApiConnection);
      :CATCH__Cannot_gather_by_name_due_to_GDS_issue (Compose);
      :Call_for_SRs_by_Name (Scope);
       if (condition) then (yes)
        :See_if_want_to_gather_by_name_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR_by_Name (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU_by_Name (Compose);
          :Run_a_Child_Flow__Parent_BU_By_Name (Workflow);
          :Get_Parent_BU_by_Name (OpenApiConnection);
         endif
       endif
       partition "Call_for_SRs_by_Name" {
        :See_if_want_to_gather_by_name_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR_by_Name (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU_by_Name (Compose);
          :Run_a_Child_Flow__Parent_BU_By_Name (Workflow);
          :Get_Parent_BU_by_Name (OpenApiConnection);
         endif
       }
     endif
   repeat while (more items)
  :Add_User_Identity_and_Guest_User_information (Scope);
   if (condition) then (yes)
    :Find_user_with_ID (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_without_known_Identity (OpenApiConnection);
      :Select_ID_and_RowID_for_record_update (Select);
      :Select_just_User_ID (Select);
      :Distinct_List_of_User_IDs (Compose);
      :Apply_to_each_user_with_unknown_identity (Foreach);
       if (condition) then (yes)
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       endif
       repeat
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Find_user_with_ID" {
      :List_envt_SR_Users_without_known_Identity (OpenApiConnection);
      :Select_ID_and_RowID_for_record_update (Select);
      :Select_just_User_ID (Select);
      :Distinct_List_of_User_IDs (Compose);
      :Apply_to_each_user_with_unknown_identity (Foreach);
       if (condition) then (yes)
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       endif
       repeat
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       repeat while (more items)
     }
    :Find_Microsoft_Accounts_from_List (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_still_unknown__list (OpenApiConnection);
      :Select_Name__list (Select);
      :Distinct_Names__list (Compose);
      :Find_names_in_known_list (Query);
      :Apply_to_each_known_Microsoft_Account (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       endif
       repeat
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       repeat while (more items)
     endif
     partition "Find_Microsoft_Accounts_from_List" {
      :List_envt_SR_Users_still_unknown__list (OpenApiConnection);
      :Select_Name__list (Select);
      :Distinct_Names__list (Compose);
      :Find_names_in_known_list (Query);
      :Apply_to_each_known_Microsoft_Account (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       endif
       repeat
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       repeat while (more items)
     }
    :Differentiate_the_rest__Microsoft_Account_v_Unknown (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_still_unknown (OpenApiConnection);
      :Select_Name (Select);
      :Distinct_Names (Compose);
      :Apply_to_each_still_unknown (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       endif
       repeat
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       repeat while (more items)
     endif
     partition "Differentiate_the_rest__Microsoft_Account_v_Unknown" {
      :List_envt_SR_Users_still_unknown (OpenApiConnection);
      :Select_Name (Select);
      :Distinct_Names (Compose);
      :Apply_to_each_still_unknown (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       endif
       repeat
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       repeat while (more items)
     }
   endif
   partition "Add_User_Identity_and_Guest_User_information" {
    :Find_user_with_ID (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_without_known_Identity (OpenApiConnection);
      :Select_ID_and_RowID_for_record_update (Select);
      :Select_just_User_ID (Select);
      :Distinct_List_of_User_IDs (Compose);
      :Apply_to_each_user_with_unknown_identity (Foreach);
       if (condition) then (yes)
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       endif
       repeat
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Find_user_with_ID" {
      :List_envt_SR_Users_without_known_Identity (OpenApiConnection);
      :Select_ID_and_RowID_for_record_update (Select);
      :Select_just_User_ID (Select);
      :Distinct_List_of_User_IDs (Compose);
      :Apply_to_each_user_with_unknown_identity (Foreach);
       if (condition) then (yes)
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       endif
       repeat
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       repeat while (more items)
     }
    :Find_Microsoft_Accounts_from_List (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_still_unknown__list (OpenApiConnection);
      :Select_Name__list (Select);
      :Distinct_Names__list (Compose);
      :Find_names_in_known_list (Query);
      :Apply_to_each_known_Microsoft_Account (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       endif
       repeat
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       repeat while (more items)
     endif
     partition "Find_Microsoft_Accounts_from_List" {
      :List_envt_SR_Users_still_unknown__list (OpenApiConnection);
      :Select_Name__list (Select);
      :Distinct_Names__list (Compose);
      :Find_names_in_known_list (Query);
      :Apply_to_each_known_Microsoft_Account (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       endif
       repeat
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       repeat while (more items)
     }
    :Differentiate_the_rest__Microsoft_Account_v_Unknown (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_still_unknown (OpenApiConnection);
      :Select_Name (Select);
      :Distinct_Names (Compose);
      :Apply_to_each_still_unknown (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       endif
       repeat
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       repeat while (more items)
     endif
     partition "Differentiate_the_rest__Microsoft_Account_v_Unknown" {
      :List_envt_SR_Users_still_unknown (OpenApiConnection);
      :Select_Name (Select);
      :Distinct_Names (Compose);
      :Apply_to_each_still_unknown (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       endif
       repeat
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       repeat while (more items)
     }
   }
 endif
 partition "Get_Security_Roles" {
  :List_SRs_to_track (OpenApiConnection);
  :Apply_to_each_SR (Foreach);
   if (condition) then (yes)
    :if_has_TID (If);
     if (condition) then (yes)
      :TID (Compose);
      :Get_SRs_by_TID (OpenApiConnection);
      :CATCH__Cannot_gather_due_to_GDS_issue (Compose);
      :Call_for_SRs (Scope);
       if (condition) then (yes)
        :See_if_want_to_gather_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU (Compose);
          :Run_a_Child_Flow__Parent_BU (Workflow);
          :Get_Parent_BU (OpenApiConnection);
         endif
       endif
       partition "Call_for_SRs" {
        :See_if_want_to_gather_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU (Compose);
          :Run_a_Child_Flow__Parent_BU (Workflow);
          :Get_Parent_BU (OpenApiConnection);
         endif
       }
     endif
     else (no)
      :Name (Compose);
      :Get_SRs_by_Name (OpenApiConnection);
      :CATCH__Cannot_gather_by_name_due_to_GDS_issue (Compose);
      :Call_for_SRs_by_Name (Scope);
       if (condition) then (yes)
        :See_if_want_to_gather_by_name_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR_by_Name (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU_by_Name (Compose);
          :Run_a_Child_Flow__Parent_BU_By_Name (Workflow);
          :Get_Parent_BU_by_Name (OpenApiConnection);
         endif
       endif
       partition "Call_for_SRs_by_Name" {
        :See_if_want_to_gather_by_name_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR_by_Name (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU_by_Name (Compose);
          :Run_a_Child_Flow__Parent_BU_By_Name (Workflow);
          :Get_Parent_BU_by_Name (OpenApiConnection);
         endif
       }
     endif
   endif
   repeat
    :if_has_TID (If);
     if (condition) then (yes)
      :TID (Compose);
      :Get_SRs_by_TID (OpenApiConnection);
      :CATCH__Cannot_gather_due_to_GDS_issue (Compose);
      :Call_for_SRs (Scope);
       if (condition) then (yes)
        :See_if_want_to_gather_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU (Compose);
          :Run_a_Child_Flow__Parent_BU (Workflow);
          :Get_Parent_BU (OpenApiConnection);
         endif
       endif
       partition "Call_for_SRs" {
        :See_if_want_to_gather_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU (Compose);
          :Run_a_Child_Flow__Parent_BU (Workflow);
          :Get_Parent_BU (OpenApiConnection);
         endif
       }
     endif
     else (no)
      :Name (Compose);
      :Get_SRs_by_Name (OpenApiConnection);
      :CATCH__Cannot_gather_by_name_due_to_GDS_issue (Compose);
      :Call_for_SRs_by_Name (Scope);
       if (condition) then (yes)
        :See_if_want_to_gather_by_name_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR_by_Name (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU_by_Name (Compose);
          :Run_a_Child_Flow__Parent_BU_By_Name (Workflow);
          :Get_Parent_BU_by_Name (OpenApiConnection);
         endif
       endif
       partition "Call_for_SRs_by_Name" {
        :See_if_want_to_gather_by_name_for_all_BUs_or_just_parent (If);
         if (condition) then (yes)
          :Apply_to_SR_by_Name (Foreach);
           if (condition) then (yes)
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           endif
           repeat
            :Run_a_Child_Flow__All_BUs_By_Name (Workflow);
           repeat while (more items)
         endif
         else (no)
          :ParentBU_by_Name (Compose);
          :Run_a_Child_Flow__Parent_BU_By_Name (Workflow);
          :Get_Parent_BU_by_Name (OpenApiConnection);
         endif
       }
     endif
   repeat while (more items)
  :Add_User_Identity_and_Guest_User_information (Scope);
   if (condition) then (yes)
    :Find_user_with_ID (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_without_known_Identity (OpenApiConnection);
      :Select_ID_and_RowID_for_record_update (Select);
      :Select_just_User_ID (Select);
      :Distinct_List_of_User_IDs (Compose);
      :Apply_to_each_user_with_unknown_identity (Foreach);
       if (condition) then (yes)
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       endif
       repeat
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Find_user_with_ID" {
      :List_envt_SR_Users_without_known_Identity (OpenApiConnection);
      :Select_ID_and_RowID_for_record_update (Select);
      :Select_just_User_ID (Select);
      :Distinct_List_of_User_IDs (Compose);
      :Apply_to_each_user_with_unknown_identity (Foreach);
       if (condition) then (yes)
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       endif
       repeat
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       repeat while (more items)
     }
    :Find_Microsoft_Accounts_from_List (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_still_unknown__list (OpenApiConnection);
      :Select_Name__list (Select);
      :Distinct_Names__list (Compose);
      :Find_names_in_known_list (Query);
      :Apply_to_each_known_Microsoft_Account (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       endif
       repeat
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       repeat while (more items)
     endif
     partition "Find_Microsoft_Accounts_from_List" {
      :List_envt_SR_Users_still_unknown__list (OpenApiConnection);
      :Select_Name__list (Select);
      :Distinct_Names__list (Compose);
      :Find_names_in_known_list (Query);
      :Apply_to_each_known_Microsoft_Account (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       endif
       repeat
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       repeat while (more items)
     }
    :Differentiate_the_rest__Microsoft_Account_v_Unknown (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_still_unknown (OpenApiConnection);
      :Select_Name (Select);
      :Distinct_Names (Compose);
      :Apply_to_each_still_unknown (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       endif
       repeat
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       repeat while (more items)
     endif
     partition "Differentiate_the_rest__Microsoft_Account_v_Unknown" {
      :List_envt_SR_Users_still_unknown (OpenApiConnection);
      :Select_Name (Select);
      :Distinct_Names (Compose);
      :Apply_to_each_still_unknown (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       endif
       repeat
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       repeat while (more items)
     }
   endif
   partition "Add_User_Identity_and_Guest_User_information" {
    :Find_user_with_ID (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_without_known_Identity (OpenApiConnection);
      :Select_ID_and_RowID_for_record_update (Select);
      :Select_just_User_ID (Select);
      :Distinct_List_of_User_IDs (Compose);
      :Apply_to_each_user_with_unknown_identity (Foreach);
       if (condition) then (yes)
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       endif
       repeat
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Find_user_with_ID" {
      :List_envt_SR_Users_without_known_Identity (OpenApiConnection);
      :Select_ID_and_RowID_for_record_update (Select);
      :Select_just_User_ID (Select);
      :Distinct_List_of_User_IDs (Compose);
      :Apply_to_each_user_with_unknown_identity (Foreach);
       if (condition) then (yes)
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       endif
       repeat
        :User_not_found (Scope);
         if (condition) then (yes)
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         endif
         partition "User_not_found" {
          :Find_this_unknown_users_name (OpenApiConnection);
          :Look_up_in_AD (OpenApiConnection);
          :App_Reg_Returned (If);
           if (condition) then (yes)
            :Apply_to_each_user__app_reg (Foreach);
             if (condition) then (yes)
              :Mark_as_an_app_reg (OpenApiConnection);
             endif
             repeat
              :Mark_as_an_app_reg (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :No_op__Agg_Reg_Not_Found (Compose);
           endif
          :Get_App_Reg_failed (Scope);
           if (condition) then (yes)
            :No_op__Agg_Reg_Failed (Compose);
           endif
           partition "Get_App_Reg_failed" {
            :No_op__Agg_Reg_Failed (Compose);
           }
          :Users_Modified_Name (Compose);
          :Users_Name (Compose);
         }
        :User_found_update (Scope);
         if (condition) then (yes)
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         endif
         partition "User_found_update" {
          :isGuestUser (Compose);
          :user_identity_type (Compose);
          :Set_users_identintities (Foreach);
           if (condition) then (yes)
            :Update_user_identity_and_type (OpenApiConnection);
           endif
           repeat
            :Update_user_identity_and_type (OpenApiConnection);
           repeat while (more items)
         }
        :Get_user_profile_V2 (OpenApiConnection);
        :Find_this_users_records (OpenApiConnection);
       repeat while (more items)
     }
    :Find_Microsoft_Accounts_from_List (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_still_unknown__list (OpenApiConnection);
      :Select_Name__list (Select);
      :Distinct_Names__list (Compose);
      :Find_names_in_known_list (Query);
      :Apply_to_each_known_Microsoft_Account (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       endif
       repeat
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       repeat while (more items)
     endif
     partition "Find_Microsoft_Accounts_from_List" {
      :List_envt_SR_Users_still_unknown__list (OpenApiConnection);
      :Select_Name__list (Select);
      :Distinct_Names__list (Compose);
      :Find_names_in_known_list (Query);
      :Apply_to_each_known_Microsoft_Account (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       endif
       repeat
        :Find_this_users_records__list (OpenApiConnection);
        :Apply_to_each_record_found__list (Foreach);
         if (condition) then (yes)
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         endif
         repeat
          :Mark_as_Microsoft_Account__list (OpenApiConnection);
         repeat while (more items)
       repeat while (more items)
     }
    :Differentiate_the_rest__Microsoft_Account_v_Unknown (Scope);
     if (condition) then (yes)
      :List_envt_SR_Users_still_unknown (OpenApiConnection);
      :Select_Name (Select);
      :Distinct_Names (Compose);
      :Apply_to_each_still_unknown (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       endif
       repeat
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       repeat while (more items)
     endif
     partition "Differentiate_the_rest__Microsoft_Account_v_Unknown" {
      :List_envt_SR_Users_still_unknown (OpenApiConnection);
      :Select_Name (Select);
      :Distinct_Names (Compose);
      :Apply_to_each_still_unknown (Foreach);
       if (condition) then (yes)
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       endif
       repeat
        :Find_this_users_records__still_unknown (OpenApiConnection);
        :List_SystemUser_Record (OpenApiConnection);
        :If_found (If);
         if (condition) then (yes)
          :Access_Mode (Compose);
          :If_acess_mode_noninteractive_support_user_or_delegated_admin (If);
           if (condition) then (yes)
            :Deduce_as_MSFT_owned__mark_all_Microsoft_Account (Foreach);
             if (condition) then (yes)
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             endif
             repeat
              :Deduce_as_MSFT_owned__mark_as_Microsoft_Account (OpenApiConnection);
             repeat while (more items)
           endif
           else (no)
            :Still_not_known__mark_all_unknown_ (Foreach);
             if (condition) then (yes)
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             endif
             repeat
              :Still_not_known___Mark_as_unknown (OpenApiConnection);
             repeat while (more items)
           endif
         endif
         else (no)
          :No_System_User_record__mark_all_unknown (Foreach);
           if (condition) then (yes)
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           endif
           repeat
            :No_System_User_Record__Mark_as_unknown (OpenApiConnection);
           repeat while (more items)
         endif
       repeat while (more items)
     }
   }
 }
:Initialize_KnownMicrosoftAccounts (InitializeVariable);
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
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_webcontents | shared_webcontents | admin_CoECoreHTTPWithAzureAD | embedded |
| shared_office365users | shared_office365users | admin_CoECoreO365Users | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| DelayObjectInventory (admin_DelayObjectInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse throttling. Things like solutions, apps, flows, will have delays in the individual envt runs. Default No. |

## Triggers

### When_a_row_is_added,_modified_or_deleted
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Check_if_Environment_Deleted_or_Excused,_terminate_if_true | If | Operation ID: 0bf354ac-4265-4bbe-9fed-996958d038bd |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Get_Security_Roles | Scope | Operation ID: fc03018b-12ab-48d7-87b5-72d88709947a |
| Initialize_KnownMicrosoftAccounts | InitializeVariable | Operation ID: 309ce83c-0e0a-4822-ac32-92badc44a049 |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
