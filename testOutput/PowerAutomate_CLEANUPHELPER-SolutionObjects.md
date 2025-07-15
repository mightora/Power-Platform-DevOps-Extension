# Power Automate Flow: CLEANUPHELPER-SolutionObjects

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A3411D9
**Source File:** CLEANUPHELPER-SolutionObjects-8A51E503-8EB5-EE11-A569-000D3A3411D9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUPHELPER-SolutionObjects
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 2
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUPHELPER-SolutionObjects

start
:Trigger: manual (Request);\n:Error_Handling (Scope);
 if (condition) then (yes)
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__fail (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :EnvtDisplayName (Compose);
 endif
 partition "Error_Handling" {
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow__fail (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :EnvtDisplayName (Compose);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow__pass (Response);
  :Get_ID_Pass (OpenApiConnection);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow__pass (Response);
  :Get_ID_Pass (OpenApiConnection);
 }
:Inventory_Solution_Object_Relationships (Scope);
 if (condition) then (yes)
  :Get_this_Environments_Solutions_from_Inventory (OpenApiConnection);
  :Apply_to_each_Soln (Foreach);
   if (condition) then (yes)
    :Get_Current_Inventory_of_Solution_Objects (Scope);
     if (condition) then (yes)
      :List_related_BPFs (OpenApiConnection);
      :List_related_Flows (OpenApiConnection);
      :List_related_Apps (OpenApiConnection);
      :Select_BPF_IDs_from_Inventory (Select);
      :Select_Flow_IDs_from_Inventory (Select);
      :Union_of_Workflow_types_from_inventory (Compose);
      :Select_Inventory_Workflows (ParseJson);
      :Select_App_IDs_from_Inventory (Select);
      :Select_Inventory_Apps (ParseJson);
      :Filter_out_null_BPFs (Query);
      :Filter_out_null_workflowentity_ids (Query);
     endif
     partition "Get_Current_Inventory_of_Solution_Objects" {
      :List_related_BPFs (OpenApiConnection);
      :List_related_Flows (OpenApiConnection);
      :List_related_Apps (OpenApiConnection);
      :Select_BPF_IDs_from_Inventory (Select);
      :Select_Flow_IDs_from_Inventory (Select);
      :Union_of_Workflow_types_from_inventory (Compose);
      :Select_Inventory_Workflows (ParseJson);
      :Select_App_IDs_from_Inventory (Select);
      :Select_Inventory_Apps (ParseJson);
      :Filter_out_null_BPFs (Query);
      :Filter_out_null_workflowentity_ids (Query);
     }
    :Get_Current_Actual_Solution_Objects (Scope);
     if (condition) then (yes)
      :Select_Actual_Apps (Select);
      :Select_Actual_Workflows (Select);
      :List_Solutions_Apps (OpenApiConnection);
      :List_Solutions_Workflows (OpenApiConnection);
     endif
     partition "Get_Current_Actual_Solution_Objects" {
      :Select_Actual_Apps (Select);
      :Select_Actual_Workflows (Select);
      :List_Solutions_Apps (OpenApiConnection);
      :List_Solutions_Workflows (OpenApiConnection);
     }
    :Remove_objects_no_longer_in_solution_inventory (Scope);
     if (condition) then (yes)
      :RemoveFromInventory__Workflows (Query);
      :remove_flow_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :RemoveFromInventory__Apps (Query);
      :remove_app_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Remove_objects_no_longer_in_solution_inventory" {
      :RemoveFromInventory__Workflows (Query);
      :remove_flow_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :RemoveFromInventory__Apps (Query);
      :remove_app_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     }
    :Add_new_objects_to_solution_inventory (Scope);
     if (condition) then (yes)
      :AddToInventory__Workflows (Query);
      :add_flow_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :AddToInventory__Apps (Query);
      :add_app_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Add_new_objects_to_solution_inventory" {
      :AddToInventory__Workflows (Query);
      :add_flow_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :AddToInventory__Apps (Query);
      :add_app_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     }
   endif
   repeat
    :Get_Current_Inventory_of_Solution_Objects (Scope);
     if (condition) then (yes)
      :List_related_BPFs (OpenApiConnection);
      :List_related_Flows (OpenApiConnection);
      :List_related_Apps (OpenApiConnection);
      :Select_BPF_IDs_from_Inventory (Select);
      :Select_Flow_IDs_from_Inventory (Select);
      :Union_of_Workflow_types_from_inventory (Compose);
      :Select_Inventory_Workflows (ParseJson);
      :Select_App_IDs_from_Inventory (Select);
      :Select_Inventory_Apps (ParseJson);
      :Filter_out_null_BPFs (Query);
      :Filter_out_null_workflowentity_ids (Query);
     endif
     partition "Get_Current_Inventory_of_Solution_Objects" {
      :List_related_BPFs (OpenApiConnection);
      :List_related_Flows (OpenApiConnection);
      :List_related_Apps (OpenApiConnection);
      :Select_BPF_IDs_from_Inventory (Select);
      :Select_Flow_IDs_from_Inventory (Select);
      :Union_of_Workflow_types_from_inventory (Compose);
      :Select_Inventory_Workflows (ParseJson);
      :Select_App_IDs_from_Inventory (Select);
      :Select_Inventory_Apps (ParseJson);
      :Filter_out_null_BPFs (Query);
      :Filter_out_null_workflowentity_ids (Query);
     }
    :Get_Current_Actual_Solution_Objects (Scope);
     if (condition) then (yes)
      :Select_Actual_Apps (Select);
      :Select_Actual_Workflows (Select);
      :List_Solutions_Apps (OpenApiConnection);
      :List_Solutions_Workflows (OpenApiConnection);
     endif
     partition "Get_Current_Actual_Solution_Objects" {
      :Select_Actual_Apps (Select);
      :Select_Actual_Workflows (Select);
      :List_Solutions_Apps (OpenApiConnection);
      :List_Solutions_Workflows (OpenApiConnection);
     }
    :Remove_objects_no_longer_in_solution_inventory (Scope);
     if (condition) then (yes)
      :RemoveFromInventory__Workflows (Query);
      :remove_flow_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :RemoveFromInventory__Apps (Query);
      :remove_app_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Remove_objects_no_longer_in_solution_inventory" {
      :RemoveFromInventory__Workflows (Query);
      :remove_flow_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :RemoveFromInventory__Apps (Query);
      :remove_app_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     }
    :Add_new_objects_to_solution_inventory (Scope);
     if (condition) then (yes)
      :AddToInventory__Workflows (Query);
      :add_flow_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :AddToInventory__Apps (Query);
      :add_app_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Add_new_objects_to_solution_inventory" {
      :AddToInventory__Workflows (Query);
      :add_flow_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :AddToInventory__Apps (Query);
      :add_app_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     }
   repeat while (more items)
 endif
 partition "Inventory_Solution_Object_Relationships" {
  :Get_this_Environments_Solutions_from_Inventory (OpenApiConnection);
  :Apply_to_each_Soln (Foreach);
   if (condition) then (yes)
    :Get_Current_Inventory_of_Solution_Objects (Scope);
     if (condition) then (yes)
      :List_related_BPFs (OpenApiConnection);
      :List_related_Flows (OpenApiConnection);
      :List_related_Apps (OpenApiConnection);
      :Select_BPF_IDs_from_Inventory (Select);
      :Select_Flow_IDs_from_Inventory (Select);
      :Union_of_Workflow_types_from_inventory (Compose);
      :Select_Inventory_Workflows (ParseJson);
      :Select_App_IDs_from_Inventory (Select);
      :Select_Inventory_Apps (ParseJson);
      :Filter_out_null_BPFs (Query);
      :Filter_out_null_workflowentity_ids (Query);
     endif
     partition "Get_Current_Inventory_of_Solution_Objects" {
      :List_related_BPFs (OpenApiConnection);
      :List_related_Flows (OpenApiConnection);
      :List_related_Apps (OpenApiConnection);
      :Select_BPF_IDs_from_Inventory (Select);
      :Select_Flow_IDs_from_Inventory (Select);
      :Union_of_Workflow_types_from_inventory (Compose);
      :Select_Inventory_Workflows (ParseJson);
      :Select_App_IDs_from_Inventory (Select);
      :Select_Inventory_Apps (ParseJson);
      :Filter_out_null_BPFs (Query);
      :Filter_out_null_workflowentity_ids (Query);
     }
    :Get_Current_Actual_Solution_Objects (Scope);
     if (condition) then (yes)
      :Select_Actual_Apps (Select);
      :Select_Actual_Workflows (Select);
      :List_Solutions_Apps (OpenApiConnection);
      :List_Solutions_Workflows (OpenApiConnection);
     endif
     partition "Get_Current_Actual_Solution_Objects" {
      :Select_Actual_Apps (Select);
      :Select_Actual_Workflows (Select);
      :List_Solutions_Apps (OpenApiConnection);
      :List_Solutions_Workflows (OpenApiConnection);
     }
    :Remove_objects_no_longer_in_solution_inventory (Scope);
     if (condition) then (yes)
      :RemoveFromInventory__Workflows (Query);
      :remove_flow_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :RemoveFromInventory__Apps (Query);
      :remove_app_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Remove_objects_no_longer_in_solution_inventory" {
      :RemoveFromInventory__Workflows (Query);
      :remove_flow_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :RemoveFromInventory__Apps (Query);
      :remove_app_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     }
    :Add_new_objects_to_solution_inventory (Scope);
     if (condition) then (yes)
      :AddToInventory__Workflows (Query);
      :add_flow_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :AddToInventory__Apps (Query);
      :add_app_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Add_new_objects_to_solution_inventory" {
      :AddToInventory__Workflows (Query);
      :add_flow_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :AddToInventory__Apps (Query);
      :add_app_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     }
   endif
   repeat
    :Get_Current_Inventory_of_Solution_Objects (Scope);
     if (condition) then (yes)
      :List_related_BPFs (OpenApiConnection);
      :List_related_Flows (OpenApiConnection);
      :List_related_Apps (OpenApiConnection);
      :Select_BPF_IDs_from_Inventory (Select);
      :Select_Flow_IDs_from_Inventory (Select);
      :Union_of_Workflow_types_from_inventory (Compose);
      :Select_Inventory_Workflows (ParseJson);
      :Select_App_IDs_from_Inventory (Select);
      :Select_Inventory_Apps (ParseJson);
      :Filter_out_null_BPFs (Query);
      :Filter_out_null_workflowentity_ids (Query);
     endif
     partition "Get_Current_Inventory_of_Solution_Objects" {
      :List_related_BPFs (OpenApiConnection);
      :List_related_Flows (OpenApiConnection);
      :List_related_Apps (OpenApiConnection);
      :Select_BPF_IDs_from_Inventory (Select);
      :Select_Flow_IDs_from_Inventory (Select);
      :Union_of_Workflow_types_from_inventory (Compose);
      :Select_Inventory_Workflows (ParseJson);
      :Select_App_IDs_from_Inventory (Select);
      :Select_Inventory_Apps (ParseJson);
      :Filter_out_null_BPFs (Query);
      :Filter_out_null_workflowentity_ids (Query);
     }
    :Get_Current_Actual_Solution_Objects (Scope);
     if (condition) then (yes)
      :Select_Actual_Apps (Select);
      :Select_Actual_Workflows (Select);
      :List_Solutions_Apps (OpenApiConnection);
      :List_Solutions_Workflows (OpenApiConnection);
     endif
     partition "Get_Current_Actual_Solution_Objects" {
      :Select_Actual_Apps (Select);
      :Select_Actual_Workflows (Select);
      :List_Solutions_Apps (OpenApiConnection);
      :List_Solutions_Workflows (OpenApiConnection);
     }
    :Remove_objects_no_longer_in_solution_inventory (Scope);
     if (condition) then (yes)
      :RemoveFromInventory__Workflows (Query);
      :remove_flow_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :RemoveFromInventory__Apps (Query);
      :remove_app_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Remove_objects_no_longer_in_solution_inventory" {
      :RemoveFromInventory__Workflows (Query);
      :remove_flow_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_to_Remove (OpenApiConnection);
        :If_flow_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_Flow (OpenApiConnection);
          :catch__already_removed_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Remove (OpenApiConnection);
          :If_BPF_found_to_remove (If);
           if (condition) then (yes)
            :Remove_Solution_BPF (OpenApiConnection);
            :catch__already_removed_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :RemoveFromInventory__Apps (Query);
      :remove_app_from_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Remove (OpenApiConnection);
        :If_app_found_to_remove (If);
         if (condition) then (yes)
          :Remove_Solution_App (OpenApiConnection);
          :catch__already_removed_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     }
    :Add_new_objects_to_solution_inventory (Scope);
     if (condition) then (yes)
      :AddToInventory__Workflows (Query);
      :add_flow_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :AddToInventory__Apps (Query);
      :add_app_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Add_new_objects_to_solution_inventory" {
      :AddToInventory__Workflows (Query);
      :add_flow_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       endif
       repeat
        :Get_Flow_To_Add (OpenApiConnection);
        :If_flow_found_to_add (If);
         if (condition) then (yes)
          :Add_Solution_Flow (OpenApiConnection);
          :catch__already_added_flow (Compose);
         endif
         else (no)
          :Get_BPF_to_Add (OpenApiConnection);
          :If_BPF_found_to_add (If);
           if (condition) then (yes)
            :Add_Solution_BPF (OpenApiConnection);
            :catch__already_added_bpf (Compose);
           endif
           else (no)
           endif
         endif
       repeat while (more items)
      :AddToInventory__Apps (Query);
      :add_app_to_solution_inventory (Foreach);
       if (condition) then (yes)
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       endif
       repeat
        :Get_App_to_Add (OpenApiConnection);
        :If_app_found_to_add_ (If);
         if (condition) then (yes)
          :Add_Solution_App (OpenApiConnection);
          :catch__already_added_app (Compose);
         endif
         else (no)
         endif
       repeat while (more items)
     }
   repeat while (more items)
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |

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
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Inventory_Solution_Object_Relationships | Scope | Operation ID: 1abd8810-3b90-46e7-b61a-e8f327112911 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
