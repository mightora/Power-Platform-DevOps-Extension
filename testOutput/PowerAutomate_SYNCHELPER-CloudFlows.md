# Power Automate Flow: SYNCHELPER-CloudFlows

**Generated on:** 2025-07-15 19:14:49
**Flow ID:** 0022480813FF
**Source File:** SYNCHELPER-CloudFlows-A44274DF-02DA-ED11-A7C7-0022480813FF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** SYNCHELPER-CloudFlows
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 5
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: SYNCHELPER-CloudFlows

start
:Trigger: manual (Request);\n:Initialize_hasBadConnections_to_false (InitializeVariable);
:Initialize_variable_FlowOwnerID (InitializeVariable);
:Inventory_this_flow (Scope);
 if (condition) then (yes)
  :Flow_does_not_exist_in_tenant (Scope);
   if (condition) then (yes)
    :See_if_flow_exists_to_mark_deleted (OpenApiConnection);
    :Catch_flow_does_not_exist (Compose);
    :Flow_existed_so_mark_deleted (OpenApiConnection);
   endif
   partition "Flow_does_not_exist_in_tenant" {
    :See_if_flow_exists_to_mark_deleted (OpenApiConnection);
    :Catch_flow_does_not_exist (Compose);
    :Flow_existed_so_mark_deleted (OpenApiConnection);
   }
  :Flow_exists_in_tenant (Scope);
   if (condition) then (yes)
    :Get_Flow_Owner_Information (Scope);
     if (condition) then (yes)
      :Set_FlowOwnerID_to_Derived_Owner (SetVariable);
      :Get_Owner_Details (Scope);
       if (condition) then (yes)
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       endif
       partition "Get_Owner_Details" {
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       }
      :isSolutionFlow (Compose);
      :if_solution_flow (If);
       if (condition) then (yes)
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Filter_to_owner (Query);
        :if_no_ower_listed (If);
         if (condition) then (yes)
          :Get_actual_object_for_owner (OpenApiConnection);
          :If_owner_listed_in_actual_object (If);
           if (condition) then (yes)
            :Get_owner_from_System_User (OpenApiConnection);
            :Set_FlowOwnerID__SPowned (SetVariable);
           endif
           else (no)
            :Set_FlowOwnerID_to_blank (SetVariable);
           endif
         endif
         else (no)
          :Set_FlowOwnerID__nonSPowned (SetVariable);
         endif
       endif
       else (no)
        :If_DerivedOwner_is_null_set_to_Creator (If);
         if (condition) then (yes)
          :Set_FlowOwnerID_to_Creator (SetVariable);
         endif
       endif
     endif
     partition "Get_Flow_Owner_Information" {
      :Set_FlowOwnerID_to_Derived_Owner (SetVariable);
      :Get_Owner_Details (Scope);
       if (condition) then (yes)
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       endif
       partition "Get_Owner_Details" {
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       }
      :isSolutionFlow (Compose);
      :if_solution_flow (If);
       if (condition) then (yes)
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Filter_to_owner (Query);
        :if_no_ower_listed (If);
         if (condition) then (yes)
          :Get_actual_object_for_owner (OpenApiConnection);
          :If_owner_listed_in_actual_object (If);
           if (condition) then (yes)
            :Get_owner_from_System_User (OpenApiConnection);
            :Set_FlowOwnerID__SPowned (SetVariable);
           endif
           else (no)
            :Set_FlowOwnerID_to_blank (SetVariable);
           endif
         endif
         else (no)
          :Set_FlowOwnerID__nonSPowned (SetVariable);
         endif
       endif
       else (no)
        :If_DerivedOwner_is_null_set_to_Creator (If);
         if (condition) then (yes)
          :Set_FlowOwnerID_to_Creator (SetVariable);
         endif
       endif
     }
    :Upsert_Flow_Details (Scope);
     if (condition) then (yes)
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_Flow_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_Flow_record (OpenApiConnection);
       endif
     endif
     partition "Upsert_Flow_Details" {
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_Flow_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_Flow_record (OpenApiConnection);
       endif
     }
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       }
      :Get_Flow_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
     endif
     partition "Get_Basics" {
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       }
      :Get_Flow_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
     }
    :Prepare_Connection_String (Scope);
     if (condition) then (yes)
      :add_HTTP_Webhook (Compose);
      :add_HTTP (Compose);
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_Connection_JSON (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
      :Select_triggers (Select);
      :add_HTTP_Request (Compose);
      :Compose_edit_comma_separated_connector_list (Compose);
      :add_TeamsWebhook (Compose);
      :Tier (Scope);
       if (condition) then (yes)
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       endif
       partition "Tier" {
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       }
      :Select_type (Select);
     endif
     partition "Prepare_Connection_String" {
      :add_HTTP_Webhook (Compose);
      :add_HTTP (Compose);
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_Connection_JSON (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
      :Select_triggers (Select);
      :add_HTTP_Request (Compose);
      :Compose_edit_comma_separated_connector_list (Compose);
      :add_TeamsWebhook (Compose);
      :Tier (Scope);
       if (condition) then (yes)
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       endif
       partition "Tier" {
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       }
      :Select_type (Select);
     }
    :Prepare_for_Connection_References_Table (Scope);
     if (condition) then (yes)
      :Get_Inventory__Flow_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__Flow_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__Flow_Connections (Scope);
       if (condition) then (yes)
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       endif
       partition "Get_Actual__Flow_Connections" {
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       }
     endif
     partition "Prepare_for_Connection_References_Table" {
      :Get_Inventory__Flow_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__Flow_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__Flow_Connections (Scope);
       if (condition) then (yes)
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       endif
       partition "Get_Actual__Flow_Connections" {
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       }
     }
    :Populate_Connection_References_Table (Scope);
     if (condition) then (yes)
      :If_BYODL (If);
       if (condition) then (yes)
        :Clear_Connection_Reference_Table_if_not_empty (Foreach);
         if (condition) then (yes)
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         endif
         repeat
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         repeat while (more items)
       endif
       else (no)
        :Add_New_Connections (Scope);
         if (condition) then (yes)
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         endif
         partition "Add_New_Connections" {
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         }
        :Remove_Deleted_Connections (Scope);
         if (condition) then (yes)
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Remove_Deleted_Connections" {
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         }
       endif
     endif
     partition "Populate_Connection_References_Table" {
      :If_BYODL (If);
       if (condition) then (yes)
        :Clear_Connection_Reference_Table_if_not_empty (Foreach);
         if (condition) then (yes)
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         endif
         repeat
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         repeat while (more items)
       endif
       else (no)
        :Add_New_Connections (Scope);
         if (condition) then (yes)
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         endif
         partition "Add_New_Connections" {
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         }
        :Remove_Deleted_Connections (Scope);
         if (condition) then (yes)
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Remove_Deleted_Connections" {
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         }
       endif
     }
    :Referenced_Resources (Scope);
     if (condition) then (yes)
      :ReferencedResourcesString (Compose);
      :if_ReferencedResources_is_not_Empty (If);
      :Collect_Services_String (Scope);
       if (condition) then (yes)
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       endif
       partition "Collect_Services_String" {
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       }
      :Collect_Sharepoint_Site_String (Scope);
       if (condition) then (yes)
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       endif
       partition "Collect_Sharepoint_Site_String" {
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       }
      :Collect_Dataverse_Tables_String (Scope);
       if (condition) then (yes)
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       endif
       partition "Collect_Dataverse_Tables_String" {
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       }
     endif
     partition "Referenced_Resources" {
      :ReferencedResourcesString (Compose);
      :if_ReferencedResources_is_not_Empty (If);
      :Collect_Services_String (Scope);
       if (condition) then (yes)
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       endif
       partition "Collect_Services_String" {
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       }
      :Collect_Sharepoint_Site_String (Scope);
       if (condition) then (yes)
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       endif
       partition "Collect_Sharepoint_Site_String" {
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       }
      :Collect_Dataverse_Tables_String (Scope);
       if (condition) then (yes)
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       endif
       partition "Collect_Dataverse_Tables_String" {
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       }
     }
    :Get_Flow_Creator_Information (Scope);
     if (condition) then (yes)
      :If_not_add_creator (If);
       if (condition) then (yes)
        :Maker_Check__Creator (Workflow);
       endif
      :See_if_creator_already_in_Maker_Table (OpenApiConnection);
      :CreatorID (Compose);
      :CreatorID_Validated (Compose);
      :Find_Creator (OpenApiConnection);
     endif
     partition "Get_Flow_Creator_Information" {
      :If_not_add_creator (If);
       if (condition) then (yes)
        :Maker_Check__Creator (Workflow);
       endif
      :See_if_creator_already_in_Maker_Table (OpenApiConnection);
      :CreatorID (Compose);
      :CreatorID_Validated (Compose);
      :Find_Creator (OpenApiConnection);
     }
   endif
   partition "Flow_exists_in_tenant" {
    :Get_Flow_Owner_Information (Scope);
     if (condition) then (yes)
      :Set_FlowOwnerID_to_Derived_Owner (SetVariable);
      :Get_Owner_Details (Scope);
       if (condition) then (yes)
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       endif
       partition "Get_Owner_Details" {
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       }
      :isSolutionFlow (Compose);
      :if_solution_flow (If);
       if (condition) then (yes)
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Filter_to_owner (Query);
        :if_no_ower_listed (If);
         if (condition) then (yes)
          :Get_actual_object_for_owner (OpenApiConnection);
          :If_owner_listed_in_actual_object (If);
           if (condition) then (yes)
            :Get_owner_from_System_User (OpenApiConnection);
            :Set_FlowOwnerID__SPowned (SetVariable);
           endif
           else (no)
            :Set_FlowOwnerID_to_blank (SetVariable);
           endif
         endif
         else (no)
          :Set_FlowOwnerID__nonSPowned (SetVariable);
         endif
       endif
       else (no)
        :If_DerivedOwner_is_null_set_to_Creator (If);
         if (condition) then (yes)
          :Set_FlowOwnerID_to_Creator (SetVariable);
         endif
       endif
     endif
     partition "Get_Flow_Owner_Information" {
      :Set_FlowOwnerID_to_Derived_Owner (SetVariable);
      :Get_Owner_Details (Scope);
       if (condition) then (yes)
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       endif
       partition "Get_Owner_Details" {
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       }
      :isSolutionFlow (Compose);
      :if_solution_flow (If);
       if (condition) then (yes)
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Filter_to_owner (Query);
        :if_no_ower_listed (If);
         if (condition) then (yes)
          :Get_actual_object_for_owner (OpenApiConnection);
          :If_owner_listed_in_actual_object (If);
           if (condition) then (yes)
            :Get_owner_from_System_User (OpenApiConnection);
            :Set_FlowOwnerID__SPowned (SetVariable);
           endif
           else (no)
            :Set_FlowOwnerID_to_blank (SetVariable);
           endif
         endif
         else (no)
          :Set_FlowOwnerID__nonSPowned (SetVariable);
         endif
       endif
       else (no)
        :If_DerivedOwner_is_null_set_to_Creator (If);
         if (condition) then (yes)
          :Set_FlowOwnerID_to_Creator (SetVariable);
         endif
       endif
     }
    :Upsert_Flow_Details (Scope);
     if (condition) then (yes)
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_Flow_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_Flow_record (OpenApiConnection);
       endif
     endif
     partition "Upsert_Flow_Details" {
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_Flow_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_Flow_record (OpenApiConnection);
       endif
     }
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       }
      :Get_Flow_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
     endif
     partition "Get_Basics" {
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       }
      :Get_Flow_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
     }
    :Prepare_Connection_String (Scope);
     if (condition) then (yes)
      :add_HTTP_Webhook (Compose);
      :add_HTTP (Compose);
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_Connection_JSON (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
      :Select_triggers (Select);
      :add_HTTP_Request (Compose);
      :Compose_edit_comma_separated_connector_list (Compose);
      :add_TeamsWebhook (Compose);
      :Tier (Scope);
       if (condition) then (yes)
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       endif
       partition "Tier" {
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       }
      :Select_type (Select);
     endif
     partition "Prepare_Connection_String" {
      :add_HTTP_Webhook (Compose);
      :add_HTTP (Compose);
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_Connection_JSON (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
      :Select_triggers (Select);
      :add_HTTP_Request (Compose);
      :Compose_edit_comma_separated_connector_list (Compose);
      :add_TeamsWebhook (Compose);
      :Tier (Scope);
       if (condition) then (yes)
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       endif
       partition "Tier" {
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       }
      :Select_type (Select);
     }
    :Prepare_for_Connection_References_Table (Scope);
     if (condition) then (yes)
      :Get_Inventory__Flow_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__Flow_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__Flow_Connections (Scope);
       if (condition) then (yes)
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       endif
       partition "Get_Actual__Flow_Connections" {
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       }
     endif
     partition "Prepare_for_Connection_References_Table" {
      :Get_Inventory__Flow_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__Flow_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__Flow_Connections (Scope);
       if (condition) then (yes)
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       endif
       partition "Get_Actual__Flow_Connections" {
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       }
     }
    :Populate_Connection_References_Table (Scope);
     if (condition) then (yes)
      :If_BYODL (If);
       if (condition) then (yes)
        :Clear_Connection_Reference_Table_if_not_empty (Foreach);
         if (condition) then (yes)
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         endif
         repeat
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         repeat while (more items)
       endif
       else (no)
        :Add_New_Connections (Scope);
         if (condition) then (yes)
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         endif
         partition "Add_New_Connections" {
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         }
        :Remove_Deleted_Connections (Scope);
         if (condition) then (yes)
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Remove_Deleted_Connections" {
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         }
       endif
     endif
     partition "Populate_Connection_References_Table" {
      :If_BYODL (If);
       if (condition) then (yes)
        :Clear_Connection_Reference_Table_if_not_empty (Foreach);
         if (condition) then (yes)
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         endif
         repeat
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         repeat while (more items)
       endif
       else (no)
        :Add_New_Connections (Scope);
         if (condition) then (yes)
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         endif
         partition "Add_New_Connections" {
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         }
        :Remove_Deleted_Connections (Scope);
         if (condition) then (yes)
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Remove_Deleted_Connections" {
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         }
       endif
     }
    :Referenced_Resources (Scope);
     if (condition) then (yes)
      :ReferencedResourcesString (Compose);
      :if_ReferencedResources_is_not_Empty (If);
      :Collect_Services_String (Scope);
       if (condition) then (yes)
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       endif
       partition "Collect_Services_String" {
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       }
      :Collect_Sharepoint_Site_String (Scope);
       if (condition) then (yes)
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       endif
       partition "Collect_Sharepoint_Site_String" {
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       }
      :Collect_Dataverse_Tables_String (Scope);
       if (condition) then (yes)
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       endif
       partition "Collect_Dataverse_Tables_String" {
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       }
     endif
     partition "Referenced_Resources" {
      :ReferencedResourcesString (Compose);
      :if_ReferencedResources_is_not_Empty (If);
      :Collect_Services_String (Scope);
       if (condition) then (yes)
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       endif
       partition "Collect_Services_String" {
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       }
      :Collect_Sharepoint_Site_String (Scope);
       if (condition) then (yes)
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       endif
       partition "Collect_Sharepoint_Site_String" {
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       }
      :Collect_Dataverse_Tables_String (Scope);
       if (condition) then (yes)
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       endif
       partition "Collect_Dataverse_Tables_String" {
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       }
     }
    :Get_Flow_Creator_Information (Scope);
     if (condition) then (yes)
      :If_not_add_creator (If);
       if (condition) then (yes)
        :Maker_Check__Creator (Workflow);
       endif
      :See_if_creator_already_in_Maker_Table (OpenApiConnection);
      :CreatorID (Compose);
      :CreatorID_Validated (Compose);
      :Find_Creator (OpenApiConnection);
     endif
     partition "Get_Flow_Creator_Information" {
      :If_not_add_creator (If);
       if (condition) then (yes)
        :Maker_Check__Creator (Workflow);
       endif
      :See_if_creator_already_in_Maker_Table (OpenApiConnection);
      :CreatorID (Compose);
      :CreatorID_Validated (Compose);
      :Find_Creator (OpenApiConnection);
     }
   }
  :Ensure_Envt_Inventoried (Scope);
   if (condition) then (yes)
    :Get_Evnt_Details (OpenApiConnection);
    :Exit_Early_no_envt (Scope);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_true__no_envt (Response);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Exit_Early_no_envt" {
      :Respond_to_a_PowerApp_or_flow_true__no_envt (Response);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
   endif
   partition "Ensure_Envt_Inventoried" {
    :Get_Evnt_Details (OpenApiConnection);
    :Exit_Early_no_envt (Scope);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_true__no_envt (Response);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Exit_Early_no_envt" {
      :Respond_to_a_PowerApp_or_flow_true__no_envt (Response);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
   }
  :Get_Flow_as_Admin (OpenApiConnection);
 endif
 partition "Inventory_this_flow" {
  :Flow_does_not_exist_in_tenant (Scope);
   if (condition) then (yes)
    :See_if_flow_exists_to_mark_deleted (OpenApiConnection);
    :Catch_flow_does_not_exist (Compose);
    :Flow_existed_so_mark_deleted (OpenApiConnection);
   endif
   partition "Flow_does_not_exist_in_tenant" {
    :See_if_flow_exists_to_mark_deleted (OpenApiConnection);
    :Catch_flow_does_not_exist (Compose);
    :Flow_existed_so_mark_deleted (OpenApiConnection);
   }
  :Flow_exists_in_tenant (Scope);
   if (condition) then (yes)
    :Get_Flow_Owner_Information (Scope);
     if (condition) then (yes)
      :Set_FlowOwnerID_to_Derived_Owner (SetVariable);
      :Get_Owner_Details (Scope);
       if (condition) then (yes)
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       endif
       partition "Get_Owner_Details" {
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       }
      :isSolutionFlow (Compose);
      :if_solution_flow (If);
       if (condition) then (yes)
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Filter_to_owner (Query);
        :if_no_ower_listed (If);
         if (condition) then (yes)
          :Get_actual_object_for_owner (OpenApiConnection);
          :If_owner_listed_in_actual_object (If);
           if (condition) then (yes)
            :Get_owner_from_System_User (OpenApiConnection);
            :Set_FlowOwnerID__SPowned (SetVariable);
           endif
           else (no)
            :Set_FlowOwnerID_to_blank (SetVariable);
           endif
         endif
         else (no)
          :Set_FlowOwnerID__nonSPowned (SetVariable);
         endif
       endif
       else (no)
        :If_DerivedOwner_is_null_set_to_Creator (If);
         if (condition) then (yes)
          :Set_FlowOwnerID_to_Creator (SetVariable);
         endif
       endif
     endif
     partition "Get_Flow_Owner_Information" {
      :Set_FlowOwnerID_to_Derived_Owner (SetVariable);
      :Get_Owner_Details (Scope);
       if (condition) then (yes)
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       endif
       partition "Get_Owner_Details" {
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       }
      :isSolutionFlow (Compose);
      :if_solution_flow (If);
       if (condition) then (yes)
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Filter_to_owner (Query);
        :if_no_ower_listed (If);
         if (condition) then (yes)
          :Get_actual_object_for_owner (OpenApiConnection);
          :If_owner_listed_in_actual_object (If);
           if (condition) then (yes)
            :Get_owner_from_System_User (OpenApiConnection);
            :Set_FlowOwnerID__SPowned (SetVariable);
           endif
           else (no)
            :Set_FlowOwnerID_to_blank (SetVariable);
           endif
         endif
         else (no)
          :Set_FlowOwnerID__nonSPowned (SetVariable);
         endif
       endif
       else (no)
        :If_DerivedOwner_is_null_set_to_Creator (If);
         if (condition) then (yes)
          :Set_FlowOwnerID_to_Creator (SetVariable);
         endif
       endif
     }
    :Upsert_Flow_Details (Scope);
     if (condition) then (yes)
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_Flow_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_Flow_record (OpenApiConnection);
       endif
     endif
     partition "Upsert_Flow_Details" {
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_Flow_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_Flow_record (OpenApiConnection);
       endif
     }
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       }
      :Get_Flow_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
     endif
     partition "Get_Basics" {
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       }
      :Get_Flow_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
     }
    :Prepare_Connection_String (Scope);
     if (condition) then (yes)
      :add_HTTP_Webhook (Compose);
      :add_HTTP (Compose);
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_Connection_JSON (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
      :Select_triggers (Select);
      :add_HTTP_Request (Compose);
      :Compose_edit_comma_separated_connector_list (Compose);
      :add_TeamsWebhook (Compose);
      :Tier (Scope);
       if (condition) then (yes)
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       endif
       partition "Tier" {
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       }
      :Select_type (Select);
     endif
     partition "Prepare_Connection_String" {
      :add_HTTP_Webhook (Compose);
      :add_HTTP (Compose);
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_Connection_JSON (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
      :Select_triggers (Select);
      :add_HTTP_Request (Compose);
      :Compose_edit_comma_separated_connector_list (Compose);
      :add_TeamsWebhook (Compose);
      :Tier (Scope);
       if (condition) then (yes)
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       endif
       partition "Tier" {
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       }
      :Select_type (Select);
     }
    :Prepare_for_Connection_References_Table (Scope);
     if (condition) then (yes)
      :Get_Inventory__Flow_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__Flow_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__Flow_Connections (Scope);
       if (condition) then (yes)
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       endif
       partition "Get_Actual__Flow_Connections" {
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       }
     endif
     partition "Prepare_for_Connection_References_Table" {
      :Get_Inventory__Flow_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__Flow_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__Flow_Connections (Scope);
       if (condition) then (yes)
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       endif
       partition "Get_Actual__Flow_Connections" {
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       }
     }
    :Populate_Connection_References_Table (Scope);
     if (condition) then (yes)
      :If_BYODL (If);
       if (condition) then (yes)
        :Clear_Connection_Reference_Table_if_not_empty (Foreach);
         if (condition) then (yes)
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         endif
         repeat
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         repeat while (more items)
       endif
       else (no)
        :Add_New_Connections (Scope);
         if (condition) then (yes)
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         endif
         partition "Add_New_Connections" {
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         }
        :Remove_Deleted_Connections (Scope);
         if (condition) then (yes)
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Remove_Deleted_Connections" {
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         }
       endif
     endif
     partition "Populate_Connection_References_Table" {
      :If_BYODL (If);
       if (condition) then (yes)
        :Clear_Connection_Reference_Table_if_not_empty (Foreach);
         if (condition) then (yes)
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         endif
         repeat
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         repeat while (more items)
       endif
       else (no)
        :Add_New_Connections (Scope);
         if (condition) then (yes)
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         endif
         partition "Add_New_Connections" {
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         }
        :Remove_Deleted_Connections (Scope);
         if (condition) then (yes)
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Remove_Deleted_Connections" {
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         }
       endif
     }
    :Referenced_Resources (Scope);
     if (condition) then (yes)
      :ReferencedResourcesString (Compose);
      :if_ReferencedResources_is_not_Empty (If);
      :Collect_Services_String (Scope);
       if (condition) then (yes)
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       endif
       partition "Collect_Services_String" {
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       }
      :Collect_Sharepoint_Site_String (Scope);
       if (condition) then (yes)
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       endif
       partition "Collect_Sharepoint_Site_String" {
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       }
      :Collect_Dataverse_Tables_String (Scope);
       if (condition) then (yes)
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       endif
       partition "Collect_Dataverse_Tables_String" {
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       }
     endif
     partition "Referenced_Resources" {
      :ReferencedResourcesString (Compose);
      :if_ReferencedResources_is_not_Empty (If);
      :Collect_Services_String (Scope);
       if (condition) then (yes)
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       endif
       partition "Collect_Services_String" {
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       }
      :Collect_Sharepoint_Site_String (Scope);
       if (condition) then (yes)
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       endif
       partition "Collect_Sharepoint_Site_String" {
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       }
      :Collect_Dataverse_Tables_String (Scope);
       if (condition) then (yes)
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       endif
       partition "Collect_Dataverse_Tables_String" {
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       }
     }
    :Get_Flow_Creator_Information (Scope);
     if (condition) then (yes)
      :If_not_add_creator (If);
       if (condition) then (yes)
        :Maker_Check__Creator (Workflow);
       endif
      :See_if_creator_already_in_Maker_Table (OpenApiConnection);
      :CreatorID (Compose);
      :CreatorID_Validated (Compose);
      :Find_Creator (OpenApiConnection);
     endif
     partition "Get_Flow_Creator_Information" {
      :If_not_add_creator (If);
       if (condition) then (yes)
        :Maker_Check__Creator (Workflow);
       endif
      :See_if_creator_already_in_Maker_Table (OpenApiConnection);
      :CreatorID (Compose);
      :CreatorID_Validated (Compose);
      :Find_Creator (OpenApiConnection);
     }
   endif
   partition "Flow_exists_in_tenant" {
    :Get_Flow_Owner_Information (Scope);
     if (condition) then (yes)
      :Set_FlowOwnerID_to_Derived_Owner (SetVariable);
      :Get_Owner_Details (Scope);
       if (condition) then (yes)
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       endif
       partition "Get_Owner_Details" {
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       }
      :isSolutionFlow (Compose);
      :if_solution_flow (If);
       if (condition) then (yes)
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Filter_to_owner (Query);
        :if_no_ower_listed (If);
         if (condition) then (yes)
          :Get_actual_object_for_owner (OpenApiConnection);
          :If_owner_listed_in_actual_object (If);
           if (condition) then (yes)
            :Get_owner_from_System_User (OpenApiConnection);
            :Set_FlowOwnerID__SPowned (SetVariable);
           endif
           else (no)
            :Set_FlowOwnerID_to_blank (SetVariable);
           endif
         endif
         else (no)
          :Set_FlowOwnerID__nonSPowned (SetVariable);
         endif
       endif
       else (no)
        :If_DerivedOwner_is_null_set_to_Creator (If);
         if (condition) then (yes)
          :Set_FlowOwnerID_to_Creator (SetVariable);
         endif
       endif
     endif
     partition "Get_Flow_Owner_Information" {
      :Set_FlowOwnerID_to_Derived_Owner (SetVariable);
      :Get_Owner_Details (Scope);
       if (condition) then (yes)
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       endif
       partition "Get_Owner_Details" {
        :If_not_add_them (If);
         if (condition) then (yes)
          :Maker_Check (Workflow);
         endif
        :Get_Maker (OpenApiConnection);
        :catch_for_orphans_no_id (Compose);
        :IsOrphan (Compose);
        :OwnerID (Compose);
        :See_if_already_in_Maker_Table (OpenApiConnection);
       }
      :isSolutionFlow (Compose);
      :if_solution_flow (If);
       if (condition) then (yes)
        :Get_Flow_Owner_Role_as_Admin (OpenApiConnection);
        :Filter_to_owner (Query);
        :if_no_ower_listed (If);
         if (condition) then (yes)
          :Get_actual_object_for_owner (OpenApiConnection);
          :If_owner_listed_in_actual_object (If);
           if (condition) then (yes)
            :Get_owner_from_System_User (OpenApiConnection);
            :Set_FlowOwnerID__SPowned (SetVariable);
           endif
           else (no)
            :Set_FlowOwnerID_to_blank (SetVariable);
           endif
         endif
         else (no)
          :Set_FlowOwnerID__nonSPowned (SetVariable);
         endif
       endif
       else (no)
        :If_DerivedOwner_is_null_set_to_Creator (If);
         if (condition) then (yes)
          :Set_FlowOwnerID_to_Creator (SetVariable);
         endif
       endif
     }
    :Upsert_Flow_Details (Scope);
     if (condition) then (yes)
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_Flow_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_Flow_record (OpenApiConnection);
       endif
     endif
     partition "Upsert_Flow_Details" {
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_Flow_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_Flow_record (OpenApiConnection);
       endif
     }
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       }
      :Get_Flow_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
     endif
     partition "Get_Basics" {
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Http (OpenApiConnection);
          :List_HttpWebhook (OpenApiConnection);
          :List_HttpRequestReceived (OpenApiConnection);
          :GUID_Http (Compose);
          :GUID_HttpWebhook (Compose);
          :GUID_HttpRequestReceived (Compose);
          :List_TeamsWebhook (OpenApiConnection);
          :GUID_TeamsWebhook (Compose);
         }
       }
      :Get_Flow_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
     }
    :Prepare_Connection_String (Scope);
     if (condition) then (yes)
      :add_HTTP_Webhook (Compose);
      :add_HTTP (Compose);
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_Connection_JSON (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
      :Select_triggers (Select);
      :add_HTTP_Request (Compose);
      :Compose_edit_comma_separated_connector_list (Compose);
      :add_TeamsWebhook (Compose);
      :Tier (Scope);
       if (condition) then (yes)
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       endif
       partition "Tier" {
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       }
      :Select_type (Select);
     endif
     partition "Prepare_Connection_String" {
      :add_HTTP_Webhook (Compose);
      :add_HTTP (Compose);
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_Connection_JSON (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
      :Select_triggers (Select);
      :add_HTTP_Request (Compose);
      :Compose_edit_comma_separated_connector_list (Compose);
      :add_TeamsWebhook (Compose);
      :Tier (Scope);
       if (condition) then (yes)
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       endif
       partition "Tier" {
        :Select_tier (Select);
        :hasPremium (Compose);
        :Filter_to_premium (Query);
       }
      :Select_type (Select);
     }
    :Prepare_for_Connection_References_Table (Scope);
     if (condition) then (yes)
      :Get_Inventory__Flow_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__Flow_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__Flow_Connections (Scope);
       if (condition) then (yes)
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       endif
       partition "Get_Actual__Flow_Connections" {
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       }
     endif
     partition "Prepare_for_Connection_References_Table" {
      :Get_Inventory__Flow_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__Flow_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__Flow_Connections (Scope);
       if (condition) then (yes)
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       endif
       partition "Get_Actual__Flow_Connections" {
        :Check_if_Flow_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Flow_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_flow_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
            :Source (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
          :If_http_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http (AppendToArrayVariable);
           endif
          :If_Http_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_webhook (AppendToArrayVariable);
           endif
          :If_http_request_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__http_request (AppendToArrayVariable);
           endif
          :If_Teams_Webhook_append_to_array (If);
           if (condition) then (yes)
            :Append_to_ActualConnectionsArray__teams_webhook (AppendToArrayVariable);
           endif
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
       }
     }
    :Populate_Connection_References_Table (Scope);
     if (condition) then (yes)
      :If_BYODL (If);
       if (condition) then (yes)
        :Clear_Connection_Reference_Table_if_not_empty (Foreach);
         if (condition) then (yes)
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         endif
         repeat
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         repeat while (more items)
       endif
       else (no)
        :Add_New_Connections (Scope);
         if (condition) then (yes)
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         endif
         partition "Add_New_Connections" {
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         }
        :Remove_Deleted_Connections (Scope);
         if (condition) then (yes)
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Remove_Deleted_Connections" {
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         }
       endif
     endif
     partition "Populate_Connection_References_Table" {
      :If_BYODL (If);
       if (condition) then (yes)
        :Clear_Connection_Reference_Table_if_not_empty (Foreach);
         if (condition) then (yes)
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         endif
         repeat
          :Delete_connection_references_for_BYODL (OpenApiConnection);
         repeat while (more items)
       endif
       else (no)
        :Add_New_Connections (Scope);
         if (condition) then (yes)
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         endif
         partition "Add_New_Connections" {
          :Apply_to_each_new_connection (Foreach);
           if (condition) then (yes)
            :Add_a_new_connection (OpenApiConnection);
           endif
           repeat
            :Add_a_new_connection (OpenApiConnection);
           repeat while (more items)
          :Distinct_Connectors (Compose);
          :Connections_to_Add (Query);
         }
        :Remove_Deleted_Connections (Scope);
         if (condition) then (yes)
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         endif
         partition "Remove_Deleted_Connections" {
          :Connections_to_Remove (Query);
          :Delete_each (Foreach);
           if (condition) then (yes)
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           endif
           repeat
            :Find_it_to_delete (OpenApiConnection);
            :Delete_it (OpenApiConnection);
           repeat while (more items)
         }
       endif
     }
    :Referenced_Resources (Scope);
     if (condition) then (yes)
      :ReferencedResourcesString (Compose);
      :if_ReferencedResources_is_not_Empty (If);
      :Collect_Services_String (Scope);
       if (condition) then (yes)
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       endif
       partition "Collect_Services_String" {
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       }
      :Collect_Sharepoint_Site_String (Scope);
       if (condition) then (yes)
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       endif
       partition "Collect_Sharepoint_Site_String" {
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       }
      :Collect_Dataverse_Tables_String (Scope);
       if (condition) then (yes)
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       endif
       partition "Collect_Dataverse_Tables_String" {
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       }
     endif
     partition "Referenced_Resources" {
      :ReferencedResourcesString (Compose);
      :if_ReferencedResources_is_not_Empty (If);
      :Collect_Services_String (Scope);
       if (condition) then (yes)
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       endif
       partition "Collect_Services_String" {
        :Parse_referencedResources (ParseJson);
        :Select_Services (Select);
        :Joined_Services_String (Compose);
        :Services_String (Compose);
       }
      :Collect_Sharepoint_Site_String (Scope);
       if (condition) then (yes)
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       endif
       partition "Collect_Sharepoint_Site_String" {
        :Filter_to_SP_Services (Query);
        :Select_SP_Resources (Select);
        :Joined_SP_Site_String (Compose);
        :SP_Site_String (Compose);
       }
      :Collect_Dataverse_Tables_String (Scope);
       if (condition) then (yes)
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       endif
       partition "Collect_Dataverse_Tables_String" {
        :Filter_to_CDS_Services (Query);
        :Joined_DV_Table_String (Compose);
        :DV_Table_String (Compose);
        :Select_CDS_Resources (Select);
       }
     }
    :Get_Flow_Creator_Information (Scope);
     if (condition) then (yes)
      :If_not_add_creator (If);
       if (condition) then (yes)
        :Maker_Check__Creator (Workflow);
       endif
      :See_if_creator_already_in_Maker_Table (OpenApiConnection);
      :CreatorID (Compose);
      :CreatorID_Validated (Compose);
      :Find_Creator (OpenApiConnection);
     endif
     partition "Get_Flow_Creator_Information" {
      :If_not_add_creator (If);
       if (condition) then (yes)
        :Maker_Check__Creator (Workflow);
       endif
      :See_if_creator_already_in_Maker_Table (OpenApiConnection);
      :CreatorID (Compose);
      :CreatorID_Validated (Compose);
      :Find_Creator (OpenApiConnection);
     }
   }
  :Ensure_Envt_Inventoried (Scope);
   if (condition) then (yes)
    :Get_Evnt_Details (OpenApiConnection);
    :Exit_Early_no_envt (Scope);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_true__no_envt (Response);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Exit_Early_no_envt" {
      :Respond_to_a_PowerApp_or_flow_true__no_envt (Response);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
   endif
   partition "Ensure_Envt_Inventoried" {
    :Get_Evnt_Details (OpenApiConnection);
    :Exit_Early_no_envt (Scope);
     if (condition) then (yes)
      :Respond_to_a_PowerApp_or_flow_true__no_envt (Response);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     endif
     partition "Exit_Early_no_envt" {
      :Respond_to_a_PowerApp_or_flow_true__no_envt (Response);
      :Terminate_if_envt_does_not_yet_exist (Terminate);
     }
   }
  :Get_Flow_as_Admin (OpenApiConnection);
 }
:Initialize_ActualConnectionsArray (InitializeVariable);
:Error_Handling (Scope);
 if (condition) then (yes)
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow_false (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
 endif
 partition "Error_Handling" {
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow_false (Response);
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow_true (Response);
  :Get_ID_Pass (OpenApiConnection);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow_true (Response);
  :Get_ID_Pass (OpenApiConnection);
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_microsoftflowforadmins | shared_microsoftflowforadmins | admin_CoECorePowerAutomateAdmin | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_flowmanagement_1 | shared_flowmanagement | admin_CoECorePowerAutomateManagement | embedded |

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
| Initialize_hasBadConnections_to_false | InitializeVariable | Operation ID: aee9429d-e744-40f0-adb3-f247e40e7694 |
| Initialize_variable_FlowOwnerID | InitializeVariable | Operation ID: 74890118-f6a1-4c4e-a69f-d69be0aabafc |
| Inventory_this_flow | Scope | Operation ID: 0bd60414-c89a-4af8-aafd-d8c67ce3e992 |
| Initialize_ActualConnectionsArray | InitializeVariable | Operation ID: 1f85714b-7529-407c-be12-a2d19ac31d64 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
