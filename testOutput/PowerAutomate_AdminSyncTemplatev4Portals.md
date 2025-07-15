# Power Automate Flow: AdminSyncTemplatev4Portals

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A341FFF
**Source File:** AdminSyncTemplatev4Portals-CEAD57C0-A080-EE11-8179-000D3A341FFF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4Portals
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 4

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4Portals

start
:Trigger: When_a_row_is_added_or_modified (OpenApiConnectionWebhook);\n:Check_if_Portal_can_be_retrieved_for_this_environment (If);
 if (condition) then (yes)
  :Terminate_inquiry_not_supported (Terminate);
 endif
 else (no)
 endif
:Initialize_portalsToInvenotry (InitializeVariable);
:Inventory_Portals_for_this_envt (Scope);
 if (condition) then (yes)
  :Get_Basics (Scope);
   if (condition) then (yes)
    :Get_Portals_and_Exit_if_no_permissions_or_no_portals (Scope);
     if (condition) then (yes)
      :Count_Portals (If);
       if (condition) then (yes)
        :Quit_if_no_Portals (Terminate);
       endif
       else (no)
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_Portals (OpenApiConnection);
      :List_Portal_EDM (OpenApiConnection);
      :SetPortalSourceEDM_or_Standard (SetVariable);
     endif
     partition "Get_Portals_and_Exit_if_no_permissions_or_no_portals" {
      :Count_Portals (If);
       if (condition) then (yes)
        :Quit_if_no_Portals (Terminate);
       endif
       else (no)
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_Portals (OpenApiConnection);
      :List_Portal_EDM (OpenApiConnection);
      :SetPortalSourceEDM_or_Standard (SetVariable);
     }
    :List_Inventory_Portals (OpenApiConnection);
   endif
   partition "Get_Basics" {
    :Get_Portals_and_Exit_if_no_permissions_or_no_portals (Scope);
     if (condition) then (yes)
      :Count_Portals (If);
       if (condition) then (yes)
        :Quit_if_no_Portals (Terminate);
       endif
       else (no)
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_Portals (OpenApiConnection);
      :List_Portal_EDM (OpenApiConnection);
      :SetPortalSourceEDM_or_Standard (SetVariable);
     endif
     partition "Get_Portals_and_Exit_if_no_permissions_or_no_portals" {
      :Count_Portals (If);
       if (condition) then (yes)
        :Quit_if_no_Portals (Terminate);
       endif
       else (no)
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_Portals (OpenApiConnection);
      :List_Portal_EDM (OpenApiConnection);
      :SetPortalSourceEDM_or_Standard (SetVariable);
     }
    :List_Inventory_Portals (OpenApiConnection);
   }
  :Look_for_Portals_to_Inventory (Scope);
   if (condition) then (yes)
    :Look_for_new_Portals (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       endif
       partition "Get_Inventory__New_Portals" {
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       }
      :Get_Actual__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       endif
       partition "Get_Actual__New_Portals" {
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_Portals" {
      :Get_Inventory__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       endif
       partition "Get_Inventory__New_Portals" {
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       }
      :Get_Actual__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       endif
       partition "Get_Actual__New_Portals" {
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_portal_to_portalsToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_portalsToInvenotry__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_portalsToInvenotry__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_portals_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :portalsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_portals_manually_flagged_for_inventory" {
        :portalsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_portals_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         endif
         repeat
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         repeat while (more items)
       endif
       partition "Look_for_ones_modified_since_date" {
        :Get_past_time (Expression);
        :Filter_to_portals_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         endif
         repeat
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         repeat while (more items)
       }
     endif
    :Raw_to_Inventory (Compose);
    :Distinct_to_Inventory (Compose);
   endif
   partition "Look_for_Portals_to_Inventory" {
    :Look_for_new_Portals (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       endif
       partition "Get_Inventory__New_Portals" {
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       }
      :Get_Actual__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       endif
       partition "Get_Actual__New_Portals" {
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_Portals" {
      :Get_Inventory__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       endif
       partition "Get_Inventory__New_Portals" {
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       }
      :Get_Actual__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       endif
       partition "Get_Actual__New_Portals" {
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_portal_to_portalsToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_portalsToInvenotry__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_portalsToInvenotry__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_portals_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :portalsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_portals_manually_flagged_for_inventory" {
        :portalsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_portals_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         endif
         repeat
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         repeat while (more items)
       endif
       partition "Look_for_ones_modified_since_date" {
        :Get_past_time (Expression);
        :Filter_to_portals_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         endif
         repeat
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         repeat while (more items)
       }
     endif
    :Raw_to_Inventory (Compose);
    :Distinct_to_Inventory (Compose);
   }
  :Inventory_Portals (Scope);
   if (condition) then (yes)
    :For_each_item_to_inventory (Foreach);
     if (condition) then (yes)
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       }
     endif
     repeat
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       }
     repeat while (more items)
   endif
   partition "Inventory_Portals" {
    :For_each_item_to_inventory (Foreach);
     if (condition) then (yes)
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       }
     endif
     repeat
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       }
     repeat while (more items)
   }
 endif
 partition "Inventory_Portals_for_this_envt" {
  :Get_Basics (Scope);
   if (condition) then (yes)
    :Get_Portals_and_Exit_if_no_permissions_or_no_portals (Scope);
     if (condition) then (yes)
      :Count_Portals (If);
       if (condition) then (yes)
        :Quit_if_no_Portals (Terminate);
       endif
       else (no)
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_Portals (OpenApiConnection);
      :List_Portal_EDM (OpenApiConnection);
      :SetPortalSourceEDM_or_Standard (SetVariable);
     endif
     partition "Get_Portals_and_Exit_if_no_permissions_or_no_portals" {
      :Count_Portals (If);
       if (condition) then (yes)
        :Quit_if_no_Portals (Terminate);
       endif
       else (no)
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_Portals (OpenApiConnection);
      :List_Portal_EDM (OpenApiConnection);
      :SetPortalSourceEDM_or_Standard (SetVariable);
     }
    :List_Inventory_Portals (OpenApiConnection);
   endif
   partition "Get_Basics" {
    :Get_Portals_and_Exit_if_no_permissions_or_no_portals (Scope);
     if (condition) then (yes)
      :Count_Portals (If);
       if (condition) then (yes)
        :Quit_if_no_Portals (Terminate);
       endif
       else (no)
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_Portals (OpenApiConnection);
      :List_Portal_EDM (OpenApiConnection);
      :SetPortalSourceEDM_or_Standard (SetVariable);
     endif
     partition "Get_Portals_and_Exit_if_no_permissions_or_no_portals" {
      :Count_Portals (If);
       if (condition) then (yes)
        :Quit_if_no_Portals (Terminate);
       endif
       else (no)
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_Portals (OpenApiConnection);
      :List_Portal_EDM (OpenApiConnection);
      :SetPortalSourceEDM_or_Standard (SetVariable);
     }
    :List_Inventory_Portals (OpenApiConnection);
   }
  :Look_for_Portals_to_Inventory (Scope);
   if (condition) then (yes)
    :Look_for_new_Portals (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       endif
       partition "Get_Inventory__New_Portals" {
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       }
      :Get_Actual__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       endif
       partition "Get_Actual__New_Portals" {
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_Portals" {
      :Get_Inventory__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       endif
       partition "Get_Inventory__New_Portals" {
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       }
      :Get_Actual__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       endif
       partition "Get_Actual__New_Portals" {
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_portal_to_portalsToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_portalsToInvenotry__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_portalsToInvenotry__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_portals_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :portalsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_portals_manually_flagged_for_inventory" {
        :portalsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_portals_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         endif
         repeat
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         repeat while (more items)
       endif
       partition "Look_for_ones_modified_since_date" {
        :Get_past_time (Expression);
        :Filter_to_portals_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         endif
         repeat
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         repeat while (more items)
       }
     endif
    :Raw_to_Inventory (Compose);
    :Distinct_to_Inventory (Compose);
   endif
   partition "Look_for_Portals_to_Inventory" {
    :Look_for_new_Portals (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       endif
       partition "Get_Inventory__New_Portals" {
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       }
      :Get_Actual__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       endif
       partition "Get_Actual__New_Portals" {
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_Portals" {
      :Get_Inventory__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       endif
       partition "Get_Inventory__New_Portals" {
        :Select_Inventory__New_Portals (Select);
        :Parse_Inventory__New_Portals (ParseJson);
       }
      :Get_Actual__New_Portals (Scope);
       if (condition) then (yes)
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       endif
       partition "Get_Actual__New_Portals" {
        :Select_Actual__New_Portals (Select);
        :Parse_Actual__New_Portals (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__new_portals (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_portal_to_portalsToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_portalsToInvenotry__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_portalsToInvenotry__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_portals_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :portalsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_portals_manually_flagged_for_inventory" {
        :portalsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_portalsToInvenotry__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_portals_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         endif
         repeat
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         repeat while (more items)
       endif
       partition "Look_for_ones_modified_since_date" {
        :Get_past_time (Expression);
        :Filter_to_portals_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         endif
         repeat
          :Get_Portal_from_Inventory (OpenApiConnection);
          :If_exists_in_inventory (If);
           if (condition) then (yes)
            :see_if_recently_modified (Scope);
             if (condition) then (yes)
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             endif
             partition "see_if_recently_modified" {
              :theLastDateModifiedProduct (Compose);
              :If_modified_add_to_inventory (If);
               if (condition) then (yes)
                :Append_to_array_variable__recently_modified (AppendToArrayVariable);
               endif
               else (no)
               endif
              :theLastDateModifiedCoE (Compose);
             }
           endif
           else (no)
           endif
         repeat while (more items)
       }
     endif
    :Raw_to_Inventory (Compose);
    :Distinct_to_Inventory (Compose);
   }
  :Inventory_Portals (Scope);
   if (condition) then (yes)
    :For_each_item_to_inventory (Foreach);
     if (condition) then (yes)
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       }
     endif
     repeat
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       }
     repeat while (more items)
   endif
   partition "Inventory_Portals" {
    :For_each_item_to_inventory (Foreach);
     if (condition) then (yes)
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       }
     endif
     repeat
      :Get_actual_object (OpenApiConnection);
      :CATCH_Object_no_longer_exists (Compose);
      :Object_Found_so_add_or_update_inventory (Scope);
       if (condition) then (yes)
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
       endif
       partition "Object_Found_so_add_or_update_inventory" {
        :See_if_in_inventory (OpenApiConnection);
        :GUID_to_use (Compose);
        :Site_Settings_Filtering_for_Authentication_Types (Scope);
         if (condition) then (yes)
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         endif
         partition "Site_Settings_Filtering_for_Authentication_Types" {
          :List_Related_Site_Settings_to_the_portal (OpenApiConnection);
          :Filter_array_Return_Local_Auth_Site_Setting (Query);
          :Auth_Local_Authentication_Enabled (Compose);
          :Filter_array_Return_Open_Registration_Enabled_Site_Setting (Query);
          :Auth_Open_Registration_Enabled (Compose);
          :Filter_Array_Return_Local_Registration_Enabled_Site_Setting (Query);
          :Auth_Local_Registration_Enabled (Compose);
          :Filter_Array_Return_Invitation_Enabled_Site_Setting (Query);
          :Auth_Invitation_Enabled (Compose);
          :Filter_Array_Return_External_Identities_Enabled_Site_Setting (Query);
          :Auth_External_Identities_Enabled (Compose);
          :FilterStringForSiteSettings (Compose);
         }
        :Data_Security (Scope);
         if (condition) then (yes)
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         endif
         partition "Data_Security" {
          :List_Related_Entity_Lists_with_Table_Permissions_Disable (OpenApiConnection);
          :List_Related_Basic_Forms_with_Table_Permissions_Disabled (OpenApiConnection);
          :List_Related_Advanced_Forms (OpenApiConnection);
          :Entity_List_Table_Permission_Enabled_Value (Compose);
          :Basic_Form_Table_Permission_Enabled_Value_ (Compose);
          :Apply_to_each_Advanced_Form (Foreach);
           if (condition) then (yes)
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           endif
           repeat
            :AdvancedFormID (Compose);
            :If_found_steps_with_permissions_disabled_set_the_variable_to_true (If);
             if (condition) then (yes)
              :Set_AdvancedFormStepHasTablePermissionsEnabled_false (SetVariable);
             endif
             else (no)
             endif
            :List_Related_Advanced_Form_Steps_with_Table_Permissions_Disabled (OpenApiConnection);
           repeat while (more items)
          :All_Table_Permissions_Enbabled (Compose);
         }
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
           else (no)
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
           else (no)
           endif
          :Get_Maker (OpenApiConnection);
          :catch_for_orphans_no_id (Compose);
          :IsOrphan (Compose);
         }
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_Portal_Orphan (OpenApiConnection);
         endif
         else (no)
          :Upsert_Portal (OpenApiConnection);
         endif
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
:Initialize_variable_AdvancedFormStepHasTablePermissionsEnabled (InitializeVariable);
:Delay_Object_Inventory (If);
 if (condition) then (yes)
  :Delay_1_to_300_minutes (Wait);
 endif
 else (no)
 endif
:varPortalSource (InitializeVariable);

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
| FullInventory (admin_FullInventory) | Bool | True | Inventory - Determines if you want to only update objects that have changed, or all objects. Defaults to No. Switching to Yes will cause the flows to inventory every single app/flow/etc in the tenant and make the flows long running  |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| CoE System User ID (admin_CoESystemUserID) | String | 6f018471-30d7-ef11-8ee9-000d3a328366 | in the maker table we store a user for system with an id. Storing here so that it can be referenced without having to look it up all the time. |
| DelayObjectInventory (admin_DelayObjectInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse throttling. Things like solutions, apps, flows, will have delays in the individual envt runs. Default No. |

## Triggers

### When_a_row_is_added_or_modified
- **Type:** OpenApiConnectionWebhook
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Check_if_Portal_can_be_retrieved_for_this_environment | If | Operation ID: 9b6688e4-c25b-4e40-9deb-fcf181094357 |
| Initialize_portalsToInvenotry | InitializeVariable | Operation ID: b133bb41-c98a-45c4-a8f4-fbf40b3c3873 |
| Inventory_Portals_for_this_envt | Scope | Operation ID: 7fabdbe3-cca0-4e6b-9f0b-b9ac39bea0b9 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_variable_AdvancedFormStepHasTablePermissionsEnabled | InitializeVariable | Operation ID: f1abf91d-ebd9-46e4-abc3-cb6a7ee3350e |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |
| varPortalSource | InitializeVariable | Operation ID: 9b2de0fb-f4b9-44b0-9b83-65d696baa53f |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
