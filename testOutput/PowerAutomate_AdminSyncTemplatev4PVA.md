# Power Automate Flow: AdminSyncTemplatev4PVA

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A341FFF
**Source File:** AdminSyncTemplatev4PVA-F103F6AF-D892-EE11-BE37-000D3A341FFF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4PVA
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 2
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4PVA

start
:Trigger: When_a_row_is_added_or_modified (OpenApiConnectionWebhook);\n:Check_if_PVAs_can_and_should_be_retrieved_for_this_environment (If);
 if (condition) then (yes)
  :Terminate_inquiry_not_supported (Terminate);
 endif
:Initialize_pvasToInvenotry (InitializeVariable);
:Inventory_Bots_PVAs_for_this_envt (Scope);
 if (condition) then (yes)
  :Get_Basics (Scope);
   if (condition) then (yes)
    :Get_PVAs_and_Exit_if_no_PVAs_in_envt_or_if_no_permissions (Scope);
     if (condition) then (yes)
      :Count_PVAs (If);
       if (condition) then (yes)
        :Quit_if_no_PVAs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_PVAs (OpenApiConnection);
     endif
     partition "Get_PVAs_and_Exit_if_no_PVAs_in_envt_or_if_no_permissions" {
      :Count_PVAs (If);
       if (condition) then (yes)
        :Quit_if_no_PVAs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_PVAs (OpenApiConnection);
     }
    :List_Inventory_Bots (OpenApiConnection);
    :Get_PVA_Components_and_Exit_if_no_permissions (Scope);
     if (condition) then (yes)
      :Terminate_if_no_access_components (Terminate);
      :List_Envt_PVA_Components (OpenApiConnection);
     endif
     partition "Get_PVA_Components_and_Exit_if_no_permissions" {
      :Terminate_if_no_access_components (Terminate);
      :List_Envt_PVA_Components (OpenApiConnection);
     }
    :List_Inventory_Components (OpenApiConnection);
    :List_Inventory_Component_Flows (OpenApiConnection);
    :Get_PVA_Component_Flows_and_Exit_if_no_permissions (Scope);
     if (condition) then (yes)
      :Terminate_if_no_access_component_flows (Terminate);
      :List_Envt_PVA_Component_Flows (OpenApiConnection);
     endif
     partition "Get_PVA_Component_Flows_and_Exit_if_no_permissions" {
      :Terminate_if_no_access_component_flows (Terminate);
      :List_Envt_PVA_Component_Flows (OpenApiConnection);
     }
   endif
   partition "Get_Basics" {
    :Get_PVAs_and_Exit_if_no_PVAs_in_envt_or_if_no_permissions (Scope);
     if (condition) then (yes)
      :Count_PVAs (If);
       if (condition) then (yes)
        :Quit_if_no_PVAs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_PVAs (OpenApiConnection);
     endif
     partition "Get_PVAs_and_Exit_if_no_PVAs_in_envt_or_if_no_permissions" {
      :Count_PVAs (If);
       if (condition) then (yes)
        :Quit_if_no_PVAs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_PVAs (OpenApiConnection);
     }
    :List_Inventory_Bots (OpenApiConnection);
    :Get_PVA_Components_and_Exit_if_no_permissions (Scope);
     if (condition) then (yes)
      :Terminate_if_no_access_components (Terminate);
      :List_Envt_PVA_Components (OpenApiConnection);
     endif
     partition "Get_PVA_Components_and_Exit_if_no_permissions" {
      :Terminate_if_no_access_components (Terminate);
      :List_Envt_PVA_Components (OpenApiConnection);
     }
    :List_Inventory_Components (OpenApiConnection);
    :List_Inventory_Component_Flows (OpenApiConnection);
    :Get_PVA_Component_Flows_and_Exit_if_no_permissions (Scope);
     if (condition) then (yes)
      :Terminate_if_no_access_component_flows (Terminate);
      :List_Envt_PVA_Component_Flows (OpenApiConnection);
     endif
     partition "Get_PVA_Component_Flows_and_Exit_if_no_permissions" {
      :Terminate_if_no_access_component_flows (Terminate);
      :List_Envt_PVA_Component_Flows (OpenApiConnection);
     }
   }
  :PVA_Bot_Components (Scope);
   if (condition) then (yes)
    :Added_Components (Scope);
     if (condition) then (yes)
      :AddToInventory_Components (Query);
      :Add_new_Components (Foreach);
       if (condition) then (yes)
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       endif
       repeat
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Added_Components" {
      :AddToInventory_Components (Query);
      :Add_new_Components (Foreach);
       if (condition) then (yes)
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       endif
       repeat
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Get_Actual__PVA_Components (Scope);
     if (condition) then (yes)
      :Parse_Actual__PVA_Components (ParseJson);
      :Select_Actual__PVA_Components (Select);
     endif
     partition "Get_Actual__PVA_Components" {
      :Parse_Actual__PVA_Components (ParseJson);
      :Select_Actual__PVA_Components (Select);
     }
    :Get_Inventory__PVAs_Components (Scope);
     if (condition) then (yes)
      :Select_Inventory__PVA_Components (Select);
      :Parse_Inventory__PVA_Components (ParseJson);
     endif
     partition "Get_Inventory__PVAs_Components" {
      :Select_Inventory__PVA_Components (Select);
      :Parse_Inventory__PVA_Components (ParseJson);
     }
    :Removed_Components (Scope);
     if (condition) then (yes)
      :RemoveFromInventory_Components (Query);
      :Remove_bad_Components (Foreach);
       if (condition) then (yes)
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       endif
       repeat
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Removed_Components" {
      :RemoveFromInventory_Components (Query);
      :Remove_bad_Components (Foreach);
       if (condition) then (yes)
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       endif
       repeat
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Get_Inventory__PVAs_Components_after_update_for_remove (Scope);
     if (condition) then (yes)
      :Parse_Inventory__PVA_Components__after_update (ParseJson);
      :List_Inventory_Components_after_update (OpenApiConnection);
      :Select_Inventory__PVA_Components_after_update (Select);
     endif
     partition "Get_Inventory__PVAs_Components_after_update_for_remove" {
      :Parse_Inventory__PVA_Components__after_update (ParseJson);
      :List_Inventory_Components_after_update (OpenApiConnection);
      :Select_Inventory__PVA_Components_after_update (Select);
     }
   endif
   partition "PVA_Bot_Components" {
    :Added_Components (Scope);
     if (condition) then (yes)
      :AddToInventory_Components (Query);
      :Add_new_Components (Foreach);
       if (condition) then (yes)
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       endif
       repeat
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Added_Components" {
      :AddToInventory_Components (Query);
      :Add_new_Components (Foreach);
       if (condition) then (yes)
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       endif
       repeat
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Get_Actual__PVA_Components (Scope);
     if (condition) then (yes)
      :Parse_Actual__PVA_Components (ParseJson);
      :Select_Actual__PVA_Components (Select);
     endif
     partition "Get_Actual__PVA_Components" {
      :Parse_Actual__PVA_Components (ParseJson);
      :Select_Actual__PVA_Components (Select);
     }
    :Get_Inventory__PVAs_Components (Scope);
     if (condition) then (yes)
      :Select_Inventory__PVA_Components (Select);
      :Parse_Inventory__PVA_Components (ParseJson);
     endif
     partition "Get_Inventory__PVAs_Components" {
      :Select_Inventory__PVA_Components (Select);
      :Parse_Inventory__PVA_Components (ParseJson);
     }
    :Removed_Components (Scope);
     if (condition) then (yes)
      :RemoveFromInventory_Components (Query);
      :Remove_bad_Components (Foreach);
       if (condition) then (yes)
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       endif
       repeat
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Removed_Components" {
      :RemoveFromInventory_Components (Query);
      :Remove_bad_Components (Foreach);
       if (condition) then (yes)
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       endif
       repeat
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Get_Inventory__PVAs_Components_after_update_for_remove (Scope);
     if (condition) then (yes)
      :Parse_Inventory__PVA_Components__after_update (ParseJson);
      :List_Inventory_Components_after_update (OpenApiConnection);
      :Select_Inventory__PVA_Components_after_update (Select);
     endif
     partition "Get_Inventory__PVAs_Components_after_update_for_remove" {
      :Parse_Inventory__PVA_Components__after_update (ParseJson);
      :List_Inventory_Components_after_update (OpenApiConnection);
      :Select_Inventory__PVA_Components_after_update (Select);
     }
   }
  :Look_for_PVAs_to_Inventory (Scope);
   if (condition) then (yes)
    :Look_for_new_PVAs (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       endif
       partition "Get_Inventory__New_PVAs" {
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       }
      :Get_Actual__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       endif
       partition "Get_Actual__New_PVAs" {
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_PVAs" {
      :Get_Inventory__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       endif
       partition "Get_Inventory__New_PVAs" {
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       }
      :Get_Actual__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       endif
       partition "Get_Actual__New_PVAs" {
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_pva_to_pvasToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_pvasToInventory__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_pvasToInventory__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_rpas_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :PVAsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_rpas_manually_flagged_for_inventory" {
        :PVAsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_pvas_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_PVA_from_Inventory (OpenApiConnection);
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
          :Get_PVA_from_Inventory (OpenApiConnection);
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
        :Filter_to_pvas_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_PVA_from_Inventory (OpenApiConnection);
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
          :Get_PVA_from_Inventory (OpenApiConnection);
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
   partition "Look_for_PVAs_to_Inventory" {
    :Look_for_new_PVAs (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       endif
       partition "Get_Inventory__New_PVAs" {
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       }
      :Get_Actual__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       endif
       partition "Get_Actual__New_PVAs" {
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_PVAs" {
      :Get_Inventory__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       endif
       partition "Get_Inventory__New_PVAs" {
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       }
      :Get_Actual__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       endif
       partition "Get_Actual__New_PVAs" {
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_pva_to_pvasToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_pvasToInventory__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_pvasToInventory__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_rpas_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :PVAsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_rpas_manually_flagged_for_inventory" {
        :PVAsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_pvas_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_PVA_from_Inventory (OpenApiConnection);
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
          :Get_PVA_from_Inventory (OpenApiConnection);
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
        :Filter_to_pvas_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_PVA_from_Inventory (OpenApiConnection);
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
          :Get_PVA_from_Inventory (OpenApiConnection);
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
  :Inventory_PVAs (Scope);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         }
       }
     repeat while (more items)
   endif
   partition "Inventory_PVAs" {
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         }
       }
     repeat while (more items)
   }
  :PVA_Flows (Scope);
   if (condition) then (yes)
    :Get_Inventory__PVA_Flows (Scope);
     if (condition) then (yes)
      :Select_Inventory__PVA_Flows (Select);
      :Parse_Inventory__PVA_Flows (ParseJson);
     endif
     partition "Get_Inventory__PVA_Flows" {
      :Select_Inventory__PVA_Flows (Select);
      :Parse_Inventory__PVA_Flows (ParseJson);
     }
    :Get_Actual__PVA_Flows (Scope);
     if (condition) then (yes)
      :Select_Actual__PVA_Flows (Select);
      :Parse_Actual__PVA_Flows (ParseJson);
     endif
     partition "Get_Actual__PVA_Flows" {
      :Select_Actual__PVA_Flows (Select);
      :Parse_Actual__PVA_Flows (ParseJson);
     }
    :Added_Flows (Scope);
     if (condition) then (yes)
      :AddToInventory_Flows (Query);
      :Add_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       endif
       repeat
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       repeat while (more items)
     endif
     partition "Added_Flows" {
      :AddToInventory_Flows (Query);
      :Add_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       endif
       repeat
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       repeat while (more items)
     }
    :Removed_Flows (Scope);
     if (condition) then (yes)
      :RemoveFromInventory_Flows (Query);
      :Remove_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Remove_PVA_Flow (OpenApiConnection);
       endif
       repeat
        :Remove_PVA_Flow (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Removed_Flows" {
      :RemoveFromInventory_Flows (Query);
      :Remove_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Remove_PVA_Flow (OpenApiConnection);
       endif
       repeat
        :Remove_PVA_Flow (OpenApiConnection);
       repeat while (more items)
     }
   endif
   partition "PVA_Flows" {
    :Get_Inventory__PVA_Flows (Scope);
     if (condition) then (yes)
      :Select_Inventory__PVA_Flows (Select);
      :Parse_Inventory__PVA_Flows (ParseJson);
     endif
     partition "Get_Inventory__PVA_Flows" {
      :Select_Inventory__PVA_Flows (Select);
      :Parse_Inventory__PVA_Flows (ParseJson);
     }
    :Get_Actual__PVA_Flows (Scope);
     if (condition) then (yes)
      :Select_Actual__PVA_Flows (Select);
      :Parse_Actual__PVA_Flows (ParseJson);
     endif
     partition "Get_Actual__PVA_Flows" {
      :Select_Actual__PVA_Flows (Select);
      :Parse_Actual__PVA_Flows (ParseJson);
     }
    :Added_Flows (Scope);
     if (condition) then (yes)
      :AddToInventory_Flows (Query);
      :Add_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       endif
       repeat
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       repeat while (more items)
     endif
     partition "Added_Flows" {
      :AddToInventory_Flows (Query);
      :Add_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       endif
       repeat
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       repeat while (more items)
     }
    :Removed_Flows (Scope);
     if (condition) then (yes)
      :RemoveFromInventory_Flows (Query);
      :Remove_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Remove_PVA_Flow (OpenApiConnection);
       endif
       repeat
        :Remove_PVA_Flow (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Removed_Flows" {
      :RemoveFromInventory_Flows (Query);
      :Remove_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Remove_PVA_Flow (OpenApiConnection);
       endif
       repeat
        :Remove_PVA_Flow (OpenApiConnection);
       repeat while (more items)
     }
   }
 endif
 partition "Inventory_Bots_PVAs_for_this_envt" {
  :Get_Basics (Scope);
   if (condition) then (yes)
    :Get_PVAs_and_Exit_if_no_PVAs_in_envt_or_if_no_permissions (Scope);
     if (condition) then (yes)
      :Count_PVAs (If);
       if (condition) then (yes)
        :Quit_if_no_PVAs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_PVAs (OpenApiConnection);
     endif
     partition "Get_PVAs_and_Exit_if_no_PVAs_in_envt_or_if_no_permissions" {
      :Count_PVAs (If);
       if (condition) then (yes)
        :Quit_if_no_PVAs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_PVAs (OpenApiConnection);
     }
    :List_Inventory_Bots (OpenApiConnection);
    :Get_PVA_Components_and_Exit_if_no_permissions (Scope);
     if (condition) then (yes)
      :Terminate_if_no_access_components (Terminate);
      :List_Envt_PVA_Components (OpenApiConnection);
     endif
     partition "Get_PVA_Components_and_Exit_if_no_permissions" {
      :Terminate_if_no_access_components (Terminate);
      :List_Envt_PVA_Components (OpenApiConnection);
     }
    :List_Inventory_Components (OpenApiConnection);
    :List_Inventory_Component_Flows (OpenApiConnection);
    :Get_PVA_Component_Flows_and_Exit_if_no_permissions (Scope);
     if (condition) then (yes)
      :Terminate_if_no_access_component_flows (Terminate);
      :List_Envt_PVA_Component_Flows (OpenApiConnection);
     endif
     partition "Get_PVA_Component_Flows_and_Exit_if_no_permissions" {
      :Terminate_if_no_access_component_flows (Terminate);
      :List_Envt_PVA_Component_Flows (OpenApiConnection);
     }
   endif
   partition "Get_Basics" {
    :Get_PVAs_and_Exit_if_no_PVAs_in_envt_or_if_no_permissions (Scope);
     if (condition) then (yes)
      :Count_PVAs (If);
       if (condition) then (yes)
        :Quit_if_no_PVAs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_PVAs (OpenApiConnection);
     endif
     partition "Get_PVAs_and_Exit_if_no_PVAs_in_envt_or_if_no_permissions" {
      :Count_PVAs (If);
       if (condition) then (yes)
        :Quit_if_no_PVAs (Terminate);
       endif
      :Terminate_if_no_access (Terminate);
      :List_Envt_PVAs (OpenApiConnection);
     }
    :List_Inventory_Bots (OpenApiConnection);
    :Get_PVA_Components_and_Exit_if_no_permissions (Scope);
     if (condition) then (yes)
      :Terminate_if_no_access_components (Terminate);
      :List_Envt_PVA_Components (OpenApiConnection);
     endif
     partition "Get_PVA_Components_and_Exit_if_no_permissions" {
      :Terminate_if_no_access_components (Terminate);
      :List_Envt_PVA_Components (OpenApiConnection);
     }
    :List_Inventory_Components (OpenApiConnection);
    :List_Inventory_Component_Flows (OpenApiConnection);
    :Get_PVA_Component_Flows_and_Exit_if_no_permissions (Scope);
     if (condition) then (yes)
      :Terminate_if_no_access_component_flows (Terminate);
      :List_Envt_PVA_Component_Flows (OpenApiConnection);
     endif
     partition "Get_PVA_Component_Flows_and_Exit_if_no_permissions" {
      :Terminate_if_no_access_component_flows (Terminate);
      :List_Envt_PVA_Component_Flows (OpenApiConnection);
     }
   }
  :PVA_Bot_Components (Scope);
   if (condition) then (yes)
    :Added_Components (Scope);
     if (condition) then (yes)
      :AddToInventory_Components (Query);
      :Add_new_Components (Foreach);
       if (condition) then (yes)
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       endif
       repeat
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Added_Components" {
      :AddToInventory_Components (Query);
      :Add_new_Components (Foreach);
       if (condition) then (yes)
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       endif
       repeat
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Get_Actual__PVA_Components (Scope);
     if (condition) then (yes)
      :Parse_Actual__PVA_Components (ParseJson);
      :Select_Actual__PVA_Components (Select);
     endif
     partition "Get_Actual__PVA_Components" {
      :Parse_Actual__PVA_Components (ParseJson);
      :Select_Actual__PVA_Components (Select);
     }
    :Get_Inventory__PVAs_Components (Scope);
     if (condition) then (yes)
      :Select_Inventory__PVA_Components (Select);
      :Parse_Inventory__PVA_Components (ParseJson);
     endif
     partition "Get_Inventory__PVAs_Components" {
      :Select_Inventory__PVA_Components (Select);
      :Parse_Inventory__PVA_Components (ParseJson);
     }
    :Removed_Components (Scope);
     if (condition) then (yes)
      :RemoveFromInventory_Components (Query);
      :Remove_bad_Components (Foreach);
       if (condition) then (yes)
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       endif
       repeat
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Removed_Components" {
      :RemoveFromInventory_Components (Query);
      :Remove_bad_Components (Foreach);
       if (condition) then (yes)
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       endif
       repeat
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Get_Inventory__PVAs_Components_after_update_for_remove (Scope);
     if (condition) then (yes)
      :Parse_Inventory__PVA_Components__after_update (ParseJson);
      :List_Inventory_Components_after_update (OpenApiConnection);
      :Select_Inventory__PVA_Components_after_update (Select);
     endif
     partition "Get_Inventory__PVAs_Components_after_update_for_remove" {
      :Parse_Inventory__PVA_Components__after_update (ParseJson);
      :List_Inventory_Components_after_update (OpenApiConnection);
      :Select_Inventory__PVA_Components_after_update (Select);
     }
   endif
   partition "PVA_Bot_Components" {
    :Added_Components (Scope);
     if (condition) then (yes)
      :AddToInventory_Components (Query);
      :Add_new_Components (Foreach);
       if (condition) then (yes)
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       endif
       repeat
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Added_Components" {
      :AddToInventory_Components (Query);
      :Add_new_Components (Foreach);
       if (condition) then (yes)
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       endif
       repeat
        :Get_Parent_Bot_ID (Scope);
         if (condition) then (yes)
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         endif
         partition "Get_Parent_Bot_ID" {
          :List_bot_for_a_botcomponent (OpenApiConnection);
          :theBotID (Compose);
          :List_component_with_parent_bot (OpenApiConnection);
          :hasParentBotID (Compose);
         }
        :Get_Component_GUID (Scope);
         if (condition) then (yes)
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         endif
         partition "Get_Component_GUID" {
          :Look_for_PVA_Component_GUID (OpenApiConnection);
          :Component_GUID_to_use (Compose);
         }
        :If_has_Parent_BotID (If);
         if (condition) then (yes)
          :Update_the_component (OpenApiConnection);
         endif
         else (no)
          :Update_the_component_no_bot (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Get_Actual__PVA_Components (Scope);
     if (condition) then (yes)
      :Parse_Actual__PVA_Components (ParseJson);
      :Select_Actual__PVA_Components (Select);
     endif
     partition "Get_Actual__PVA_Components" {
      :Parse_Actual__PVA_Components (ParseJson);
      :Select_Actual__PVA_Components (Select);
     }
    :Get_Inventory__PVAs_Components (Scope);
     if (condition) then (yes)
      :Select_Inventory__PVA_Components (Select);
      :Parse_Inventory__PVA_Components (ParseJson);
     endif
     partition "Get_Inventory__PVAs_Components" {
      :Select_Inventory__PVA_Components (Select);
      :Parse_Inventory__PVA_Components (ParseJson);
     }
    :Removed_Components (Scope);
     if (condition) then (yes)
      :RemoveFromInventory_Components (Query);
      :Remove_bad_Components (Foreach);
       if (condition) then (yes)
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       endif
       repeat
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       repeat while (more items)
     endif
     partition "Removed_Components" {
      :RemoveFromInventory_Components (Query);
      :Remove_bad_Components (Foreach);
       if (condition) then (yes)
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       endif
       repeat
        :Look_for_PVA_Component_GUID_to_remove (OpenApiConnection);
        :Remove_if_found (If);
         if (condition) then (yes)
          :Component_GUID_to_remove (Compose);
          :Delete_PVA_Component (OpenApiConnection);
         endif
       repeat while (more items)
     }
    :Get_Inventory__PVAs_Components_after_update_for_remove (Scope);
     if (condition) then (yes)
      :Parse_Inventory__PVA_Components__after_update (ParseJson);
      :List_Inventory_Components_after_update (OpenApiConnection);
      :Select_Inventory__PVA_Components_after_update (Select);
     endif
     partition "Get_Inventory__PVAs_Components_after_update_for_remove" {
      :Parse_Inventory__PVA_Components__after_update (ParseJson);
      :List_Inventory_Components_after_update (OpenApiConnection);
      :Select_Inventory__PVA_Components_after_update (Select);
     }
   }
  :Look_for_PVAs_to_Inventory (Scope);
   if (condition) then (yes)
    :Look_for_new_PVAs (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       endif
       partition "Get_Inventory__New_PVAs" {
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       }
      :Get_Actual__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       endif
       partition "Get_Actual__New_PVAs" {
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_PVAs" {
      :Get_Inventory__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       endif
       partition "Get_Inventory__New_PVAs" {
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       }
      :Get_Actual__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       endif
       partition "Get_Actual__New_PVAs" {
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_pva_to_pvasToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_pvasToInventory__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_pvasToInventory__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_rpas_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :PVAsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_rpas_manually_flagged_for_inventory" {
        :PVAsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_pvas_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_PVA_from_Inventory (OpenApiConnection);
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
          :Get_PVA_from_Inventory (OpenApiConnection);
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
        :Filter_to_pvas_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_PVA_from_Inventory (OpenApiConnection);
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
          :Get_PVA_from_Inventory (OpenApiConnection);
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
   partition "Look_for_PVAs_to_Inventory" {
    :Look_for_new_PVAs (Scope);
     if (condition) then (yes)
      :Get_Inventory__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       endif
       partition "Get_Inventory__New_PVAs" {
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       }
      :Get_Actual__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       endif
       partition "Get_Actual__New_PVAs" {
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       }
     endif
     partition "Look_for_new_PVAs" {
      :Get_Inventory__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       endif
       partition "Get_Inventory__New_PVAs" {
        :Select_Inventory__New_PVAs (Select);
        :Parse_Inventory__New_PVAs (ParseJson);
       }
      :Get_Actual__New_PVAs (Scope);
       if (condition) then (yes)
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       endif
       partition "Get_Actual__New_PVAs" {
        :Select_Actual__New_PVAs (Select);
        :Parse_Actual__New_PVAs (ParseJson);
       }
      :Add_new_ones_to_inventory_array (Scope);
       if (condition) then (yes)
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Add_new_ones_to_inventory_array" {
        :AddToInventory (Query);
        :Add_new_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__new_pvas (AppendToArrayVariable);
         repeat while (more items)
       }
     }
    :If_full_inventory_run (If);
     if (condition) then (yes)
      :Add_every_inventoried_pva_to_pvasToInventory (Foreach);
       if (condition) then (yes)
        :Append_to_pvasToInventory__full_inventory (AppendToArrayVariable);
       endif
       repeat
        :Append_to_pvasToInventory__full_inventory (AppendToArrayVariable);
       repeat while (more items)
     endif
     else (no)
      :Look_for_rpas_manually_flagged_for_inventory (Scope);
       if (condition) then (yes)
        :PVAsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       endif
       partition "Look_for_rpas_manually_flagged_for_inventory" {
        :PVAsToInventory__ManualRequest (OpenApiConnection);
        :Add_manual_requests_to_array (Foreach);
         if (condition) then (yes)
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         endif
         repeat
          :Append_to_pvasToInventory__Manual_Requests (AppendToArrayVariable);
         repeat while (more items)
       }
      :Look_for_ones_modified_since_date (Scope);
       if (condition) then (yes)
        :Get_past_time (Expression);
        :Filter_to_pvas_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_PVA_from_Inventory (OpenApiConnection);
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
          :Get_PVA_from_Inventory (OpenApiConnection);
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
        :Filter_to_pvas_modified_since_Get_past_time (Query);
        :Add_each_recently_modified_to_array (Foreach);
         if (condition) then (yes)
          :Get_PVA_from_Inventory (OpenApiConnection);
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
          :Get_PVA_from_Inventory (OpenApiConnection);
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
  :Inventory_PVAs (Scope);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         }
       }
     repeat while (more items)
   endif
   partition "Inventory_PVAs" {
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
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
        :Upsert_Record (If);
         if (condition) then (yes)
          :Upsert_PVA_Orphaned (OpenApiConnection);
         endif
         else (no)
          :Upsert_PVA (OpenApiConnection);
         endif
        :Get_Object_for_Deleted_Date (Scope);
         if (condition) then (yes)
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         endif
         partition "Get_Object_for_Deleted_Date" {
          :See_if_exists (OpenApiConnection);
          :PotentialDelDate (Compose);
         }
       }
     repeat while (more items)
   }
  :PVA_Flows (Scope);
   if (condition) then (yes)
    :Get_Inventory__PVA_Flows (Scope);
     if (condition) then (yes)
      :Select_Inventory__PVA_Flows (Select);
      :Parse_Inventory__PVA_Flows (ParseJson);
     endif
     partition "Get_Inventory__PVA_Flows" {
      :Select_Inventory__PVA_Flows (Select);
      :Parse_Inventory__PVA_Flows (ParseJson);
     }
    :Get_Actual__PVA_Flows (Scope);
     if (condition) then (yes)
      :Select_Actual__PVA_Flows (Select);
      :Parse_Actual__PVA_Flows (ParseJson);
     endif
     partition "Get_Actual__PVA_Flows" {
      :Select_Actual__PVA_Flows (Select);
      :Parse_Actual__PVA_Flows (ParseJson);
     }
    :Added_Flows (Scope);
     if (condition) then (yes)
      :AddToInventory_Flows (Query);
      :Add_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       endif
       repeat
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       repeat while (more items)
     endif
     partition "Added_Flows" {
      :AddToInventory_Flows (Query);
      :Add_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       endif
       repeat
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       repeat while (more items)
     }
    :Removed_Flows (Scope);
     if (condition) then (yes)
      :RemoveFromInventory_Flows (Query);
      :Remove_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Remove_PVA_Flow (OpenApiConnection);
       endif
       repeat
        :Remove_PVA_Flow (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Removed_Flows" {
      :RemoveFromInventory_Flows (Query);
      :Remove_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Remove_PVA_Flow (OpenApiConnection);
       endif
       repeat
        :Remove_PVA_Flow (OpenApiConnection);
       repeat while (more items)
     }
   endif
   partition "PVA_Flows" {
    :Get_Inventory__PVA_Flows (Scope);
     if (condition) then (yes)
      :Select_Inventory__PVA_Flows (Select);
      :Parse_Inventory__PVA_Flows (ParseJson);
     endif
     partition "Get_Inventory__PVA_Flows" {
      :Select_Inventory__PVA_Flows (Select);
      :Parse_Inventory__PVA_Flows (ParseJson);
     }
    :Get_Actual__PVA_Flows (Scope);
     if (condition) then (yes)
      :Select_Actual__PVA_Flows (Select);
      :Parse_Actual__PVA_Flows (ParseJson);
     endif
     partition "Get_Actual__PVA_Flows" {
      :Select_Actual__PVA_Flows (Select);
      :Parse_Actual__PVA_Flows (ParseJson);
     }
    :Added_Flows (Scope);
     if (condition) then (yes)
      :AddToInventory_Flows (Query);
      :Add_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       endif
       repeat
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       repeat while (more items)
     endif
     partition "Added_Flows" {
      :AddToInventory_Flows (Query);
      :Add_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       endif
       repeat
        :Get_Flow_from_CoE (Scope);
         if (condition) then (yes)
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         endif
         partition "Get_Flow_from_CoE" {
          :Find_flow_for_GUID (OpenApiConnection);
          :FlowID (Compose);
          :FlowInInventory (Compose);
         }
        :If_flow_found_put_component_flow_in_inventory (If);
         if (condition) then (yes)
          :Add_with_our_without_Bot (If);
           if (condition) then (yes)
            :Upsert_PVA_Component_Flow (OpenApiConnection);
           endif
           else (no)
            :Bot_deleted_so_Bot_Component_no_longer_reliably_present (Compose);
           endif
         endif
         else (no)
          :Flow_not_yet_in_inventory (Compose);
         endif
        :Get_Component_from_CoE (Scope);
         if (condition) then (yes)
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         endif
         partition "Get_Component_from_CoE" {
          :Find_component_for_GUID (OpenApiConnection);
          :ComponentID (Compose);
          :hasBotID (Compose);
          :BotID (Compose);
         }
       repeat while (more items)
     }
    :Removed_Flows (Scope);
     if (condition) then (yes)
      :RemoveFromInventory_Flows (Query);
      :Remove_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Remove_PVA_Flow (OpenApiConnection);
       endif
       repeat
        :Remove_PVA_Flow (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Removed_Flows" {
      :RemoveFromInventory_Flows (Query);
      :Remove_Each_PVA_Flow (Foreach);
       if (condition) then (yes)
        :Remove_PVA_Flow (OpenApiConnection);
       endif
       repeat
        :Remove_PVA_Flow (OpenApiConnection);
       repeat while (more items)
     }
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
| Check_if_PVAs_can_and_should_be_retrieved_for_this_environment | If | Operation ID: 9b6688e4-c25b-4e40-9deb-fcf181094357 |
| Initialize_pvasToInvenotry | InitializeVariable | Operation ID: b133bb41-c98a-45c4-a8f4-fbf40b3c3873 |
| Inventory_Bots_(PVAs)_for_this_envt | Scope | Operation ID: 7fabdbe3-cca0-4e6b-9f0b-b9ac39bea0b9 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Delay_Object_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
