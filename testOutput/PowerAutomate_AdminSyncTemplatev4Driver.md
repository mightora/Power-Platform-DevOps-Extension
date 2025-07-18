# Power Automate Flow: AdminSyncTemplatev4Driver

**Generated on:** 2025-07-15 19:14:47
**Flow ID:** 000D3A341D27
**Source File:** AdminSyncTemplatev4Driver-74157AA1-A8AC-EE11-A569-000D3A341D27.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev4Driver
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1
- **Connections:** 11
- **Parameters:** 5

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev4Driver

start
:Trigger: Recurrence (Recurrence);\n:Get_Environments_fails__Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
 endif
 partition "Get_Environments_fails__Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
 }
:Initialize_systemMaker (InitializeVariable);
:Delay_Inventory (If);
 if (condition) then (yes)
  :Delay_1_to_300_minutes (Wait);
 endif
:If_inventory_in_BYODL_terminate_here (If);
 if (condition) then (yes)
  :Terminate_for_BYODL (Terminate);
 endif
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
:Sync_Template_Driver (Scope);
 if (condition) then (yes)
  :Get_Environments_and_some_tenant_wide_properties (Scope);
   if (condition) then (yes)
    :Get_Environments (OpenApiConnection);
    :Get_tenantID (Scope);
     if (condition) then (yes)
      :Select_Tenant_ID (Select);
      :Filter_not_null (Query);
      :Tenant_ID (Compose);
     endif
     partition "Get_tenantID" {
      :Select_Tenant_ID (Select);
      :Filter_not_null (Query);
      :Tenant_ID (Compose);
     }
    :Get_System_User (Scope);
     if (condition) then (yes)
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Create_Maker_record_for_SYSTEM (OpenApiConnection);
        :Set_systemMaker_with_new_record (SetVariable);
        :Update_GUID_string (OpenApiConnection);
       endif
       else (no)
        :Set_systemMaker_with_existing_record (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     endif
     partition "Get_System_User" {
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Create_Maker_record_for_SYSTEM (OpenApiConnection);
        :Set_systemMaker_with_new_record (SetVariable);
        :Update_GUID_string (OpenApiConnection);
       endif
       else (no)
        :Set_systemMaker_with_existing_record (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     }
    :Get_CoE_Specifics (Scope);
     if (condition) then (yes)
      :CoE_Envt (Compose);
      :Default_Behavior_for_Excuse_from_Inventory (Compose);
     endif
     partition "Get_CoE_Specifics" {
      :CoE_Envt (Compose);
      :Default_Behavior_for_Excuse_from_Inventory (Compose);
     }
    :Get_Tenant_DLP_Information (Scope);
     if (condition) then (yes)
      :List_DLP_Policies_V2 (OpenApiConnection);
      :Select_Policy (Select);
      :Filter_to_All_Envt (Query);
      :Select_All_Envt_Names (Select);
     endif
     partition "Get_Tenant_DLP_Information" {
      :List_DLP_Policies_V2 (OpenApiConnection);
      :Select_Policy (Select);
      :Filter_to_All_Envt (Query);
      :Select_All_Envt_Names (Select);
     }
    :Current_User_ID (Scope);
     if (condition) then (yes)
      :Get_my_profile_V2 (OpenApiConnection);
      :CurrentUserID (Compose);
     endif
     partition "Current_User_ID" {
      :Get_my_profile_V2 (OpenApiConnection);
      :CurrentUserID (Compose);
     }
   endif
   partition "Get_Environments_and_some_tenant_wide_properties" {
    :Get_Environments (OpenApiConnection);
    :Get_tenantID (Scope);
     if (condition) then (yes)
      :Select_Tenant_ID (Select);
      :Filter_not_null (Query);
      :Tenant_ID (Compose);
     endif
     partition "Get_tenantID" {
      :Select_Tenant_ID (Select);
      :Filter_not_null (Query);
      :Tenant_ID (Compose);
     }
    :Get_System_User (Scope);
     if (condition) then (yes)
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Create_Maker_record_for_SYSTEM (OpenApiConnection);
        :Set_systemMaker_with_new_record (SetVariable);
        :Update_GUID_string (OpenApiConnection);
       endif
       else (no)
        :Set_systemMaker_with_existing_record (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     endif
     partition "Get_System_User" {
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Create_Maker_record_for_SYSTEM (OpenApiConnection);
        :Set_systemMaker_with_new_record (SetVariable);
        :Update_GUID_string (OpenApiConnection);
       endif
       else (no)
        :Set_systemMaker_with_existing_record (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     }
    :Get_CoE_Specifics (Scope);
     if (condition) then (yes)
      :CoE_Envt (Compose);
      :Default_Behavior_for_Excuse_from_Inventory (Compose);
     endif
     partition "Get_CoE_Specifics" {
      :CoE_Envt (Compose);
      :Default_Behavior_for_Excuse_from_Inventory (Compose);
     }
    :Get_Tenant_DLP_Information (Scope);
     if (condition) then (yes)
      :List_DLP_Policies_V2 (OpenApiConnection);
      :Select_Policy (Select);
      :Filter_to_All_Envt (Query);
      :Select_All_Envt_Names (Select);
     endif
     partition "Get_Tenant_DLP_Information" {
      :List_DLP_Policies_V2 (OpenApiConnection);
      :Select_Policy (Select);
      :Filter_to_All_Envt (Query);
      :Select_All_Envt_Names (Select);
     }
    :Current_User_ID (Scope);
     if (condition) then (yes)
      :Get_my_profile_V2 (OpenApiConnection);
      :CurrentUserID (Compose);
     endif
     partition "Current_User_ID" {
      :Get_my_profile_V2 (OpenApiConnection);
      :CurrentUserID (Compose);
     }
   }
  :Store_environments_in_the_CoE_CDS_Entity (Scope);
   if (condition) then (yes)
    :Apply_to_each_Environment (Foreach);
     if (condition) then (yes)
      :Get_Environment_as_Admin__see_if_still_exists (OpenApiConnection);
      :Inventory_environment (Scope);
       if (condition) then (yes)
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       endif
       partition "Inventory_environment" {
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       }
      :catch__envt_deleted_since_flow_started (Compose);
     endif
     repeat
      :Get_Environment_as_Admin__see_if_still_exists (OpenApiConnection);
      :Inventory_environment (Scope);
       if (condition) then (yes)
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       endif
       partition "Inventory_environment" {
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       }
      :catch__envt_deleted_since_flow_started (Compose);
     repeat while (more items)
   endif
   partition "Store_environments_in_the_CoE_CDS_Entity" {
    :Apply_to_each_Environment (Foreach);
     if (condition) then (yes)
      :Get_Environment_as_Admin__see_if_still_exists (OpenApiConnection);
      :Inventory_environment (Scope);
       if (condition) then (yes)
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       endif
       partition "Inventory_environment" {
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       }
      :catch__envt_deleted_since_flow_started (Compose);
     endif
     repeat
      :Get_Environment_as_Admin__see_if_still_exists (OpenApiConnection);
      :Inventory_environment (Scope);
       if (condition) then (yes)
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       endif
       partition "Inventory_environment" {
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       }
      :catch__envt_deleted_since_flow_started (Compose);
     repeat while (more items)
   }
  :Look_for_Deleted_Environments (Scope);
   if (condition) then (yes)
    :CurrentEnvtInventory (OpenApiConnection);
    :Get_Inventory__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     endif
     partition "Get_Inventory__Deleted_Envts" {
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     }
    :Get_Actual__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     endif
     partition "Get_Actual__Deleted_Envts" {
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     }
    :DeletedEnvts (Query);
    :Mark_deleted (Foreach);
     if (condition) then (yes)
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
     endif
     repeat
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
     repeat while (more items)
   endif
   partition "Look_for_Deleted_Environments" {
    :CurrentEnvtInventory (OpenApiConnection);
    :Get_Inventory__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     endif
     partition "Get_Inventory__Deleted_Envts" {
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     }
    :Get_Actual__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     endif
     partition "Get_Actual__Deleted_Envts" {
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     }
    :DeletedEnvts (Query);
    :Mark_deleted (Foreach);
     if (condition) then (yes)
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
     endif
     repeat
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
     repeat while (more items)
   }
 endif
 partition "Sync_Template_Driver" {
  :Get_Environments_and_some_tenant_wide_properties (Scope);
   if (condition) then (yes)
    :Get_Environments (OpenApiConnection);
    :Get_tenantID (Scope);
     if (condition) then (yes)
      :Select_Tenant_ID (Select);
      :Filter_not_null (Query);
      :Tenant_ID (Compose);
     endif
     partition "Get_tenantID" {
      :Select_Tenant_ID (Select);
      :Filter_not_null (Query);
      :Tenant_ID (Compose);
     }
    :Get_System_User (Scope);
     if (condition) then (yes)
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Create_Maker_record_for_SYSTEM (OpenApiConnection);
        :Set_systemMaker_with_new_record (SetVariable);
        :Update_GUID_string (OpenApiConnection);
       endif
       else (no)
        :Set_systemMaker_with_existing_record (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     endif
     partition "Get_System_User" {
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Create_Maker_record_for_SYSTEM (OpenApiConnection);
        :Set_systemMaker_with_new_record (SetVariable);
        :Update_GUID_string (OpenApiConnection);
       endif
       else (no)
        :Set_systemMaker_with_existing_record (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     }
    :Get_CoE_Specifics (Scope);
     if (condition) then (yes)
      :CoE_Envt (Compose);
      :Default_Behavior_for_Excuse_from_Inventory (Compose);
     endif
     partition "Get_CoE_Specifics" {
      :CoE_Envt (Compose);
      :Default_Behavior_for_Excuse_from_Inventory (Compose);
     }
    :Get_Tenant_DLP_Information (Scope);
     if (condition) then (yes)
      :List_DLP_Policies_V2 (OpenApiConnection);
      :Select_Policy (Select);
      :Filter_to_All_Envt (Query);
      :Select_All_Envt_Names (Select);
     endif
     partition "Get_Tenant_DLP_Information" {
      :List_DLP_Policies_V2 (OpenApiConnection);
      :Select_Policy (Select);
      :Filter_to_All_Envt (Query);
      :Select_All_Envt_Names (Select);
     }
    :Current_User_ID (Scope);
     if (condition) then (yes)
      :Get_my_profile_V2 (OpenApiConnection);
      :CurrentUserID (Compose);
     endif
     partition "Current_User_ID" {
      :Get_my_profile_V2 (OpenApiConnection);
      :CurrentUserID (Compose);
     }
   endif
   partition "Get_Environments_and_some_tenant_wide_properties" {
    :Get_Environments (OpenApiConnection);
    :Get_tenantID (Scope);
     if (condition) then (yes)
      :Select_Tenant_ID (Select);
      :Filter_not_null (Query);
      :Tenant_ID (Compose);
     endif
     partition "Get_tenantID" {
      :Select_Tenant_ID (Select);
      :Filter_not_null (Query);
      :Tenant_ID (Compose);
     }
    :Get_System_User (Scope);
     if (condition) then (yes)
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Create_Maker_record_for_SYSTEM (OpenApiConnection);
        :Set_systemMaker_with_new_record (SetVariable);
        :Update_GUID_string (OpenApiConnection);
       endif
       else (no)
        :Set_systemMaker_with_existing_record (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     endif
     partition "Get_System_User" {
      :Is_System_Maker (If);
       if (condition) then (yes)
        :Create_Maker_record_for_SYSTEM (OpenApiConnection);
        :Set_systemMaker_with_new_record (SetVariable);
        :Update_GUID_string (OpenApiConnection);
       endif
       else (no)
        :Set_systemMaker_with_existing_record (SetVariable);
       endif
      :List_Makers (OpenApiConnection);
     }
    :Get_CoE_Specifics (Scope);
     if (condition) then (yes)
      :CoE_Envt (Compose);
      :Default_Behavior_for_Excuse_from_Inventory (Compose);
     endif
     partition "Get_CoE_Specifics" {
      :CoE_Envt (Compose);
      :Default_Behavior_for_Excuse_from_Inventory (Compose);
     }
    :Get_Tenant_DLP_Information (Scope);
     if (condition) then (yes)
      :List_DLP_Policies_V2 (OpenApiConnection);
      :Select_Policy (Select);
      :Filter_to_All_Envt (Query);
      :Select_All_Envt_Names (Select);
     endif
     partition "Get_Tenant_DLP_Information" {
      :List_DLP_Policies_V2 (OpenApiConnection);
      :Select_Policy (Select);
      :Filter_to_All_Envt (Query);
      :Select_All_Envt_Names (Select);
     }
    :Current_User_ID (Scope);
     if (condition) then (yes)
      :Get_my_profile_V2 (OpenApiConnection);
      :CurrentUserID (Compose);
     endif
     partition "Current_User_ID" {
      :Get_my_profile_V2 (OpenApiConnection);
      :CurrentUserID (Compose);
     }
   }
  :Store_environments_in_the_CoE_CDS_Entity (Scope);
   if (condition) then (yes)
    :Apply_to_each_Environment (Foreach);
     if (condition) then (yes)
      :Get_Environment_as_Admin__see_if_still_exists (OpenApiConnection);
      :Inventory_environment (Scope);
       if (condition) then (yes)
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       endif
       partition "Inventory_environment" {
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       }
      :catch__envt_deleted_since_flow_started (Compose);
     endif
     repeat
      :Get_Environment_as_Admin__see_if_still_exists (OpenApiConnection);
      :Inventory_environment (Scope);
       if (condition) then (yes)
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       endif
       partition "Inventory_environment" {
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       }
      :catch__envt_deleted_since_flow_started (Compose);
     repeat while (more items)
   endif
   partition "Store_environments_in_the_CoE_CDS_Entity" {
    :Apply_to_each_Environment (Foreach);
     if (condition) then (yes)
      :Get_Environment_as_Admin__see_if_still_exists (OpenApiConnection);
      :Inventory_environment (Scope);
       if (condition) then (yes)
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       endif
       partition "Inventory_environment" {
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       }
      :catch__envt_deleted_since_flow_started (Compose);
     endif
     repeat
      :Get_Environment_as_Admin__see_if_still_exists (OpenApiConnection);
      :Inventory_environment (Scope);
       if (condition) then (yes)
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       endif
       partition "Inventory_environment" {
        :teams_information (Scope);
         if (condition) then (yes)
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         endif
         partition "teams_information" {
          :Check_if_Teams_envt (If);
           if (condition) then (yes)
            :Parse_JSON (ParseJson);
            :get_connectedGroups (Compose);
            :TeamID (Compose);
            :Get_a_team (OpenApiConnection);
            :TeamURL (Compose);
           endif
         }
        :Get_basics (Scope);
         if (condition) then (yes)
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         endif
         partition "Get_basics" {
          :Get_Environment (OpenApiConnection);
          :catch__not_yet_inventoried (Compose);
          :Get_GUID (Scope);
           if (condition) then (yes)
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           endif
           partition "Get_GUID" {
            :For_Type_Legacy (Scope);
             if (condition) then (yes)
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             endif
             partition "For_Type_Legacy" {
              :Get_with_Name (OpenApiConnection);
              :GUID_for_Legacy (Compose);
             }
            :Name_Length (Compose);
            :Remove_any_Environment_prefix (Compose);
            :EnvtGUID (Compose);
           }
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
         }
        :cds_and_other_basics (Scope);
         if (condition) then (yes)
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         endif
         partition "cds_and_other_basics" {
          :hasCDS (Compose);
          :cds_URL (Compose);
          :CDS_Metadata_Name (Compose);
          :is_New_Envt (Compose);
          :isCoE (Compose);
          :Excused_From_Inventory (Compose);
         }
        :See_if_need_to_add_to_inventory (If);
         if (condition) then (yes)
          :Update_after_check_orphan_status (If);
           if (condition) then (yes)
            :Upsert_Environment_Orphaned (OpenApiConnection);
           endif
           else (no)
            :Upsert_Environment (OpenApiConnection);
           endif
         endif
         else (no)
          :no_op_for_preexisting_environments_excused_from_inventory (Compose);
         endif
        :security_group_information (Scope);
         if (condition) then (yes)
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         endif
         partition "security_group_information" {
          :securityGroupID (Compose);
          :securityGroupName (Compose);
          :has_security_group (Compose);
          :If_has_security_group (If);
           if (condition) then (yes)
            :Get_Security_Group (OpenApiConnection);
            :hasGroup_securityGroupName (Compose);
           endif
         }
        :Get_DLP_Information (Scope);
         if (condition) then (yes)
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         endif
         partition "Get_DLP_Information" {
          :Filter_to_Only_Envt (Query);
          :Select_Only_Envt_Names (Select);
          :Filter_to_Except_Environments (Query);
          :Select_Except_Environments_Names (Select);
          :Impacting_DLPs_Array (Compose);
          :has_DLP (Compose);
          :Impacting_DLPs (Compose);
          :Filter_to_Single_Envt (Query);
          :Select_Single_Envt_Names (Select);
         }
        :Connection_accessibility (Scope);
         if (condition) then (yes)
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         endif
         partition "Connection_accessibility" {
          :Get_Connections_as_Admin (OpenApiConnection);
          :Catch__are_connections_inaccessible (Compose);
          :connections_inaccessible (Compose);
         }
        :envt_information (Scope);
         if (condition) then (yes)
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         endif
         partition "envt_information" {
          :If_not_excused_from_inventory (If);
           if (condition) then (yes)
            :Get_Org_Info (Scope);
             if (condition) then (yes)
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             endif
             partition "Get_Org_Info" {
              :Get_organization (OpenApiConnection);
              :catch_for_legacy_connector_bug (Compose);
              :Parse_organization (ParseJson);
             }
           endif
          :has_Maker_Copilot_State (Compose);
          :has_PCF_State (Compose);
         }
        :ensure_escalated_privaledges (Scope);
         if (condition) then (yes)
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         endif
         partition "ensure_escalated_privaledges" {
          :is_has_CDS_and_not_excused (If);
           if (condition) then (yes)
            :First_Try (Scope);
             if (condition) then (yes)
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             endif
             partition "First_Try" {
              :Grants_requesting_tenant_admin_user_the_system_admin_role (OpenApiConnection);
             }
            :Call_helper_flow_for__second_try (Scope);
             if (condition) then (yes)
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             endif
             partition "Call_helper_flow_for__second_try" {
              :Run_HELPER__Driver_Escalation_Check (Workflow);
             }
           endif
         }
       }
      :catch__envt_deleted_since_flow_started (Compose);
     repeat while (more items)
   }
  :Look_for_Deleted_Environments (Scope);
   if (condition) then (yes)
    :CurrentEnvtInventory (OpenApiConnection);
    :Get_Inventory__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     endif
     partition "Get_Inventory__Deleted_Envts" {
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     }
    :Get_Actual__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     endif
     partition "Get_Actual__Deleted_Envts" {
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     }
    :DeletedEnvts (Query);
    :Mark_deleted (Foreach);
     if (condition) then (yes)
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
     endif
     repeat
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
     repeat while (more items)
   endif
   partition "Look_for_Deleted_Environments" {
    :CurrentEnvtInventory (OpenApiConnection);
    :Get_Inventory__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     endif
     partition "Get_Inventory__Deleted_Envts" {
      :Select_Inventory__Deleted_Envts (Select);
      :Parse_Inventory__Deleted_Envts (ParseJson);
     }
    :Get_Actual__Deleted_Envts (Scope);
     if (condition) then (yes)
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     endif
     partition "Get_Actual__Deleted_Envts" {
      :Select_Actual__Deleted_Envts (Select);
      :Parse_Actual__Deleted_Envts (ParseJson);
     }
    :DeletedEnvts (Query);
    :Mark_deleted (Foreach);
     if (condition) then (yes)
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
     endif
     repeat
      :Find_it_for_GUID (OpenApiConnection);
      :If_found_mark_deleted (If);
       if (condition) then (yes)
        :GUID_to_Delete (Compose);
        :Mark_record_deleted (OpenApiConnection);
       endif
     repeat while (more items)
   }
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_powerplatformforadmins_1 | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdmins | embedded |
| shared_commondataserviceforapps_1 | shared_commondataserviceforapps | admin_CoECoreDataverseEnvRequest | embedded |
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdminsEnvRequest | embedded |
| shared_office365users | shared_office365users | admin_CoECoreO365Users | embedded |
| shared_teams | shared_teams | admin_CoECoreTeams | embedded |
| shared_office365groups | shared_office365groups | admin_CoECoreO365Groups | embedded |
| shared_powerappsforadmins | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |
| shared_powerplatformadminv2_1 | shared_powerplatformadminv2 | admin_CoECorePowerPlatformforAdminV2 | embedded |
| shared_commondataserviceforapps_2 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| DelayInventory (admin_DelayInventory) | Bool | - | Inventory - If Yes, will run a delay step to assist with the Dataverse health. Only turn to No for debugging.  |
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Inventory and Telemetry in Azure Data Storage account (admin_InventoryandTelemetryinAzureDataStorageaccount) | Bool | - | Inventory - Have you set up data export in PPAC and is your inventory and telemetry in an Azure Data Storage folder (also referred to as Bring your own Datalake, self-serve analytics feature). Default no |
| is All Environments Inventory (admin_isFullTenantInventory) | Bool | True | Inventory - If true, (the default) the CoE inventory tracks all environments. New environments added to the inventory will have their Excuse from Inventory to false. You can opt out individual environments.  If false, the CoE inventory tracks a subset of environments. New environments added to the inventory will have their Excuse from Inventory to true. You can opt in individual environments. |
| CoE System User ID (admin_CoESystemUserID) | String | 12c238e6-eea1-ef11-8a69-000d3a5c3575 | in the maker table we store a user for system with an id. Storing here so that it can be referenced without having to look it up all the time. |

## Triggers

### Recurrence
- **Type:** Recurrence
- **Recurrence:** Frequency: Day, Interval: 1

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Get_Environments_fails_-_Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Initialize_systemMaker | InitializeVariable | Operation ID: 34322142-9050-4db3-bb27-b6a0060a81a5 |
| Delay_Inventory | If | Operation ID: 49b3d120-232d-4694-b373-a97ecde35cc4 |
| If_inventory_in_BYODL_terminate_here | If | Operation ID: 54988332-a904-4fb7-b5b3-40e6a1ceba99 |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Sync_Template_Driver | Scope | Operation ID: 842b4d24-6012-4729-929e-d2afacd3b04f |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
