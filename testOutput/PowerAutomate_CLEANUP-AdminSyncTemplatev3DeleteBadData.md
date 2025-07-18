# Power Automate Flow: CLEANUP-AdminSyncTemplatev3DeleteBadData

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 002248237D7D
**Source File:** CLEANUP-AdminSyncTemplatev3DeleteBadData-0D504EE6-70FB-EB11-94EF-002248237D7D.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUP-AdminSyncTemplatev3DeleteBadData
- **Triggers:** 1
- **Actions:** 1 1 1 1
- **Connections:** 7
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUP-AdminSyncTemplatev3DeleteBadData

start
:Trigger: Recurrence (Recurrence);\n:Delete_Bad_Data (Scope);
 if (condition) then (yes)
  :No_Other_Parent_Object (Scope);
   if (condition) then (yes)
    :List_Flow_Actions_with_no_Flow_or_no_Envt (OpenApiConnection);
    :Delete_Flow_Actions_with_no_Flow_or_Envt (Foreach);
     if (condition) then (yes)
      :Delete_flow_action_detail (OpenApiConnection);
     endif
     repeat
      :Delete_flow_action_detail (OpenApiConnection);
     repeat while (more items)
    :List_CoE_Connection_References_with_no_Connection (OpenApiConnection);
    :Delete_CoE_Connection_References_with_no_Connection (Foreach);
     if (condition) then (yes)
      :Delete_connection_reference (OpenApiConnection);
     endif
     repeat
      :Delete_connection_reference (OpenApiConnection);
     repeat while (more items)
    :List_CoE_Connection_References_with_neither_app_nor_flow (OpenApiConnection);
    :Delete_CoE_Connection_References_with_neither_app_nor_flow (Foreach);
     if (condition) then (yes)
      :Delete_connection_reference_2 (OpenApiConnection);
     endif
     repeat
      :Delete_connection_reference_2 (OpenApiConnection);
     repeat while (more items)
    :List_Power_Platform_User_Role_with_no_app_or_flow (OpenApiConnection);
    :Delete_Power_Platform_User_Role_with_no_app_or_flow (Foreach);
     if (condition) then (yes)
      :Delete_Power_Platform_User_Role_without_app_or_flow (OpenApiConnection);
     endif
     repeat
      :Delete_Power_Platform_User_Role_without_app_or_flow (OpenApiConnection);
     repeat while (more items)
    :List_RPA_Sessions_with_no_RPA (OpenApiConnection);
    :Delete_RPA_Sessions_with_no_RPA (Foreach);
     if (condition) then (yes)
      :Delete_RPA_Sessions_without_RPA (OpenApiConnection);
     endif
     repeat
      :Delete_RPA_Sessions_without_RPA (OpenApiConnection);
     repeat while (more items)
    :List_Bots_Components_Flows_with_no_Bot_Envt_or_Flow (OpenApiConnection);
    :Delete_Bots_Components_Flows_with_no_Bot_Envt_or_Flow (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_Flows_without_Bot_Envt_or_Flow (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_Flows_without_Bot_Envt_or_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_no_Creator_or_no_Connector (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_no_Creator_or_Connector (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_no_Creator_or_Connector (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_no_Creator_or_Connector (OpenApiConnection);
     repeat while (more items)
    :List_PVA_Bot_Usage_records_with_no_Bot (OpenApiConnection);
    :Delete_PVA_Bot_Usage_records_with_no_Bot (Foreach);
     if (condition) then (yes)
      :Delete_PVA_Bot_Usage_record_with_no_Bot (OpenApiConnection);
     endif
     repeat
      :Delete_PVA_Bot_Usage_record_with_no_Bot (OpenApiConnection);
     repeat while (more items)
   endif
   partition "No_Other_Parent_Object" {
    :List_Flow_Actions_with_no_Flow_or_no_Envt (OpenApiConnection);
    :Delete_Flow_Actions_with_no_Flow_or_Envt (Foreach);
     if (condition) then (yes)
      :Delete_flow_action_detail (OpenApiConnection);
     endif
     repeat
      :Delete_flow_action_detail (OpenApiConnection);
     repeat while (more items)
    :List_CoE_Connection_References_with_no_Connection (OpenApiConnection);
    :Delete_CoE_Connection_References_with_no_Connection (Foreach);
     if (condition) then (yes)
      :Delete_connection_reference (OpenApiConnection);
     endif
     repeat
      :Delete_connection_reference (OpenApiConnection);
     repeat while (more items)
    :List_CoE_Connection_References_with_neither_app_nor_flow (OpenApiConnection);
    :Delete_CoE_Connection_References_with_neither_app_nor_flow (Foreach);
     if (condition) then (yes)
      :Delete_connection_reference_2 (OpenApiConnection);
     endif
     repeat
      :Delete_connection_reference_2 (OpenApiConnection);
     repeat while (more items)
    :List_Power_Platform_User_Role_with_no_app_or_flow (OpenApiConnection);
    :Delete_Power_Platform_User_Role_with_no_app_or_flow (Foreach);
     if (condition) then (yes)
      :Delete_Power_Platform_User_Role_without_app_or_flow (OpenApiConnection);
     endif
     repeat
      :Delete_Power_Platform_User_Role_without_app_or_flow (OpenApiConnection);
     repeat while (more items)
    :List_RPA_Sessions_with_no_RPA (OpenApiConnection);
    :Delete_RPA_Sessions_with_no_RPA (Foreach);
     if (condition) then (yes)
      :Delete_RPA_Sessions_without_RPA (OpenApiConnection);
     endif
     repeat
      :Delete_RPA_Sessions_without_RPA (OpenApiConnection);
     repeat while (more items)
    :List_Bots_Components_Flows_with_no_Bot_Envt_or_Flow (OpenApiConnection);
    :Delete_Bots_Components_Flows_with_no_Bot_Envt_or_Flow (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_Flows_without_Bot_Envt_or_Flow (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_Flows_without_Bot_Envt_or_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_no_Creator_or_no_Connector (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_no_Creator_or_Connector (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_no_Creator_or_Connector (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_no_Creator_or_Connector (OpenApiConnection);
     repeat while (more items)
    :List_PVA_Bot_Usage_records_with_no_Bot (OpenApiConnection);
    :Delete_PVA_Bot_Usage_records_with_no_Bot (Foreach);
     if (condition) then (yes)
      :Delete_PVA_Bot_Usage_record_with_no_Bot (OpenApiConnection);
     endif
     repeat
      :Delete_PVA_Bot_Usage_record_with_no_Bot (OpenApiConnection);
     repeat while (more items)
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
  :No_Object_Modified_On_Date (Scope);
   if (condition) then (yes)
    :List_Apps_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Apps (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_App (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_App (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Solns (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Soln (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Soln (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_BPFs (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_BPF (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_BPF (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Desktop_Flows (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Desktop_Flow (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Desktop_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Flows (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Flow (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Custom_Connectors (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Custom_Connector (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Custom_Connector (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_no_Modified_Date (OpenApiConnection);
    :List_Bots_Components_with_no_Modified_Date (OpenApiConnection);
    :List_Portals_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Portals (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Portal (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Portal (OpenApiConnection);
     repeat while (more items)
    :Add_Modified_Date_Bots (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Bot (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Bot (OpenApiConnection);
     repeat while (more items)
    :Add_Modified_Date_Bot_Components (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Bot_Component (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Bot_Component (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_AiModels (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_AiModel (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_AiModel (OpenApiConnection);
     repeat while (more items)
   endif
   partition "No_Object_Modified_On_Date" {
    :List_Apps_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Apps (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_App (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_App (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Solns (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Soln (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Soln (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_BPFs (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_BPF (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_BPF (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Desktop_Flows (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Desktop_Flow (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Desktop_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Flows (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Flow (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Custom_Connectors (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Custom_Connector (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Custom_Connector (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_no_Modified_Date (OpenApiConnection);
    :List_Bots_Components_with_no_Modified_Date (OpenApiConnection);
    :List_Portals_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Portals (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Portal (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Portal (OpenApiConnection);
     repeat while (more items)
    :Add_Modified_Date_Bots (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Bot (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Bot (OpenApiConnection);
     repeat while (more items)
    :Add_Modified_Date_Bot_Components (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Bot_Component (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Bot_Component (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_AiModels (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_AiModel (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_AiModel (OpenApiConnection);
     repeat while (more items)
   }
  :Environment_Marked_Excuse_from_Inventory (Scope);
   if (condition) then (yes)
    :List_Apps_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Apps_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_app_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_app_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Solns_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_soln_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_soln_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_BPFs_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_BPF_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_BPF_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Desktop_Flows_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_desktop_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_desktop_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Flows_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Custom_Connections_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_custom_connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_custom_connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Environment_Capacities_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :List_Bots_Components_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :List_Portals_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Portals_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Portal_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Portal_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Bot_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Bot_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Component_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Component_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_AiModels_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_AiModel_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_AiModel_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Environment_Marked_Excuse_from_Inventory" {
    :List_Apps_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Apps_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_app_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_app_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Solns_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_soln_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_soln_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_BPFs_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_BPF_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_BPF_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Desktop_Flows_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_desktop_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_desktop_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Flows_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Custom_Connections_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_custom_connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_custom_connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Environment_Capacities_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :List_Bots_Components_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :List_Portals_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Portals_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Portal_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Portal_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Bot_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Bot_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Component_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Component_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_AiModels_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_AiModel_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_AiModel_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
   }
  :No_Environment (Scope);
   if (condition) then (yes)
    :List_Apps_with_No_Environment (OpenApiConnection);
    :Delete_Apps_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_app_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_app_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_No_Environment (OpenApiConnection);
    :Delete_Solns_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_soln_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_soln_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_No_Environment (OpenApiConnection);
    :Delete_BPFs_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_BPF_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_BPF_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_No_Environment (OpenApiConnection);
    :Delete_Desktop_Flows_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_desktop_flow_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_desktop_flow_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_No_Environment (OpenApiConnection);
    :Delete_Flows_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_flow_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_flow_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_no_Environment (OpenApiConnection);
    :Delete_Custom_Connection_with_no_Environmnet (Foreach);
     if (condition) then (yes)
      :Delete_custom_connection (OpenApiConnection);
     endif
     repeat
      :Delete_custom_connection (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_with_No_Environment (OpenApiConnection);
    :Delete_Environment_Capacities_with_no_Envt (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_No_Environment (OpenApiConnection);
    :List_Bots_Components_with_No_Environment (OpenApiConnection);
    :List_Portals_with_No_Environment (OpenApiConnection);
    :Delete_Portals_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Portals_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Portals_without_Environment (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Bots_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_without_Environment (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_without_Environment (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_No_Environment (OpenApiConnection);
    :Delete_AiModels_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_AiModel_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_AiModel_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
    :Delete_Environment_Security_Role_Permissions_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_No_Environment (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_No_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_No_Environment (OpenApiConnection);
     repeat while (more items)
   endif
   partition "No_Environment" {
    :List_Apps_with_No_Environment (OpenApiConnection);
    :Delete_Apps_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_app_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_app_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_No_Environment (OpenApiConnection);
    :Delete_Solns_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_soln_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_soln_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_No_Environment (OpenApiConnection);
    :Delete_BPFs_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_BPF_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_BPF_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_No_Environment (OpenApiConnection);
    :Delete_Desktop_Flows_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_desktop_flow_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_desktop_flow_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_No_Environment (OpenApiConnection);
    :Delete_Flows_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_flow_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_flow_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_no_Environment (OpenApiConnection);
    :Delete_Custom_Connection_with_no_Environmnet (Foreach);
     if (condition) then (yes)
      :Delete_custom_connection (OpenApiConnection);
     endif
     repeat
      :Delete_custom_connection (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_with_No_Environment (OpenApiConnection);
    :Delete_Environment_Capacities_with_no_Envt (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_No_Environment (OpenApiConnection);
    :List_Bots_Components_with_No_Environment (OpenApiConnection);
    :List_Portals_with_No_Environment (OpenApiConnection);
    :Delete_Portals_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Portals_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Portals_without_Environment (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Bots_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_without_Environment (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_without_Environment (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_No_Environment (OpenApiConnection);
    :Delete_AiModels_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_AiModel_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_AiModel_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
    :Delete_Environment_Security_Role_Permissions_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_No_Environment (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_No_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_No_Environment (OpenApiConnection);
     repeat while (more items)
   }
  :Misc_Cleanup (Scope);
   if (condition) then (yes)
    :Delete_incorrectly_named_specialty_connectors (Foreach);
     if (condition) then (yes)
      :Delete_incorrectly_named_specialty_connector (OpenApiConnection);
     endif
     repeat
      :Delete_incorrectly_named_specialty_connector (OpenApiConnection);
     repeat while (more items)
    :List_environments_without_Excuse_From_Inventory_filled (OpenApiConnection);
    :Update_environments_without_Excuse_From_Inventory_filled (Foreach);
     if (condition) then (yes)
      :Update_to_false_if_isFullTenantInventory_else_true (OpenApiConnection);
     endif
     repeat
      :Update_to_false_if_isFullTenantInventory_else_true (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_of_type_FinOps (OpenApiConnection);
    :Delete_Environment_Capacities_of_type_FinOps (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity_of_type_FinOps (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity_of_type_FinOps (OpenApiConnection);
     repeat while (more items)
    :List_Dev_and_Team_Environment_Capacities_with_Null_Approved_Value (OpenApiConnection);
    :Delete_Dev_and_Team_Environment_Capacities_with_Null_Approved_Value (Foreach);
     if (condition) then (yes)
      :Delete_this_Dev_and_Team_Environment_Capacity_with_Null_Approved_Value (OpenApiConnection);
     endif
     repeat
      :Delete_this_Dev_and_Team_Environment_Capacity_with_Null_Approved_Value (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_No_AccountName (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_No_AccountName (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_No_AccountName (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_No_AccountName (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_No_NonUnique (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_without_NonUnique (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_without_NonUnique (OpenApiConnection);
     repeat while (more items)
    :List_Bots_Components_with_No_NonUnique (OpenApiConnection);
    :List_incorrectly_named_specialty_connectors (OpenApiConnection);
    :List_flows_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
    :Update_flows_with_blank_Contains_Plain_Text_Password (Foreach);
     if (condition) then (yes)
      :Update_flow_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
     endif
     repeat
      :Update_flow_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_without_Unique_Name (OpenApiConnection);
    :Delete_Desktop_Flows_without_Unique_Name (Foreach);
     if (condition) then (yes)
      :Delete_Desktop_Flow_without_Unique_Name (OpenApiConnection);
     endif
     repeat
      :Delete_Desktop_Flow_without_Unique_Name (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Misc_Cleanup" {
    :Delete_incorrectly_named_specialty_connectors (Foreach);
     if (condition) then (yes)
      :Delete_incorrectly_named_specialty_connector (OpenApiConnection);
     endif
     repeat
      :Delete_incorrectly_named_specialty_connector (OpenApiConnection);
     repeat while (more items)
    :List_environments_without_Excuse_From_Inventory_filled (OpenApiConnection);
    :Update_environments_without_Excuse_From_Inventory_filled (Foreach);
     if (condition) then (yes)
      :Update_to_false_if_isFullTenantInventory_else_true (OpenApiConnection);
     endif
     repeat
      :Update_to_false_if_isFullTenantInventory_else_true (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_of_type_FinOps (OpenApiConnection);
    :Delete_Environment_Capacities_of_type_FinOps (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity_of_type_FinOps (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity_of_type_FinOps (OpenApiConnection);
     repeat while (more items)
    :List_Dev_and_Team_Environment_Capacities_with_Null_Approved_Value (OpenApiConnection);
    :Delete_Dev_and_Team_Environment_Capacities_with_Null_Approved_Value (Foreach);
     if (condition) then (yes)
      :Delete_this_Dev_and_Team_Environment_Capacity_with_Null_Approved_Value (OpenApiConnection);
     endif
     repeat
      :Delete_this_Dev_and_Team_Environment_Capacity_with_Null_Approved_Value (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_No_AccountName (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_No_AccountName (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_No_AccountName (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_No_AccountName (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_No_NonUnique (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_without_NonUnique (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_without_NonUnique (OpenApiConnection);
     repeat while (more items)
    :List_Bots_Components_with_No_NonUnique (OpenApiConnection);
    :List_incorrectly_named_specialty_connectors (OpenApiConnection);
    :List_flows_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
    :Update_flows_with_blank_Contains_Plain_Text_Password (Foreach);
     if (condition) then (yes)
      :Update_flow_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
     endif
     repeat
      :Update_flow_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_without_Unique_Name (OpenApiConnection);
    :Delete_Desktop_Flows_without_Unique_Name (Foreach);
     if (condition) then (yes)
      :Delete_Desktop_Flow_without_Unique_Name (OpenApiConnection);
     endif
     repeat
      :Delete_Desktop_Flow_without_Unique_Name (OpenApiConnection);
     repeat while (more items)
   }
  :Force_Invetory (Scope);
   if (condition) then (yes)
    :Implicit_Connections (Scope);
     if (condition) then (yes)
      :Mark_apps_that_might_have_implicit_connetions_as_Inventory_Me (Foreach);
       if (condition) then (yes)
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       endif
       repeat
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       repeat while (more items)
      :List_apps_that_might_have_implicit_connetions (Query);
      :List_apps_that_might_have_implicit_connetions_no_nulls (OpenApiConnection);
     endif
     partition "Implicit_Connections" {
      :Mark_apps_that_might_have_implicit_connetions_as_Inventory_Me (Foreach);
       if (condition) then (yes)
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       endif
       repeat
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       repeat while (more items)
      :List_apps_that_might_have_implicit_connetions (Query);
      :List_apps_that_might_have_implicit_connetions_no_nulls (OpenApiConnection);
     }
    :Mark_List_DesktopFlows_without_state (Foreach);
     if (condition) then (yes)
      :Mark_List_DesktopFlow_without_state (OpenApiConnection);
     endif
     repeat
      :Mark_List_DesktopFlow_without_state (OpenApiConnection);
     repeat while (more items)
    :List_DesktopFlows_without_state (OpenApiConnection);
    :Mark_BPFs_without_status_code_or_state (Foreach);
     if (condition) then (yes)
      :Mark_BPF_without_status_code_or_state (OpenApiConnection);
     endif
     repeat
      :Mark_BPF_without_status_code_or_state (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_without_status_code_or_state (OpenApiConnection);
    :Mark_Ai_Models_without_status_code_or_componentstate_as_old (Foreach);
     if (condition) then (yes)
      :Mark_Ai_Model_without_status_code_or_componentstate_s_old (OpenApiConnection);
     endif
     repeat
      :Mark_Ai_Model_without_status_code_or_componentstate_s_old (OpenApiConnection);
     repeat while (more items)
    :List_Ai_Models_without_status_code_or_componentstate (OpenApiConnection);
    :state_code_v_string (Scope);
     if (condition) then (yes)
      :List_PVA_Bots_without_state (OpenApiConnection);
      :Mark_PVA_Bots_without_state (Foreach);
       if (condition) then (yes)
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       endif
       repeat
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       repeat while (more items)
     endif
     partition "state_code_v_string" {
      :List_PVA_Bots_without_state (OpenApiConnection);
      :Mark_PVA_Bots_without_state (Foreach);
       if (condition) then (yes)
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       endif
       repeat
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       repeat while (more items)
     }
    :List_MDAs_without_logical_name (OpenApiConnection);
    :Mark_MDAs_without_logical_name_as_Inventory_Me (Foreach);
     if (condition) then (yes)
      :Mark_MDA_without_logical_name_as_Inventory_Me (OpenApiConnection);
     endif
     repeat
      :Mark_MDA_without_logical_name_as_Inventory_Me (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Force_Invetory" {
    :Implicit_Connections (Scope);
     if (condition) then (yes)
      :Mark_apps_that_might_have_implicit_connetions_as_Inventory_Me (Foreach);
       if (condition) then (yes)
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       endif
       repeat
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       repeat while (more items)
      :List_apps_that_might_have_implicit_connetions (Query);
      :List_apps_that_might_have_implicit_connetions_no_nulls (OpenApiConnection);
     endif
     partition "Implicit_Connections" {
      :Mark_apps_that_might_have_implicit_connetions_as_Inventory_Me (Foreach);
       if (condition) then (yes)
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       endif
       repeat
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       repeat while (more items)
      :List_apps_that_might_have_implicit_connetions (Query);
      :List_apps_that_might_have_implicit_connetions_no_nulls (OpenApiConnection);
     }
    :Mark_List_DesktopFlows_without_state (Foreach);
     if (condition) then (yes)
      :Mark_List_DesktopFlow_without_state (OpenApiConnection);
     endif
     repeat
      :Mark_List_DesktopFlow_without_state (OpenApiConnection);
     repeat while (more items)
    :List_DesktopFlows_without_state (OpenApiConnection);
    :Mark_BPFs_without_status_code_or_state (Foreach);
     if (condition) then (yes)
      :Mark_BPF_without_status_code_or_state (OpenApiConnection);
     endif
     repeat
      :Mark_BPF_without_status_code_or_state (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_without_status_code_or_state (OpenApiConnection);
    :Mark_Ai_Models_without_status_code_or_componentstate_as_old (Foreach);
     if (condition) then (yes)
      :Mark_Ai_Model_without_status_code_or_componentstate_s_old (OpenApiConnection);
     endif
     repeat
      :Mark_Ai_Model_without_status_code_or_componentstate_s_old (OpenApiConnection);
     repeat while (more items)
    :List_Ai_Models_without_status_code_or_componentstate (OpenApiConnection);
    :state_code_v_string (Scope);
     if (condition) then (yes)
      :List_PVA_Bots_without_state (OpenApiConnection);
      :Mark_PVA_Bots_without_state (Foreach);
       if (condition) then (yes)
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       endif
       repeat
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       repeat while (more items)
     endif
     partition "state_code_v_string" {
      :List_PVA_Bots_without_state (OpenApiConnection);
      :Mark_PVA_Bots_without_state (Foreach);
       if (condition) then (yes)
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       endif
       repeat
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       repeat while (more items)
     }
    :List_MDAs_without_logical_name (OpenApiConnection);
    :Mark_MDAs_without_logical_name_as_Inventory_Me (Foreach);
     if (condition) then (yes)
      :Mark_MDA_without_logical_name_as_Inventory_Me (OpenApiConnection);
     endif
     repeat
      :Mark_MDA_without_logical_name_as_Inventory_Me (OpenApiConnection);
     repeat while (more items)
   }
 endif
 partition "Delete_Bad_Data" {
  :No_Other_Parent_Object (Scope);
   if (condition) then (yes)
    :List_Flow_Actions_with_no_Flow_or_no_Envt (OpenApiConnection);
    :Delete_Flow_Actions_with_no_Flow_or_Envt (Foreach);
     if (condition) then (yes)
      :Delete_flow_action_detail (OpenApiConnection);
     endif
     repeat
      :Delete_flow_action_detail (OpenApiConnection);
     repeat while (more items)
    :List_CoE_Connection_References_with_no_Connection (OpenApiConnection);
    :Delete_CoE_Connection_References_with_no_Connection (Foreach);
     if (condition) then (yes)
      :Delete_connection_reference (OpenApiConnection);
     endif
     repeat
      :Delete_connection_reference (OpenApiConnection);
     repeat while (more items)
    :List_CoE_Connection_References_with_neither_app_nor_flow (OpenApiConnection);
    :Delete_CoE_Connection_References_with_neither_app_nor_flow (Foreach);
     if (condition) then (yes)
      :Delete_connection_reference_2 (OpenApiConnection);
     endif
     repeat
      :Delete_connection_reference_2 (OpenApiConnection);
     repeat while (more items)
    :List_Power_Platform_User_Role_with_no_app_or_flow (OpenApiConnection);
    :Delete_Power_Platform_User_Role_with_no_app_or_flow (Foreach);
     if (condition) then (yes)
      :Delete_Power_Platform_User_Role_without_app_or_flow (OpenApiConnection);
     endif
     repeat
      :Delete_Power_Platform_User_Role_without_app_or_flow (OpenApiConnection);
     repeat while (more items)
    :List_RPA_Sessions_with_no_RPA (OpenApiConnection);
    :Delete_RPA_Sessions_with_no_RPA (Foreach);
     if (condition) then (yes)
      :Delete_RPA_Sessions_without_RPA (OpenApiConnection);
     endif
     repeat
      :Delete_RPA_Sessions_without_RPA (OpenApiConnection);
     repeat while (more items)
    :List_Bots_Components_Flows_with_no_Bot_Envt_or_Flow (OpenApiConnection);
    :Delete_Bots_Components_Flows_with_no_Bot_Envt_or_Flow (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_Flows_without_Bot_Envt_or_Flow (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_Flows_without_Bot_Envt_or_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_no_Creator_or_no_Connector (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_no_Creator_or_Connector (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_no_Creator_or_Connector (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_no_Creator_or_Connector (OpenApiConnection);
     repeat while (more items)
    :List_PVA_Bot_Usage_records_with_no_Bot (OpenApiConnection);
    :Delete_PVA_Bot_Usage_records_with_no_Bot (Foreach);
     if (condition) then (yes)
      :Delete_PVA_Bot_Usage_record_with_no_Bot (OpenApiConnection);
     endif
     repeat
      :Delete_PVA_Bot_Usage_record_with_no_Bot (OpenApiConnection);
     repeat while (more items)
   endif
   partition "No_Other_Parent_Object" {
    :List_Flow_Actions_with_no_Flow_or_no_Envt (OpenApiConnection);
    :Delete_Flow_Actions_with_no_Flow_or_Envt (Foreach);
     if (condition) then (yes)
      :Delete_flow_action_detail (OpenApiConnection);
     endif
     repeat
      :Delete_flow_action_detail (OpenApiConnection);
     repeat while (more items)
    :List_CoE_Connection_References_with_no_Connection (OpenApiConnection);
    :Delete_CoE_Connection_References_with_no_Connection (Foreach);
     if (condition) then (yes)
      :Delete_connection_reference (OpenApiConnection);
     endif
     repeat
      :Delete_connection_reference (OpenApiConnection);
     repeat while (more items)
    :List_CoE_Connection_References_with_neither_app_nor_flow (OpenApiConnection);
    :Delete_CoE_Connection_References_with_neither_app_nor_flow (Foreach);
     if (condition) then (yes)
      :Delete_connection_reference_2 (OpenApiConnection);
     endif
     repeat
      :Delete_connection_reference_2 (OpenApiConnection);
     repeat while (more items)
    :List_Power_Platform_User_Role_with_no_app_or_flow (OpenApiConnection);
    :Delete_Power_Platform_User_Role_with_no_app_or_flow (Foreach);
     if (condition) then (yes)
      :Delete_Power_Platform_User_Role_without_app_or_flow (OpenApiConnection);
     endif
     repeat
      :Delete_Power_Platform_User_Role_without_app_or_flow (OpenApiConnection);
     repeat while (more items)
    :List_RPA_Sessions_with_no_RPA (OpenApiConnection);
    :Delete_RPA_Sessions_with_no_RPA (Foreach);
     if (condition) then (yes)
      :Delete_RPA_Sessions_without_RPA (OpenApiConnection);
     endif
     repeat
      :Delete_RPA_Sessions_without_RPA (OpenApiConnection);
     repeat while (more items)
    :List_Bots_Components_Flows_with_no_Bot_Envt_or_Flow (OpenApiConnection);
    :Delete_Bots_Components_Flows_with_no_Bot_Envt_or_Flow (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_Flows_without_Bot_Envt_or_Flow (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_Flows_without_Bot_Envt_or_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_no_Creator_or_no_Connector (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_no_Creator_or_Connector (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_no_Creator_or_Connector (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_no_Creator_or_Connector (OpenApiConnection);
     repeat while (more items)
    :List_PVA_Bot_Usage_records_with_no_Bot (OpenApiConnection);
    :Delete_PVA_Bot_Usage_records_with_no_Bot (Foreach);
     if (condition) then (yes)
      :Delete_PVA_Bot_Usage_record_with_no_Bot (OpenApiConnection);
     endif
     repeat
      :Delete_PVA_Bot_Usage_record_with_no_Bot (OpenApiConnection);
     repeat while (more items)
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
  :No_Object_Modified_On_Date (Scope);
   if (condition) then (yes)
    :List_Apps_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Apps (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_App (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_App (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Solns (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Soln (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Soln (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_BPFs (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_BPF (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_BPF (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Desktop_Flows (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Desktop_Flow (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Desktop_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Flows (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Flow (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Custom_Connectors (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Custom_Connector (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Custom_Connector (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_no_Modified_Date (OpenApiConnection);
    :List_Bots_Components_with_no_Modified_Date (OpenApiConnection);
    :List_Portals_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Portals (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Portal (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Portal (OpenApiConnection);
     repeat while (more items)
    :Add_Modified_Date_Bots (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Bot (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Bot (OpenApiConnection);
     repeat while (more items)
    :Add_Modified_Date_Bot_Components (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Bot_Component (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Bot_Component (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_AiModels (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_AiModel (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_AiModel (OpenApiConnection);
     repeat while (more items)
   endif
   partition "No_Object_Modified_On_Date" {
    :List_Apps_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Apps (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_App (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_App (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Solns (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Soln (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Soln (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_BPFs (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_BPF (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_BPF (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Desktop_Flows (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Desktop_Flow (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Desktop_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Flows (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Flow (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Flow (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Custom_Connectors (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Custom_Connector (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Custom_Connector (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_no_Modified_Date (OpenApiConnection);
    :List_Bots_Components_with_no_Modified_Date (OpenApiConnection);
    :List_Portals_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_Portals (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Portal (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Portal (OpenApiConnection);
     repeat while (more items)
    :Add_Modified_Date_Bots (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Bot (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Bot (OpenApiConnection);
     repeat while (more items)
    :Add_Modified_Date_Bot_Components (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_Bot_Component (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_Bot_Component (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_no_Modified_Date (OpenApiConnection);
    :Add_Modified_Date_AiModels (Foreach);
     if (condition) then (yes)
      :Add_Modified_Date_AiModel (OpenApiConnection);
     endif
     repeat
      :Add_Modified_Date_AiModel (OpenApiConnection);
     repeat while (more items)
   }
  :Environment_Marked_Excuse_from_Inventory (Scope);
   if (condition) then (yes)
    :List_Apps_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Apps_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_app_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_app_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Solns_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_soln_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_soln_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_BPFs_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_BPF_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_BPF_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Desktop_Flows_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_desktop_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_desktop_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Flows_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Custom_Connections_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_custom_connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_custom_connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Environment_Capacities_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :List_Bots_Components_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :List_Portals_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Portals_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Portal_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Portal_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Bot_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Bot_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Component_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Component_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_AiModels_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_AiModel_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_AiModel_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Environment_Marked_Excuse_from_Inventory" {
    :List_Apps_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Apps_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_app_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_app_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Solns_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_soln_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_soln_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_BPFs_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_BPF_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_BPF_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Desktop_Flows_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_desktop_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_desktop_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Flows_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_flow_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Custom_Connections_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_custom_connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_custom_connection_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Environment_Capacities_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :List_Bots_Components_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :List_Portals_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_Portals_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Portal_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Portal_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Bot_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Bot_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Component_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Component_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
    :Delete_AiModels_with_Environment_Marked_Excuse_from_Inventory (Foreach);
     if (condition) then (yes)
      :Delete_AiModel_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     endif
     repeat
      :Delete_AiModel_with_Environment_Marked_Excuse_from_Inventory (OpenApiConnection);
     repeat while (more items)
   }
  :No_Environment (Scope);
   if (condition) then (yes)
    :List_Apps_with_No_Environment (OpenApiConnection);
    :Delete_Apps_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_app_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_app_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_No_Environment (OpenApiConnection);
    :Delete_Solns_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_soln_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_soln_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_No_Environment (OpenApiConnection);
    :Delete_BPFs_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_BPF_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_BPF_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_No_Environment (OpenApiConnection);
    :Delete_Desktop_Flows_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_desktop_flow_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_desktop_flow_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_No_Environment (OpenApiConnection);
    :Delete_Flows_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_flow_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_flow_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_no_Environment (OpenApiConnection);
    :Delete_Custom_Connection_with_no_Environmnet (Foreach);
     if (condition) then (yes)
      :Delete_custom_connection (OpenApiConnection);
     endif
     repeat
      :Delete_custom_connection (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_with_No_Environment (OpenApiConnection);
    :Delete_Environment_Capacities_with_no_Envt (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_No_Environment (OpenApiConnection);
    :List_Bots_Components_with_No_Environment (OpenApiConnection);
    :List_Portals_with_No_Environment (OpenApiConnection);
    :Delete_Portals_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Portals_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Portals_without_Environment (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Bots_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_without_Environment (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_without_Environment (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_No_Environment (OpenApiConnection);
    :Delete_AiModels_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_AiModel_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_AiModel_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
    :Delete_Environment_Security_Role_Permissions_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_No_Environment (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_No_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_No_Environment (OpenApiConnection);
     repeat while (more items)
   endif
   partition "No_Environment" {
    :List_Apps_with_No_Environment (OpenApiConnection);
    :Delete_Apps_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_app_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_app_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Solns_with_No_Environment (OpenApiConnection);
    :Delete_Solns_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_soln_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_soln_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_with_No_Environment (OpenApiConnection);
    :Delete_BPFs_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_BPF_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_BPF_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_with_No_Environment (OpenApiConnection);
    :Delete_Desktop_Flows_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_desktop_flow_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_desktop_flow_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Flow_with_No_Environment (OpenApiConnection);
    :Delete_Flows_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_flow_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_flow_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Custom_Connection_with_no_Environment (OpenApiConnection);
    :Delete_Custom_Connection_with_no_Environmnet (Foreach);
     if (condition) then (yes)
      :Delete_custom_connection (OpenApiConnection);
     endif
     repeat
      :Delete_custom_connection (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_with_No_Environment (OpenApiConnection);
    :Delete_Environment_Capacities_with_no_Envt (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity (OpenApiConnection);
     repeat while (more items)
    :List_Bots_with_No_Environment (OpenApiConnection);
    :List_Bots_Components_with_No_Environment (OpenApiConnection);
    :List_Portals_with_No_Environment (OpenApiConnection);
    :Delete_Portals_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Portals_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Portals_without_Environment (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Bots_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_without_Environment (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_without_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_without_Environment (OpenApiConnection);
     repeat while (more items)
    :List_AiModels_with_No_Environment (OpenApiConnection);
    :Delete_AiModels_without_Environments (Foreach);
     if (condition) then (yes)
      :Delete_AiModel_without_environment (OpenApiConnection);
     endif
     repeat
      :Delete_AiModel_without_environment (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
    :Delete_Environment_Security_Role_Permissions_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Security_Role_Permission_with_No_Environment (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_No_Environment (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_No_Environment (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_No_Environment (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_No_Environment (OpenApiConnection);
     repeat while (more items)
   }
  :Misc_Cleanup (Scope);
   if (condition) then (yes)
    :Delete_incorrectly_named_specialty_connectors (Foreach);
     if (condition) then (yes)
      :Delete_incorrectly_named_specialty_connector (OpenApiConnection);
     endif
     repeat
      :Delete_incorrectly_named_specialty_connector (OpenApiConnection);
     repeat while (more items)
    :List_environments_without_Excuse_From_Inventory_filled (OpenApiConnection);
    :Update_environments_without_Excuse_From_Inventory_filled (Foreach);
     if (condition) then (yes)
      :Update_to_false_if_isFullTenantInventory_else_true (OpenApiConnection);
     endif
     repeat
      :Update_to_false_if_isFullTenantInventory_else_true (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_of_type_FinOps (OpenApiConnection);
    :Delete_Environment_Capacities_of_type_FinOps (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity_of_type_FinOps (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity_of_type_FinOps (OpenApiConnection);
     repeat while (more items)
    :List_Dev_and_Team_Environment_Capacities_with_Null_Approved_Value (OpenApiConnection);
    :Delete_Dev_and_Team_Environment_Capacities_with_Null_Approved_Value (Foreach);
     if (condition) then (yes)
      :Delete_this_Dev_and_Team_Environment_Capacity_with_Null_Approved_Value (OpenApiConnection);
     endif
     repeat
      :Delete_this_Dev_and_Team_Environment_Capacity_with_Null_Approved_Value (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_No_AccountName (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_No_AccountName (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_No_AccountName (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_No_AccountName (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_No_NonUnique (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_without_NonUnique (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_without_NonUnique (OpenApiConnection);
     repeat while (more items)
    :List_Bots_Components_with_No_NonUnique (OpenApiConnection);
    :List_incorrectly_named_specialty_connectors (OpenApiConnection);
    :List_flows_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
    :Update_flows_with_blank_Contains_Plain_Text_Password (Foreach);
     if (condition) then (yes)
      :Update_flow_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
     endif
     repeat
      :Update_flow_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_without_Unique_Name (OpenApiConnection);
    :Delete_Desktop_Flows_without_Unique_Name (Foreach);
     if (condition) then (yes)
      :Delete_Desktop_Flow_without_Unique_Name (OpenApiConnection);
     endif
     repeat
      :Delete_Desktop_Flow_without_Unique_Name (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Misc_Cleanup" {
    :Delete_incorrectly_named_specialty_connectors (Foreach);
     if (condition) then (yes)
      :Delete_incorrectly_named_specialty_connector (OpenApiConnection);
     endif
     repeat
      :Delete_incorrectly_named_specialty_connector (OpenApiConnection);
     repeat while (more items)
    :List_environments_without_Excuse_From_Inventory_filled (OpenApiConnection);
    :Update_environments_without_Excuse_From_Inventory_filled (Foreach);
     if (condition) then (yes)
      :Update_to_false_if_isFullTenantInventory_else_true (OpenApiConnection);
     endif
     repeat
      :Update_to_false_if_isFullTenantInventory_else_true (OpenApiConnection);
     repeat while (more items)
    :List_Environment_Capacities_of_type_FinOps (OpenApiConnection);
    :Delete_Environment_Capacities_of_type_FinOps (Foreach);
     if (condition) then (yes)
      :Delete_Environment_Capacity_of_type_FinOps (OpenApiConnection);
     endif
     repeat
      :Delete_Environment_Capacity_of_type_FinOps (OpenApiConnection);
     repeat while (more items)
    :List_Dev_and_Team_Environment_Capacities_with_Null_Approved_Value (OpenApiConnection);
    :Delete_Dev_and_Team_Environment_Capacities_with_Null_Approved_Value (Foreach);
     if (condition) then (yes)
      :Delete_this_Dev_and_Team_Environment_Capacity_with_Null_Approved_Value (OpenApiConnection);
     endif
     repeat
      :Delete_this_Dev_and_Team_Environment_Capacity_with_Null_Approved_Value (OpenApiConnection);
     repeat while (more items)
    :List_Connection_Reference_Identities_with_No_AccountName (OpenApiConnection);
    :Delete_Connection_Reference_Identities_with_No_AccountName (Foreach);
     if (condition) then (yes)
      :Delete_Connection_Reference_Identity_with_No_AccountName (OpenApiConnection);
     endif
     repeat
      :Delete_Connection_Reference_Identity_with_No_AccountName (OpenApiConnection);
     repeat while (more items)
    :Delete_Bots_Components_with_No_NonUnique (Foreach);
     if (condition) then (yes)
      :Delete_Bots_Components_without_NonUnique (OpenApiConnection);
     endif
     repeat
      :Delete_Bots_Components_without_NonUnique (OpenApiConnection);
     repeat while (more items)
    :List_Bots_Components_with_No_NonUnique (OpenApiConnection);
    :List_incorrectly_named_specialty_connectors (OpenApiConnection);
    :List_flows_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
    :Update_flows_with_blank_Contains_Plain_Text_Password (Foreach);
     if (condition) then (yes)
      :Update_flow_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
     endif
     repeat
      :Update_flow_with_blank_Contains_Plain_Text_Password (OpenApiConnection);
     repeat while (more items)
    :List_Desktop_Flows_without_Unique_Name (OpenApiConnection);
    :Delete_Desktop_Flows_without_Unique_Name (Foreach);
     if (condition) then (yes)
      :Delete_Desktop_Flow_without_Unique_Name (OpenApiConnection);
     endif
     repeat
      :Delete_Desktop_Flow_without_Unique_Name (OpenApiConnection);
     repeat while (more items)
   }
  :Force_Invetory (Scope);
   if (condition) then (yes)
    :Implicit_Connections (Scope);
     if (condition) then (yes)
      :Mark_apps_that_might_have_implicit_connetions_as_Inventory_Me (Foreach);
       if (condition) then (yes)
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       endif
       repeat
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       repeat while (more items)
      :List_apps_that_might_have_implicit_connetions (Query);
      :List_apps_that_might_have_implicit_connetions_no_nulls (OpenApiConnection);
     endif
     partition "Implicit_Connections" {
      :Mark_apps_that_might_have_implicit_connetions_as_Inventory_Me (Foreach);
       if (condition) then (yes)
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       endif
       repeat
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       repeat while (more items)
      :List_apps_that_might_have_implicit_connetions (Query);
      :List_apps_that_might_have_implicit_connetions_no_nulls (OpenApiConnection);
     }
    :Mark_List_DesktopFlows_without_state (Foreach);
     if (condition) then (yes)
      :Mark_List_DesktopFlow_without_state (OpenApiConnection);
     endif
     repeat
      :Mark_List_DesktopFlow_without_state (OpenApiConnection);
     repeat while (more items)
    :List_DesktopFlows_without_state (OpenApiConnection);
    :Mark_BPFs_without_status_code_or_state (Foreach);
     if (condition) then (yes)
      :Mark_BPF_without_status_code_or_state (OpenApiConnection);
     endif
     repeat
      :Mark_BPF_without_status_code_or_state (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_without_status_code_or_state (OpenApiConnection);
    :Mark_Ai_Models_without_status_code_or_componentstate_as_old (Foreach);
     if (condition) then (yes)
      :Mark_Ai_Model_without_status_code_or_componentstate_s_old (OpenApiConnection);
     endif
     repeat
      :Mark_Ai_Model_without_status_code_or_componentstate_s_old (OpenApiConnection);
     repeat while (more items)
    :List_Ai_Models_without_status_code_or_componentstate (OpenApiConnection);
    :state_code_v_string (Scope);
     if (condition) then (yes)
      :List_PVA_Bots_without_state (OpenApiConnection);
      :Mark_PVA_Bots_without_state (Foreach);
       if (condition) then (yes)
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       endif
       repeat
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       repeat while (more items)
     endif
     partition "state_code_v_string" {
      :List_PVA_Bots_without_state (OpenApiConnection);
      :Mark_PVA_Bots_without_state (Foreach);
       if (condition) then (yes)
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       endif
       repeat
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       repeat while (more items)
     }
    :List_MDAs_without_logical_name (OpenApiConnection);
    :Mark_MDAs_without_logical_name_as_Inventory_Me (Foreach);
     if (condition) then (yes)
      :Mark_MDA_without_logical_name_as_Inventory_Me (OpenApiConnection);
     endif
     repeat
      :Mark_MDA_without_logical_name_as_Inventory_Me (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Force_Invetory" {
    :Implicit_Connections (Scope);
     if (condition) then (yes)
      :Mark_apps_that_might_have_implicit_connetions_as_Inventory_Me (Foreach);
       if (condition) then (yes)
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       endif
       repeat
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       repeat while (more items)
      :List_apps_that_might_have_implicit_connetions (Query);
      :List_apps_that_might_have_implicit_connetions_no_nulls (OpenApiConnection);
     endif
     partition "Implicit_Connections" {
      :Mark_apps_that_might_have_implicit_connetions_as_Inventory_Me (Foreach);
       if (condition) then (yes)
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       endif
       repeat
        :Mark_app_that_might_have_implicit_connetions_as_Inventory_Me (OpenApiConnection);
       repeat while (more items)
      :List_apps_that_might_have_implicit_connetions (Query);
      :List_apps_that_might_have_implicit_connetions_no_nulls (OpenApiConnection);
     }
    :Mark_List_DesktopFlows_without_state (Foreach);
     if (condition) then (yes)
      :Mark_List_DesktopFlow_without_state (OpenApiConnection);
     endif
     repeat
      :Mark_List_DesktopFlow_without_state (OpenApiConnection);
     repeat while (more items)
    :List_DesktopFlows_without_state (OpenApiConnection);
    :Mark_BPFs_without_status_code_or_state (Foreach);
     if (condition) then (yes)
      :Mark_BPF_without_status_code_or_state (OpenApiConnection);
     endif
     repeat
      :Mark_BPF_without_status_code_or_state (OpenApiConnection);
     repeat while (more items)
    :List_BPFs_without_status_code_or_state (OpenApiConnection);
    :Mark_Ai_Models_without_status_code_or_componentstate_as_old (Foreach);
     if (condition) then (yes)
      :Mark_Ai_Model_without_status_code_or_componentstate_s_old (OpenApiConnection);
     endif
     repeat
      :Mark_Ai_Model_without_status_code_or_componentstate_s_old (OpenApiConnection);
     repeat while (more items)
    :List_Ai_Models_without_status_code_or_componentstate (OpenApiConnection);
    :state_code_v_string (Scope);
     if (condition) then (yes)
      :List_PVA_Bots_without_state (OpenApiConnection);
      :Mark_PVA_Bots_without_state (Foreach);
       if (condition) then (yes)
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       endif
       repeat
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       repeat while (more items)
     endif
     partition "state_code_v_string" {
      :List_PVA_Bots_without_state (OpenApiConnection);
      :Mark_PVA_Bots_without_state (Foreach);
       if (condition) then (yes)
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       endif
       repeat
        :Mark_PVA_Bot_without_state (OpenApiConnection);
       repeat while (more items)
     }
    :List_MDAs_without_logical_name (OpenApiConnection);
    :Mark_MDAs_without_logical_name_as_Inventory_Me (Foreach);
     if (condition) then (yes)
      :Mark_MDA_without_logical_name_as_Inventory_Me (OpenApiConnection);
     endif
     repeat
      :Mark_MDA_without_logical_name_as_Inventory_Me (OpenApiConnection);
     repeat while (more items)
   }
 }
:Initialize_variable_flowEnvironment (InitializeVariable);
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
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse2 | embedded |
| shared_commondataserviceforapps_4 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_commondataserviceforapps_6 | shared_commondataserviceforapps | admin_CoECoreDataverseForApps | embedded |
| shared_commondataserviceforapps_5 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| is All Environments Inventory (admin_isFullTenantInventory) | Bool | True | Inventory - If true, (the default) the CoE inventory tracks all environments. New environments added to the inventory will have their Excuse from Inventory to false. You can opt out individual environments.  If false, the CoE inventory tracks a subset of environments. New environments added to the inventory will have their Excuse from Inventory to true. You can opt in individual environments. |

## Triggers

### Recurrence
- **Type:** Recurrence
- **Recurrence:** Frequency: Day, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Delete_Bad_Data | Scope | Operation ID: 2ef5c264-64e7-475b-ba13-72c01946ca0e |
| Initialize_variable_flowEnvironment | InitializeVariable | Operation ID: ec77f66a-62c5-44cb-951d-60749199ff32 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
