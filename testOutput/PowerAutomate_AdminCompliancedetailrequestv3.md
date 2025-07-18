# Power Automate Flow: AdminCompliancedetailrequestv3

**Generated on:** 2025-07-15 19:14:46
**Flow ID:** 000D3A13451D
**Source File:** AdminCompliancedetailrequestv3-309DA5D3-659C-EB11-B1AC-000D3A13451D.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminCompliancedetailrequestv3
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 9

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminCompliancedetailrequestv3

start
:Trigger: Recurrence (Recurrence);\n:Initialize_varAssignee (InitializeVariable);
:Initialize_NumberUsersShared (InitializeVariable);
:Initialize_NumberGroupsShared (InitializeVariable);
:Initialize_NumberChatbotLaunches (InitializeVariable);
:Initialize_NumberDaysSincePublished (InitializeVariable);
:Initialize_NumberLaunchesLast30Days (InitializeVariable);
:Compliance_due_to_heavy_usage (Scope);
 if (condition) then (yes)
  :List_Environments_not_excused_from_compliance (OpenApiConnection);
  :Apply_to_each_envt (Foreach);
   if (condition) then (yes)
    :Send_Compliance_Request_email_for_Chatbots (Scope);
     if (condition) then (yes)
      :Apply_to_each_chatbot (Foreach);
       if (condition) then (yes)
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       endif
       repeat
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       repeat while (more items)
      :List_chatbots (OpenApiConnection);
     endif
     partition "Send_Compliance_Request_email_for_Chatbots" {
      :Apply_to_each_chatbot (Foreach);
       if (condition) then (yes)
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       endif
       repeat
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       repeat while (more items)
      :List_chatbots (OpenApiConnection);
     }
    :Send_Compliance_Request_email_for_Apps (Scope);
     if (condition) then (yes)
      :Apply_to_each_envt_App (Foreach);
       if (condition) then (yes)
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       endif
       repeat
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       repeat while (more items)
      :List_this_envt_apps (OpenApiConnection);
     endif
     partition "Send_Compliance_Request_email_for_Apps" {
      :Apply_to_each_envt_App (Foreach);
       if (condition) then (yes)
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       endif
       repeat
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       repeat while (more items)
      :List_this_envt_apps (OpenApiConnection);
     }
   endif
   repeat
    :Send_Compliance_Request_email_for_Chatbots (Scope);
     if (condition) then (yes)
      :Apply_to_each_chatbot (Foreach);
       if (condition) then (yes)
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       endif
       repeat
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       repeat while (more items)
      :List_chatbots (OpenApiConnection);
     endif
     partition "Send_Compliance_Request_email_for_Chatbots" {
      :Apply_to_each_chatbot (Foreach);
       if (condition) then (yes)
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       endif
       repeat
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       repeat while (more items)
      :List_chatbots (OpenApiConnection);
     }
    :Send_Compliance_Request_email_for_Apps (Scope);
     if (condition) then (yes)
      :Apply_to_each_envt_App (Foreach);
       if (condition) then (yes)
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       endif
       repeat
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       repeat while (more items)
      :List_this_envt_apps (OpenApiConnection);
     endif
     partition "Send_Compliance_Request_email_for_Apps" {
      :Apply_to_each_envt_App (Foreach);
       if (condition) then (yes)
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       endif
       repeat
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       repeat while (more items)
      :List_this_envt_apps (OpenApiConnection);
     }
   repeat while (more items)
 endif
 partition "Compliance_due_to_heavy_usage" {
  :List_Environments_not_excused_from_compliance (OpenApiConnection);
  :Apply_to_each_envt (Foreach);
   if (condition) then (yes)
    :Send_Compliance_Request_email_for_Chatbots (Scope);
     if (condition) then (yes)
      :Apply_to_each_chatbot (Foreach);
       if (condition) then (yes)
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       endif
       repeat
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       repeat while (more items)
      :List_chatbots (OpenApiConnection);
     endif
     partition "Send_Compliance_Request_email_for_Chatbots" {
      :Apply_to_each_chatbot (Foreach);
       if (condition) then (yes)
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       endif
       repeat
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       repeat while (more items)
      :List_chatbots (OpenApiConnection);
     }
    :Send_Compliance_Request_email_for_Apps (Scope);
     if (condition) then (yes)
      :Apply_to_each_envt_App (Foreach);
       if (condition) then (yes)
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       endif
       repeat
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       repeat while (more items)
      :List_this_envt_apps (OpenApiConnection);
     endif
     partition "Send_Compliance_Request_email_for_Apps" {
      :Apply_to_each_envt_App (Foreach);
       if (condition) then (yes)
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       endif
       repeat
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       repeat while (more items)
      :List_this_envt_apps (OpenApiConnection);
     }
   endif
   repeat
    :Send_Compliance_Request_email_for_Chatbots (Scope);
     if (condition) then (yes)
      :Apply_to_each_chatbot (Foreach);
       if (condition) then (yes)
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       endif
       repeat
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       repeat while (more items)
      :List_chatbots (OpenApiConnection);
     endif
     partition "Send_Compliance_Request_email_for_Chatbots" {
      :Apply_to_each_chatbot (Foreach);
       if (condition) then (yes)
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       endif
       repeat
        :Get_Assignee_for_Bots (If);
         if (condition) then (yes)
          :Set_variable_2 (SetVariable);
         endif
         else (no)
          :Recheck_Orphan_2 (Workflow);
          :See_if_now_orphaned_2 (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin_2 (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner_2 (SetVariable);
           endif
         endif
        :NumLaunchesWithNullCheck (Compose);
        :Condition_Audit_chatbots_that_are_highly_used_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :Check_if_any_of_the_requirements_are_not_yet_complete__bots (If);
           if (condition) then (yes)
            :Update_bot_Risk_Assessment_State_to_Requested (OpenApiConnection);
            :List_BPFs_for_this_Chatbot (OpenApiConnection);
            :If_BPF_not_already_started_for_this_chatbot_start_it (If);
             if (condition) then (yes)
              :Start_Chatbot_Approval_Business_Process_Flow (OpenApiConnection);
             endif
             else (no)
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_bot_as_submitted (If);
             if (condition) then (yes)
              :Update_bots_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
           endif
         endif
         else (no)
          :Noop_not_heavily_used (Compose);
         endif
       repeat while (more items)
      :List_chatbots (OpenApiConnection);
     }
    :Send_Compliance_Request_email_for_Apps (Scope);
     if (condition) then (yes)
      :Apply_to_each_envt_App (Foreach);
       if (condition) then (yes)
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       endif
       repeat
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       repeat while (more items)
      :List_this_envt_apps (OpenApiConnection);
     endif
     partition "Send_Compliance_Request_email_for_Apps" {
      :Apply_to_each_envt_App (Foreach);
       if (condition) then (yes)
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       endif
       repeat
        :Condition_Audit_apps_that_are_broadly_shared_or_admin_has_requested_audit (If);
         if (condition) then (yes)
          :If_still_or_ready_for_Requested_state (If);
           if (condition) then (yes)
            :List_BPFs_for_this_App (OpenApiConnection);
            :If_BPF_not_already_started_for_this_app_start_it (If);
             if (condition) then (yes)
              :Start_App_Audit_BPF (OpenApiConnection);
             endif
             else (no)
             endif
            :Update_requested_date_AND_state_or_just_state (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Requested_and_Requested_Date (OpenApiConnection);
             endif
             else (no)
              :Update_apps_Risk_Assessment_State_to_Requested (OpenApiConnection);
             endif
           endif
           else (no)
            :If_not_already_submitted_or_complete_mark_as_submitted (If);
             if (condition) then (yes)
              :Update_apps_Risk_Assessment_State_to_Submitted (OpenApiConnection);
             endif
             else (no)
             endif
            :If_not_recently_published_send_for_testing_and_republish (If);
             if (condition) then (yes)
              :Update_apps_Republish_State_to_Requested (OpenApiConnection);
              :emailGUID_to_enUS_2 (Compose);
              :List_emails_for_preferred_language_2 (OpenApiConnection);
              :Set_emailGUID_to_localized_row_2 (SetVariable);
              :Get_a_row_by_ID_2 (OpenApiConnection);
              :Send_Republish_Mail_to_Owner_Apps (Workflow);
              :Send_Republish_Mail_to_Admin_Apps (Workflow);
             endif
             else (no)
              :Update_apps_Republish_State_to_Complete (OpenApiConnection);
             endif
           endif
         endif
         else (no)
          :Noop_not_broadly_used_or_shared (Compose);
         endif
        :Get_Session_Count_last_30_days (Scope);
         if (condition) then (yes)
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         endif
         partition "Get_Session_Count_last_30_days" {
          :If_App_Launches_are_0_get_data_from_Audit_Log_table (If);
           if (condition) then (yes)
            :List_launches_for_this_app_last_30_days (OpenApiConnection);
            :Set_App_Launches_from_Audit_Log_table (SetVariable);
           endif
           else (no)
           endif
          :Set_App_Launches_from_PowerApps_table (SetVariable);
         }
        :Get_Assignee_apps (If);
         if (condition) then (yes)
          :Set_Assignee_to_Admin (SetVariable);
         endif
         else (no)
          :Run_a_Child_Flow (Workflow);
          :See_if_now_orphaned (If);
           if (condition) then (yes)
            :Set_variable_to_Approval_the_Admin (SetVariable);
           endif
           else (no)
            :Set_Assignee_to_app_Owner (SetVariable);
           endif
         endif
       repeat while (more items)
      :List_this_envt_apps (OpenApiConnection);
     }
   repeat while (more items)
 }
:Initialize_emailGUID (InitializeVariable);
:Initialize_AppSessionsLast30Days (InitializeVariable);
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

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Compliance â€“ Apps â€“ Number Launches Last 30 Days (admin_ComplianceAppsNumberLaunchesLast30Days) | Int | 30 | Compliance â€“ If the app was launched at least this many times in the last 30, ask for business justification. Default 30. |
| Compliance â€“ Apps - Number Users Shared (admin_ComplianceAppsNumberUsersShared) | Int | 20 | Compliance â€“ If the app is shared with this many or more users, ask for business justification. Default 20 |
| Compliance â€“ Apps â€“ Number Groups Shared (admin_ComplianceAppsNumberGroupsShared) | Int | 1 | Compliance â€“ If the app is shared with this many or more groups, ask for business justification. Default 1 |
| Compliance â€“ Chatbots â€“ Number Launches (admin_ComplianceChatbotsNumberLaunches) | Int | 50 | Compliance â€“ If the chatbot is launched this many or more times, ask for business justification. Default 50 |
| Compliance â€“ Apps â€“ Number Days Since Published (admin_ComplianceAppsNumberDaysSincePublished) | Int | 60 | Compliance â€“ If an app is broadly shared and was last published this many days ago or older, then they are asked to publish to stay compliant. Default 60 |
| Developer Compliance Center URL (admin_DeveloperComplianceCenterURL) | String | https://peddacattoolsdev.crm.dynamics.com/main.aspx?appid=c711a5f8-8c10-432f-af65-96d4ee63a306 | Compliance â€“ LEAVE EMPTY ON IMPORT.  URL to Developer Compliance Center Canvas App.  |
| ProductionEnvironment (admin_ProductionEnvironment) | Bool | - | Inventory - Yes by default. Set to No if you are creating a dev type envt. This will allow some flows to set target users to the admin instead of resource owners |
| Admin eMail (admin_AdminMail) | String | hannescoeadmins@powercattools.onmicrosoft.com | Inventory - CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |

## Triggers

### Recurrence
- **Type:** Recurrence
- **Recurrence:** Frequency: Week, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_varAssignee | InitializeVariable | Operation ID: be05b098-9f03-4b1b-b8c7-a25a00631dc3 |
| Initialize_NumberUsersShared | InitializeVariable | Operation ID: 33d288a8-ceaf-4eb5-9191-1ae4300a1804 |
| Initialize_NumberGroupsShared | InitializeVariable | Operation ID: 12ef889e-4143-4c8a-90ef-d187f9dc5706 |
| Initialize_NumberChatbotLaunches | InitializeVariable | Operation ID: 521c896e-c64e-431b-a990-a47b3d2f9f7f |
| Initialize_NumberDaysSincePublished | InitializeVariable | Operation ID: de1e511b-2c30-45d4-97ed-4a1ee3168be7 |
| Initialize_NumberLaunchesLast30Days | InitializeVariable | Operation ID: 08497d29-29f7-421f-b0c0-59501a16a08f |
| Compliance_due_to_heavy_usage | Scope | Operation ID: ab92ac8f-3523-4fcb-b6a3-2343afcb776c |
| Initialize_emailGUID | InitializeVariable | Operation ID: dad8eca6-7937-47c0-aa57-f2d48dd1c5a2 |
| Initialize_AppSessionsLast30Days | InitializeVariable | Operation ID: f83a2fe5-d043-42de-8d8b-249a42c25d13 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
