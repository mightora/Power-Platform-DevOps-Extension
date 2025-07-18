# Power Automate Flow: SYNCHELPER-Apps

**Generated on:** 2025-07-15 19:14:49
**Flow ID:** 0022480813FF
**Source File:** SYNCHELPER-Apps-B677AA25-8DE4-ED11-A7C7-0022480813FF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** SYNCHELPER-Apps
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 3
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: SYNCHELPER-Apps

start
:Trigger: manual (Request);\n:Initialize_ActualConnectionsArray (InitializeVariable);
:Initialize_hasBadConnections_to_false (InitializeVariable);
:Inventory_this_app (Scope);
 if (condition) then (yes)
  :App_does_not_exist_in_tenant (Scope);
   if (condition) then (yes)
    :See_if_app_exists_to_mark_deleted (OpenApiConnection);
    :Catch_app_does_not_exist (Compose);
    :App_existed_so_mark_deleted (OpenApiConnection);
   endif
   partition "App_does_not_exist_in_tenant" {
    :See_if_app_exists_to_mark_deleted (OpenApiConnection);
    :Catch_app_does_not_exist (Compose);
    :App_existed_so_mark_deleted (OpenApiConnection);
   }
  :App_exists_in_tenant (Scope);
   if (condition) then (yes)
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_App_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       }
     endif
     partition "Get_Basics" {
      :Get_App_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       }
     }
    :Upsert_App_Details (Scope);
     if (condition) then (yes)
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_App_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_App_record (OpenApiConnection);
       endif
     endif
     partition "Upsert_App_Details" {
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_App_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_App_record (OpenApiConnection);
       endif
     }
    :Get_App_Type (Scope);
     if (condition) then (yes)
      :Switch_App_Type (Switch);
     endif
     partition "Get_App_Type" {
      :Switch_App_Type (Switch);
     }
    :Prepare_Connection_String (Scope);
     if (condition) then (yes)
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_JSON__Connection_References (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
       else (no)
       endif
      :Compose_commaseparated_list_of_connection_references (Compose);
     endif
     partition "Prepare_Connection_String" {
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_JSON__Connection_References (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
       else (no)
       endif
      :Compose_commaseparated_list_of_connection_references (Compose);
     }
    :Check_if_App_Shared_with_Tenant_Editted (Scope);
     if (condition) then (yes)
      :only_if_not_SP_App_Editted (If);
       if (condition) then (yes)
        :Filter_to_tenant (Query);
        :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
       endif
       else (no)
       endif
      :isSharedWithTenant (Compose);
     endif
     partition "Check_if_App_Shared_with_Tenant_Editted" {
      :only_if_not_SP_App_Editted (If);
       if (condition) then (yes)
        :Filter_to_tenant (Query);
        :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
       endif
       else (no)
       endif
      :isSharedWithTenant (Compose);
     }
    :Prepare_for_Connection_References_Table (Scope);
     if (condition) then (yes)
      :Get_Inventory__App_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__App_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__App_Connections (Scope);
       if (condition) then (yes)
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       endif
       partition "Get_Actual__App_Connections" {
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       }
     endif
     partition "Prepare_for_Connection_References_Table" {
      :Get_Inventory__App_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__App_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__App_Connections (Scope);
       if (condition) then (yes)
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       endif
       partition "Get_Actual__App_Connections" {
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       }
     }
    :Get_DLP_Policies_Violated (Scope);
     if (condition) then (yes)
      :If_violated_policies_exist (If);
       if (condition) then (yes)
        :Append_to_violated_policy_array (Foreach);
         if (condition) then (yes)
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         endif
         repeat
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Set_PoliciesViolatedArray_to_empty_array (SetVariable);
       endif
      :ViolatedPoliciesString (Compose);
     endif
     partition "Get_DLP_Policies_Violated" {
      :If_violated_policies_exist (If);
       if (condition) then (yes)
        :Append_to_violated_policy_array (Foreach);
         if (condition) then (yes)
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         endif
         repeat
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Set_PoliciesViolatedArray_to_empty_array (SetVariable);
       endif
      :ViolatedPoliciesString (Compose);
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
    :Implicit_Connections (Scope);
     if (condition) then (yes)
      :has_Shared_Connection (Compose);
      :has_Insecure_Shared_Connection (Compose);
     endif
     partition "Implicit_Connections" {
      :has_Shared_Connection (Compose);
      :has_Insecure_Shared_Connection (Compose);
     }
    :Get_Owner_Details (Scope);
     if (condition) then (yes)
      :If_not_add_them (If);
       if (condition) then (yes)
        :Maker_Check (Workflow);
       endif
       else (no)
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
       else (no)
       endif
      :Get_Maker (OpenApiConnection);
      :catch_for_orphans_no_id (Compose);
      :IsOrphan (Compose);
      :OwnerID (Compose);
      :See_if_already_in_Maker_Table (OpenApiConnection);
     }
    :Quarantine_State (Scope);
     if (condition) then (yes)
      :AppIsQuarantined (Compose);
     endif
     partition "Quarantine_State" {
      :AppIsQuarantined (Compose);
     }
   endif
   partition "App_exists_in_tenant" {
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_App_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       }
     endif
     partition "Get_Basics" {
      :Get_App_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       }
     }
    :Upsert_App_Details (Scope);
     if (condition) then (yes)
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_App_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_App_record (OpenApiConnection);
       endif
     endif
     partition "Upsert_App_Details" {
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_App_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_App_record (OpenApiConnection);
       endif
     }
    :Get_App_Type (Scope);
     if (condition) then (yes)
      :Switch_App_Type (Switch);
     endif
     partition "Get_App_Type" {
      :Switch_App_Type (Switch);
     }
    :Prepare_Connection_String (Scope);
     if (condition) then (yes)
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_JSON__Connection_References (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
       else (no)
       endif
      :Compose_commaseparated_list_of_connection_references (Compose);
     endif
     partition "Prepare_Connection_String" {
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_JSON__Connection_References (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
       else (no)
       endif
      :Compose_commaseparated_list_of_connection_references (Compose);
     }
    :Check_if_App_Shared_with_Tenant_Editted (Scope);
     if (condition) then (yes)
      :only_if_not_SP_App_Editted (If);
       if (condition) then (yes)
        :Filter_to_tenant (Query);
        :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
       endif
       else (no)
       endif
      :isSharedWithTenant (Compose);
     endif
     partition "Check_if_App_Shared_with_Tenant_Editted" {
      :only_if_not_SP_App_Editted (If);
       if (condition) then (yes)
        :Filter_to_tenant (Query);
        :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
       endif
       else (no)
       endif
      :isSharedWithTenant (Compose);
     }
    :Prepare_for_Connection_References_Table (Scope);
     if (condition) then (yes)
      :Get_Inventory__App_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__App_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__App_Connections (Scope);
       if (condition) then (yes)
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       endif
       partition "Get_Actual__App_Connections" {
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       }
     endif
     partition "Prepare_for_Connection_References_Table" {
      :Get_Inventory__App_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__App_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__App_Connections (Scope);
       if (condition) then (yes)
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       endif
       partition "Get_Actual__App_Connections" {
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       }
     }
    :Get_DLP_Policies_Violated (Scope);
     if (condition) then (yes)
      :If_violated_policies_exist (If);
       if (condition) then (yes)
        :Append_to_violated_policy_array (Foreach);
         if (condition) then (yes)
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         endif
         repeat
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Set_PoliciesViolatedArray_to_empty_array (SetVariable);
       endif
      :ViolatedPoliciesString (Compose);
     endif
     partition "Get_DLP_Policies_Violated" {
      :If_violated_policies_exist (If);
       if (condition) then (yes)
        :Append_to_violated_policy_array (Foreach);
         if (condition) then (yes)
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         endif
         repeat
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Set_PoliciesViolatedArray_to_empty_array (SetVariable);
       endif
      :ViolatedPoliciesString (Compose);
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
    :Implicit_Connections (Scope);
     if (condition) then (yes)
      :has_Shared_Connection (Compose);
      :has_Insecure_Shared_Connection (Compose);
     endif
     partition "Implicit_Connections" {
      :has_Shared_Connection (Compose);
      :has_Insecure_Shared_Connection (Compose);
     }
    :Get_Owner_Details (Scope);
     if (condition) then (yes)
      :If_not_add_them (If);
       if (condition) then (yes)
        :Maker_Check (Workflow);
       endif
       else (no)
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
       else (no)
       endif
      :Get_Maker (OpenApiConnection);
      :catch_for_orphans_no_id (Compose);
      :IsOrphan (Compose);
      :OwnerID (Compose);
      :See_if_already_in_Maker_Table (OpenApiConnection);
     }
    :Quarantine_State (Scope);
     if (condition) then (yes)
      :AppIsQuarantined (Compose);
     endif
     partition "Quarantine_State" {
      :AppIsQuarantined (Compose);
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
  :Get_App_as_Admin (OpenApiConnection);
 endif
 partition "Inventory_this_app" {
  :App_does_not_exist_in_tenant (Scope);
   if (condition) then (yes)
    :See_if_app_exists_to_mark_deleted (OpenApiConnection);
    :Catch_app_does_not_exist (Compose);
    :App_existed_so_mark_deleted (OpenApiConnection);
   endif
   partition "App_does_not_exist_in_tenant" {
    :See_if_app_exists_to_mark_deleted (OpenApiConnection);
    :Catch_app_does_not_exist (Compose);
    :App_existed_so_mark_deleted (OpenApiConnection);
   }
  :App_exists_in_tenant (Scope);
   if (condition) then (yes)
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_App_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       }
     endif
     partition "Get_Basics" {
      :Get_App_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       }
     }
    :Upsert_App_Details (Scope);
     if (condition) then (yes)
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_App_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_App_record (OpenApiConnection);
       endif
     endif
     partition "Upsert_App_Details" {
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_App_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_App_record (OpenApiConnection);
       endif
     }
    :Get_App_Type (Scope);
     if (condition) then (yes)
      :Switch_App_Type (Switch);
     endif
     partition "Get_App_Type" {
      :Switch_App_Type (Switch);
     }
    :Prepare_Connection_String (Scope);
     if (condition) then (yes)
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_JSON__Connection_References (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
       else (no)
       endif
      :Compose_commaseparated_list_of_connection_references (Compose);
     endif
     partition "Prepare_Connection_String" {
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_JSON__Connection_References (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
       else (no)
       endif
      :Compose_commaseparated_list_of_connection_references (Compose);
     }
    :Check_if_App_Shared_with_Tenant_Editted (Scope);
     if (condition) then (yes)
      :only_if_not_SP_App_Editted (If);
       if (condition) then (yes)
        :Filter_to_tenant (Query);
        :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
       endif
       else (no)
       endif
      :isSharedWithTenant (Compose);
     endif
     partition "Check_if_App_Shared_with_Tenant_Editted" {
      :only_if_not_SP_App_Editted (If);
       if (condition) then (yes)
        :Filter_to_tenant (Query);
        :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
       endif
       else (no)
       endif
      :isSharedWithTenant (Compose);
     }
    :Prepare_for_Connection_References_Table (Scope);
     if (condition) then (yes)
      :Get_Inventory__App_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__App_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__App_Connections (Scope);
       if (condition) then (yes)
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       endif
       partition "Get_Actual__App_Connections" {
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       }
     endif
     partition "Prepare_for_Connection_References_Table" {
      :Get_Inventory__App_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__App_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__App_Connections (Scope);
       if (condition) then (yes)
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       endif
       partition "Get_Actual__App_Connections" {
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       }
     }
    :Get_DLP_Policies_Violated (Scope);
     if (condition) then (yes)
      :If_violated_policies_exist (If);
       if (condition) then (yes)
        :Append_to_violated_policy_array (Foreach);
         if (condition) then (yes)
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         endif
         repeat
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Set_PoliciesViolatedArray_to_empty_array (SetVariable);
       endif
      :ViolatedPoliciesString (Compose);
     endif
     partition "Get_DLP_Policies_Violated" {
      :If_violated_policies_exist (If);
       if (condition) then (yes)
        :Append_to_violated_policy_array (Foreach);
         if (condition) then (yes)
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         endif
         repeat
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Set_PoliciesViolatedArray_to_empty_array (SetVariable);
       endif
      :ViolatedPoliciesString (Compose);
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
    :Implicit_Connections (Scope);
     if (condition) then (yes)
      :has_Shared_Connection (Compose);
      :has_Insecure_Shared_Connection (Compose);
     endif
     partition "Implicit_Connections" {
      :has_Shared_Connection (Compose);
      :has_Insecure_Shared_Connection (Compose);
     }
    :Get_Owner_Details (Scope);
     if (condition) then (yes)
      :If_not_add_them (If);
       if (condition) then (yes)
        :Maker_Check (Workflow);
       endif
       else (no)
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
       else (no)
       endif
      :Get_Maker (OpenApiConnection);
      :catch_for_orphans_no_id (Compose);
      :IsOrphan (Compose);
      :OwnerID (Compose);
      :See_if_already_in_Maker_Table (OpenApiConnection);
     }
    :Quarantine_State (Scope);
     if (condition) then (yes)
      :AppIsQuarantined (Compose);
     endif
     partition "Quarantine_State" {
      :AppIsQuarantined (Compose);
     }
   endif
   partition "App_exists_in_tenant" {
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_App_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       }
     endif
     partition "Get_Basics" {
      :Get_App_from_Inventory (OpenApiConnection);
      :Catch__new_to_inventory (Compose);
      :Get_Connectors (Scope);
       if (condition) then (yes)
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       endif
       partition "Get_Connectors" {
        :List_Connectors (OpenApiConnection);
        :Specialty_Connectors (Scope);
         if (condition) then (yes)
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         endif
         partition "Specialty_Connectors" {
          :List_Dataverse (OpenApiConnection);
          :GUID_Dataverse (Compose);
          :hasDataverse (Compose);
         }
       }
     }
    :Upsert_App_Details (Scope);
     if (condition) then (yes)
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_App_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_App_record (OpenApiConnection);
       endif
     endif
     partition "Upsert_App_Details" {
      :Check_if_Orphan (If);
       if (condition) then (yes)
        :Upsert_App_record_creator_not_found (OpenApiConnection);
       endif
       else (no)
        :Upsert_App_record (OpenApiConnection);
       endif
     }
    :Get_App_Type (Scope);
     if (condition) then (yes)
      :Switch_App_Type (Switch);
     endif
     partition "Get_App_Type" {
      :Switch_App_Type (Switch);
     }
    :Prepare_Connection_String (Scope);
     if (condition) then (yes)
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_JSON__Connection_References (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
       else (no)
       endif
      :Compose_commaseparated_list_of_connection_references (Compose);
     endif
     partition "Prepare_Connection_String" {
      :check_if_connection_reference_exist (If);
       if (condition) then (yes)
        :Parse_JSON__Connection_References (ParseJson);
        :Select_Connector_Display_Name (Select);
        :Joined_Connectors_String (Compose);
       endif
       else (no)
       endif
      :Compose_commaseparated_list_of_connection_references (Compose);
     }
    :Check_if_App_Shared_with_Tenant_Editted (Scope);
     if (condition) then (yes)
      :only_if_not_SP_App_Editted (If);
       if (condition) then (yes)
        :Filter_to_tenant (Query);
        :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
       endif
       else (no)
       endif
      :isSharedWithTenant (Compose);
     endif
     partition "Check_if_App_Shared_with_Tenant_Editted" {
      :only_if_not_SP_App_Editted (If);
       if (condition) then (yes)
        :Filter_to_tenant (Query);
        :Get_App_Role_Assignments_as_Admin (OpenApiConnection);
       endif
       else (no)
       endif
      :isSharedWithTenant (Compose);
     }
    :Prepare_for_Connection_References_Table (Scope);
     if (condition) then (yes)
      :Get_Inventory__App_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__App_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__App_Connections (Scope);
       if (condition) then (yes)
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       endif
       partition "Get_Actual__App_Connections" {
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       }
     endif
     partition "Prepare_for_Connection_References_Table" {
      :Get_Inventory__App_Connections (Scope);
       if (condition) then (yes)
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       endif
       partition "Get_Inventory__App_Connections" {
        :List_Connection_References_Inventory (OpenApiConnection);
        :Select_Inventory (Select);
        :Parse_Inventory (ParseJson);
       }
      :Get_Actual__App_Connections (Scope);
       if (condition) then (yes)
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       endif
       partition "Get_Actual__App_Connections" {
        :Check_if_App_Connection_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Apply_to_each_Connection_Reference (Foreach);
           if (condition) then (yes)
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           endif
           repeat
            :Connecor_Name (Compose);
            :ConnectorID (Compose);
            :Filter_current_app_Connector (Query);
            :mark_broken_connector_or_insert_connection_reference (If);
             if (condition) then (yes)
              :Append_to_ActualConnectionsArray (AppendToArrayVariable);
             endif
             else (no)
              :Set_hasBadConnections_true (SetVariable);
             endif
            :split_on_slash (Compose);
           repeat while (more items)
          :Filter_id_not_null (Query);
         endif
         else (no)
          :Set_ActualConnectionsArray_to_empty (SetVariable);
         endif
        :Parse_Actual (ParseJson);
        :Check_if_App_Database_References_are_not_null_and_not_BYODL (If);
         if (condition) then (yes)
          :Append_to_ActualConnectionsArray__Dataverse (AppendToArrayVariable);
         endif
         else (no)
         endif
       }
     }
    :Get_DLP_Policies_Violated (Scope);
     if (condition) then (yes)
      :If_violated_policies_exist (If);
       if (condition) then (yes)
        :Append_to_violated_policy_array (Foreach);
         if (condition) then (yes)
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         endif
         repeat
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Set_PoliciesViolatedArray_to_empty_array (SetVariable);
       endif
      :ViolatedPoliciesString (Compose);
     endif
     partition "Get_DLP_Policies_Violated" {
      :If_violated_policies_exist (If);
       if (condition) then (yes)
        :Append_to_violated_policy_array (Foreach);
         if (condition) then (yes)
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         endif
         repeat
          :Append_to_PoliciesViolatedArray (AppendToArrayVariable);
         repeat while (more items)
       endif
       else (no)
        :Set_PoliciesViolatedArray_to_empty_array (SetVariable);
       endif
      :ViolatedPoliciesString (Compose);
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
    :Implicit_Connections (Scope);
     if (condition) then (yes)
      :has_Shared_Connection (Compose);
      :has_Insecure_Shared_Connection (Compose);
     endif
     partition "Implicit_Connections" {
      :has_Shared_Connection (Compose);
      :has_Insecure_Shared_Connection (Compose);
     }
    :Get_Owner_Details (Scope);
     if (condition) then (yes)
      :If_not_add_them (If);
       if (condition) then (yes)
        :Maker_Check (Workflow);
       endif
       else (no)
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
       else (no)
       endif
      :Get_Maker (OpenApiConnection);
      :catch_for_orphans_no_id (Compose);
      :IsOrphan (Compose);
      :OwnerID (Compose);
      :See_if_already_in_Maker_Table (OpenApiConnection);
     }
    :Quarantine_State (Scope);
     if (condition) then (yes)
      :AppIsQuarantined (Compose);
     endif
     partition "Quarantine_State" {
      :AppIsQuarantined (Compose);
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
  :Get_App_as_Admin (OpenApiConnection);
 }
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
:Initialize_AppType_to_Canvas (InitializeVariable);
:Initialize_PoliciesViolatedArray (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_powerappsforadmins | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| CoE System User ID (admin_CoESystemUserID) | String | 6f018471-30d7-ef11-8ee9-000d3a328366 | in the maker table we store a user for system with an id. Storing here so that it can be referenced without having to look it up all the time. |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_ActualConnectionsArray | InitializeVariable | Operation ID: 1f85714b-7529-407c-be12-a2d19ac31d64 |
| Initialize_hasBadConnections_to_false | InitializeVariable | Operation ID: aee9429d-e744-40f0-adb3-f247e40e7694 |
| Inventory_this_app | Scope | Operation ID: 0bd60414-c89a-4af8-aafd-d8c67ce3e992 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initialize_AppType_to_Canvas | InitializeVariable | Operation ID: 2e2f5668-9ded-4b68-b70d-fb96d1aabb91 |
| Initialize_PoliciesViolatedArray | InitializeVariable | Operation ID: 47547832-2485-4f2f-9e50-22756f4a573d |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
