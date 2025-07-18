# Power Automate Flow: CLEANUPHELPER-CheckDeletedv4AiModels

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 000D3A341FFF
**Source File:** CLEANUPHELPER-CheckDeletedv4AiModels-AE6E90ED-4B94-EE11-BE37-000D3A341FFF.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUPHELPER-CheckDeletedv4AiModels
- **Triggers:** 1
- **Actions:** 1 1 1
- **Connections:** 3
- **Parameters:** 1

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUPHELPER-CheckDeletedv4AiModels

start
:Trigger: manual (Request);\n:Check_Deleted_Scope (Scope);
 if (condition) then (yes)
  :Get_Environment_as_Admin (OpenApiConnection);
  :Terminate__envt_deleted (Scope);
   if (condition) then (yes)
    :Respond_to_a_PowerApp_or_pass_with_early_terminate (Response);
    :Terminate_for_environments_recently_deleted (Terminate);
   endif
   partition "Terminate__envt_deleted" {
    :Respond_to_a_PowerApp_or_pass_with_early_terminate (Response);
    :Terminate_for_environments_recently_deleted (Terminate);
   }
  :Run_Check_Deleted_Scope (Scope);
   if (condition) then (yes)
    :Get_Envt_Information (Scope);
     if (condition) then (yes)
      :Get_Envt_from_CoE_inventory (OpenApiConnection);
      :EnvtURL (Compose);
      :EnvtDisplayName (Compose);
      :Exit_if_unsupported (If);
       if (condition) then (yes)
        :Respond_to_a_PowerApp_or_flow__early_termination (Response);
        :Terminate_early (Terminate);
       endif
       else (no)
       endif
     endif
     partition "Get_Envt_Information" {
      :Get_Envt_from_CoE_inventory (OpenApiConnection);
      :EnvtURL (Compose);
      :EnvtDisplayName (Compose);
      :Exit_if_unsupported (If);
       if (condition) then (yes)
        :Respond_to_a_PowerApp_or_flow__early_termination (Response);
        :Terminate_early (Terminate);
       endif
       else (no)
       endif
     }
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_AI_Models_and_Exit_if_no_permissions (Scope);
       if (condition) then (yes)
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       endif
       partition "Get_AI_Models_and_Exit_if_no_permissions" {
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       }
      :List_Inventory_AI_Models (OpenApiConnection);
     endif
     partition "Get_Basics" {
      :Get_AI_Models_and_Exit_if_no_permissions (Scope);
       if (condition) then (yes)
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       endif
       partition "Get_AI_Models_and_Exit_if_no_permissions" {
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       }
      :List_Inventory_AI_Models (OpenApiConnection);
     }
    :Deleted_AI_Models (Scope);
     if (condition) then (yes)
      :Get_Inventory__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Inventory__Deleted_AI_Models" {
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       }
      :Get_Actual__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Actual__Deleted_AI_Models" {
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       }
      :DeletedAIModels (Query);
      :Mark_deleted (Foreach);
       if (condition) then (yes)
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       endif
       repeat
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Deleted_AI_Models" {
      :Get_Inventory__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Inventory__Deleted_AI_Models" {
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       }
      :Get_Actual__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Actual__Deleted_AI_Models" {
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       }
      :DeletedAIModels (Query);
      :Mark_deleted (Foreach);
       if (condition) then (yes)
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       endif
       repeat
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       repeat while (more items)
     }
   endif
   partition "Run_Check_Deleted_Scope" {
    :Get_Envt_Information (Scope);
     if (condition) then (yes)
      :Get_Envt_from_CoE_inventory (OpenApiConnection);
      :EnvtURL (Compose);
      :EnvtDisplayName (Compose);
      :Exit_if_unsupported (If);
       if (condition) then (yes)
        :Respond_to_a_PowerApp_or_flow__early_termination (Response);
        :Terminate_early (Terminate);
       endif
       else (no)
       endif
     endif
     partition "Get_Envt_Information" {
      :Get_Envt_from_CoE_inventory (OpenApiConnection);
      :EnvtURL (Compose);
      :EnvtDisplayName (Compose);
      :Exit_if_unsupported (If);
       if (condition) then (yes)
        :Respond_to_a_PowerApp_or_flow__early_termination (Response);
        :Terminate_early (Terminate);
       endif
       else (no)
       endif
     }
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_AI_Models_and_Exit_if_no_permissions (Scope);
       if (condition) then (yes)
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       endif
       partition "Get_AI_Models_and_Exit_if_no_permissions" {
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       }
      :List_Inventory_AI_Models (OpenApiConnection);
     endif
     partition "Get_Basics" {
      :Get_AI_Models_and_Exit_if_no_permissions (Scope);
       if (condition) then (yes)
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       endif
       partition "Get_AI_Models_and_Exit_if_no_permissions" {
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       }
      :List_Inventory_AI_Models (OpenApiConnection);
     }
    :Deleted_AI_Models (Scope);
     if (condition) then (yes)
      :Get_Inventory__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Inventory__Deleted_AI_Models" {
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       }
      :Get_Actual__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Actual__Deleted_AI_Models" {
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       }
      :DeletedAIModels (Query);
      :Mark_deleted (Foreach);
       if (condition) then (yes)
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       endif
       repeat
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Deleted_AI_Models" {
      :Get_Inventory__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Inventory__Deleted_AI_Models" {
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       }
      :Get_Actual__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Actual__Deleted_AI_Models" {
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       }
      :DeletedAIModels (Query);
      :Mark_deleted (Foreach);
       if (condition) then (yes)
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       endif
       repeat
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       repeat while (more items)
     }
   }
 endif
 partition "Check_Deleted_Scope" {
  :Get_Environment_as_Admin (OpenApiConnection);
  :Terminate__envt_deleted (Scope);
   if (condition) then (yes)
    :Respond_to_a_PowerApp_or_pass_with_early_terminate (Response);
    :Terminate_for_environments_recently_deleted (Terminate);
   endif
   partition "Terminate__envt_deleted" {
    :Respond_to_a_PowerApp_or_pass_with_early_terminate (Response);
    :Terminate_for_environments_recently_deleted (Terminate);
   }
  :Run_Check_Deleted_Scope (Scope);
   if (condition) then (yes)
    :Get_Envt_Information (Scope);
     if (condition) then (yes)
      :Get_Envt_from_CoE_inventory (OpenApiConnection);
      :EnvtURL (Compose);
      :EnvtDisplayName (Compose);
      :Exit_if_unsupported (If);
       if (condition) then (yes)
        :Respond_to_a_PowerApp_or_flow__early_termination (Response);
        :Terminate_early (Terminate);
       endif
       else (no)
       endif
     endif
     partition "Get_Envt_Information" {
      :Get_Envt_from_CoE_inventory (OpenApiConnection);
      :EnvtURL (Compose);
      :EnvtDisplayName (Compose);
      :Exit_if_unsupported (If);
       if (condition) then (yes)
        :Respond_to_a_PowerApp_or_flow__early_termination (Response);
        :Terminate_early (Terminate);
       endif
       else (no)
       endif
     }
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_AI_Models_and_Exit_if_no_permissions (Scope);
       if (condition) then (yes)
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       endif
       partition "Get_AI_Models_and_Exit_if_no_permissions" {
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       }
      :List_Inventory_AI_Models (OpenApiConnection);
     endif
     partition "Get_Basics" {
      :Get_AI_Models_and_Exit_if_no_permissions (Scope);
       if (condition) then (yes)
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       endif
       partition "Get_AI_Models_and_Exit_if_no_permissions" {
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       }
      :List_Inventory_AI_Models (OpenApiConnection);
     }
    :Deleted_AI_Models (Scope);
     if (condition) then (yes)
      :Get_Inventory__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Inventory__Deleted_AI_Models" {
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       }
      :Get_Actual__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Actual__Deleted_AI_Models" {
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       }
      :DeletedAIModels (Query);
      :Mark_deleted (Foreach);
       if (condition) then (yes)
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       endif
       repeat
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Deleted_AI_Models" {
      :Get_Inventory__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Inventory__Deleted_AI_Models" {
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       }
      :Get_Actual__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Actual__Deleted_AI_Models" {
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       }
      :DeletedAIModels (Query);
      :Mark_deleted (Foreach);
       if (condition) then (yes)
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       endif
       repeat
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       repeat while (more items)
     }
   endif
   partition "Run_Check_Deleted_Scope" {
    :Get_Envt_Information (Scope);
     if (condition) then (yes)
      :Get_Envt_from_CoE_inventory (OpenApiConnection);
      :EnvtURL (Compose);
      :EnvtDisplayName (Compose);
      :Exit_if_unsupported (If);
       if (condition) then (yes)
        :Respond_to_a_PowerApp_or_flow__early_termination (Response);
        :Terminate_early (Terminate);
       endif
       else (no)
       endif
     endif
     partition "Get_Envt_Information" {
      :Get_Envt_from_CoE_inventory (OpenApiConnection);
      :EnvtURL (Compose);
      :EnvtDisplayName (Compose);
      :Exit_if_unsupported (If);
       if (condition) then (yes)
        :Respond_to_a_PowerApp_or_flow__early_termination (Response);
        :Terminate_early (Terminate);
       endif
       else (no)
       endif
     }
    :Get_Basics (Scope);
     if (condition) then (yes)
      :Get_AI_Models_and_Exit_if_no_permissions (Scope);
       if (condition) then (yes)
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       endif
       partition "Get_AI_Models_and_Exit_if_no_permissions" {
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       }
      :List_Inventory_AI_Models (OpenApiConnection);
     endif
     partition "Get_Basics" {
      :Get_AI_Models_and_Exit_if_no_permissions (Scope);
       if (condition) then (yes)
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       endif
       partition "Get_AI_Models_and_Exit_if_no_permissions" {
        :List_Envt_AI_Models (OpenApiConnection);
        :Terminate__no_access (Scope);
         if (condition) then (yes)
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         endif
         partition "Terminate__no_access" {
          :Respond_to_a_PowerApp_for_fail_for_no_access (Response);
          :Terminate_for_no_access (Terminate);
         }
       }
      :List_Inventory_AI_Models (OpenApiConnection);
     }
    :Deleted_AI_Models (Scope);
     if (condition) then (yes)
      :Get_Inventory__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Inventory__Deleted_AI_Models" {
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       }
      :Get_Actual__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Actual__Deleted_AI_Models" {
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       }
      :DeletedAIModels (Query);
      :Mark_deleted (Foreach);
       if (condition) then (yes)
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       endif
       repeat
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       repeat while (more items)
     endif
     partition "Deleted_AI_Models" {
      :Get_Inventory__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Inventory__Deleted_AI_Models" {
        :Select_Inventory__Deleted_AI_Models (Select);
        :Parse_Inventory__Deleted_AI_Models (ParseJson);
       }
      :Get_Actual__Deleted_AI_Models (Scope);
       if (condition) then (yes)
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       endif
       partition "Get_Actual__Deleted_AI_Models" {
        :Select_Actual__Deleted_AI_Models (Select);
        :Parse_Actual__Deleted_AI_Models (ParseJson);
       }
      :DeletedAIModels (Query);
      :Mark_deleted (Foreach);
       if (condition) then (yes)
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       endif
       repeat
        :Find_it_for_GUID (OpenApiConnection);
        :If_found_mark_deleted (If);
         if (condition) then (yes)
          :GUID_to_Delete (Compose);
          :Mark_record_deleted (OpenApiConnection);
         endif
         else (no)
         endif
       repeat while (more items)
     }
   }
 }
:Error_Handling (Scope);
 if (condition) then (yes)
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate_2 (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow_failed (Response);
 endif
 partition "Error_Handling" {
  :Create_a_new_record__Sync_Flow_Errors (OpenApiConnection);
  :Terminate_2 (Terminate);
  :Get_ID_Fail (OpenApiConnection);
  :Update_Last_Run_Fail (OpenApiConnection);
  :Respond_to_a_PowerApp_or_flow_failed (Response);
 }
:Update_last_run_as_pass (Scope);
 if (condition) then (yes)
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
 endif
 partition "Update_last_run_as_pass" {
  :Update_Last_Run_Successful (OpenApiConnection);
  :Get_ID_Pass (OpenApiConnection);
  :Catch__not_ready_to_take_last_run_date (Compose);
  :Respond_to_a_PowerApp_or_flow (Response);
 }

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_powerplatformforadmins | shared_powerplatformforadmins | admin_CoECorePowerPlatformforAdmins | embedded |
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |

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
| Check_Deleted_Scope | Scope | Operation ID: 86c68153-2b1b-4eeb-b1c8-2b6781eb5328 |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
