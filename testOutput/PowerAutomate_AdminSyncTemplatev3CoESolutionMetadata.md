# Power Automate Flow: AdminSyncTemplatev3CoESolutionMetadata

**Generated on:** 2025-07-15 19:14:46
**Flow ID:** 0022482783B7
**Source File:** AdminSyncTemplatev3CoESolutionMetadata-F67E1E35-4CD5-EC11-A7B5-0022482783B7.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** AdminSyncTemplatev3CoESolutionMetadata
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1 1 1 1 1
- **Connections:** 4
- **Parameters:** 2

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: AdminSyncTemplatev3CoESolutionMetadata

start
:Trigger: manual (Request);\n:Add_or_update_data (Scope);
 if (condition) then (yes)
  :Apps (Scope);
   if (condition) then (yes)
    :Apply_to_each__App (Foreach);
     if (condition) then (yes)
      :Canvas_or_Model_Driven (If);
       if (condition) then (yes)
        :Add_if_in_tenant__Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Apps (OpenApiConnection);
          :Add_if_does_not_exist__Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Apps (Query);
       endif
       else (no)
        :Add_if_in_tenant__Model_Driven_Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Model_Driven_Apps (OpenApiConnection);
          :Add_if_does_not_exist__Model_Driven_Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Model_Driven_Apps (Query);
       endif
     endif
     repeat
      :Canvas_or_Model_Driven (If);
       if (condition) then (yes)
        :Add_if_in_tenant__Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Apps (OpenApiConnection);
          :Add_if_does_not_exist__Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Apps (Query);
       endif
       else (no)
        :Add_if_in_tenant__Model_Driven_Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Model_Driven_Apps (OpenApiConnection);
          :Add_if_does_not_exist__Model_Driven_Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Model_Driven_Apps (Query);
       endif
     repeat while (more items)
    :Cleanup_Deleted__Apps (OpenApiConnection);
    :Cleanup_Deleted_Apps (Foreach);
     if (condition) then (yes)
      :Cleanup_Deleted_App (OpenApiConnection);
      :catch_already_deleted_app (Compose);
     endif
     repeat
      :Cleanup_Deleted_App (OpenApiConnection);
      :catch_already_deleted_app (Compose);
     repeat while (more items)
    :Parse_JSON__Apps (ParseJson);
    :Core_Apps (SetVariable);
    :Governance_Apps (SetVariable);
    :BVA_Apps (SetVariable);
    :Nurture_Apps (SetVariable);
    :Test_Apps (SetVariable);
    :TenantApps (Compose);
   endif
   partition "Apps" {
    :Apply_to_each__App (Foreach);
     if (condition) then (yes)
      :Canvas_or_Model_Driven (If);
       if (condition) then (yes)
        :Add_if_in_tenant__Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Apps (OpenApiConnection);
          :Add_if_does_not_exist__Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Apps (Query);
       endif
       else (no)
        :Add_if_in_tenant__Model_Driven_Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Model_Driven_Apps (OpenApiConnection);
          :Add_if_does_not_exist__Model_Driven_Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Model_Driven_Apps (Query);
       endif
     endif
     repeat
      :Canvas_or_Model_Driven (If);
       if (condition) then (yes)
        :Add_if_in_tenant__Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Apps (OpenApiConnection);
          :Add_if_does_not_exist__Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Apps (Query);
       endif
       else (no)
        :Add_if_in_tenant__Model_Driven_Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Model_Driven_Apps (OpenApiConnection);
          :Add_if_does_not_exist__Model_Driven_Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Model_Driven_Apps (Query);
       endif
     repeat while (more items)
    :Cleanup_Deleted__Apps (OpenApiConnection);
    :Cleanup_Deleted_Apps (Foreach);
     if (condition) then (yes)
      :Cleanup_Deleted_App (OpenApiConnection);
      :catch_already_deleted_app (Compose);
     endif
     repeat
      :Cleanup_Deleted_App (OpenApiConnection);
      :catch_already_deleted_app (Compose);
     repeat while (more items)
    :Parse_JSON__Apps (ParseJson);
    :Core_Apps (SetVariable);
    :Governance_Apps (SetVariable);
    :BVA_Apps (SetVariable);
    :Nurture_Apps (SetVariable);
    :Test_Apps (SetVariable);
    :TenantApps (Compose);
   }
  :Flows (Scope);
   if (condition) then (yes)
    :Apply_to_each__Flow (Foreach);
     if (condition) then (yes)
      :Filter_array__Flows (Query);
      :Add_if_in_tenant__Flows (If);
       if (condition) then (yes)
        :Add_if_does_not_exist__Flows (If);
         if (condition) then (yes)
          :Add_Metadata__Flows (OpenApiConnection);
         endif
         else (no)
          :Update_Metadata__Flows (OpenApiConnection);
         endif
        :GetWorkflowMetadataID (OpenApiConnection);
        :WorkflowEntityID (Compose);
        :See_if_already_exists__Flows (OpenApiConnection);
       endif
     endif
     repeat
      :Filter_array__Flows (Query);
      :Add_if_in_tenant__Flows (If);
       if (condition) then (yes)
        :Add_if_does_not_exist__Flows (If);
         if (condition) then (yes)
          :Add_Metadata__Flows (OpenApiConnection);
         endif
         else (no)
          :Update_Metadata__Flows (OpenApiConnection);
         endif
        :GetWorkflowMetadataID (OpenApiConnection);
        :WorkflowEntityID (Compose);
        :See_if_already_exists__Flows (OpenApiConnection);
       endif
     repeat while (more items)
    :Cleanup_Deleted__Flows (OpenApiConnection);
    :Cleanup_Deleted_Flows (Foreach);
     if (condition) then (yes)
      :Cleanup_Deleted_Flow (OpenApiConnection);
      :catch_already_deleted_flow (Compose);
     endif
     repeat
      :Cleanup_Deleted_Flow (OpenApiConnection);
      :catch_already_deleted_flow (Compose);
     repeat while (more items)
    :Parse_JSON__Flows (ParseJson);
    :Test_Flows (SetVariable);
    :Core_Flows (SetVariable);
    :Governance_Flows (SetVariable);
    :BVA_Flows (SetVariable);
    :Nurture_Flows (SetVariable);
    :TenantFlows (Compose);
   endif
   partition "Flows" {
    :Apply_to_each__Flow (Foreach);
     if (condition) then (yes)
      :Filter_array__Flows (Query);
      :Add_if_in_tenant__Flows (If);
       if (condition) then (yes)
        :Add_if_does_not_exist__Flows (If);
         if (condition) then (yes)
          :Add_Metadata__Flows (OpenApiConnection);
         endif
         else (no)
          :Update_Metadata__Flows (OpenApiConnection);
         endif
        :GetWorkflowMetadataID (OpenApiConnection);
        :WorkflowEntityID (Compose);
        :See_if_already_exists__Flows (OpenApiConnection);
       endif
     endif
     repeat
      :Filter_array__Flows (Query);
      :Add_if_in_tenant__Flows (If);
       if (condition) then (yes)
        :Add_if_does_not_exist__Flows (If);
         if (condition) then (yes)
          :Add_Metadata__Flows (OpenApiConnection);
         endif
         else (no)
          :Update_Metadata__Flows (OpenApiConnection);
         endif
        :GetWorkflowMetadataID (OpenApiConnection);
        :WorkflowEntityID (Compose);
        :See_if_already_exists__Flows (OpenApiConnection);
       endif
     repeat while (more items)
    :Cleanup_Deleted__Flows (OpenApiConnection);
    :Cleanup_Deleted_Flows (Foreach);
     if (condition) then (yes)
      :Cleanup_Deleted_Flow (OpenApiConnection);
      :catch_already_deleted_flow (Compose);
     endif
     repeat
      :Cleanup_Deleted_Flow (OpenApiConnection);
      :catch_already_deleted_flow (Compose);
     repeat while (more items)
    :Parse_JSON__Flows (ParseJson);
    :Test_Flows (SetVariable);
    :Core_Flows (SetVariable);
    :Governance_Flows (SetVariable);
    :BVA_Flows (SetVariable);
    :Nurture_Flows (SetVariable);
    :TenantFlows (Compose);
   }
  :Get_Tenant_Info (Scope);
   if (condition) then (yes)
    :Prep_work (Scope);
     if (condition) then (yes)
      :CoE_Envt (Compose);
      :Tenant_ID (Compose);
      :Get_Environment_as_Admin (OpenApiConnection);
     endif
     partition "Prep_work" {
      :CoE_Envt (Compose);
      :Tenant_ID (Compose);
      :Get_Environment_as_Admin (OpenApiConnection);
     }
    :Canvas_Apps_and_Custom_Pages (Scope);
     if (condition) then (yes)
      :Get_Apps_as_Admin (OpenApiConnection);
      :Select_Envt_PowerApps (Select);
     endif
     partition "Canvas_Apps_and_Custom_Pages" {
      :Get_Apps_as_Admin (OpenApiConnection);
      :Select_Envt_PowerApps (Select);
     }
    :Model_Driven_Apps (Scope);
     if (condition) then (yes)
      :List_Model_Driven_Apps (OpenApiConnection);
      :Select_Envt_Model_Driven_Apps (Select);
     endif
     partition "Model_Driven_Apps" {
      :List_Model_Driven_Apps (OpenApiConnection);
      :Select_Envt_Model_Driven_Apps (Select);
     }
    :Cloud_Flows (Scope);
     if (condition) then (yes)
      :List_Unpublished_Cloud_Flows (OpenApiConnection);
      :Select_Envt_Cloud_Flows_Off (Select);
      :Union_Envt_Cloud_Flows (Compose);
      :Parse_Envt_Cloud_Flows (ParseJson);
      :Filter_Envt_Clouds_Unpublished (Query);
      :List_Flows_as_Admin_V2 (OpenApiConnection);
      :Select_Cloud_Flows_from_Envt (Select);
     endif
     partition "Cloud_Flows" {
      :List_Unpublished_Cloud_Flows (OpenApiConnection);
      :Select_Envt_Cloud_Flows_Off (Select);
      :Union_Envt_Cloud_Flows (Compose);
      :Parse_Envt_Cloud_Flows (ParseJson);
      :Filter_Envt_Clouds_Unpublished (Query);
      :List_Flows_as_Admin_V2 (OpenApiConnection);
      :Select_Cloud_Flows_from_Envt (Select);
     }
    :Solutions (Scope);
     if (condition) then (yes)
      :SetupTest (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       endif
       partition "SetupTest" {
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       }
      :SetupCore (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       endif
       partition "SetupCore" {
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       }
      :SetupGovernance (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       endif
       partition "SetupGovernance" {
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       }
      :SetupBVA (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       endif
       partition "SetupBVA" {
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       }
      :SetupNurture (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       endif
       partition "SetupNurture" {
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       }
      :List_Envt_Solutions (OpenApiConnection);
     endif
     partition "Solutions" {
      :SetupTest (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       endif
       partition "SetupTest" {
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       }
      :SetupCore (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       endif
       partition "SetupCore" {
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       }
      :SetupGovernance (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       endif
       partition "SetupGovernance" {
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       }
      :SetupBVA (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       endif
       partition "SetupBVA" {
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       }
      :SetupNurture (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       endif
       partition "SetupNurture" {
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       }
      :List_Envt_Solutions (OpenApiConnection);
     }
   endif
   partition "Get_Tenant_Info" {
    :Prep_work (Scope);
     if (condition) then (yes)
      :CoE_Envt (Compose);
      :Tenant_ID (Compose);
      :Get_Environment_as_Admin (OpenApiConnection);
     endif
     partition "Prep_work" {
      :CoE_Envt (Compose);
      :Tenant_ID (Compose);
      :Get_Environment_as_Admin (OpenApiConnection);
     }
    :Canvas_Apps_and_Custom_Pages (Scope);
     if (condition) then (yes)
      :Get_Apps_as_Admin (OpenApiConnection);
      :Select_Envt_PowerApps (Select);
     endif
     partition "Canvas_Apps_and_Custom_Pages" {
      :Get_Apps_as_Admin (OpenApiConnection);
      :Select_Envt_PowerApps (Select);
     }
    :Model_Driven_Apps (Scope);
     if (condition) then (yes)
      :List_Model_Driven_Apps (OpenApiConnection);
      :Select_Envt_Model_Driven_Apps (Select);
     endif
     partition "Model_Driven_Apps" {
      :List_Model_Driven_Apps (OpenApiConnection);
      :Select_Envt_Model_Driven_Apps (Select);
     }
    :Cloud_Flows (Scope);
     if (condition) then (yes)
      :List_Unpublished_Cloud_Flows (OpenApiConnection);
      :Select_Envt_Cloud_Flows_Off (Select);
      :Union_Envt_Cloud_Flows (Compose);
      :Parse_Envt_Cloud_Flows (ParseJson);
      :Filter_Envt_Clouds_Unpublished (Query);
      :List_Flows_as_Admin_V2 (OpenApiConnection);
      :Select_Cloud_Flows_from_Envt (Select);
     endif
     partition "Cloud_Flows" {
      :List_Unpublished_Cloud_Flows (OpenApiConnection);
      :Select_Envt_Cloud_Flows_Off (Select);
      :Union_Envt_Cloud_Flows (Compose);
      :Parse_Envt_Cloud_Flows (ParseJson);
      :Filter_Envt_Clouds_Unpublished (Query);
      :List_Flows_as_Admin_V2 (OpenApiConnection);
      :Select_Cloud_Flows_from_Envt (Select);
     }
    :Solutions (Scope);
     if (condition) then (yes)
      :SetupTest (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       endif
       partition "SetupTest" {
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       }
      :SetupCore (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       endif
       partition "SetupCore" {
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       }
      :SetupGovernance (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       endif
       partition "SetupGovernance" {
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       }
      :SetupBVA (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       endif
       partition "SetupBVA" {
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       }
      :SetupNurture (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       endif
       partition "SetupNurture" {
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       }
      :List_Envt_Solutions (OpenApiConnection);
     endif
     partition "Solutions" {
      :SetupTest (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       endif
       partition "SetupTest" {
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       }
      :SetupCore (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       endif
       partition "SetupCore" {
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       }
      :SetupGovernance (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       endif
       partition "SetupGovernance" {
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       }
      :SetupBVA (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       endif
       partition "SetupBVA" {
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       }
      :SetupNurture (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       endif
       partition "SetupNurture" {
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       }
      :List_Envt_Solutions (OpenApiConnection);
     }
   }
 endif
 partition "Add_or_update_data" {
  :Apps (Scope);
   if (condition) then (yes)
    :Apply_to_each__App (Foreach);
     if (condition) then (yes)
      :Canvas_or_Model_Driven (If);
       if (condition) then (yes)
        :Add_if_in_tenant__Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Apps (OpenApiConnection);
          :Add_if_does_not_exist__Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Apps (Query);
       endif
       else (no)
        :Add_if_in_tenant__Model_Driven_Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Model_Driven_Apps (OpenApiConnection);
          :Add_if_does_not_exist__Model_Driven_Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Model_Driven_Apps (Query);
       endif
     endif
     repeat
      :Canvas_or_Model_Driven (If);
       if (condition) then (yes)
        :Add_if_in_tenant__Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Apps (OpenApiConnection);
          :Add_if_does_not_exist__Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Apps (Query);
       endif
       else (no)
        :Add_if_in_tenant__Model_Driven_Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Model_Driven_Apps (OpenApiConnection);
          :Add_if_does_not_exist__Model_Driven_Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Model_Driven_Apps (Query);
       endif
     repeat while (more items)
    :Cleanup_Deleted__Apps (OpenApiConnection);
    :Cleanup_Deleted_Apps (Foreach);
     if (condition) then (yes)
      :Cleanup_Deleted_App (OpenApiConnection);
      :catch_already_deleted_app (Compose);
     endif
     repeat
      :Cleanup_Deleted_App (OpenApiConnection);
      :catch_already_deleted_app (Compose);
     repeat while (more items)
    :Parse_JSON__Apps (ParseJson);
    :Core_Apps (SetVariable);
    :Governance_Apps (SetVariable);
    :BVA_Apps (SetVariable);
    :Nurture_Apps (SetVariable);
    :Test_Apps (SetVariable);
    :TenantApps (Compose);
   endif
   partition "Apps" {
    :Apply_to_each__App (Foreach);
     if (condition) then (yes)
      :Canvas_or_Model_Driven (If);
       if (condition) then (yes)
        :Add_if_in_tenant__Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Apps (OpenApiConnection);
          :Add_if_does_not_exist__Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Apps (Query);
       endif
       else (no)
        :Add_if_in_tenant__Model_Driven_Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Model_Driven_Apps (OpenApiConnection);
          :Add_if_does_not_exist__Model_Driven_Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Model_Driven_Apps (Query);
       endif
     endif
     repeat
      :Canvas_or_Model_Driven (If);
       if (condition) then (yes)
        :Add_if_in_tenant__Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Apps (OpenApiConnection);
          :Add_if_does_not_exist__Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Apps (Query);
       endif
       else (no)
        :Add_if_in_tenant__Model_Driven_Apps (If);
         if (condition) then (yes)
          :See_if_already_exists__Model_Driven_Apps (OpenApiConnection);
          :Add_if_does_not_exist__Model_Driven_Apps (If);
           if (condition) then (yes)
            :Add_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
           else (no)
            :Update_Metadata__Model_Driven_Apps (OpenApiConnection);
           endif
         endif
        :Filter_array__Model_Driven_Apps (Query);
       endif
     repeat while (more items)
    :Cleanup_Deleted__Apps (OpenApiConnection);
    :Cleanup_Deleted_Apps (Foreach);
     if (condition) then (yes)
      :Cleanup_Deleted_App (OpenApiConnection);
      :catch_already_deleted_app (Compose);
     endif
     repeat
      :Cleanup_Deleted_App (OpenApiConnection);
      :catch_already_deleted_app (Compose);
     repeat while (more items)
    :Parse_JSON__Apps (ParseJson);
    :Core_Apps (SetVariable);
    :Governance_Apps (SetVariable);
    :BVA_Apps (SetVariable);
    :Nurture_Apps (SetVariable);
    :Test_Apps (SetVariable);
    :TenantApps (Compose);
   }
  :Flows (Scope);
   if (condition) then (yes)
    :Apply_to_each__Flow (Foreach);
     if (condition) then (yes)
      :Filter_array__Flows (Query);
      :Add_if_in_tenant__Flows (If);
       if (condition) then (yes)
        :Add_if_does_not_exist__Flows (If);
         if (condition) then (yes)
          :Add_Metadata__Flows (OpenApiConnection);
         endif
         else (no)
          :Update_Metadata__Flows (OpenApiConnection);
         endif
        :GetWorkflowMetadataID (OpenApiConnection);
        :WorkflowEntityID (Compose);
        :See_if_already_exists__Flows (OpenApiConnection);
       endif
     endif
     repeat
      :Filter_array__Flows (Query);
      :Add_if_in_tenant__Flows (If);
       if (condition) then (yes)
        :Add_if_does_not_exist__Flows (If);
         if (condition) then (yes)
          :Add_Metadata__Flows (OpenApiConnection);
         endif
         else (no)
          :Update_Metadata__Flows (OpenApiConnection);
         endif
        :GetWorkflowMetadataID (OpenApiConnection);
        :WorkflowEntityID (Compose);
        :See_if_already_exists__Flows (OpenApiConnection);
       endif
     repeat while (more items)
    :Cleanup_Deleted__Flows (OpenApiConnection);
    :Cleanup_Deleted_Flows (Foreach);
     if (condition) then (yes)
      :Cleanup_Deleted_Flow (OpenApiConnection);
      :catch_already_deleted_flow (Compose);
     endif
     repeat
      :Cleanup_Deleted_Flow (OpenApiConnection);
      :catch_already_deleted_flow (Compose);
     repeat while (more items)
    :Parse_JSON__Flows (ParseJson);
    :Test_Flows (SetVariable);
    :Core_Flows (SetVariable);
    :Governance_Flows (SetVariable);
    :BVA_Flows (SetVariable);
    :Nurture_Flows (SetVariable);
    :TenantFlows (Compose);
   endif
   partition "Flows" {
    :Apply_to_each__Flow (Foreach);
     if (condition) then (yes)
      :Filter_array__Flows (Query);
      :Add_if_in_tenant__Flows (If);
       if (condition) then (yes)
        :Add_if_does_not_exist__Flows (If);
         if (condition) then (yes)
          :Add_Metadata__Flows (OpenApiConnection);
         endif
         else (no)
          :Update_Metadata__Flows (OpenApiConnection);
         endif
        :GetWorkflowMetadataID (OpenApiConnection);
        :WorkflowEntityID (Compose);
        :See_if_already_exists__Flows (OpenApiConnection);
       endif
     endif
     repeat
      :Filter_array__Flows (Query);
      :Add_if_in_tenant__Flows (If);
       if (condition) then (yes)
        :Add_if_does_not_exist__Flows (If);
         if (condition) then (yes)
          :Add_Metadata__Flows (OpenApiConnection);
         endif
         else (no)
          :Update_Metadata__Flows (OpenApiConnection);
         endif
        :GetWorkflowMetadataID (OpenApiConnection);
        :WorkflowEntityID (Compose);
        :See_if_already_exists__Flows (OpenApiConnection);
       endif
     repeat while (more items)
    :Cleanup_Deleted__Flows (OpenApiConnection);
    :Cleanup_Deleted_Flows (Foreach);
     if (condition) then (yes)
      :Cleanup_Deleted_Flow (OpenApiConnection);
      :catch_already_deleted_flow (Compose);
     endif
     repeat
      :Cleanup_Deleted_Flow (OpenApiConnection);
      :catch_already_deleted_flow (Compose);
     repeat while (more items)
    :Parse_JSON__Flows (ParseJson);
    :Test_Flows (SetVariable);
    :Core_Flows (SetVariable);
    :Governance_Flows (SetVariable);
    :BVA_Flows (SetVariable);
    :Nurture_Flows (SetVariable);
    :TenantFlows (Compose);
   }
  :Get_Tenant_Info (Scope);
   if (condition) then (yes)
    :Prep_work (Scope);
     if (condition) then (yes)
      :CoE_Envt (Compose);
      :Tenant_ID (Compose);
      :Get_Environment_as_Admin (OpenApiConnection);
     endif
     partition "Prep_work" {
      :CoE_Envt (Compose);
      :Tenant_ID (Compose);
      :Get_Environment_as_Admin (OpenApiConnection);
     }
    :Canvas_Apps_and_Custom_Pages (Scope);
     if (condition) then (yes)
      :Get_Apps_as_Admin (OpenApiConnection);
      :Select_Envt_PowerApps (Select);
     endif
     partition "Canvas_Apps_and_Custom_Pages" {
      :Get_Apps_as_Admin (OpenApiConnection);
      :Select_Envt_PowerApps (Select);
     }
    :Model_Driven_Apps (Scope);
     if (condition) then (yes)
      :List_Model_Driven_Apps (OpenApiConnection);
      :Select_Envt_Model_Driven_Apps (Select);
     endif
     partition "Model_Driven_Apps" {
      :List_Model_Driven_Apps (OpenApiConnection);
      :Select_Envt_Model_Driven_Apps (Select);
     }
    :Cloud_Flows (Scope);
     if (condition) then (yes)
      :List_Unpublished_Cloud_Flows (OpenApiConnection);
      :Select_Envt_Cloud_Flows_Off (Select);
      :Union_Envt_Cloud_Flows (Compose);
      :Parse_Envt_Cloud_Flows (ParseJson);
      :Filter_Envt_Clouds_Unpublished (Query);
      :List_Flows_as_Admin_V2 (OpenApiConnection);
      :Select_Cloud_Flows_from_Envt (Select);
     endif
     partition "Cloud_Flows" {
      :List_Unpublished_Cloud_Flows (OpenApiConnection);
      :Select_Envt_Cloud_Flows_Off (Select);
      :Union_Envt_Cloud_Flows (Compose);
      :Parse_Envt_Cloud_Flows (ParseJson);
      :Filter_Envt_Clouds_Unpublished (Query);
      :List_Flows_as_Admin_V2 (OpenApiConnection);
      :Select_Cloud_Flows_from_Envt (Select);
     }
    :Solutions (Scope);
     if (condition) then (yes)
      :SetupTest (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       endif
       partition "SetupTest" {
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       }
      :SetupCore (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       endif
       partition "SetupCore" {
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       }
      :SetupGovernance (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       endif
       partition "SetupGovernance" {
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       }
      :SetupBVA (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       endif
       partition "SetupBVA" {
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       }
      :SetupNurture (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       endif
       partition "SetupNurture" {
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       }
      :List_Envt_Solutions (OpenApiConnection);
     endif
     partition "Solutions" {
      :SetupTest (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       endif
       partition "SetupTest" {
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       }
      :SetupCore (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       endif
       partition "SetupCore" {
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       }
      :SetupGovernance (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       endif
       partition "SetupGovernance" {
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       }
      :SetupBVA (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       endif
       partition "SetupBVA" {
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       }
      :SetupNurture (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       endif
       partition "SetupNurture" {
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       }
      :List_Envt_Solutions (OpenApiConnection);
     }
   endif
   partition "Get_Tenant_Info" {
    :Prep_work (Scope);
     if (condition) then (yes)
      :CoE_Envt (Compose);
      :Tenant_ID (Compose);
      :Get_Environment_as_Admin (OpenApiConnection);
     endif
     partition "Prep_work" {
      :CoE_Envt (Compose);
      :Tenant_ID (Compose);
      :Get_Environment_as_Admin (OpenApiConnection);
     }
    :Canvas_Apps_and_Custom_Pages (Scope);
     if (condition) then (yes)
      :Get_Apps_as_Admin (OpenApiConnection);
      :Select_Envt_PowerApps (Select);
     endif
     partition "Canvas_Apps_and_Custom_Pages" {
      :Get_Apps_as_Admin (OpenApiConnection);
      :Select_Envt_PowerApps (Select);
     }
    :Model_Driven_Apps (Scope);
     if (condition) then (yes)
      :List_Model_Driven_Apps (OpenApiConnection);
      :Select_Envt_Model_Driven_Apps (Select);
     endif
     partition "Model_Driven_Apps" {
      :List_Model_Driven_Apps (OpenApiConnection);
      :Select_Envt_Model_Driven_Apps (Select);
     }
    :Cloud_Flows (Scope);
     if (condition) then (yes)
      :List_Unpublished_Cloud_Flows (OpenApiConnection);
      :Select_Envt_Cloud_Flows_Off (Select);
      :Union_Envt_Cloud_Flows (Compose);
      :Parse_Envt_Cloud_Flows (ParseJson);
      :Filter_Envt_Clouds_Unpublished (Query);
      :List_Flows_as_Admin_V2 (OpenApiConnection);
      :Select_Cloud_Flows_from_Envt (Select);
     endif
     partition "Cloud_Flows" {
      :List_Unpublished_Cloud_Flows (OpenApiConnection);
      :Select_Envt_Cloud_Flows_Off (Select);
      :Union_Envt_Cloud_Flows (Compose);
      :Parse_Envt_Cloud_Flows (ParseJson);
      :Filter_Envt_Clouds_Unpublished (Query);
      :List_Flows_as_Admin_V2 (OpenApiConnection);
      :Select_Cloud_Flows_from_Envt (Select);
     }
    :Solutions (Scope);
     if (condition) then (yes)
      :SetupTest (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       endif
       partition "SetupTest" {
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       }
      :SetupCore (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       endif
       partition "SetupCore" {
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       }
      :SetupGovernance (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       endif
       partition "SetupGovernance" {
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       }
      :SetupBVA (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       endif
       partition "SetupBVA" {
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       }
      :SetupNurture (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       endif
       partition "SetupNurture" {
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       }
      :List_Envt_Solutions (OpenApiConnection);
     endif
     partition "Solutions" {
      :SetupTest (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       endif
       partition "SetupTest" {
        :Filter_to_tenant_Test (Query);
        :TestID (Compose);
        :TestIsManaged (Compose);
        :hasTest (Compose);
       }
      :SetupCore (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       endif
       partition "SetupCore" {
        :Filter_to_tenant_Core (Query);
        :CoreID (Compose);
        :CoreIsManaged (Compose);
       }
      :SetupGovernance (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       endif
       partition "SetupGovernance" {
        :Filter_to_tenant_Governance (Query);
        :GovernanceID (Compose);
        :GovernanceIsManaged (Compose);
        :hasGovernance (Compose);
       }
      :SetupBVA (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       endif
       partition "SetupBVA" {
        :Filter_to_tenant_BVA (Query);
        :BvaID (Compose);
        :BvaIsManaged (Compose);
        :hasBVA (Compose);
       }
      :SetupNurture (Scope);
       if (condition) then (yes)
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       endif
       partition "SetupNurture" {
        :Filter_to_tenant_Nurture (Query);
        :NurtureID (Compose);
        :NurtureIsManaged (Compose);
        :hasNurture (Compose);
       }
      :List_Envt_Solutions (OpenApiConnection);
     }
   }
 }
:Get_past_time (Expression);
:Initialize_CoreObjects (InitializeVariable);
:Initialize_AuditLogsObjects (InitializeVariable);
:Initialize_GovernanceObjects (InitializeVariable);
:Initialize_BvaObjects (InitializeVariable);
:Initialize_NurtureObjects (InitializeVariable);
:Initialize_TestObjects (InitializeVariable);
:Respond_to_a_PowerApp_or_flow (Response);
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
| shared_powerplatformforadmins_1 | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdmins | embedded |
| shared_powerappsforadmins | shared_powerappsforadmins | admin_CoECorePowerAppsAdmin2 | embedded |
| shared_flowmanagement | shared_flowmanagement | admin_CoECorePowerAutomateManagement | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| TenantID (admin_TenantID) | String | 67c96cd6-4a95-46ee-ac9b-8ee13ae256c4 | Inventory - REQUIRED. Azure Tenant ID |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Add_or_update_data | Scope | Operation ID: ca1a100e-f702-40d7-bb73-c94646ca2599 |
| Get_past_time | Expression | Operation ID: bbd36329-dcb9-4eda-b086-32840d3493a3 |
| Initialize_CoreObjects | InitializeVariable | Operation ID: 3b9440b5-9822-42a6-9a34-fd6f73df3747 |
| Initialize_AuditLogsObjects | InitializeVariable | Operation ID: 7a1ba9b1-0bc2-4538-adc0-44aa6dfc2953 |
| Initialize_GovernanceObjects | InitializeVariable | Operation ID: 415e12ee-7986-4df3-8193-9fbe09b64b1e |
| Initialize_BvaObjects | InitializeVariable | Operation ID: 87717d8a-cacf-42e3-a7eb-ceffd24b1743 |
| Initialize_NurtureObjects | InitializeVariable | Operation ID: 6893a344-1307-4e33-bcc7-d93477f7b2ac |
| Initialize_TestObjects | InitializeVariable | Operation ID: ee6ea965-b61a-47b3-95d3-e46e3ce46b71 |
| Respond_to_a_PowerApp_or_flow | Response | Operation ID: eb024ca6-698c-4dc3-ab20-51b6968b6938 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
