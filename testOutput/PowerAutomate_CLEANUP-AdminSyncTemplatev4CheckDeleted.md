# Power Automate Flow: CLEANUP-AdminSyncTemplatev4CheckDeleted

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A341B0E
**Source File:** CLEANUP-AdminSyncTemplatev4CheckDeleted-3FAAD19D-938F-EE11-8179-000D3A341B0E.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUP-AdminSyncTemplatev4CheckDeleted
- **Triggers:** 1
- **Actions:** 1 1 1 1 1
- **Connections:** 5
- **Parameters:** 3

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUP-AdminSyncTemplatev4CheckDeleted

start
:Trigger: Recurrence (Recurrence);\n:Initialize_DeleteFromCoE (InitializeVariable);
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
:Check_Deleted_Scope (Scope);
 if (condition) then (yes)
  :Get_Basics (Scope);
   if (condition) then (yes)
    :Get_Environments (OpenApiConnection);
    :CurrentEnvtInventory (OpenApiConnection);
   endif
   partition "Get_Basics" {
    :Get_Environments (OpenApiConnection);
    :CurrentEnvtInventory (OpenApiConnection);
   }
  :Deleted_Environments (Scope);
   if (condition) then (yes)
    :Mark_deleted (Foreach);
     if (condition) then (yes)
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
       else (no)
       endif
     endif
     repeat
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
       else (no)
       endif
     repeat while (more items)
    :DeletedEnvts (Query);
    :Get_Actual__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     endif
     partition "Get_Actual__Deleted_Envts" {
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     }
    :Get_Inventory__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     endif
     partition "Get_Inventory__Deleted_Envts" {
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     }
   endif
   partition "Deleted_Environments" {
    :Mark_deleted (Foreach);
     if (condition) then (yes)
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
       else (no)
       endif
     endif
     repeat
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
       else (no)
       endif
     repeat while (more items)
    :DeletedEnvts (Query);
    :Get_Actual__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     endif
     partition "Get_Actual__Deleted_Envts" {
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     }
    :Get_Inventory__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     endif
     partition "Get_Inventory__Deleted_Envts" {
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     }
   }
  :Clean_up_branch (Compose);
  :Remove_old_deleted_items_from_CoE_inventory (Scope);
   if (condition) then (yes)
    :Check_if_they_want_to_delete_from_CoE (If);
     if (condition) then (yes)
      :Delete_Each_Environment (Foreach);
       if (condition) then (yes)
        :Delete_Environment (OpenApiConnection);
       endif
       repeat
        :Delete_Environment (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Flow (Foreach);
       if (condition) then (yes)
        :Delete_Flow (OpenApiConnection);
       endif
       repeat
        :Delete_Flow (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Flow_Action (Foreach);
       if (condition) then (yes)
        :Delete_Flow_Action (OpenApiConnection);
       endif
       repeat
        :Delete_Flow_Action (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_PVA (Foreach);
       if (condition) then (yes)
        :Delete_PVA (OpenApiConnection);
       endif
       repeat
        :Delete_PVA (OpenApiConnection);
       repeat while (more items)
      :List_Envts_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Flow_Actions_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Flows_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_PVAs_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_BPFs_Marked_Deleted_To_Delete (OpenApiConnection);
      :Delete_Each_BPF (Foreach);
       if (condition) then (yes)
        :Delete_BPF (OpenApiConnection);
       endif
       repeat
        :Delete_BPF (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Solution (Foreach);
       if (condition) then (yes)
        :Delete_Solution (OpenApiConnection);
       endif
       repeat
        :Delete_Solution (OpenApiConnection);
       repeat while (more items)
      :List_Solutions_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Models_Marked_Deleted_To_Delete (OpenApiConnection);
      :Delete_Each_Model (Foreach);
       if (condition) then (yes)
        :Delete_Model (OpenApiConnection);
       endif
       repeat
        :Delete_Model (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_App (Foreach);
       if (condition) then (yes)
        :Delete_App (OpenApiConnection);
       endif
       repeat
        :Delete_App (OpenApiConnection);
       repeat while (more items)
      :List_Apps_Marked_Deleted_To_Delete (OpenApiConnection);
      :Get_old_deletes_time (Expression);
     endif
     else (no)
     endif
   endif
   partition "Remove_old_deleted_items_from_CoE_inventory" {
    :Check_if_they_want_to_delete_from_CoE (If);
     if (condition) then (yes)
      :Delete_Each_Environment (Foreach);
       if (condition) then (yes)
        :Delete_Environment (OpenApiConnection);
       endif
       repeat
        :Delete_Environment (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Flow (Foreach);
       if (condition) then (yes)
        :Delete_Flow (OpenApiConnection);
       endif
       repeat
        :Delete_Flow (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Flow_Action (Foreach);
       if (condition) then (yes)
        :Delete_Flow_Action (OpenApiConnection);
       endif
       repeat
        :Delete_Flow_Action (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_PVA (Foreach);
       if (condition) then (yes)
        :Delete_PVA (OpenApiConnection);
       endif
       repeat
        :Delete_PVA (OpenApiConnection);
       repeat while (more items)
      :List_Envts_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Flow_Actions_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Flows_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_PVAs_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_BPFs_Marked_Deleted_To_Delete (OpenApiConnection);
      :Delete_Each_BPF (Foreach);
       if (condition) then (yes)
        :Delete_BPF (OpenApiConnection);
       endif
       repeat
        :Delete_BPF (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Solution (Foreach);
       if (condition) then (yes)
        :Delete_Solution (OpenApiConnection);
       endif
       repeat
        :Delete_Solution (OpenApiConnection);
       repeat while (more items)
      :List_Solutions_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Models_Marked_Deleted_To_Delete (OpenApiConnection);
      :Delete_Each_Model (Foreach);
       if (condition) then (yes)
        :Delete_Model (OpenApiConnection);
       endif
       repeat
        :Delete_Model (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_App (Foreach);
       if (condition) then (yes)
        :Delete_App (OpenApiConnection);
       endif
       repeat
        :Delete_App (OpenApiConnection);
       repeat while (more items)
      :List_Apps_Marked_Deleted_To_Delete (OpenApiConnection);
      :Get_old_deletes_time (Expression);
     endif
     else (no)
     endif
   }
  :Environment_Marked_Deleted (Scope);
   if (condition) then (yes)
    :List_Solns_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Solns_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Soln_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Soln_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_BPFs_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_BPF_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_BPF_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Desktop_Flows_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Desktop_Flow_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Desktop_Flow_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Custom_Connection_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Custom_Connection_as_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Custom_Connection_as_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Bots_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Bot_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Bot_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_AiModels_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_AiModel_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_AiModel_Deleted (OpenApiConnection);
     repeat while (more items)
    :Mark_Flows_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Flow_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Flow_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Apps_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_App_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_App_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Apps_with_Environment_Marked_Deleted (OpenApiConnection);
   endif
   partition "Environment_Marked_Deleted" {
    :List_Solns_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Solns_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Soln_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Soln_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_BPFs_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_BPF_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_BPF_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Desktop_Flows_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Desktop_Flow_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Desktop_Flow_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Custom_Connection_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Custom_Connection_as_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Custom_Connection_as_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Bots_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Bot_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Bot_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_AiModels_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_AiModel_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_AiModel_Deleted (OpenApiConnection);
     repeat while (more items)
    :Mark_Flows_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Flow_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Flow_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Apps_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_App_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_App_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Apps_with_Environment_Marked_Deleted (OpenApiConnection);
   }
  :Deleted_Objects_in_Existing_Environments (Scope);
   if (condition) then (yes)
    :Apply_to_each_environment (Foreach);
     if (condition) then (yes)
      :Call_each_object_type_helper_for_this_environment (Compose);
      :Call_Custom_Connector_Helper__check_deleted (Workflow);
      :Call_Canvas_Helper__check_deleted (Workflow);
      :Call_Cloud_Flows_Helper__check_deleted (Workflow);
      :Call_MDA_Helper__check_deleted (Workflow);
      :Call_PVA_Helper__check_deleted (Workflow);
      :Call_BPF_Helper__check_deleted (Workflow);
      :Call_AiModel_Helper__check_deleted (Workflow);
      :Call_Soln_Helper__check_deleted (Workflow);
      :Call_RPA_Helper__check_deleted (Workflow);
      :Call_Portal_Helper__check_deleted (Workflow);
     endif
     repeat
      :Call_each_object_type_helper_for_this_environment (Compose);
      :Call_Custom_Connector_Helper__check_deleted (Workflow);
      :Call_Canvas_Helper__check_deleted (Workflow);
      :Call_Cloud_Flows_Helper__check_deleted (Workflow);
      :Call_MDA_Helper__check_deleted (Workflow);
      :Call_PVA_Helper__check_deleted (Workflow);
      :Call_BPF_Helper__check_deleted (Workflow);
      :Call_AiModel_Helper__check_deleted (Workflow);
      :Call_Soln_Helper__check_deleted (Workflow);
      :Call_RPA_Helper__check_deleted (Workflow);
      :Call_Portal_Helper__check_deleted (Workflow);
     repeat while (more items)
    :List_CoE_Environments_not_marked_deleted (OpenApiConnection);
   endif
   partition "Deleted_Objects_in_Existing_Environments" {
    :Apply_to_each_environment (Foreach);
     if (condition) then (yes)
      :Call_each_object_type_helper_for_this_environment (Compose);
      :Call_Custom_Connector_Helper__check_deleted (Workflow);
      :Call_Canvas_Helper__check_deleted (Workflow);
      :Call_Cloud_Flows_Helper__check_deleted (Workflow);
      :Call_MDA_Helper__check_deleted (Workflow);
      :Call_PVA_Helper__check_deleted (Workflow);
      :Call_BPF_Helper__check_deleted (Workflow);
      :Call_AiModel_Helper__check_deleted (Workflow);
      :Call_Soln_Helper__check_deleted (Workflow);
      :Call_RPA_Helper__check_deleted (Workflow);
      :Call_Portal_Helper__check_deleted (Workflow);
     endif
     repeat
      :Call_each_object_type_helper_for_this_environment (Compose);
      :Call_Custom_Connector_Helper__check_deleted (Workflow);
      :Call_Canvas_Helper__check_deleted (Workflow);
      :Call_Cloud_Flows_Helper__check_deleted (Workflow);
      :Call_MDA_Helper__check_deleted (Workflow);
      :Call_PVA_Helper__check_deleted (Workflow);
      :Call_BPF_Helper__check_deleted (Workflow);
      :Call_AiModel_Helper__check_deleted (Workflow);
      :Call_Soln_Helper__check_deleted (Workflow);
      :Call_RPA_Helper__check_deleted (Workflow);
      :Call_Portal_Helper__check_deleted (Workflow);
     repeat while (more items)
    :List_CoE_Environments_not_marked_deleted (OpenApiConnection);
   }
 endif
 partition "Check_Deleted_Scope" {
  :Get_Basics (Scope);
   if (condition) then (yes)
    :Get_Environments (OpenApiConnection);
    :CurrentEnvtInventory (OpenApiConnection);
   endif
   partition "Get_Basics" {
    :Get_Environments (OpenApiConnection);
    :CurrentEnvtInventory (OpenApiConnection);
   }
  :Deleted_Environments (Scope);
   if (condition) then (yes)
    :Mark_deleted (Foreach);
     if (condition) then (yes)
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
       else (no)
       endif
     endif
     repeat
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
       else (no)
       endif
     repeat while (more items)
    :DeletedEnvts (Query);
    :Get_Actual__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     endif
     partition "Get_Actual__Deleted_Envts" {
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     }
    :Get_Inventory__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     endif
     partition "Get_Inventory__Deleted_Envts" {
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     }
   endif
   partition "Deleted_Environments" {
    :Mark_deleted (Foreach);
     if (condition) then (yes)
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
       else (no)
       endif
     endif
     repeat
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
       else (no)
       endif
     repeat while (more items)
    :DeletedEnvts (Query);
    :Get_Actual__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     endif
     partition "Get_Actual__Deleted_Envts" {
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     }
    :Get_Inventory__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     endif
     partition "Get_Inventory__Deleted_Envts" {
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     }
   }
  :Clean_up_branch (Compose);
  :Remove_old_deleted_items_from_CoE_inventory (Scope);
   if (condition) then (yes)
    :Check_if_they_want_to_delete_from_CoE (If);
     if (condition) then (yes)
      :Delete_Each_Environment (Foreach);
       if (condition) then (yes)
        :Delete_Environment (OpenApiConnection);
       endif
       repeat
        :Delete_Environment (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Flow (Foreach);
       if (condition) then (yes)
        :Delete_Flow (OpenApiConnection);
       endif
       repeat
        :Delete_Flow (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Flow_Action (Foreach);
       if (condition) then (yes)
        :Delete_Flow_Action (OpenApiConnection);
       endif
       repeat
        :Delete_Flow_Action (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_PVA (Foreach);
       if (condition) then (yes)
        :Delete_PVA (OpenApiConnection);
       endif
       repeat
        :Delete_PVA (OpenApiConnection);
       repeat while (more items)
      :List_Envts_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Flow_Actions_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Flows_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_PVAs_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_BPFs_Marked_Deleted_To_Delete (OpenApiConnection);
      :Delete_Each_BPF (Foreach);
       if (condition) then (yes)
        :Delete_BPF (OpenApiConnection);
       endif
       repeat
        :Delete_BPF (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Solution (Foreach);
       if (condition) then (yes)
        :Delete_Solution (OpenApiConnection);
       endif
       repeat
        :Delete_Solution (OpenApiConnection);
       repeat while (more items)
      :List_Solutions_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Models_Marked_Deleted_To_Delete (OpenApiConnection);
      :Delete_Each_Model (Foreach);
       if (condition) then (yes)
        :Delete_Model (OpenApiConnection);
       endif
       repeat
        :Delete_Model (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_App (Foreach);
       if (condition) then (yes)
        :Delete_App (OpenApiConnection);
       endif
       repeat
        :Delete_App (OpenApiConnection);
       repeat while (more items)
      :List_Apps_Marked_Deleted_To_Delete (OpenApiConnection);
      :Get_old_deletes_time (Expression);
     endif
     else (no)
     endif
   endif
   partition "Remove_old_deleted_items_from_CoE_inventory" {
    :Check_if_they_want_to_delete_from_CoE (If);
     if (condition) then (yes)
      :Delete_Each_Environment (Foreach);
       if (condition) then (yes)
        :Delete_Environment (OpenApiConnection);
       endif
       repeat
        :Delete_Environment (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Flow (Foreach);
       if (condition) then (yes)
        :Delete_Flow (OpenApiConnection);
       endif
       repeat
        :Delete_Flow (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Flow_Action (Foreach);
       if (condition) then (yes)
        :Delete_Flow_Action (OpenApiConnection);
       endif
       repeat
        :Delete_Flow_Action (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_PVA (Foreach);
       if (condition) then (yes)
        :Delete_PVA (OpenApiConnection);
       endif
       repeat
        :Delete_PVA (OpenApiConnection);
       repeat while (more items)
      :List_Envts_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Flow_Actions_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Flows_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_PVAs_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_BPFs_Marked_Deleted_To_Delete (OpenApiConnection);
      :Delete_Each_BPF (Foreach);
       if (condition) then (yes)
        :Delete_BPF (OpenApiConnection);
       endif
       repeat
        :Delete_BPF (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_Solution (Foreach);
       if (condition) then (yes)
        :Delete_Solution (OpenApiConnection);
       endif
       repeat
        :Delete_Solution (OpenApiConnection);
       repeat while (more items)
      :List_Solutions_Marked_Deleted_To_Delete (OpenApiConnection);
      :List_Models_Marked_Deleted_To_Delete (OpenApiConnection);
      :Delete_Each_Model (Foreach);
       if (condition) then (yes)
        :Delete_Model (OpenApiConnection);
       endif
       repeat
        :Delete_Model (OpenApiConnection);
       repeat while (more items)
      :Delete_Each_App (Foreach);
       if (condition) then (yes)
        :Delete_App (OpenApiConnection);
       endif
       repeat
        :Delete_App (OpenApiConnection);
       repeat while (more items)
      :List_Apps_Marked_Deleted_To_Delete (OpenApiConnection);
      :Get_old_deletes_time (Expression);
     endif
     else (no)
     endif
   }
  :Environment_Marked_Deleted (Scope);
   if (condition) then (yes)
    :List_Solns_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Solns_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Soln_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Soln_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_BPFs_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_BPF_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_BPF_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Desktop_Flows_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Desktop_Flow_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Desktop_Flow_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Custom_Connection_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Custom_Connection_as_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Custom_Connection_as_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Bots_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Bot_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Bot_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_AiModels_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_AiModel_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_AiModel_Deleted (OpenApiConnection);
     repeat while (more items)
    :Mark_Flows_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Flow_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Flow_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Apps_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_App_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_App_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Apps_with_Environment_Marked_Deleted (OpenApiConnection);
   endif
   partition "Environment_Marked_Deleted" {
    :List_Solns_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Solns_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Soln_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Soln_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_BPFs_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_BPF_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_BPF_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Desktop_Flows_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Desktop_Flow_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Desktop_Flow_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Custom_Connection_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Custom_Connection_as_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Custom_Connection_as_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Bots_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Bot_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Bot_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_AiModels_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_AiModel_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_AiModel_Deleted (OpenApiConnection);
     repeat while (more items)
    :Mark_Flows_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_Flow_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_Flow_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_Environment_Marked_Deleted (OpenApiConnection);
    :Mark_Apps_Deleted (Foreach);
     if (condition) then (yes)
      :Mark_App_Deleted (OpenApiConnection);
     endif
     repeat
      :Mark_App_Deleted (OpenApiConnection);
     repeat while (more items)
    :List_Apps_with_Environment_Marked_Deleted (OpenApiConnection);
   }
  :Deleted_Objects_in_Existing_Environments (Scope);
   if (condition) then (yes)
    :Apply_to_each_environment (Foreach);
     if (condition) then (yes)
      :Call_each_object_type_helper_for_this_environment (Compose);
      :Call_Custom_Connector_Helper__check_deleted (Workflow);
      :Call_Canvas_Helper__check_deleted (Workflow);
      :Call_Cloud_Flows_Helper__check_deleted (Workflow);
      :Call_MDA_Helper__check_deleted (Workflow);
      :Call_PVA_Helper__check_deleted (Workflow);
      :Call_BPF_Helper__check_deleted (Workflow);
      :Call_AiModel_Helper__check_deleted (Workflow);
      :Call_Soln_Helper__check_deleted (Workflow);
      :Call_RPA_Helper__check_deleted (Workflow);
      :Call_Portal_Helper__check_deleted (Workflow);
     endif
     repeat
      :Call_each_object_type_helper_for_this_environment (Compose);
      :Call_Custom_Connector_Helper__check_deleted (Workflow);
      :Call_Canvas_Helper__check_deleted (Workflow);
      :Call_Cloud_Flows_Helper__check_deleted (Workflow);
      :Call_MDA_Helper__check_deleted (Workflow);
      :Call_PVA_Helper__check_deleted (Workflow);
      :Call_BPF_Helper__check_deleted (Workflow);
      :Call_AiModel_Helper__check_deleted (Workflow);
      :Call_Soln_Helper__check_deleted (Workflow);
      :Call_RPA_Helper__check_deleted (Workflow);
      :Call_Portal_Helper__check_deleted (Workflow);
     repeat while (more items)
    :List_CoE_Environments_not_marked_deleted (OpenApiConnection);
   endif
   partition "Deleted_Objects_in_Existing_Environments" {
    :Apply_to_each_environment (Foreach);
     if (condition) then (yes)
      :Call_each_object_type_helper_for_this_environment (Compose);
      :Call_Custom_Connector_Helper__check_deleted (Workflow);
      :Call_Canvas_Helper__check_deleted (Workflow);
      :Call_Cloud_Flows_Helper__check_deleted (Workflow);
      :Call_MDA_Helper__check_deleted (Workflow);
      :Call_PVA_Helper__check_deleted (Workflow);
      :Call_BPF_Helper__check_deleted (Workflow);
      :Call_AiModel_Helper__check_deleted (Workflow);
      :Call_Soln_Helper__check_deleted (Workflow);
      :Call_RPA_Helper__check_deleted (Workflow);
      :Call_Portal_Helper__check_deleted (Workflow);
     endif
     repeat
      :Call_each_object_type_helper_for_this_environment (Compose);
      :Call_Custom_Connector_Helper__check_deleted (Workflow);
      :Call_Canvas_Helper__check_deleted (Workflow);
      :Call_Cloud_Flows_Helper__check_deleted (Workflow);
      :Call_MDA_Helper__check_deleted (Workflow);
      :Call_PVA_Helper__check_deleted (Workflow);
      :Call_BPF_Helper__check_deleted (Workflow);
      :Call_AiModel_Helper__check_deleted (Workflow);
      :Call_Soln_Helper__check_deleted (Workflow);
      :Call_RPA_Helper__check_deleted (Workflow);
      :Call_Portal_Helper__check_deleted (Workflow);
     repeat while (more items)
    :List_CoE_Environments_not_marked_deleted (OpenApiConnection);
   }
 }
:Delay_Inventory (If);
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
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_powerplatformforadmins_1 | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdmins | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Also Delete From CoE (admin_DeleteFromCoE) | String | yes | Inventory - when we run "Admin | Sync Template v4 (Check Deleted)", delete the items from CoE (yes) or just mark deleted (no) |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| DelayInventory (admin_DelayInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse health. Only turn to No for debugging.  |

## Triggers

### Recurrence
- **Type:** Recurrence
- **Recurrence:** Frequency: Week, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_DeleteFromCoE | InitializeVariable | Operation ID: 86218be8-8f1e-486b-ac72-d181fd12591f |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Check_Deleted_Scope | Scope | Operation ID: 66327624-653f-426c-b35e-c3fb186a1482 |
| Delay_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
