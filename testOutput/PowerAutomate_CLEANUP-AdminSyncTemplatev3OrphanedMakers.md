# Power Automate Flow: CLEANUP-AdminSyncTemplatev3OrphanedMakers

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A1BB7BB
**Source File:** CLEANUP-AdminSyncTemplatev3OrphanedMakers-E05CFB27-740D-EB11-A814-000D3A1BB7BB.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUP-AdminSyncTemplatev3OrphanedMakers
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1 1
- **Connections:** 5
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUP-AdminSyncTemplatev3OrphanedMakers

start
:Trigger: manual (Request);\n:Initialize_Flow_Environment_variable (InitializeVariable);
:Find_No_Longer_Orphaned (Scope);
 if (condition) then (yes)
  :List_bots_no_longer_orphaned (OpenApiConnection);
  :List_ui_flows_no_longer_orphaned (OpenApiConnection);
  :List_custom_connectors_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_bot (Foreach);
   if (condition) then (yes)
    :If_bot_owner_not_null (If);
     if (condition) then (yes)
      :Mark_bot_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_bot_owner_not_null (If);
     if (condition) then (yes)
      :Mark_bot_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :Apply_to_each_not_orphaned_ui_flow (Foreach);
   if (condition) then (yes)
    :If_ui_flow_owner_not_null (If);
     if (condition) then (yes)
      :Mark_ui_flow_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_ui_flow_owner_not_null (If);
     if (condition) then (yes)
      :Mark_ui_flow_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :Apply_to_each_not_orphaned_custom_connector (Foreach);
   if (condition) then (yes)
    :If_custom_connector_owner_not_null (If);
     if (condition) then (yes)
      :Mark_custom_connector_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_custom_connector_owner_not_null (If);
     if (condition) then (yes)
      :Mark_custom_connector_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_BPFs_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_BPF (Foreach);
   if (condition) then (yes)
    :If_BPF_owner_not_null (If);
     if (condition) then (yes)
      :Mark_BPF_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_BPF_owner_not_null (If);
     if (condition) then (yes)
      :Mark_BPF_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_AI_Models_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_AIModel (Foreach);
   if (condition) then (yes)
    :If_AI_Model_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Ai_Model_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_AI_Model_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Ai_Model_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_Pages_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_Pages (Foreach);
   if (condition) then (yes)
    :If_Page_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Page_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_Page_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Page_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_Solutions_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_Solution (Foreach);
   if (condition) then (yes)
    :If_Solution_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Solution_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_Solution_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Solution_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :Apply_to_each_not_orphaned_envt (Foreach);
   if (condition) then (yes)
    :If_envt_owner_not_null (If);
     if (condition) then (yes)
      :Mark_envt_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_envt_owner_not_null (If);
     if (condition) then (yes)
      :Mark_envt_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_envts_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_flow (Foreach);
   if (condition) then (yes)
    :If_flow_owner_not_null (If);
     if (condition) then (yes)
      :Mark_flow_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_flow_owner_not_null (If);
     if (condition) then (yes)
      :Mark_flow_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_flows_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_app (Foreach);
   if (condition) then (yes)
    :If_app_owner_not_null (If);
     if (condition) then (yes)
      :Mark_app_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_app_owner_not_null (If);
     if (condition) then (yes)
      :Mark_app_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_apps_no_longer_orphaned (OpenApiConnection);
 endif
 partition "Find_No_Longer_Orphaned" {
  :List_bots_no_longer_orphaned (OpenApiConnection);
  :List_ui_flows_no_longer_orphaned (OpenApiConnection);
  :List_custom_connectors_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_bot (Foreach);
   if (condition) then (yes)
    :If_bot_owner_not_null (If);
     if (condition) then (yes)
      :Mark_bot_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_bot_owner_not_null (If);
     if (condition) then (yes)
      :Mark_bot_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :Apply_to_each_not_orphaned_ui_flow (Foreach);
   if (condition) then (yes)
    :If_ui_flow_owner_not_null (If);
     if (condition) then (yes)
      :Mark_ui_flow_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_ui_flow_owner_not_null (If);
     if (condition) then (yes)
      :Mark_ui_flow_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :Apply_to_each_not_orphaned_custom_connector (Foreach);
   if (condition) then (yes)
    :If_custom_connector_owner_not_null (If);
     if (condition) then (yes)
      :Mark_custom_connector_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_custom_connector_owner_not_null (If);
     if (condition) then (yes)
      :Mark_custom_connector_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_BPFs_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_BPF (Foreach);
   if (condition) then (yes)
    :If_BPF_owner_not_null (If);
     if (condition) then (yes)
      :Mark_BPF_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_BPF_owner_not_null (If);
     if (condition) then (yes)
      :Mark_BPF_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_AI_Models_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_AIModel (Foreach);
   if (condition) then (yes)
    :If_AI_Model_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Ai_Model_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_AI_Model_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Ai_Model_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_Pages_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_Pages (Foreach);
   if (condition) then (yes)
    :If_Page_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Page_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_Page_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Page_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_Solutions_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_Solution (Foreach);
   if (condition) then (yes)
    :If_Solution_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Solution_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_Solution_owner_not_null (If);
     if (condition) then (yes)
      :Mark_Solution_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :Apply_to_each_not_orphaned_envt (Foreach);
   if (condition) then (yes)
    :If_envt_owner_not_null (If);
     if (condition) then (yes)
      :Mark_envt_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_envt_owner_not_null (If);
     if (condition) then (yes)
      :Mark_envt_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_envts_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_flow (Foreach);
   if (condition) then (yes)
    :If_flow_owner_not_null (If);
     if (condition) then (yes)
      :Mark_flow_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_flow_owner_not_null (If);
     if (condition) then (yes)
      :Mark_flow_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_flows_no_longer_orphaned (OpenApiConnection);
  :Apply_to_each_not_orphaned_app (Foreach);
   if (condition) then (yes)
    :If_app_owner_not_null (If);
     if (condition) then (yes)
      :Mark_app_not_orphaned (OpenApiConnection);
     endif
   endif
   repeat
    :If_app_owner_not_null (If);
     if (condition) then (yes)
      :Mark_app_not_orphaned (OpenApiConnection);
     endif
   repeat while (more items)
  :List_apps_no_longer_orphaned (OpenApiConnection);
 }
:Find_New_Orphans_and_Update_Existing_Makers (Scope);
 if (condition) then (yes)
  :List_Makers (OpenApiConnection);
  :Apply_to_each_maker (Foreach);
   if (condition) then (yes)
    :See_if_now_orphaned (If);
     if (condition) then (yes)
      :Mark_all_objects_as_orphaned (Scope);
       if (condition) then (yes)
        :Update_Maker_record_mark_as_orphaned (OpenApiConnection);
        :Apply_to_each_connector (Foreach);
         if (condition) then (yes)
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_custom_connectors_of_maker (OpenApiConnection);
        :Apply_to_each_UI_Flow (Foreach);
         if (condition) then (yes)
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_UI_Flows_of_maker (OpenApiConnection);
        :Apply_to_each_bot (Foreach);
         if (condition) then (yes)
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_bots_of_maker (OpenApiConnection);
        :List_BPFs_of_maker (OpenApiConnection);
        :Apply_to_each_BPF (Foreach);
         if (condition) then (yes)
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_AIModels_of_maker (OpenApiConnection);
        :Apply_to_each_AI_Model (Foreach);
         if (condition) then (yes)
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Pages_of_maker (OpenApiConnection);
        :Apply_to_each_Page (Foreach);
         if (condition) then (yes)
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Solution_of_maker (OpenApiConnection);
        :Apply_to_each_Solution (Foreach);
         if (condition) then (yes)
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :Apply_to_each_environment (Foreach);
         if (condition) then (yes)
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_environments_of_maker (OpenApiConnection);
        :Apply_to_each_flow (Foreach);
         if (condition) then (yes)
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_flows_of_maker (OpenApiConnection);
        :Apply_to_each_app (Foreach);
         if (condition) then (yes)
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_apps_of_maker (OpenApiConnection);
       endif
       partition "Mark_all_objects_as_orphaned" {
        :Update_Maker_record_mark_as_orphaned (OpenApiConnection);
        :Apply_to_each_connector (Foreach);
         if (condition) then (yes)
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_custom_connectors_of_maker (OpenApiConnection);
        :Apply_to_each_UI_Flow (Foreach);
         if (condition) then (yes)
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_UI_Flows_of_maker (OpenApiConnection);
        :Apply_to_each_bot (Foreach);
         if (condition) then (yes)
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_bots_of_maker (OpenApiConnection);
        :List_BPFs_of_maker (OpenApiConnection);
        :Apply_to_each_BPF (Foreach);
         if (condition) then (yes)
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_AIModels_of_maker (OpenApiConnection);
        :Apply_to_each_AI_Model (Foreach);
         if (condition) then (yes)
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Pages_of_maker (OpenApiConnection);
        :Apply_to_each_Page (Foreach);
         if (condition) then (yes)
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Solution_of_maker (OpenApiConnection);
        :Apply_to_each_Solution (Foreach);
         if (condition) then (yes)
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :Apply_to_each_environment (Foreach);
         if (condition) then (yes)
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_environments_of_maker (OpenApiConnection);
        :Apply_to_each_flow (Foreach);
         if (condition) then (yes)
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_flows_of_maker (OpenApiConnection);
        :Apply_to_each_app (Foreach);
         if (condition) then (yes)
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_apps_of_maker (OpenApiConnection);
       }
      :Date_marked_orphan (Scope);
       if (condition) then (yes)
        :If_date_marked_orphan_is_null_then_update_it (If);
         if (condition) then (yes)
          :Update_date_marked_orphan_to_today (OpenApiConnection);
         endif
       endif
       partition "Date_marked_orphan" {
        :If_date_marked_orphan_is_null_then_update_it (If);
         if (condition) then (yes)
          :Update_date_marked_orphan_to_today (OpenApiConnection);
         endif
       }
     endif
     else (no)
      :update_photo (Scope);
       if (condition) then (yes)
        :Get_user_photo_V2 (OpenApiConnection);
        :update_if_not_null (If);
         if (condition) then (yes)
          :Upload_a_file_or_an_image (OpenApiConnection);
          :Catch__cant_update_maker_photo (Compose);
         endif
        :catch__not_allowed_to_query_photo (Compose);
       endif
       partition "update_photo" {
        :Get_user_photo_V2 (OpenApiConnection);
        :update_if_not_null (If);
         if (condition) then (yes)
          :Upload_a_file_or_an_image (OpenApiConnection);
          :Catch__cant_update_maker_photo (Compose);
         endif
        :catch__not_allowed_to_query_photo (Compose);
       }
      :update_managers (Scope);
       if (condition) then (yes)
        :get_M1_info_if_not_null (If);
         if (condition) then (yes)
          :update_M1_and_get_M2_info_if_not_null (If);
           if (condition) then (yes)
            :Update_Maker_Manager_M1 (OpenApiConnection);
            :Get_M2_manager (OpenApiConnection);
            :catch_no_M2 (Compose);
            :update_M2_info_if_not_null (If);
             if (condition) then (yes)
              :Update_Maker_Manager_M2 (OpenApiConnection);
             endif
           endif
          :Get_M1_manager (OpenApiConnection);
          :catch_no_M1 (Compose);
         endif
       endif
       partition "update_managers" {
        :get_M1_info_if_not_null (If);
         if (condition) then (yes)
          :update_M1_and_get_M2_info_if_not_null (If);
           if (condition) then (yes)
            :Update_Maker_Manager_M1 (OpenApiConnection);
            :Get_M2_manager (OpenApiConnection);
            :catch_no_M2 (Compose);
            :update_M2_info_if_not_null (If);
             if (condition) then (yes)
              :Update_Maker_Manager_M2 (OpenApiConnection);
             endif
           endif
          :Get_M1_manager (OpenApiConnection);
          :catch_no_M1 (Compose);
         endif
       }
     endif
    :Get_Maker (Workflow);
   endif
   repeat
    :See_if_now_orphaned (If);
     if (condition) then (yes)
      :Mark_all_objects_as_orphaned (Scope);
       if (condition) then (yes)
        :Update_Maker_record_mark_as_orphaned (OpenApiConnection);
        :Apply_to_each_connector (Foreach);
         if (condition) then (yes)
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_custom_connectors_of_maker (OpenApiConnection);
        :Apply_to_each_UI_Flow (Foreach);
         if (condition) then (yes)
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_UI_Flows_of_maker (OpenApiConnection);
        :Apply_to_each_bot (Foreach);
         if (condition) then (yes)
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_bots_of_maker (OpenApiConnection);
        :List_BPFs_of_maker (OpenApiConnection);
        :Apply_to_each_BPF (Foreach);
         if (condition) then (yes)
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_AIModels_of_maker (OpenApiConnection);
        :Apply_to_each_AI_Model (Foreach);
         if (condition) then (yes)
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Pages_of_maker (OpenApiConnection);
        :Apply_to_each_Page (Foreach);
         if (condition) then (yes)
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Solution_of_maker (OpenApiConnection);
        :Apply_to_each_Solution (Foreach);
         if (condition) then (yes)
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :Apply_to_each_environment (Foreach);
         if (condition) then (yes)
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_environments_of_maker (OpenApiConnection);
        :Apply_to_each_flow (Foreach);
         if (condition) then (yes)
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_flows_of_maker (OpenApiConnection);
        :Apply_to_each_app (Foreach);
         if (condition) then (yes)
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_apps_of_maker (OpenApiConnection);
       endif
       partition "Mark_all_objects_as_orphaned" {
        :Update_Maker_record_mark_as_orphaned (OpenApiConnection);
        :Apply_to_each_connector (Foreach);
         if (condition) then (yes)
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_custom_connectors_of_maker (OpenApiConnection);
        :Apply_to_each_UI_Flow (Foreach);
         if (condition) then (yes)
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_UI_Flows_of_maker (OpenApiConnection);
        :Apply_to_each_bot (Foreach);
         if (condition) then (yes)
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_bots_of_maker (OpenApiConnection);
        :List_BPFs_of_maker (OpenApiConnection);
        :Apply_to_each_BPF (Foreach);
         if (condition) then (yes)
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_AIModels_of_maker (OpenApiConnection);
        :Apply_to_each_AI_Model (Foreach);
         if (condition) then (yes)
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Pages_of_maker (OpenApiConnection);
        :Apply_to_each_Page (Foreach);
         if (condition) then (yes)
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Solution_of_maker (OpenApiConnection);
        :Apply_to_each_Solution (Foreach);
         if (condition) then (yes)
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :Apply_to_each_environment (Foreach);
         if (condition) then (yes)
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_environments_of_maker (OpenApiConnection);
        :Apply_to_each_flow (Foreach);
         if (condition) then (yes)
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_flows_of_maker (OpenApiConnection);
        :Apply_to_each_app (Foreach);
         if (condition) then (yes)
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_apps_of_maker (OpenApiConnection);
       }
      :Date_marked_orphan (Scope);
       if (condition) then (yes)
        :If_date_marked_orphan_is_null_then_update_it (If);
         if (condition) then (yes)
          :Update_date_marked_orphan_to_today (OpenApiConnection);
         endif
       endif
       partition "Date_marked_orphan" {
        :If_date_marked_orphan_is_null_then_update_it (If);
         if (condition) then (yes)
          :Update_date_marked_orphan_to_today (OpenApiConnection);
         endif
       }
     endif
     else (no)
      :update_photo (Scope);
       if (condition) then (yes)
        :Get_user_photo_V2 (OpenApiConnection);
        :update_if_not_null (If);
         if (condition) then (yes)
          :Upload_a_file_or_an_image (OpenApiConnection);
          :Catch__cant_update_maker_photo (Compose);
         endif
        :catch__not_allowed_to_query_photo (Compose);
       endif
       partition "update_photo" {
        :Get_user_photo_V2 (OpenApiConnection);
        :update_if_not_null (If);
         if (condition) then (yes)
          :Upload_a_file_or_an_image (OpenApiConnection);
          :Catch__cant_update_maker_photo (Compose);
         endif
        :catch__not_allowed_to_query_photo (Compose);
       }
      :update_managers (Scope);
       if (condition) then (yes)
        :get_M1_info_if_not_null (If);
         if (condition) then (yes)
          :update_M1_and_get_M2_info_if_not_null (If);
           if (condition) then (yes)
            :Update_Maker_Manager_M1 (OpenApiConnection);
            :Get_M2_manager (OpenApiConnection);
            :catch_no_M2 (Compose);
            :update_M2_info_if_not_null (If);
             if (condition) then (yes)
              :Update_Maker_Manager_M2 (OpenApiConnection);
             endif
           endif
          :Get_M1_manager (OpenApiConnection);
          :catch_no_M1 (Compose);
         endif
       endif
       partition "update_managers" {
        :get_M1_info_if_not_null (If);
         if (condition) then (yes)
          :update_M1_and_get_M2_info_if_not_null (If);
           if (condition) then (yes)
            :Update_Maker_Manager_M1 (OpenApiConnection);
            :Get_M2_manager (OpenApiConnection);
            :catch_no_M2 (Compose);
            :update_M2_info_if_not_null (If);
             if (condition) then (yes)
              :Update_Maker_Manager_M2 (OpenApiConnection);
             endif
           endif
          :Get_M1_manager (OpenApiConnection);
          :catch_no_M1 (Compose);
         endif
       }
     endif
    :Get_Maker (Workflow);
   repeat while (more items)
 endif
 partition "Find_New_Orphans_and_Update_Existing_Makers" {
  :List_Makers (OpenApiConnection);
  :Apply_to_each_maker (Foreach);
   if (condition) then (yes)
    :See_if_now_orphaned (If);
     if (condition) then (yes)
      :Mark_all_objects_as_orphaned (Scope);
       if (condition) then (yes)
        :Update_Maker_record_mark_as_orphaned (OpenApiConnection);
        :Apply_to_each_connector (Foreach);
         if (condition) then (yes)
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_custom_connectors_of_maker (OpenApiConnection);
        :Apply_to_each_UI_Flow (Foreach);
         if (condition) then (yes)
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_UI_Flows_of_maker (OpenApiConnection);
        :Apply_to_each_bot (Foreach);
         if (condition) then (yes)
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_bots_of_maker (OpenApiConnection);
        :List_BPFs_of_maker (OpenApiConnection);
        :Apply_to_each_BPF (Foreach);
         if (condition) then (yes)
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_AIModels_of_maker (OpenApiConnection);
        :Apply_to_each_AI_Model (Foreach);
         if (condition) then (yes)
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Pages_of_maker (OpenApiConnection);
        :Apply_to_each_Page (Foreach);
         if (condition) then (yes)
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Solution_of_maker (OpenApiConnection);
        :Apply_to_each_Solution (Foreach);
         if (condition) then (yes)
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :Apply_to_each_environment (Foreach);
         if (condition) then (yes)
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_environments_of_maker (OpenApiConnection);
        :Apply_to_each_flow (Foreach);
         if (condition) then (yes)
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_flows_of_maker (OpenApiConnection);
        :Apply_to_each_app (Foreach);
         if (condition) then (yes)
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_apps_of_maker (OpenApiConnection);
       endif
       partition "Mark_all_objects_as_orphaned" {
        :Update_Maker_record_mark_as_orphaned (OpenApiConnection);
        :Apply_to_each_connector (Foreach);
         if (condition) then (yes)
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_custom_connectors_of_maker (OpenApiConnection);
        :Apply_to_each_UI_Flow (Foreach);
         if (condition) then (yes)
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_UI_Flows_of_maker (OpenApiConnection);
        :Apply_to_each_bot (Foreach);
         if (condition) then (yes)
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_bots_of_maker (OpenApiConnection);
        :List_BPFs_of_maker (OpenApiConnection);
        :Apply_to_each_BPF (Foreach);
         if (condition) then (yes)
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_AIModels_of_maker (OpenApiConnection);
        :Apply_to_each_AI_Model (Foreach);
         if (condition) then (yes)
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Pages_of_maker (OpenApiConnection);
        :Apply_to_each_Page (Foreach);
         if (condition) then (yes)
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Solution_of_maker (OpenApiConnection);
        :Apply_to_each_Solution (Foreach);
         if (condition) then (yes)
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :Apply_to_each_environment (Foreach);
         if (condition) then (yes)
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_environments_of_maker (OpenApiConnection);
        :Apply_to_each_flow (Foreach);
         if (condition) then (yes)
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_flows_of_maker (OpenApiConnection);
        :Apply_to_each_app (Foreach);
         if (condition) then (yes)
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_apps_of_maker (OpenApiConnection);
       }
      :Date_marked_orphan (Scope);
       if (condition) then (yes)
        :If_date_marked_orphan_is_null_then_update_it (If);
         if (condition) then (yes)
          :Update_date_marked_orphan_to_today (OpenApiConnection);
         endif
       endif
       partition "Date_marked_orphan" {
        :If_date_marked_orphan_is_null_then_update_it (If);
         if (condition) then (yes)
          :Update_date_marked_orphan_to_today (OpenApiConnection);
         endif
       }
     endif
     else (no)
      :update_photo (Scope);
       if (condition) then (yes)
        :Get_user_photo_V2 (OpenApiConnection);
        :update_if_not_null (If);
         if (condition) then (yes)
          :Upload_a_file_or_an_image (OpenApiConnection);
          :Catch__cant_update_maker_photo (Compose);
         endif
        :catch__not_allowed_to_query_photo (Compose);
       endif
       partition "update_photo" {
        :Get_user_photo_V2 (OpenApiConnection);
        :update_if_not_null (If);
         if (condition) then (yes)
          :Upload_a_file_or_an_image (OpenApiConnection);
          :Catch__cant_update_maker_photo (Compose);
         endif
        :catch__not_allowed_to_query_photo (Compose);
       }
      :update_managers (Scope);
       if (condition) then (yes)
        :get_M1_info_if_not_null (If);
         if (condition) then (yes)
          :update_M1_and_get_M2_info_if_not_null (If);
           if (condition) then (yes)
            :Update_Maker_Manager_M1 (OpenApiConnection);
            :Get_M2_manager (OpenApiConnection);
            :catch_no_M2 (Compose);
            :update_M2_info_if_not_null (If);
             if (condition) then (yes)
              :Update_Maker_Manager_M2 (OpenApiConnection);
             endif
           endif
          :Get_M1_manager (OpenApiConnection);
          :catch_no_M1 (Compose);
         endif
       endif
       partition "update_managers" {
        :get_M1_info_if_not_null (If);
         if (condition) then (yes)
          :update_M1_and_get_M2_info_if_not_null (If);
           if (condition) then (yes)
            :Update_Maker_Manager_M1 (OpenApiConnection);
            :Get_M2_manager (OpenApiConnection);
            :catch_no_M2 (Compose);
            :update_M2_info_if_not_null (If);
             if (condition) then (yes)
              :Update_Maker_Manager_M2 (OpenApiConnection);
             endif
           endif
          :Get_M1_manager (OpenApiConnection);
          :catch_no_M1 (Compose);
         endif
       }
     endif
    :Get_Maker (Workflow);
   endif
   repeat
    :See_if_now_orphaned (If);
     if (condition) then (yes)
      :Mark_all_objects_as_orphaned (Scope);
       if (condition) then (yes)
        :Update_Maker_record_mark_as_orphaned (OpenApiConnection);
        :Apply_to_each_connector (Foreach);
         if (condition) then (yes)
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_custom_connectors_of_maker (OpenApiConnection);
        :Apply_to_each_UI_Flow (Foreach);
         if (condition) then (yes)
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_UI_Flows_of_maker (OpenApiConnection);
        :Apply_to_each_bot (Foreach);
         if (condition) then (yes)
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_bots_of_maker (OpenApiConnection);
        :List_BPFs_of_maker (OpenApiConnection);
        :Apply_to_each_BPF (Foreach);
         if (condition) then (yes)
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_AIModels_of_maker (OpenApiConnection);
        :Apply_to_each_AI_Model (Foreach);
         if (condition) then (yes)
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Pages_of_maker (OpenApiConnection);
        :Apply_to_each_Page (Foreach);
         if (condition) then (yes)
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Solution_of_maker (OpenApiConnection);
        :Apply_to_each_Solution (Foreach);
         if (condition) then (yes)
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :Apply_to_each_environment (Foreach);
         if (condition) then (yes)
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_environments_of_maker (OpenApiConnection);
        :Apply_to_each_flow (Foreach);
         if (condition) then (yes)
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_flows_of_maker (OpenApiConnection);
        :Apply_to_each_app (Foreach);
         if (condition) then (yes)
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_apps_of_maker (OpenApiConnection);
       endif
       partition "Mark_all_objects_as_orphaned" {
        :Update_Maker_record_mark_as_orphaned (OpenApiConnection);
        :Apply_to_each_connector (Foreach);
         if (condition) then (yes)
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Custom_Connector_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_custom_connectors_of_maker (OpenApiConnection);
        :Apply_to_each_UI_Flow (Foreach);
         if (condition) then (yes)
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_UI_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_UI_Flows_of_maker (OpenApiConnection);
        :Apply_to_each_bot (Foreach);
         if (condition) then (yes)
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_bot_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_bots_of_maker (OpenApiConnection);
        :List_BPFs_of_maker (OpenApiConnection);
        :Apply_to_each_BPF (Foreach);
         if (condition) then (yes)
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_BPF_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_AIModels_of_maker (OpenApiConnection);
        :Apply_to_each_AI_Model (Foreach);
         if (condition) then (yes)
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_AI_Model_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Pages_of_maker (OpenApiConnection);
        :Apply_to_each_Page (Foreach);
         if (condition) then (yes)
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Page_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_Solution_of_maker (OpenApiConnection);
        :Apply_to_each_Solution (Foreach);
         if (condition) then (yes)
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Solution_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :Apply_to_each_environment (Foreach);
         if (condition) then (yes)
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Environment_Mark_as_Orphaned (OpenApiConnection);
         repeat while (more items)
        :List_environments_of_maker (OpenApiConnection);
        :Apply_to_each_flow (Foreach);
         if (condition) then (yes)
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_Flow_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_flows_of_maker (OpenApiConnection);
        :Apply_to_each_app (Foreach);
         if (condition) then (yes)
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         endif
         repeat
          :Update_App_Mark_as_orphaned (OpenApiConnection);
         repeat while (more items)
        :List_apps_of_maker (OpenApiConnection);
       }
      :Date_marked_orphan (Scope);
       if (condition) then (yes)
        :If_date_marked_orphan_is_null_then_update_it (If);
         if (condition) then (yes)
          :Update_date_marked_orphan_to_today (OpenApiConnection);
         endif
       endif
       partition "Date_marked_orphan" {
        :If_date_marked_orphan_is_null_then_update_it (If);
         if (condition) then (yes)
          :Update_date_marked_orphan_to_today (OpenApiConnection);
         endif
       }
     endif
     else (no)
      :update_photo (Scope);
       if (condition) then (yes)
        :Get_user_photo_V2 (OpenApiConnection);
        :update_if_not_null (If);
         if (condition) then (yes)
          :Upload_a_file_or_an_image (OpenApiConnection);
          :Catch__cant_update_maker_photo (Compose);
         endif
        :catch__not_allowed_to_query_photo (Compose);
       endif
       partition "update_photo" {
        :Get_user_photo_V2 (OpenApiConnection);
        :update_if_not_null (If);
         if (condition) then (yes)
          :Upload_a_file_or_an_image (OpenApiConnection);
          :Catch__cant_update_maker_photo (Compose);
         endif
        :catch__not_allowed_to_query_photo (Compose);
       }
      :update_managers (Scope);
       if (condition) then (yes)
        :get_M1_info_if_not_null (If);
         if (condition) then (yes)
          :update_M1_and_get_M2_info_if_not_null (If);
           if (condition) then (yes)
            :Update_Maker_Manager_M1 (OpenApiConnection);
            :Get_M2_manager (OpenApiConnection);
            :catch_no_M2 (Compose);
            :update_M2_info_if_not_null (If);
             if (condition) then (yes)
              :Update_Maker_Manager_M2 (OpenApiConnection);
             endif
           endif
          :Get_M1_manager (OpenApiConnection);
          :catch_no_M1 (Compose);
         endif
       endif
       partition "update_managers" {
        :get_M1_info_if_not_null (If);
         if (condition) then (yes)
          :update_M1_and_get_M2_info_if_not_null (If);
           if (condition) then (yes)
            :Update_Maker_Manager_M1 (OpenApiConnection);
            :Get_M2_manager (OpenApiConnection);
            :catch_no_M2 (Compose);
            :update_M2_info_if_not_null (If);
             if (condition) then (yes)
              :Update_Maker_Manager_M2 (OpenApiConnection);
             endif
           endif
          :Get_M1_manager (OpenApiConnection);
          :catch_no_M1 (Compose);
         endif
       }
     endif
    :Get_Maker (Workflow);
   repeat while (more items)
 }
:Initialize_FailureOccurred (InitializeVariable);
:Set_FailureOccurred_true__new_orphans (SetVariable);
:Set_FailureOccurred_true__old_orphan_checks (SetVariable);
:Respond_to_a_PowerApp_or_flow (Response);
:SYSTEM_Maker_Update (Scope);
 if (condition) then (yes)
  :Update_SYSTEM_as_Maker (OpenApiConnection);
  :Update_SYSTEM_as_User (OpenApiConnection);
 endif
 partition "SYSTEM_Maker_Update" {
  :Update_SYSTEM_as_Maker (OpenApiConnection);
  :Update_SYSTEM_as_User (OpenApiConnection);
 }
:Orphan_Makers__Error_Handling (Scope);
 if (condition) then (yes)
  :if_failure_occurred (If);
   if (condition) then (yes)
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
   endif
   else (no)
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
   endif
 endif
 partition "Orphan_Makers__Error_Handling" {
  :if_failure_occurred (If);
   if (condition) then (yes)
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
   endif
   else (no)
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
   endif
 }
:Set_FailureOccurred_true__SYSTEM_maker (SetVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_office365users_1 | shared_office365users | admin_CoECoreO365Users | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| CoE System User ID (admin_CoESystemUserID) | String | f039b642-ad47-ee11-be6d-000d3a3411d9 | in the maker table we store a user for system with an id. Storing here so that it can be referenced without having to look it up all the time. |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_Flow_Environment_variable | InitializeVariable | Operation ID: 1317eec2-490e-44ed-8782-626f3e887243 |
| Find_No_Longer_Orphaned | Scope | Operation ID: e0f32238-060b-4ca6-a31f-42b7fb8f23ad |
| Find_New_Orphans_and_Update_Existing_Makers | Scope | Operation ID: bf74b53e-e858-49de-b356-2a9b6893ec79 |
| Initialize_FailureOccurred | InitializeVariable | Operation ID: 53dff7d9-317d-4a5a-b8e1-545a24aa4be5 |
| Set_FailureOccurred_true_-_new_orphans | SetVariable | Operation ID: d6963e02-ece9-45d2-9548-d64f5b142682 |
| Set_FailureOccurred_true_-_old_orphan_checks | SetVariable | Operation ID: d2e512fc-f510-415d-87b9-98fa7fc432d1 |
| Respond_to_a_PowerApp_or_flow | Response | Operation ID: 49fabba9-b34f-4351-8533-c51ad226917b |
| SYSTEM_Maker_Update | Scope | Operation ID: b69a6436-508a-430a-8983-458d74a67e8c |
| Orphan_Makers_-_Error_Handling | Scope | Operation ID: e0179844-f2ce-403f-80ca-1e51f39beee5 |
| Set_FailureOccurred_true_-_SYSTEM_maker | SetVariable | Operation ID: d6963e02-ece9-45d2-9548-d64f5b142682 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
