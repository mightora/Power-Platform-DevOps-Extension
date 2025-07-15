# Power Automate Flow: AdminSyncTemplatev4AiModels

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A3411D9
**Source File:** AdminSyncTemplatev4AiModels-E5601A14-5494-EE11-BE37-000D3A3411D9.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4AiModels
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4AiModels

start
:Trigger: When_a_row_is_added_or_modified (OpenApiConnectionWebhook);\n:Check_if_AI_Models_can_and_should_be_retrieved_for_this_environment (If);
 if (condition) then (yes)
  :Terminate_inquiry_not_supported (Terminate);
 endif
:Initialize_aisToInvenotry (InitializeVariable);
:Inventory_AI_Models_AIs_for_this_envt (Scope);
 if (condition) then (yes)
  :Get_Basics (Scope);
   if (condition) then (yes)
    :Get_AIs_and_Exit_if_no_AIs_in_envt_or_if_no_permissions (Scope);
     if (condition) then (yes)
      :Count_AIs (If);
       if (condition) then (yes)
        :Quit_if_no_AIs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_AIs (OpenApiConnection);
     endif
     partition "Get_AIs_and_Exit_if_no_AIs_in_envt_or_if_no_permissions" {
      :Count_AIs (If);
       if (condition) then (yes)
        :Quit_if_no_AIs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_AIs (OpenApiConnection);
     }
    :List_Inventory_AIs (OpenApiConnection);
   endif
   partition "Get_Basics" {
    :Get_AIs_and_Exit_if_no_AIs_in_envt_or_if_no_permissions (Scope);
     if (condition) then (yes)
      :Count_AIs (If);
       if (condition) then (yes)
        :Quit_if_no_AIs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_AIs (OpenApiConnection);
     endif
     partition "Get_AIs_and_Exit_if_no_AIs_in_envt_or_if_no_permissions" {
      :Count_AIs (If);
       if (condition) then (yes)
        :Quit_if_no_AIs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_AIs (OpenApiConnection);
     }
    :List_Inventory_AIs (OpenApiConnection);
   }
  :Look_for_AIs_to_Inventory (Scope);
   if (condition) then (yes)
    :Look_for_new_AIs (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       endif
       partition "Get_Inventory__New_AIs" {
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       }
      :Get_Actual__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       endif
       partition "Get_Actual__New_AIs" {
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_AIs" {
      :Get_Inventory__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       endif
       partition "Get_Inventory__New_AIs" {
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       }
      :Get_Actual__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       endif
       partition "Get_Actual__New_AIs" {
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_mda_to_mdasToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_aisToInventory__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_aisToInventory__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_AIs_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :AIsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_AIs_manually_flagged_for_inventory" {
        :AIsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_ais_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         endif
         repeat
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         repeat while (more items)
       endif
       partition "Look_for_ones_modified_since_date" {
        :Get_past_time (Expression);
        :Filter_to_ais_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         endif
         repeat
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         repeat while (more items)
       }
     endif
    :Raw_to_Inventory (Compose);
    :Distinct_to_Inventory (Compose);
   endif
   partition "Look_for_AIs_to_Inventory" {
    :Look_for_new_AIs (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       endif
       partition "Get_Inventory__New_AIs" {
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       }
      :Get_Actual__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       endif
       partition "Get_Actual__New_AIs" {
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_AIs" {
      :Get_Inventory__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       endif
       partition "Get_Inventory__New_AIs" {
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       }
      :Get_Actual__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       endif
       partition "Get_Actual__New_AIs" {
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_mda_to_mdasToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_aisToInventory__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_aisToInventory__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_AIs_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :AIsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_AIs_manually_flagged_for_inventory" {
        :AIsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_ais_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         endif
         repeat
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         repeat while (more items)
       endif
       partition "Look_for_ones_modified_since_date" {
        :Get_past_time (Expression);
        :Filter_to_ais_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         endif
         repeat
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         repeat while (more items)
       }
     endif
    :Raw_to_Inventory (Compose);
    :Distinct_to_Inventory (Compose);
   }
  :Inventory_Ais (Scope);
   if (condition) then (yes)
    :For_each_item_to_inventory (Foreach);
     if (condition) then (yes)
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       }
     endif
     repeat
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       }
     repeat while (more items)
   endif
   partition "Inventory_Ais" {
    :For_each_item_to_inventory (Foreach);
     if (condition) then (yes)
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       }
     endif
     repeat
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       }
     repeat while (more items)
   }
 endif
 partition "Inventory_AI_Models_AIs_for_this_envt" {
  :Get_Basics (Scope);
   if (condition) then (yes)
    :Get_AIs_and_Exit_if_no_AIs_in_envt_or_if_no_permissions (Scope);
     if (condition) then (yes)
      :Count_AIs (If);
       if (condition) then (yes)
        :Quit_if_no_AIs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_AIs (OpenApiConnection);
     endif
     partition "Get_AIs_and_Exit_if_no_AIs_in_envt_or_if_no_permissions" {
      :Count_AIs (If);
       if (condition) then (yes)
        :Quit_if_no_AIs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_AIs (OpenApiConnection);
     }
    :List_Inventory_AIs (OpenApiConnection);
   endif
   partition "Get_Basics" {
    :Get_AIs_and_Exit_if_no_AIs_in_envt_or_if_no_permissions (Scope);
     if (condition) then (yes)
      :Count_AIs (If);
       if (condition) then (yes)
        :Quit_if_no_AIs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_AIs (OpenApiConnection);
     endif
     partition "Get_AIs_and_Exit_if_no_AIs_in_envt_or_if_no_permissions" {
      :Count_AIs (If);
       if (condition) then (yes)
        :Quit_if_no_AIs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_AIs (OpenApiConnection);
     }
    :List_Inventory_AIs (OpenApiConnection);
   }
  :Look_for_AIs_to_Inventory (Scope);
   if (condition) then (yes)
    :Look_for_new_AIs (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       endif
       partition "Get_Inventory__New_AIs" {
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       }
      :Get_Actual__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       endif
       partition "Get_Actual__New_AIs" {
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_AIs" {
      :Get_Inventory__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       endif
       partition "Get_Inventory__New_AIs" {
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       }
      :Get_Actual__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       endif
       partition "Get_Actual__New_AIs" {
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_mda_to_mdasToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_aisToInventory__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_aisToInventory__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_AIs_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :AIsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_AIs_manually_flagged_for_inventory" {
        :AIsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_ais_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         endif
         repeat
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         repeat while (more items)
       endif
       partition "Look_for_ones_modified_since_date" {
        :Get_past_time (Expression);
        :Filter_to_ais_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         endif
         repeat
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         repeat while (more items)
       }
     endif
    :Raw_to_Inventory (Compose);
    :Distinct_to_Inventory (Compose);
   endif
   partition "Look_for_AIs_to_Inventory" {
    :Look_for_new_AIs (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       endif
       partition "Get_Inventory__New_AIs" {
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       }
      :Get_Actual__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       endif
       partition "Get_Actual__New_AIs" {
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_AIs" {
      :Get_Inventory__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       endif
       partition "Get_Inventory__New_AIs" {
        :Select_Inventory__New_AIs (Select);
        :Parse_Inventory__New_AIs (ParseJson);
       }
      :Get_Actual__New_AIs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       endif
       partition "Get_Actual__New_AIs" {
        :Select_Actual__New_AIs (Select);
        :Parse_Actual__New_AIs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__new_ais (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_mda_to_mdasToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_aisToInventory__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_aisToInventory__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_AIs_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :AIsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_AIs_manually_flagged_for_inventory" {
        :AIsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_aisToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_ais_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         endif
         repeat
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         repeat while (more items)
       endif
       partition "Look_for_ones_modified_since_date" {
        :Get_past_time (Expression);
        :Filter_to_ais_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         endif
         repeat
          :Get_AI_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
              :theLastDateModfiedCoE (Compose);
             }
           endif
         repeat while (more items)
       }
     endif
    :Raw_to_Inventory (Compose);
    :Distinct_to_Inventory (Compose);
   }
  :Inventory_Ais (Scope);
   if (condition) then (yes)
    :For_each_item_to_inventory (Foreach);
     if (condition) then (yes)
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       }
     endif
     repeat
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       }
     repeat while (more items)
   endif
   partition "Inventory_Ais" {
    :For_each_item_to_inventory (Foreach);
     if (condition) then (yes)
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       }
     endif
     repeat
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :Get_Owner_Details (Scope);
         if (condition) then (yes)
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         endif
         partition "Get_Owner_Details" {
          :Get_Owner (OpenApiConnection);
          :OwnerID (Compose);
          :See_if_already_in_Maker_Table (OpenApiConnection);
          :If_not_add_them (If);
           if (condition) then (yes)
            :OwnerID_for_Helper (Compose);
            :Maker_Check (Workflow);
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_AI_Builder_Model_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_AI_Builder_Model (OpenApiConnection);
         endif
        :Run_info (Scope);
         if (condition) then (yes)
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         endif
         partition "Run_info" {
          :Get_Ai_Configurations_for_Run_Info (OpenApiConnection);
          :AiModel_LastRun (Compose);
         }
        :Template_info (Scope);
         if (condition) then (yes)
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         endif
         partition "Template_info" {
          :Get_AiModel_Template (OpenApiConnection);
          :TemplateName (Compose);
         }
       }
     repeat while (more items)
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
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| InventoryFilter_DaysToLookBack (admin_InventoryFilter_DaysToLookBack) | Int | 7 | Inventory - When not running a full inventory, we filter back this number of days and then see if the object needs updated in order to save API calls. Default 7 |
| FullInventory (admin_FullInventory) | Bool | - | Inventory - Determines if you want to only update objects that have changed, or all objects. Defaults to No. Switching to Yes will cause the flows to inventory every single app/flow/etc in the tenant and make the flows long running  |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| CoE System User ID (admin_CoESystemUserID) | String | 12c238e6-eea1-ef11-8a69-000d3a5c3575 | in the maker table we store a user for system with an id. Storing here so that it can be referenced without having to look it up all the time. |
| DelayObjectInventory (admin_DelayObjectInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse throttling. Things like solutions, apps, flows, will have delays in the individual envt runs. Default No. |

## Triggers

### When_a_row_is_added_or_modified
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Check_if_AI_Models_can_and_should_be_retrieved_for_this_environment | If | Operation ID: 9b6688e4-c25b-4e40-9deb-fcf181094357 |
| Initialize_aisToInvenotry | InitializeVariable | Operation ID: b133bb41-c98a-45c4-a8f4-fbf40b3c3873 |
| Inventory_AI_Models_(AIs)_for_this_envt | Scope | Operation ID: 7fabdbe3-cca0-4e6b-9f0b-b9ac39bea0b9 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
