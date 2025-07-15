# Power Automate Flow: CLEANUP-AdminSyncTemplatev3OrphanedUsers

**Generated on:** 2025-07-15 19:14:48
**Flow ID:** 0022480B7872
**Source File:** CLEANUP-AdminSyncTemplatev3OrphanedUsers-B9E28619-A6E0-EE11-904C-0022480B7872.json

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** CLEANUP-AdminSyncTemplatev3OrphanedUsers
- **Triggers:** 1
- **Actions:** 1 1 1 1 1 1 1
- **Connections:** 5
- **Parameters:** 3

## Flow Diagram

```plantuml
@startuml
!theme plain
title Power Automate Flow: CLEANUP-AdminSyncTemplatev3OrphanedUsers

start
:Trigger: manual (Request);\n:Initialize_Flow_Environment_variable (InitializeVariable);
:Find_New_Orphans_and_Update_Existing_Users (Scope);
 if (condition) then (yes)
  :Users (Scope);
   if (condition) then (yes)
    :List_Users (OpenApiConnection);
    :Apply_to_each_user (Foreach);
     if (condition) then (yes)
      :Get_user_profile_V2 (OpenApiConnection);
      :User_Not_Found (Scope);
       if (condition) then (yes)
        :Update_User_as_Orphan (OpenApiConnection);
       endif
       partition "User_Not_Found" {
        :Update_User_as_Orphan (OpenApiConnection);
       }
      :User_Found (Scope);
       if (condition) then (yes)
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       endif
       partition "User_Found" {
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       }
     endif
     repeat
      :Get_user_profile_V2 (OpenApiConnection);
      :User_Not_Found (Scope);
       if (condition) then (yes)
        :Update_User_as_Orphan (OpenApiConnection);
       endif
       partition "User_Not_Found" {
        :Update_User_as_Orphan (OpenApiConnection);
       }
      :User_Found (Scope);
       if (condition) then (yes)
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       endif
       partition "User_Found" {
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       }
     repeat while (more items)
   endif
   partition "Users" {
    :List_Users (OpenApiConnection);
    :Apply_to_each_user (Foreach);
     if (condition) then (yes)
      :Get_user_profile_V2 (OpenApiConnection);
      :User_Not_Found (Scope);
       if (condition) then (yes)
        :Update_User_as_Orphan (OpenApiConnection);
       endif
       partition "User_Not_Found" {
        :Update_User_as_Orphan (OpenApiConnection);
       }
      :User_Found (Scope);
       if (condition) then (yes)
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       endif
       partition "User_Found" {
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       }
     endif
     repeat
      :Get_user_profile_V2 (OpenApiConnection);
      :User_Not_Found (Scope);
       if (condition) then (yes)
        :Update_User_as_Orphan (OpenApiConnection);
       endif
       partition "User_Not_Found" {
        :Update_User_as_Orphan (OpenApiConnection);
       }
      :User_Found (Scope);
       if (condition) then (yes)
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       endif
       partition "User_Found" {
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       }
     repeat while (more items)
   }
  :Groups (Scope);
   if (condition) then (yes)
    :List_Groups (OpenApiConnection);
    :Apply_to_each_group (Foreach);
     if (condition) then (yes)
      :Group_Not_Found (Scope);
       if (condition) then (yes)
        :Update_Group_as_Orphan (OpenApiConnection);
       endif
       partition "Group_Not_Found" {
        :Update_Group_as_Orphan (OpenApiConnection);
       }
      :Group_Found (Scope);
       if (condition) then (yes)
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       endif
       partition "Group_Found" {
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       }
      :Get_Group (OpenApiConnection);
     endif
     repeat
      :Group_Not_Found (Scope);
       if (condition) then (yes)
        :Update_Group_as_Orphan (OpenApiConnection);
       endif
       partition "Group_Not_Found" {
        :Update_Group_as_Orphan (OpenApiConnection);
       }
      :Group_Found (Scope);
       if (condition) then (yes)
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       endif
       partition "Group_Found" {
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       }
      :Get_Group (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Groups" {
    :List_Groups (OpenApiConnection);
    :Apply_to_each_group (Foreach);
     if (condition) then (yes)
      :Group_Not_Found (Scope);
       if (condition) then (yes)
        :Update_Group_as_Orphan (OpenApiConnection);
       endif
       partition "Group_Not_Found" {
        :Update_Group_as_Orphan (OpenApiConnection);
       }
      :Group_Found (Scope);
       if (condition) then (yes)
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       endif
       partition "Group_Found" {
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       }
      :Get_Group (OpenApiConnection);
     endif
     repeat
      :Group_Not_Found (Scope);
       if (condition) then (yes)
        :Update_Group_as_Orphan (OpenApiConnection);
       endif
       partition "Group_Not_Found" {
        :Update_Group_as_Orphan (OpenApiConnection);
       }
      :Group_Found (Scope);
       if (condition) then (yes)
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       endif
       partition "Group_Found" {
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       }
      :Get_Group (OpenApiConnection);
     repeat while (more items)
   }
  :Service_Principles (Scope);
   if (condition) then (yes)
    :List_ServicePrinciples (OpenApiConnection);
    :Apply_to_each_ServicePrinciple (Foreach);
     if (condition) then (yes)
      :ServicePrinciple_Not_Found (Scope);
       if (condition) then (yes)
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       endif
       partition "ServicePrinciple_Not_Found" {
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       }
      :ServicePrinciple_Found (Scope);
       if (condition) then (yes)
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       endif
       partition "ServicePrinciple_Found" {
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       }
      :Look_up_in_AD_for_Service_Principle (OpenApiConnection);
     endif
     repeat
      :ServicePrinciple_Not_Found (Scope);
       if (condition) then (yes)
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       endif
       partition "ServicePrinciple_Not_Found" {
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       }
      :ServicePrinciple_Found (Scope);
       if (condition) then (yes)
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       endif
       partition "ServicePrinciple_Found" {
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       }
      :Look_up_in_AD_for_Service_Principle (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Service_Principles" {
    :List_ServicePrinciples (OpenApiConnection);
    :Apply_to_each_ServicePrinciple (Foreach);
     if (condition) then (yes)
      :ServicePrinciple_Not_Found (Scope);
       if (condition) then (yes)
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       endif
       partition "ServicePrinciple_Not_Found" {
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       }
      :ServicePrinciple_Found (Scope);
       if (condition) then (yes)
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       endif
       partition "ServicePrinciple_Found" {
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       }
      :Look_up_in_AD_for_Service_Principle (OpenApiConnection);
     endif
     repeat
      :ServicePrinciple_Not_Found (Scope);
       if (condition) then (yes)
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       endif
       partition "ServicePrinciple_Not_Found" {
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       }
      :ServicePrinciple_Found (Scope);
       if (condition) then (yes)
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       endif
       partition "ServicePrinciple_Found" {
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       }
      :Look_up_in_AD_for_Service_Principle (OpenApiConnection);
     repeat while (more items)
   }
  :Tenant (Scope);
   if (condition) then (yes)
    :If_no_Tenant_record_add_it (If);
     if (condition) then (yes)
      :Add_Tenant (OpenApiConnection);
     endif
    :Get_Tenant (OpenApiConnection);
    :If_more_than_one_Tenant_clean_up (If);
     if (condition) then (yes)
      :Select_ID_for_cleanup (Select);
      :Skip_first_for_delelte (Compose);
      :Delete_extra_tenent_records (Foreach);
       if (condition) then (yes)
        :Delete_extra_tenent_record (OpenApiConnection);
       endif
       repeat
        :Delete_extra_tenent_record (OpenApiConnection);
       repeat while (more items)
     endif
    :Cleanup_Named_but_not_Typed_Tenant (Scope);
     if (condition) then (yes)
      :Get_Fake_Tenants (OpenApiConnection);
      :Delete_Fake_Tenants (Foreach);
       if (condition) then (yes)
        :Delete_Fake_Tenant (OpenApiConnection);
       endif
       repeat
        :Delete_Fake_Tenant (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Cleanup_Named_but_not_Typed_Tenant" {
      :Get_Fake_Tenants (OpenApiConnection);
      :Delete_Fake_Tenants (Foreach);
       if (condition) then (yes)
        :Delete_Fake_Tenant (OpenApiConnection);
       endif
       repeat
        :Delete_Fake_Tenant (OpenApiConnection);
       repeat while (more items)
     }
    :Get_Tenant_PreCheck (OpenApiConnection);
    :Try_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Look_up_in_AD__Tenant_User_Count (OpenApiConnection);
      :TenantSize (Compose);
      :Look_up_in_AD__Tenant_Guest_User_Count (OpenApiConnection);
      :NumberGuests (Compose);
      :hasGuests (Compose);
     endif
     partition "Try_to_get_tenant_size" {
      :Look_up_in_AD__Tenant_User_Count (OpenApiConnection);
      :TenantSize (Compose);
      :Look_up_in_AD__Tenant_Guest_User_Count (OpenApiConnection);
      :NumberGuests (Compose);
      :hasGuests (Compose);
     }
    :Fail_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Get_Tenant_User_for_Details (OpenApiConnection);
      :If_no_count_encourage_admin_to_enter_manually (If);
       if (condition) then (yes)
        :Create_a_new_record__Sync_Flow_Errors__cant_get_tenant_size (OpenApiConnection);
       endif
     endif
     partition "Fail_to_get_tenant_size" {
      :Get_Tenant_User_for_Details (OpenApiConnection);
      :If_no_count_encourage_admin_to_enter_manually (If);
       if (condition) then (yes)
        :Create_a_new_record__Sync_Flow_Errors__cant_get_tenant_size (OpenApiConnection);
       endif
     }
    :Able_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Update_Tenant (OpenApiConnection);
     endif
     partition "Able_to_get_tenant_size" {
      :Update_Tenant (OpenApiConnection);
     }
    :Tenant_User_ID (Compose);
   endif
   partition "Tenant" {
    :If_no_Tenant_record_add_it (If);
     if (condition) then (yes)
      :Add_Tenant (OpenApiConnection);
     endif
    :Get_Tenant (OpenApiConnection);
    :If_more_than_one_Tenant_clean_up (If);
     if (condition) then (yes)
      :Select_ID_for_cleanup (Select);
      :Skip_first_for_delelte (Compose);
      :Delete_extra_tenent_records (Foreach);
       if (condition) then (yes)
        :Delete_extra_tenent_record (OpenApiConnection);
       endif
       repeat
        :Delete_extra_tenent_record (OpenApiConnection);
       repeat while (more items)
     endif
    :Cleanup_Named_but_not_Typed_Tenant (Scope);
     if (condition) then (yes)
      :Get_Fake_Tenants (OpenApiConnection);
      :Delete_Fake_Tenants (Foreach);
       if (condition) then (yes)
        :Delete_Fake_Tenant (OpenApiConnection);
       endif
       repeat
        :Delete_Fake_Tenant (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Cleanup_Named_but_not_Typed_Tenant" {
      :Get_Fake_Tenants (OpenApiConnection);
      :Delete_Fake_Tenants (Foreach);
       if (condition) then (yes)
        :Delete_Fake_Tenant (OpenApiConnection);
       endif
       repeat
        :Delete_Fake_Tenant (OpenApiConnection);
       repeat while (more items)
     }
    :Get_Tenant_PreCheck (OpenApiConnection);
    :Try_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Look_up_in_AD__Tenant_User_Count (OpenApiConnection);
      :TenantSize (Compose);
      :Look_up_in_AD__Tenant_Guest_User_Count (OpenApiConnection);
      :NumberGuests (Compose);
      :hasGuests (Compose);
     endif
     partition "Try_to_get_tenant_size" {
      :Look_up_in_AD__Tenant_User_Count (OpenApiConnection);
      :TenantSize (Compose);
      :Look_up_in_AD__Tenant_Guest_User_Count (OpenApiConnection);
      :NumberGuests (Compose);
      :hasGuests (Compose);
     }
    :Fail_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Get_Tenant_User_for_Details (OpenApiConnection);
      :If_no_count_encourage_admin_to_enter_manually (If);
       if (condition) then (yes)
        :Create_a_new_record__Sync_Flow_Errors__cant_get_tenant_size (OpenApiConnection);
       endif
     endif
     partition "Fail_to_get_tenant_size" {
      :Get_Tenant_User_for_Details (OpenApiConnection);
      :If_no_count_encourage_admin_to_enter_manually (If);
       if (condition) then (yes)
        :Create_a_new_record__Sync_Flow_Errors__cant_get_tenant_size (OpenApiConnection);
       endif
     }
    :Able_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Update_Tenant (OpenApiConnection);
     endif
     partition "Able_to_get_tenant_size" {
      :Update_Tenant (OpenApiConnection);
     }
    :Tenant_User_ID (Compose);
   }
 endif
 partition "Find_New_Orphans_and_Update_Existing_Users" {
  :Users (Scope);
   if (condition) then (yes)
    :List_Users (OpenApiConnection);
    :Apply_to_each_user (Foreach);
     if (condition) then (yes)
      :Get_user_profile_V2 (OpenApiConnection);
      :User_Not_Found (Scope);
       if (condition) then (yes)
        :Update_User_as_Orphan (OpenApiConnection);
       endif
       partition "User_Not_Found" {
        :Update_User_as_Orphan (OpenApiConnection);
       }
      :User_Found (Scope);
       if (condition) then (yes)
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       endif
       partition "User_Found" {
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       }
     endif
     repeat
      :Get_user_profile_V2 (OpenApiConnection);
      :User_Not_Found (Scope);
       if (condition) then (yes)
        :Update_User_as_Orphan (OpenApiConnection);
       endif
       partition "User_Not_Found" {
        :Update_User_as_Orphan (OpenApiConnection);
       }
      :User_Found (Scope);
       if (condition) then (yes)
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       endif
       partition "User_Found" {
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       }
     repeat while (more items)
   endif
   partition "Users" {
    :List_Users (OpenApiConnection);
    :Apply_to_each_user (Foreach);
     if (condition) then (yes)
      :Get_user_profile_V2 (OpenApiConnection);
      :User_Not_Found (Scope);
       if (condition) then (yes)
        :Update_User_as_Orphan (OpenApiConnection);
       endif
       partition "User_Not_Found" {
        :Update_User_as_Orphan (OpenApiConnection);
       }
      :User_Found (Scope);
       if (condition) then (yes)
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       endif
       partition "User_Found" {
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       }
     endif
     repeat
      :Get_user_profile_V2 (OpenApiConnection);
      :User_Not_Found (Scope);
       if (condition) then (yes)
        :Update_User_as_Orphan (OpenApiConnection);
       endif
       partition "User_Not_Found" {
        :Update_User_as_Orphan (OpenApiConnection);
       }
      :User_Found (Scope);
       if (condition) then (yes)
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       endif
       partition "User_Found" {
        :If_disabled_and_disabled_is_orphan (If);
         if (condition) then (yes)
          :Update_Disabled_User_as_Orphan (OpenApiConnection);
         endif
         else (no)
          :Update_User (OpenApiConnection);
         endif
       }
     repeat while (more items)
   }
  :Groups (Scope);
   if (condition) then (yes)
    :List_Groups (OpenApiConnection);
    :Apply_to_each_group (Foreach);
     if (condition) then (yes)
      :Group_Not_Found (Scope);
       if (condition) then (yes)
        :Update_Group_as_Orphan (OpenApiConnection);
       endif
       partition "Group_Not_Found" {
        :Update_Group_as_Orphan (OpenApiConnection);
       }
      :Group_Found (Scope);
       if (condition) then (yes)
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       endif
       partition "Group_Found" {
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       }
      :Get_Group (OpenApiConnection);
     endif
     repeat
      :Group_Not_Found (Scope);
       if (condition) then (yes)
        :Update_Group_as_Orphan (OpenApiConnection);
       endif
       partition "Group_Not_Found" {
        :Update_Group_as_Orphan (OpenApiConnection);
       }
      :Group_Found (Scope);
       if (condition) then (yes)
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       endif
       partition "Group_Found" {
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       }
      :Get_Group (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Groups" {
    :List_Groups (OpenApiConnection);
    :Apply_to_each_group (Foreach);
     if (condition) then (yes)
      :Group_Not_Found (Scope);
       if (condition) then (yes)
        :Update_Group_as_Orphan (OpenApiConnection);
       endif
       partition "Group_Not_Found" {
        :Update_Group_as_Orphan (OpenApiConnection);
       }
      :Group_Found (Scope);
       if (condition) then (yes)
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       endif
       partition "Group_Found" {
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       }
      :Get_Group (OpenApiConnection);
     endif
     repeat
      :Group_Not_Found (Scope);
       if (condition) then (yes)
        :Update_Group_as_Orphan (OpenApiConnection);
       endif
       partition "Group_Not_Found" {
        :Update_Group_as_Orphan (OpenApiConnection);
       }
      :Group_Found (Scope);
       if (condition) then (yes)
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       endif
       partition "Group_Found" {
        :If_no_group_returned (If);
         if (condition) then (yes)
          :Update_Group_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_Group (OpenApiConnection);
          :Cannot_get_Transitive (Scope);
           if (condition) then (yes)
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           endif
           partition "Cannot_get_Transitive" {
            :flat_group_size (Compose);
            :flat_group_has_guests (Compose);
            :Add_error_so_admin_can_investigate__Sync_Flow_Errors (OpenApiConnection);
            :List_group_members (OpenApiConnection);
           }
          :Transitive_available (Scope);
           if (condition) then (yes)
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           endif
           partition "Transitive_available" {
            :Filter_to_just_type_users (Query);
            :Filter_to_Guest_Users (Query);
           }
          :Determine_group_values (Scope);
           if (condition) then (yes)
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           endif
           partition "Determine_group_values" {
            :Group_hasGuests (Compose);
            :Group_NumUsers (Compose);
           }
          :Get_Transitive_members (Scope);
           if (condition) then (yes)
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           endif
           partition "Get_Transitive_members" {
            :Reset_GroupMembersArray_to_empty (SetVariable);
            :Reset_NextPageUri (SetVariable);
            :Do_until (Until);
             if (condition) then (yes)
              :ListGroupMembersTransitive (OpenApiConnection);
              :New_Group_Members (Compose);
              :Existing_Group_Members (Compose);
              :Set_GroupMembersArray (SetVariable);
              :Update_NextPageUri (SetVariable);
             endif
           }
         endif
       }
      :Get_Group (OpenApiConnection);
     repeat while (more items)
   }
  :Service_Principles (Scope);
   if (condition) then (yes)
    :List_ServicePrinciples (OpenApiConnection);
    :Apply_to_each_ServicePrinciple (Foreach);
     if (condition) then (yes)
      :ServicePrinciple_Not_Found (Scope);
       if (condition) then (yes)
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       endif
       partition "ServicePrinciple_Not_Found" {
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       }
      :ServicePrinciple_Found (Scope);
       if (condition) then (yes)
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       endif
       partition "ServicePrinciple_Found" {
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       }
      :Look_up_in_AD_for_Service_Principle (OpenApiConnection);
     endif
     repeat
      :ServicePrinciple_Not_Found (Scope);
       if (condition) then (yes)
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       endif
       partition "ServicePrinciple_Not_Found" {
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       }
      :ServicePrinciple_Found (Scope);
       if (condition) then (yes)
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       endif
       partition "ServicePrinciple_Found" {
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       }
      :Look_up_in_AD_for_Service_Principle (OpenApiConnection);
     repeat while (more items)
   endif
   partition "Service_Principles" {
    :List_ServicePrinciples (OpenApiConnection);
    :Apply_to_each_ServicePrinciple (Foreach);
     if (condition) then (yes)
      :ServicePrinciple_Not_Found (Scope);
       if (condition) then (yes)
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       endif
       partition "ServicePrinciple_Not_Found" {
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       }
      :ServicePrinciple_Found (Scope);
       if (condition) then (yes)
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       endif
       partition "ServicePrinciple_Found" {
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       }
      :Look_up_in_AD_for_Service_Principle (OpenApiConnection);
     endif
     repeat
      :ServicePrinciple_Not_Found (Scope);
       if (condition) then (yes)
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       endif
       partition "ServicePrinciple_Not_Found" {
        :Update_ServicePrinciple_as_Orphan (OpenApiConnection);
       }
      :ServicePrinciple_Found (Scope);
       if (condition) then (yes)
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       endif
       partition "ServicePrinciple_Found" {
        :If_no_ServicePrinciple_returned (If);
         if (condition) then (yes)
          :Update_ServicePrinciple_as_Orphan__none_returned (OpenApiConnection);
         endif
         else (no)
          :Update_ServicePrinciple (OpenApiConnection);
         endif
       }
      :Look_up_in_AD_for_Service_Principle (OpenApiConnection);
     repeat while (more items)
   }
  :Tenant (Scope);
   if (condition) then (yes)
    :If_no_Tenant_record_add_it (If);
     if (condition) then (yes)
      :Add_Tenant (OpenApiConnection);
     endif
    :Get_Tenant (OpenApiConnection);
    :If_more_than_one_Tenant_clean_up (If);
     if (condition) then (yes)
      :Select_ID_for_cleanup (Select);
      :Skip_first_for_delelte (Compose);
      :Delete_extra_tenent_records (Foreach);
       if (condition) then (yes)
        :Delete_extra_tenent_record (OpenApiConnection);
       endif
       repeat
        :Delete_extra_tenent_record (OpenApiConnection);
       repeat while (more items)
     endif
    :Cleanup_Named_but_not_Typed_Tenant (Scope);
     if (condition) then (yes)
      :Get_Fake_Tenants (OpenApiConnection);
      :Delete_Fake_Tenants (Foreach);
       if (condition) then (yes)
        :Delete_Fake_Tenant (OpenApiConnection);
       endif
       repeat
        :Delete_Fake_Tenant (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Cleanup_Named_but_not_Typed_Tenant" {
      :Get_Fake_Tenants (OpenApiConnection);
      :Delete_Fake_Tenants (Foreach);
       if (condition) then (yes)
        :Delete_Fake_Tenant (OpenApiConnection);
       endif
       repeat
        :Delete_Fake_Tenant (OpenApiConnection);
       repeat while (more items)
     }
    :Get_Tenant_PreCheck (OpenApiConnection);
    :Try_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Look_up_in_AD__Tenant_User_Count (OpenApiConnection);
      :TenantSize (Compose);
      :Look_up_in_AD__Tenant_Guest_User_Count (OpenApiConnection);
      :NumberGuests (Compose);
      :hasGuests (Compose);
     endif
     partition "Try_to_get_tenant_size" {
      :Look_up_in_AD__Tenant_User_Count (OpenApiConnection);
      :TenantSize (Compose);
      :Look_up_in_AD__Tenant_Guest_User_Count (OpenApiConnection);
      :NumberGuests (Compose);
      :hasGuests (Compose);
     }
    :Fail_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Get_Tenant_User_for_Details (OpenApiConnection);
      :If_no_count_encourage_admin_to_enter_manually (If);
       if (condition) then (yes)
        :Create_a_new_record__Sync_Flow_Errors__cant_get_tenant_size (OpenApiConnection);
       endif
     endif
     partition "Fail_to_get_tenant_size" {
      :Get_Tenant_User_for_Details (OpenApiConnection);
      :If_no_count_encourage_admin_to_enter_manually (If);
       if (condition) then (yes)
        :Create_a_new_record__Sync_Flow_Errors__cant_get_tenant_size (OpenApiConnection);
       endif
     }
    :Able_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Update_Tenant (OpenApiConnection);
     endif
     partition "Able_to_get_tenant_size" {
      :Update_Tenant (OpenApiConnection);
     }
    :Tenant_User_ID (Compose);
   endif
   partition "Tenant" {
    :If_no_Tenant_record_add_it (If);
     if (condition) then (yes)
      :Add_Tenant (OpenApiConnection);
     endif
    :Get_Tenant (OpenApiConnection);
    :If_more_than_one_Tenant_clean_up (If);
     if (condition) then (yes)
      :Select_ID_for_cleanup (Select);
      :Skip_first_for_delelte (Compose);
      :Delete_extra_tenent_records (Foreach);
       if (condition) then (yes)
        :Delete_extra_tenent_record (OpenApiConnection);
       endif
       repeat
        :Delete_extra_tenent_record (OpenApiConnection);
       repeat while (more items)
     endif
    :Cleanup_Named_but_not_Typed_Tenant (Scope);
     if (condition) then (yes)
      :Get_Fake_Tenants (OpenApiConnection);
      :Delete_Fake_Tenants (Foreach);
       if (condition) then (yes)
        :Delete_Fake_Tenant (OpenApiConnection);
       endif
       repeat
        :Delete_Fake_Tenant (OpenApiConnection);
       repeat while (more items)
     endif
     partition "Cleanup_Named_but_not_Typed_Tenant" {
      :Get_Fake_Tenants (OpenApiConnection);
      :Delete_Fake_Tenants (Foreach);
       if (condition) then (yes)
        :Delete_Fake_Tenant (OpenApiConnection);
       endif
       repeat
        :Delete_Fake_Tenant (OpenApiConnection);
       repeat while (more items)
     }
    :Get_Tenant_PreCheck (OpenApiConnection);
    :Try_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Look_up_in_AD__Tenant_User_Count (OpenApiConnection);
      :TenantSize (Compose);
      :Look_up_in_AD__Tenant_Guest_User_Count (OpenApiConnection);
      :NumberGuests (Compose);
      :hasGuests (Compose);
     endif
     partition "Try_to_get_tenant_size" {
      :Look_up_in_AD__Tenant_User_Count (OpenApiConnection);
      :TenantSize (Compose);
      :Look_up_in_AD__Tenant_Guest_User_Count (OpenApiConnection);
      :NumberGuests (Compose);
      :hasGuests (Compose);
     }
    :Fail_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Get_Tenant_User_for_Details (OpenApiConnection);
      :If_no_count_encourage_admin_to_enter_manually (If);
       if (condition) then (yes)
        :Create_a_new_record__Sync_Flow_Errors__cant_get_tenant_size (OpenApiConnection);
       endif
     endif
     partition "Fail_to_get_tenant_size" {
      :Get_Tenant_User_for_Details (OpenApiConnection);
      :If_no_count_encourage_admin_to_enter_manually (If);
       if (condition) then (yes)
        :Create_a_new_record__Sync_Flow_Errors__cant_get_tenant_size (OpenApiConnection);
       endif
     }
    :Able_to_get_tenant_size (Scope);
     if (condition) then (yes)
      :Update_Tenant (OpenApiConnection);
     endif
     partition "Able_to_get_tenant_size" {
      :Update_Tenant (OpenApiConnection);
     }
    :Tenant_User_ID (Compose);
   }
 }
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
:Initalize_GroupMembersArray (InitializeVariable);
:NextPageUri (InitializeVariable);

stop
@enduml
```

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
| shared_commondataserviceforapps | shared_commondataserviceforapps | admin_sharedcommondataserviceforapps_98924 | embedded |
| shared_office365users_1 | shared_office365users | admin_CoECoreO365Users | embedded |
| shared_commondataserviceforapps_3 | shared_commondataserviceforapps | admin_CoECoreDataverse | embedded |
| shared_office365groups | shared_office365groups | admin_CoECoreO365Groups | embedded |
| shared_webcontents | shared_webcontents | admin_CoECoreHTTPWithAzureAD | embedded |

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|
| Power Automate Environment Variable (admin_PowerAutomateEnvironmentVariable) | String | https://flow.microsoft.com/manage/environments/ | Inventory - REQUIRED. Environment, including geographic location, for Power Automate - Ex for commercial: https://flow.microsoft.com/manage/environments/ |
| Disabled Users are Orphaned (admin_DisabledUsersareOrphaned) | Bool | - | Inventory - If true (Yes), then when an AD User is marked as disabled (Account enabled = false), they will be considered as orphaned. Default is false (No) |
| Graph URL Environment Variable (admin_GraphURLEnvironmentVariable) | String | https://graph.microsoft.com/ | Inventory - REQUIRED. The URL used to get graph information for your cloud. Ex https://graph.microsoft.com/ |

## Triggers

### manual
- **Type:** Request
- **Recurrence:** N/A

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|
| Initialize_Flow_Environment_variable | InitializeVariable | Operation ID: 1317eec2-490e-44ed-8782-626f3e887243 |
| Find_New_Orphans_and_Update_Existing_Users | Scope | Operation ID: bf74b53e-e858-49de-b356-2a9b6893ec79 |
| Respond_to_a_PowerApp_or_flow | Response | Operation ID: 49fabba9-b34f-4351-8533-c51ad226917b |
| Error_Handling | Scope | Operation ID: 38ae684e-622d-42ea-abd2-ee571aee3a5f |
| Update_last_run_as_pass | Scope | Operation ID: 5c140442-d939-4ca4-8ec8-d1ee2bed4a81 |
| Initalize_GroupMembersArray | InitializeVariable | Operation ID: 6d24336c-4d2b-45fc-9022-2033ecca0451 |
| NextPageUri | InitializeVariable | Operation ID: 97b3b8ca-3592-48bd-86e4-0579886a9c93 |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
