# Power Automate Flow: AdminGatherTenantSRs

**Generated on:** 2025-07-15 19:14:46
**Flow ID:** 000D3A3411D9
**Source File:** AdminGatherTenantSRs-F23475A4-8EC6-EE11-9079-000D3A3411D9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminGatherTenantSRs
- **Triggers:** 1
- **Actions:** 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 3

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminGatherTenantSRs

start
:Trigger: Recurrence (Recurrence);\n:Initialize_TenantSRs (InitializeVariable);
:Get_Tenant_SRs (Scope);
 if (condition) then (yes)
  :Get_the_Basics (Scope);
   if (condition) then (yes)
    :List_Environments_as_Admin (OpenApiConnection);
    :Filter_to_Envts_with_Linked_Environment_Metadata (Query);
    :Get_SRs_already_tracked_in_inventory (OpenApiConnection);
    :isEmptyTable (Compose);
    :Inventory_SRs_with_TID (Query);
    :Inventory_SRs (Query);
    :Select_Inventory_SRs_with_TID (Select);
    :Select_Inventory_SRs (Select);
   endif
   partition "Get_the_Basics" {
    :List_Environments_as_Admin (OpenApiConnection);
    :Filter_to_Envts_with_Linked_Environment_Metadata (Query);
    :Get_SRs_already_tracked_in_inventory (OpenApiConnection);
    :isEmptyTable (Compose);
    :Inventory_SRs_with_TID (Query);
    :Inventory_SRs (Query);
    :Select_Inventory_SRs_with_TID (Select);
    :Select_Inventory_SRs (Select);
   }
  :Get_SRs_from_CoE_Envt (Scope);
   if (condition) then (yes)
    :Select_CoE_Envts_SRs_with_Template_IDs (Select);
    :Select_CoE_Envts_Tids (Select);
    :List_CoE_Envt_SRs (OpenApiConnection);
    :Select_CoE_Envts_SRs_without_Template_IDs (Select);
    :Select_CoE_Envts_Names (Select);
    :Get_CoE_Parent_BU_for_ID (OpenApiConnection);
    :CoE_ParentBU (Compose);
    :List_CoE_Envt_SRs_with_Template_IDs (OpenApiConnection);
   endif
   partition "Get_SRs_from_CoE_Envt" {
    :Select_CoE_Envts_SRs_with_Template_IDs (Select);
    :Select_CoE_Envts_Tids (Select);
    :List_CoE_Envt_SRs (OpenApiConnection);
    :Select_CoE_Envts_SRs_without_Template_IDs (Select);
    :Select_CoE_Envts_Names (Select);
    :Get_CoE_Parent_BU_for_ID (OpenApiConnection);
    :CoE_ParentBU (Compose);
    :List_CoE_Envt_SRs_with_Template_IDs (OpenApiConnection);
   }
  :Fetch_SRs_from_other_envts_if_additive_to_CoE_Envt_SRs (Scope);
   if (condition) then (yes)
    :Apply_to_each_envt (Foreach);
     if (condition) then (yes)
      :Parent_BU (Scope);
       if (condition) then (yes)
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       endif
       partition "Parent_BU" {
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       }
      :Gather (Scope);
       if (condition) then (yes)
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Gather" {
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       }
      :CATCH__No_permissions (Compose);
     endif
     repeat
      :Parent_BU (Scope);
       if (condition) then (yes)
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       endif
       partition "Parent_BU" {
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       }
      :Gather (Scope);
       if (condition) then (yes)
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Gather" {
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       }
      :CATCH__No_permissions (Compose);
     repeat while (more items)
    :Union_Additive_SRs_to_Distinct_List (Compose);
    :Set_TenantSRs_to_Distinct_List (SetVariable);
   endif
   partition "Fetch_SRs_from_other_envts_if_additive_to_CoE_Envt_SRs" {
    :Apply_to_each_envt (Foreach);
     if (condition) then (yes)
      :Parent_BU (Scope);
       if (condition) then (yes)
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       endif
       partition "Parent_BU" {
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       }
      :Gather (Scope);
       if (condition) then (yes)
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Gather" {
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       }
      :CATCH__No_permissions (Compose);
     endif
     repeat
      :Parent_BU (Scope);
       if (condition) then (yes)
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       endif
       partition "Parent_BU" {
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       }
      :Gather (Scope);
       if (condition) then (yes)
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Gather" {
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       }
      :CATCH__No_permissions (Compose);
     repeat while (more items)
    :Union_Additive_SRs_to_Distinct_List (Compose);
    :Set_TenantSRs_to_Distinct_List (SetVariable);
   }
  :Add_CoE_Envt_SRs (Scope);
   if (condition) then (yes)
    :Apply_to_each_CoE_Envts_SRs_with_Template_IDs (Foreach);
     if (condition) then (yes)
      :Append_CoE_SRs_with_TIDs (AppendToArrayVariable);
     endif
     repeat
      :Append_CoE_SRs_with_TIDs (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_CoE_Envts_SRs_without_Template_IDs (Foreach);
     if (condition) then (yes)
      :Append_CoE_SRs (AppendToArrayVariable);
     endif
     repeat
      :Append_CoE_SRs (AppendToArrayVariable);
     repeat while (more items)
   endif
   partition "Add_CoE_Envt_SRs" {
    :Apply_to_each_CoE_Envts_SRs_with_Template_IDs (Foreach);
     if (condition) then (yes)
      :Append_CoE_SRs_with_TIDs (AppendToArrayVariable);
     endif
     repeat
      :Append_CoE_SRs_with_TIDs (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_CoE_Envts_SRs_without_Template_IDs (Foreach);
     if (condition) then (yes)
      :Append_CoE_SRs (AppendToArrayVariable);
     endif
     repeat
      :Append_CoE_SRs (AppendToArrayVariable);
     repeat while (more items)
   }
  :Debug_to_show_the_full_SR_list (Compose);
  :Add_new_SRs (Scope);
   if (condition) then (yes)
    :Find_new_SRs_for_Inventory_with_TIDs (Query);
    :Find_new_SRs_for_Inventory_without_TIDs (Query);
    :Add_SRs_with_TIDs (Foreach);
     if (condition) then (yes)
      :Add_SR_with_TIDs (OpenApiConnection);
     endif
     repeat
      :Add_SR_with_TIDs (OpenApiConnection);
     repeat while (more items)
    :Add_SRs_without_TIDs (Foreach);
     if (condition) then (yes)
      :Add_SR_without_TIDs (OpenApiConnection);
     endif
     repeat
      :Add_SR_without_TIDs (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Add_new_SRs" {
    :Find_new_SRs_for_Inventory_with_TIDs (Query);
    :Find_new_SRs_for_Inventory_without_TIDs (Query);
    :Add_SRs_with_TIDs (Foreach);
     if (condition) then (yes)
      :Add_SR_with_TIDs (OpenApiConnection);
     endif
     repeat
      :Add_SR_with_TIDs (OpenApiConnection);
     repeat while (more items)
    :Add_SRs_without_TIDs (Foreach);
     if (condition) then (yes)
      :Add_SR_without_TIDs (OpenApiConnection);
     endif
     repeat
      :Add_SR_without_TIDs (OpenApiConnection);
     repeat while (more items)
   }
  :Deal_with_new_SRs (Scope);
   if (condition) then (yes)
    :if_new_setup (If);
     if (condition) then (yes)
      :Mark_up_starter_SRs (Compose);
      :Apply_to_each_starter_SR (Foreach);
       if (condition) then (yes)
        :Find_this_SR (OpenApiConnection);
        :Mark_starter_SR_as_a_SR_to_track (OpenApiConnection);
       endif
       repeat
        :Find_this_SR (OpenApiConnection);
        :Mark_starter_SR_as_a_SR_to_track (OpenApiConnection);
       repeat while (more items)
     endif
     else (no)
      :if_new_SRs (If);
       if (condition) then (yes)
        :Get_Row__Send_New_SRs_to_Admin (Scope);
         if (condition) then (yes)
          :emailGUID_to_enUS (Compose);
          :List_emails_for_preferred_language (OpenApiConnection);
          :Set_emailGUID_to_localized_row (SetVariable);
          :Get_a_row_by_ID (OpenApiConnection);
         endif
         partition "Get_Row__Send_New_SRs_to_Admin" {
          :emailGUID_to_enUS (Compose);
          :List_emails_for_preferred_language (OpenApiConnection);
          :Set_emailGUID_to_localized_row (SetVariable);
          :Get_a_row_by_ID (OpenApiConnection);
         }
        :Send_New_SRs_to_Admin (Workflow);
        :Get_App_Link_for_Admin (Scope);
         if (condition) then (yes)
          :Get_App_URL (OpenApiConnection);
          :Specific_Custom_Page (Compose);
          :App_URL_Base (Compose);
          :App_URL (Compose);
         endif
         partition "Get_App_Link_for_Admin" {
          :Get_App_URL (OpenApiConnection);
          :Specific_Custom_Page (Compose);
          :App_URL_Base (Compose);
          :App_URL (Compose);
         }
        :Get_New_SR_Table (Scope);
         if (condition) then (yes)
          :Select_Name_Tenant_SRs_to_those_with_TIDs (Select);
          :Create_single_list_of_new_SRs (Compose);
          :Add_Header (Select);
          :Create_HTML_table_of_new_SRs (Table);
         endif
         partition "Get_New_SR_Table" {
          :Select_Name_Tenant_SRs_to_those_with_TIDs (Select);
          :Create_single_list_of_new_SRs (Compose);
          :Add_Header (Select);
          :Create_HTML_table_of_new_SRs (Table);
         }
       endif
     endif
   endif
   partition "Deal_with_new_SRs" {
    :if_new_setup (If);
     if (condition) then (yes)
      :Mark_up_starter_SRs (Compose);
      :Apply_to_each_starter_SR (Foreach);
       if (condition) then (yes)
        :Find_this_SR (OpenApiConnection);
        :Mark_starter_SR_as_a_SR_to_track (OpenApiConnection);
       endif
       repeat
        :Find_this_SR (OpenApiConnection);
        :Mark_starter_SR_as_a_SR_to_track (OpenApiConnection);
       repeat while (more items)
     endif
     else (no)
      :if_new_SRs (If);
       if (condition) then (yes)
        :Get_Row__Send_New_SRs_to_Admin (Scope);
         if (condition) then (yes)
          :emailGUID_to_enUS (Compose);
          :List_emails_for_preferred_language (OpenApiConnection);
          :Set_emailGUID_to_localized_row (SetVariable);
          :Get_a_row_by_ID (OpenApiConnection);
         endif
         partition "Get_Row__Send_New_SRs_to_Admin" {
          :emailGUID_to_enUS (Compose);
          :List_emails_for_preferred_language (OpenApiConnection);
          :Set_emailGUID_to_localized_row (SetVariable);
          :Get_a_row_by_ID (OpenApiConnection);
         }
        :Send_New_SRs_to_Admin (Workflow);
        :Get_App_Link_for_Admin (Scope);
         if (condition) then (yes)
          :Get_App_URL (OpenApiConnection);
          :Specific_Custom_Page (Compose);
          :App_URL_Base (Compose);
          :App_URL (Compose);
         endif
         partition "Get_App_Link_for_Admin" {
          :Get_App_URL (OpenApiConnection);
          :Specific_Custom_Page (Compose);
          :App_URL_Base (Compose);
          :App_URL (Compose);
         }
        :Get_New_SR_Table (Scope);
         if (condition) then (yes)
          :Select_Name_Tenant_SRs_to_those_with_TIDs (Select);
          :Create_single_list_of_new_SRs (Compose);
          :Add_Header (Select);
          :Create_HTML_table_of_new_SRs (Table);
         endif
         partition "Get_New_SR_Table" {
          :Select_Name_Tenant_SRs_to_those_with_TIDs (Select);
          :Create_single_list_of_new_SRs (Compose);
          :Add_Header (Select);
          :Create_HTML_table_of_new_SRs (Table);
         }
       endif
     endif
   }
  :Remove_deleted_SRs (Scope);
   if (condition) then (yes)
    :Find_deleted_SRs_for_Inventory_with_TIDs (Query);
    :Find_deleted_SRs_for_Inventory_without_TIDs (Query);
    :Remove_SRs_with_TIDs (Foreach);
     if (condition) then (yes)
      :Find_SRs_with_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_with_TIDs (OpenApiConnection);
     endif
     repeat
      :Find_SRs_with_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_with_TIDs (OpenApiConnection);
     repeat while (more items)
    :Remove_SRs_without_TIDs (Foreach);
     if (condition) then (yes)
      :Find_SRs_without_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_without_TIDs (OpenApiConnection);
     endif
     repeat
      :Find_SRs_without_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_without_TIDs (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Remove_deleted_SRs" {
    :Find_deleted_SRs_for_Inventory_with_TIDs (Query);
    :Find_deleted_SRs_for_Inventory_without_TIDs (Query);
    :Remove_SRs_with_TIDs (Foreach);
     if (condition) then (yes)
      :Find_SRs_with_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_with_TIDs (OpenApiConnection);
     endif
     repeat
      :Find_SRs_with_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_with_TIDs (OpenApiConnection);
     repeat while (more items)
    :Remove_SRs_without_TIDs (Foreach);
     if (condition) then (yes)
      :Find_SRs_without_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_without_TIDs (OpenApiConnection);
     endif
     repeat
      :Find_SRs_without_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_without_TIDs (OpenApiConnection);
     repeat while (more items)
   }
  :Prepare_for_Add_Delete (Scope);
   if (condition) then (yes)
    :Filter_Tenant_SRs_to_those_with_TIDs (Query);
    :Filter_Tenant_SRs_to_those_without_TIDs (Query);
    :Select_Name_Tenant_SRs_to_those_without_TIDs (Select);
   endif
   partition "Prepare_for_Add_Delete" {
    :Filter_Tenant_SRs_to_those_with_TIDs (Query);
    :Filter_Tenant_SRs_to_those_without_TIDs (Query);
    :Select_Name_Tenant_SRs_to_those_without_TIDs (Select);
   }
 endif
 partition "Get_Tenant_SRs" {
  :Get_the_Basics (Scope);
   if (condition) then (yes)
    :List_Environments_as_Admin (OpenApiConnection);
    :Filter_to_Envts_with_Linked_Environment_Metadata (Query);
    :Get_SRs_already_tracked_in_inventory (OpenApiConnection);
    :isEmptyTable (Compose);
    :Inventory_SRs_with_TID (Query);
    :Inventory_SRs (Query);
    :Select_Inventory_SRs_with_TID (Select);
    :Select_Inventory_SRs (Select);
   endif
   partition "Get_the_Basics" {
    :List_Environments_as_Admin (OpenApiConnection);
    :Filter_to_Envts_with_Linked_Environment_Metadata (Query);
    :Get_SRs_already_tracked_in_inventory (OpenApiConnection);
    :isEmptyTable (Compose);
    :Inventory_SRs_with_TID (Query);
    :Inventory_SRs (Query);
    :Select_Inventory_SRs_with_TID (Select);
    :Select_Inventory_SRs (Select);
   }
  :Get_SRs_from_CoE_Envt (Scope);
   if (condition) then (yes)
    :Select_CoE_Envts_SRs_with_Template_IDs (Select);
    :Select_CoE_Envts_Tids (Select);
    :List_CoE_Envt_SRs (OpenApiConnection);
    :Select_CoE_Envts_SRs_without_Template_IDs (Select);
    :Select_CoE_Envts_Names (Select);
    :Get_CoE_Parent_BU_for_ID (OpenApiConnection);
    :CoE_ParentBU (Compose);
    :List_CoE_Envt_SRs_with_Template_IDs (OpenApiConnection);
   endif
   partition "Get_SRs_from_CoE_Envt" {
    :Select_CoE_Envts_SRs_with_Template_IDs (Select);
    :Select_CoE_Envts_Tids (Select);
    :List_CoE_Envt_SRs (OpenApiConnection);
    :Select_CoE_Envts_SRs_without_Template_IDs (Select);
    :Select_CoE_Envts_Names (Select);
    :Get_CoE_Parent_BU_for_ID (OpenApiConnection);
    :CoE_ParentBU (Compose);
    :List_CoE_Envt_SRs_with_Template_IDs (OpenApiConnection);
   }
  :Fetch_SRs_from_other_envts_if_additive_to_CoE_Envt_SRs (Scope);
   if (condition) then (yes)
    :Apply_to_each_envt (Foreach);
     if (condition) then (yes)
      :Parent_BU (Scope);
       if (condition) then (yes)
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       endif
       partition "Parent_BU" {
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       }
      :Gather (Scope);
       if (condition) then (yes)
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Gather" {
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       }
      :CATCH__No_permissions (Compose);
     endif
     repeat
      :Parent_BU (Scope);
       if (condition) then (yes)
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       endif
       partition "Parent_BU" {
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       }
      :Gather (Scope);
       if (condition) then (yes)
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Gather" {
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       }
      :CATCH__No_permissions (Compose);
     repeat while (more items)
    :Union_Additive_SRs_to_Distinct_List (Compose);
    :Set_TenantSRs_to_Distinct_List (SetVariable);
   endif
   partition "Fetch_SRs_from_other_envts_if_additive_to_CoE_Envt_SRs" {
    :Apply_to_each_envt (Foreach);
     if (condition) then (yes)
      :Parent_BU (Scope);
       if (condition) then (yes)
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       endif
       partition "Parent_BU" {
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       }
      :Gather (Scope);
       if (condition) then (yes)
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Gather" {
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       }
      :CATCH__No_permissions (Compose);
     endif
     repeat
      :Parent_BU (Scope);
       if (condition) then (yes)
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       endif
       partition "Parent_BU" {
        :Get_Parent_BU_for_ID (OpenApiConnection);
        :ParentBU (Compose);
       }
      :Gather (Scope);
       if (condition) then (yes)
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Gather" {
        :Get_SRs_from_envt_with_TIDs (OpenApiConnection);
        :Select_SRs_from_envt_with_TIDs (Select);
        :Find_new_SRs_with_TIDs (Query);
        :Apply_to_each_new_SR_with_TID (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable (AppendToArrayVariable);
          :Filter_to_find_name (Query);
         repeat while (more items)
        :Get_SRs_from_envt (OpenApiConnection);
        :Select_SRs_from_envt (Select);
        :Find_new_SRs (Query);
        :Apply_to_each_new_SR (Foreach);
         if (condition) then (yes)
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         endif
         repeat
          :Append_new_SR_with_TID_to_array_variable_2 (AppendToArrayVariable);
         repeat while (more items)
       }
      :CATCH__No_permissions (Compose);
     repeat while (more items)
    :Union_Additive_SRs_to_Distinct_List (Compose);
    :Set_TenantSRs_to_Distinct_List (SetVariable);
   }
  :Add_CoE_Envt_SRs (Scope);
   if (condition) then (yes)
    :Apply_to_each_CoE_Envts_SRs_with_Template_IDs (Foreach);
     if (condition) then (yes)
      :Append_CoE_SRs_with_TIDs (AppendToArrayVariable);
     endif
     repeat
      :Append_CoE_SRs_with_TIDs (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_CoE_Envts_SRs_without_Template_IDs (Foreach);
     if (condition) then (yes)
      :Append_CoE_SRs (AppendToArrayVariable);
     endif
     repeat
      :Append_CoE_SRs (AppendToArrayVariable);
     repeat while (more items)
   endif
   partition "Add_CoE_Envt_SRs" {
    :Apply_to_each_CoE_Envts_SRs_with_Template_IDs (Foreach);
     if (condition) then (yes)
      :Append_CoE_SRs_with_TIDs (AppendToArrayVariable);
     endif
     repeat
      :Append_CoE_SRs_with_TIDs (AppendToArrayVariable);
     repeat while (more items)
    :Apply_to_each_CoE_Envts_SRs_without_Template_IDs (Foreach);
     if (condition) then (yes)
      :Append_CoE_SRs (AppendToArrayVariable);
     endif
     repeat
      :Append_CoE_SRs (AppendToArrayVariable);
     repeat while (more items)
   }
  :Debug_to_show_the_full_SR_list (Compose);
  :Add_new_SRs (Scope);
   if (condition) then (yes)
    :Find_new_SRs_for_Inventory_with_TIDs (Query);
    :Find_new_SRs_for_Inventory_without_TIDs (Query);
    :Add_SRs_with_TIDs (Foreach);
     if (condition) then (yes)
      :Add_SR_with_TIDs (OpenApiConnection);
     endif
     repeat
      :Add_SR_with_TIDs (OpenApiConnection);
     repeat while (more items)
    :Add_SRs_without_TIDs (Foreach);
     if (condition) then (yes)
      :Add_SR_without_TIDs (OpenApiConnection);
     endif
     repeat
      :Add_SR_without_TIDs (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Add_new_SRs" {
    :Find_new_SRs_for_Inventory_with_TIDs (Query);
    :Find_new_SRs_for_Inventory_without_TIDs (Query);
    :Add_SRs_with_TIDs (Foreach);
     if (condition) then (yes)
      :Add_SR_with_TIDs (OpenApiConnection);
     endif
     repeat
      :Add_SR_with_TIDs (OpenApiConnection);
     repeat while (more items)
    :Add_SRs_without_TIDs (Foreach);
     if (condition) then (yes)
      :Add_SR_without_TIDs (OpenApiConnection);
     endif
     repeat
      :Add_SR_without_TIDs (OpenApiConnection);
     repeat while (more items)
   }
  :Deal_with_new_SRs (Scope);
   if (condition) then (yes)
    :if_new_setup (If);
     if (condition) then (yes)
      :Mark_up_starter_SRs (Compose);
      :Apply_to_each_starter_SR (Foreach);
       if (condition) then (yes)
        :Find_this_SR (OpenApiConnection);
        :Mark_starter_SR_as_a_SR_to_track (OpenApiConnection);
       endif
       repeat
        :Find_this_SR (OpenApiConnection);
        :Mark_starter_SR_as_a_SR_to_track (OpenApiConnection);
       repeat while (more items)
     endif
     else (no)
      :if_new_SRs (If);
       if (condition) then (yes)
        :Get_Row__Send_New_SRs_to_Admin (Scope);
         if (condition) then (yes)
          :emailGUID_to_enUS (Compose);
          :List_emails_for_preferred_language (OpenApiConnection);
          :Set_emailGUID_to_localized_row (SetVariable);
          :Get_a_row_by_ID (OpenApiConnection);
         endif
         partition "Get_Row__Send_New_SRs_to_Admin" {
          :emailGUID_to_enUS (Compose);
          :List_emails_for_preferred_language (OpenApiConnection);
          :Set_emailGUID_to_localized_row (SetVariable);
          :Get_a_row_by_ID (OpenApiConnection);
         }
        :Send_New_SRs_to_Admin (Workflow);
        :Get_App_Link_for_Admin (Scope);
         if (condition) then (yes)
          :Get_App_URL (OpenApiConnection);
          :Specific_Custom_Page (Compose);
          :App_URL_Base (Compose);
          :App_URL (Compose);
         endif
         partition "Get_App_Link_for_Admin" {
          :Get_App_URL (OpenApiConnection);
          :Specific_Custom_Page (Compose);
          :App_URL_Base (Compose);
          :App_URL (Compose);
         }
        :Get_New_SR_Table (Scope);
         if (condition) then (yes)
          :Select_Name_Tenant_SRs_to_those_with_TIDs (Select);
          :Create_single_list_of_new_SRs (Compose);
          :Add_Header (Select);
          :Create_HTML_table_of_new_SRs (Table);
         endif
         partition "Get_New_SR_Table" {
          :Select_Name_Tenant_SRs_to_those_with_TIDs (Select);
          :Create_single_list_of_new_SRs (Compose);
          :Add_Header (Select);
          :Create_HTML_table_of_new_SRs (Table);
         }
       endif
     endif
   endif
   partition "Deal_with_new_SRs" {
    :if_new_setup (If);
     if (condition) then (yes)
      :Mark_up_starter_SRs (Compose);
      :Apply_to_each_starter_SR (Foreach);
       if (condition) then (yes)
        :Find_this_SR (OpenApiConnection);
        :Mark_starter_SR_as_a_SR_to_track (OpenApiConnection);
       endif
       repeat
        :Find_this_SR (OpenApiConnection);
        :Mark_starter_SR_as_a_SR_to_track (OpenApiConnection);
       repeat while (more items)
     endif
     else (no)
      :if_new_SRs (If);
       if (condition) then (yes)
        :Get_Row__Send_New_SRs_to_Admin (Scope);
         if (condition) then (yes)
          :emailGUID_to_enUS (Compose);
          :List_emails_for_preferred_language (OpenApiConnection);
          :Set_emailGUID_to_localized_row (SetVariable);
          :Get_a_row_by_ID (OpenApiConnection);
         endif
         partition "Get_Row__Send_New_SRs_to_Admin" {
          :emailGUID_to_enUS (Compose);
          :List_emails_for_preferred_language (OpenApiConnection);
          :Set_emailGUID_to_localized_row (SetVariable);
          :Get_a_row_by_ID (OpenApiConnection);
         }
        :Send_New_SRs_to_Admin (Workflow);
        :Get_App_Link_for_Admin (Scope);
         if (condition) then (yes)
          :Get_App_URL (OpenApiConnection);
          :Specific_Custom_Page (Compose);
          :App_URL_Base (Compose);
          :App_URL (Compose);
         endif
         partition "Get_App_Link_for_Admin" {
          :Get_App_URL (OpenApiConnection);
          :Specific_Custom_Page (Compose);
          :App_URL_Base (Compose);
          :App_URL (Compose);
         }
        :Get_New_SR_Table (Scope);
         if (condition) then (yes)
          :Select_Name_Tenant_SRs_to_those_with_TIDs (Select);
          :Create_single_list_of_new_SRs (Compose);
          :Add_Header (Select);
          :Create_HTML_table_of_new_SRs (Table);
         endif
         partition "Get_New_SR_Table" {
          :Select_Name_Tenant_SRs_to_those_with_TIDs (Select);
          :Create_single_list_of_new_SRs (Compose);
          :Add_Header (Select);
          :Create_HTML_table_of_new_SRs (Table);
         }
       endif
     endif
   }
  :Remove_deleted_SRs (Scope);
   if (condition) then (yes)
    :Find_deleted_SRs_for_Inventory_with_TIDs (Query);
    :Find_deleted_SRs_for_Inventory_without_TIDs (Query);
    :Remove_SRs_with_TIDs (Foreach);
     if (condition) then (yes)
      :Find_SRs_with_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_with_TIDs (OpenApiConnection);
     endif
     repeat
      :Find_SRs_with_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_with_TIDs (OpenApiConnection);
     repeat while (more items)
    :Remove_SRs_without_TIDs (Foreach);
     if (condition) then (yes)
      :Find_SRs_without_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_without_TIDs (OpenApiConnection);
     endif
     repeat
      :Find_SRs_without_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_without_TIDs (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Remove_deleted_SRs" {
    :Find_deleted_SRs_for_Inventory_with_TIDs (Query);
    :Find_deleted_SRs_for_Inventory_without_TIDs (Query);
    :Remove_SRs_with_TIDs (Foreach);
     if (condition) then (yes)
      :Find_SRs_with_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_with_TIDs (OpenApiConnection);
     endif
     repeat
      :Find_SRs_with_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_with_TIDs (OpenApiConnection);
     repeat while (more items)
    :Remove_SRs_without_TIDs (Foreach);
     if (condition) then (yes)
      :Find_SRs_without_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_without_TIDs (OpenApiConnection);
     endif
     repeat
      :Find_SRs_without_TIDs_to_delete (OpenApiConnection);
      :Delete_Removed_SRs_without_TIDs (OpenApiConnection);
     repeat while (more items)
   }
  :Prepare_for_Add_Delete (Scope);
   if (condition) then (yes)
    :Filter_Tenant_SRs_to_those_with_TIDs (Query);
    :Filter_Tenant_SRs_to_those_without_TIDs (Query);
    :Select_Name_Tenant_SRs_to_those_without_TIDs (Select);
   endif
   partition "Prepare_for_Add_Delete" {
    :Filter_Tenant_SRs_to_those_with_TIDs (Query);
    :Filter_Tenant_SRs_to_those_without_TIDs (Query);
    :Select_Name_Tenant_SRs_to_those_without_TIDs (Select);
   }
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
:Initialize_emailGUID (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Admin eMail Preferred Language (admin_AdmineMailPreferredLanguage) | String | en-US | Inventory - The preferred language for the emails sent to the admin email alias, which is specified in theAdmin eMail environment variable. Default is en-US |
| Admin eMail (admin_AdminMail) | String | hannescoeadmins@powercattools.onmicrosoft.com | Inventory - CoE Admin eMail. Email address used in flows to send notifications to admins; this should be either your email address or a distribution list |

## Triggers

### Recurrence
- **Type:** Recurrence
- **Recurrence:** Frequency: Month, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_TenantSRs | InitializeVariable | Operation ID: 1891198f-c203-458d-829b-8a8c79436029 |
| Get_Tenant_SRs | Scope | Operation ID: ba4faf69-d8d4-4bcb-8f1d-56e43afb37fc |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_emailGUID | InitializeVariable | Operation ID: dad8eca6-7937-47c0-aa57-f2d48dd1c5a2 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
