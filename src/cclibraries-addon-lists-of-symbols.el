;; cclibraries-addon-lists-of-symbols.el --- definition of lists of symbols for the C language

;; Copyright (C) 2020 Marco Maggi

;; Author: Marco Maggi <mrc.mgg@gmail.com>
;; Created: Mar 22, 2020a
;; Time-stamp: <2020-04-12 10:43:15 marco>
;; Keywords: convenience, data, languages

;; This file is part of MMUX Emacs CCLibraries Addon.
;;
;; This program is  free software: you can redistribute  it and/or modify it under the  terms of the
;; GNU General Public License as published by the  Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
;; even the implied  warranty of MERCHANTABILITY or  FITNESS FOR A PARTICULAR PURPOSE.   See the GNU
;; General Public License for more details.
;;
;; You should have  received a copy of the  GNU General Public License along with  this program.  If
;; not, see <http://www.gnu.org/licenses/>.
;;

;;; Commentary:


;;; Change Log:

;;

;;; Code:


;;;; CCMode font locking: CCLibraries stuff

(defconst cclibraries-c-language-cdecls-directives-list
  '("cclib_decl"
    "cclib_private_decl"))

(defconst cclibraries-c-language-cast-directives-list
  '("CCLIB_PC"
    "CCLIB_CAST"))

(defconst cclibraries-c-language-attributes-directives-list
  '("CCLIB_FUNC_ATTRIBUTE_ALWAYS_INLINE"
    "CCLIB_FUNC_ATTRIBUTE_CONST"
    "CCLIB_FUNC_ATTRIBUTE_CONSTRUCTOR"
    "CCLIB_FUNC_ATTRIBUTE_DLLEXPORT"
    "CCLIB_FUNC_ATTRIBUTE_DLLIMPORT"
    "CCLIB_FUNC_ATTRIBUTE_FORMAT"
    "CCLIB_FUNC_ATTRIBUTE_HOT"
    "CCLIB_FUNC_ATTRIBUTE_LEAF"
    "CCLIB_FUNC_ATTRIBUTE_NONNULL"
    "CCLIB_FUNC_ATTRIBUTE_NORETURN"
    "CCLIB_FUNC_ATTRIBUTE_PURE"
    "CCLIB_FUNC_ATTRIBUTE_RETURNS_NONNULL"
    "CCLIB_FUNC_ATTRIBUTE_UNUSED"
    "CCLIB_FUNC_ATTRIBUTE_USED"
    "CCLIB_FUNC_ATTRIBUTE_VISIBILITY"
    "CCLIB_UNUSED"))

(defconst cclibraries-c-language-ccnames-macros-list
  '(
    "cclib_init"
    "cclib_final"
    "cclib_alloc"
    "cclib_release"
    "cclib_new"
    "cclib_delete"
    "cclib_make"
    "cclib_unmake"
    ;;
    "CCLIB_DEFINE_STRUCT_WITH_DESCRIPTOR"
    "CCLIB_DEFINE_TRAIT"
    "CCLIB_DEFINE_TRAIT_IMPLEMENTATION"
    ;;
    "cclib_struct_descriptor_type"
    "cclib_struct_descriptor"
    "cclib_methods_table_type"
    "cclib_methods_table"
    "cclib_method_type"
    "cclib_method"
    "cclib_struct_descriptor_ref_methods_table_pointer"
    "cclib_struct_descriptor_set_methods_table_pointer"
    "cclib_method_pointer"
    "cclib_call"
    "cclib_vcall"
    "cclib_resource_pointer"
    ;;
    "cclib_trait_resource_pointer"
    ;;
    "cclib_fun"
    "cclib_is"
    ))


;;;; CCMode font locking: CCExceptions stuff

(defconst cclibraries-c-language-ccexceptions-directives-list
  '("cce_location"
    "cce_raise"
    "cce_run_body_handlers"
    "cce_run_body_handlers_final"
    "cce_run_body_handlers_raise"
    "cce_run_catch_handlers_final"
    "cce_run_catch_handlers_raise"
    "cce_register_clean_handler_to_run_body_handlers"
    "cce_register_clean_handler_to_run_catch_handlers"
    "cce_register_error_handler_to_run_body_handlers"
    "cce_register_error_handler_to_run_catch_handlers"
    "cce_descriptor_set_parent_to"
    "cce_descriptor_pointer"
    "cce_resource_pointer"
    "cce_resource_destructor"
    "cce_descriptor"
    "cce_location"))

(defconst cclibraries-c-language-ccexceptions-known-functions-list
  '("cce_sys_malloc"
    "cce_sys_realloc"
    "cce_sys_calloc"
    "cce_init_and_register_handler_malloc"
    "cce_sys_malloc_guarded"
    "cce_sys_realloc_guarded"
    "cce_sys_calloc_guarded"
    ;;
    "cce_default_clean_handler_function"
    "cce_default_error_handler_function"
    ;;
    "cce_init_handler"
    "cce_init_and_register_handler"
    "cce_register_handler"
    "cce_forget_handler"
    ;;
    "cce_condition_init"
    "cce_condition_final"
    "cce_condition_delete"
    "cce_condition_is"
    "cce_condition_static_message"
    "cce_descriptor_child_and_ancestor"
    ;;
    "cce_condition_init_root"
    "cce_condition_is_root"
    ;;
    "cce_condition_init_unknown"
    "cce_condition_new_unknown"
    "cce_condition_is_unknown"
    ;;
    "cce_condition_init_break"
    "cce_condition_new_break"
    "cce_condition_is_break"
    ;;
    "cce_condition_init_error"
    "cce_condition_new_error"
    "cce_condition_is_error"
    ;;
    "cce_condition_init_runtime_error"
    "cce_condition_new_runtime_error"
    "cce_condition_is_runtime_error"
    ;;
    "cce_condition_init_logic_error"
    "cce_condition_new_logic_error"
    "cce_condition_is_logic_error"
    ;;
    "cce_condition_init_unreachable"
    "cce_condition_new_unreachable"
    "cce_condition_is_unreachable"
    "cce_raise_unreachable"
    ;;
    "cce_condition_init_unimplemented"
    "cce_condition_new_unimplemented"
    "cce_condition_is_unimplemented"
    ;;
    "cce_condition_init_invalid_argument"
    "cce_condition_new_invalid_argument"
    "cce_condition_is_invalid_argument"
    "cce_check_argument"
    ;;
    "cce_condition_init_math_error"
    "cce_condition_new_math_error"
    "cce_condition_is_math_error"
    ;;
    "cce_condition_init_math_nan"
    "cce_condition_new_math_nan"
    "cce_condition_is_math_nan"
    ;;
    "cce_condition_init_math_infinity"
    "cce_condition_new_math_infinity"
    "cce_condition_is_math_infinity"
    ;;
    "cce_condition_init_math_overflow"
    "cce_condition_new_math_overflow"
    "cce_condition_is_math_overflow"
    ;;
    "cce_condition_init_math_underflow"
    "cce_condition_new_math_underflow"
    "cce_condition_is_math_underflow"
    ;;
    "cce_condition_init_errno"
    "cce_condition_new_errno"
    "cce_condition_new_errno_clear"
    "cce_condition_is_errno"
    "cce_condition_is_errno_with_code"
    "cce_condition_ref_errno_errnum"
    "cce_condition_ref_errno_message"))


;;;; CCMode font locking: CCTests stuff

(defconst cclibraries-c-language-cctests-directives-list
  '("cctests_init"
    "cctests_final"
    "cctests_begin_group"
    "cctests_end_group"
    "cctests_run"))

(defconst cclibraries-c-language-cctests-known-functions-list
  '("cctests_condition_init_base"
    "cctests_condition_is_base"
    ;;
    "cctests_condition_init_success"
    "cctests_condition_new_success"
    "cctests_condition_is_success"
    ;;
    "cctests_condition_init_skipped"
    "cctests_condition_new_skipped"
    "cctests_condition_is_skipped"
    ;;
    "cctests_condition_init_failure"
    "cctests_condition_new_failure"
    "cctests_condition_is_failure"
    ;;
    "cctests_condition_init_expected_failure"
    "cctests_condition_new_expected_failure"
    "cctests_condition_is_expected_failure"
    ;;
    "cctests_condition_init_assertion"
    "cctests_condition_new_assertion"
    "cctests_condition_is_assertion"
    "cctests_condition_print_assertion"
    ;;
    "cctests_condition_init_assertion_expected_value"
    "cctests_condition_is_assertion_expected_value"
    ;;
    "cctests_condition_init_assertion_expected_char"
    "cctests_condition_new_assertion_expected_char"
    "cctests_condition_is_assertion_expected_char"
    ;;
    "cctests_condition_init_assertion_expected_uchar"
    "cctests_condition_new_assertion_expected_uchar"
    "cctests_condition_is_assertion_expected_uchar"
    ;;
    "cctests_condition_init_assertion_expected_int"
    "cctests_condition_new_assertion_expected_int"
    "cctests_condition_is_assertion_expected_int"
    ;;
    "cctests_condition_init_assertion_expected_uint"
    "cctests_condition_new_assertion_expected_uint"
    "cctests_condition_is_assertion_expected_uint"
    ;;
    "cctests_condition_init_assertion_expected_short"
    "cctests_condition_new_assertion_expected_short"
    "cctests_condition_is_assertion_expected_short"
    ;;
    "cctests_condition_init_assertion_expected_ushort"
    "cctests_condition_new_assertion_expected_ushort"
    "cctests_condition_is_assertion_expected_ushort"
    ;;
    "cctests_condition_init_assertion_expected_long"
    "cctests_condition_new_assertion_expected_long"
    "cctests_condition_is_assertion_expected_long"
    ;;
    "cctests_condition_init_assertion_expected_ulong"
    "cctests_condition_new_assertion_expected_ulong"
    "cctests_condition_is_assertion_expected_ulong"
    ;;
    "cctests_condition_init_assertion_expected_llong"
    "cctests_condition_new_assertion_expected_llong"
    "cctests_condition_is_assertion_expected_llong"
    ;;
    "cctests_condition_init_assertion_expected_ullong"
    "cctests_condition_new_assertion_expected_ullong"
    "cctests_condition_is_assertion_expected_ullong"
    ;;
    "cctests_condition_init_assertion_expected_int8"
    "cctests_condition_new_assertion_expected_int8"
    "cctests_condition_is_assertion_expected_int8"
    ;;
    "cctests_condition_init_assertion_expected_uint8"
    "cctests_condition_new_assertion_expected_uint8"
    "cctests_condition_is_assertion_expected_uint8"
    ;;
    "cctests_condition_init_assertion_expected_int16"
    "cctests_condition_new_assertion_expected_int16"
    "cctests_condition_is_assertion_expected_int16"
    ;;
    "cctests_condition_init_assertion_expected_uint16"
    "cctests_condition_new_assertion_expected_uint16"
    "cctests_condition_is_assertion_expected_uint16"
    ;;
    "cctests_condition_init_assertion_expected_int32"
    "cctests_condition_new_assertion_expected_int32"
    "cctests_condition_is_assertion_expected_int32"
    ;;
    "cctests_condition_init_assertion_expected_uint32"
    "cctests_condition_new_assertion_expected_uint32"
    "cctests_condition_is_assertion_expected_uint32"
    ;;
    "cctests_condition_init_assertion_expected_int64"
    "cctests_condition_new_assertion_expected_int64"
    "cctests_condition_is_assertion_expected_int64"
    ;;
    "cctests_condition_init_assertion_expected_uint64"
    "cctests_condition_new_assertion_expected_uint64"
    "cctests_condition_is_assertion_expected_uint64"
    ;;
    "cctests_condition_init_assertion_expected_float"
    "cctests_condition_new_assertion_expected_double"
    ;;
    "cctests_condition_init_assertion_expected_ssize"
    "cctests_condition_new_assertion_expected_ssize"
    "cctests_condition_is_assertion_expected_ssize"
    ;;
    "cctests_condition_init_assertion_expected_size"
    "cctests_condition_new_assertion_expected_size"
    "cctests_condition_is_assertion_expected_size"
    ;;
    "cctests_condition_init_assertion_expected_pointer"
    "cctests_condition_new_assertion_expected_pointer"
    "cctests_condition_is_assertion_expected_pointer"
    ;;
    "cctests_condition_init_assertion_expected_ptrdiff"
    "cctests_condition_new_assertion_expected_ptrdiff"
    "cctests_condition_is_assertion_expected_ptrdiff"
    ;;
    "cctests_condition_init_assertion_expected_intptr"
    "cctests_condition_new_assertion_expected_intptr"
    "cctests_condition_is_assertion_expected_intptr"
    ;;
    "cctests_condition_init_assertion_expected_uintptr"
    "cctests_condition_new_assertion_expected_uintptr"
    "cctests_condition_is_assertion_expected_uintptr"
    ;;
    "cctests_condition_init_assertion_expected_asciiz"
    "cctests_condition_new_assertion_expected_asciiz"
    "cctests_condition_is_assertion_expected_asciiz"
    ;;
    "cctests_condition_init_assertion_expected_ascii"
    "cctests_condition_new_assertion_expected_ascii"
    "cctests_condition_is_assertion_expected_ascii"
    ;;
    "cctests_condition_init_unreachable"
    "cctests_condition_new_unreachable"
    "cctests_condition_is_unreachable"
    "cctests_raise_unreachable"
    ;;
    "cctests_condition_init_signal"
    "cctests_condition_new_signal"
    "cctests_condition_is_signal"
    ;;
    "cctests_condition_init_signal_1"
    "cctests_condition_new_signal_1"
    "cctests_condition_is_signal_1"
    ;;
    "cctests_condition_init_signal_2"
    "cctests_condition_new_signal_2"
    "cctests_condition_is_signal_2"
    ;;
    "cctests_condition_init_signal_3"
    "cctests_condition_new_signal_3"
    "cctests_condition_is_signal_3"
    ;;
    "cctests_condition_init_child_failure"
    "cctests_condition_new_child_failure"
    "cctests_condition_is_child_failure"
    ;;
    "cctests_condition_init_child_abnormal_termination"
    "cctests_condition_new_child_abnormal_termination"
    "cctests_condition_is_child_abnormal_termination"
    ;;
    "cctests_condition_init_child_failure_exit_status"
    "cctests_condition_new_child_failure_exit_status"
    "cctests_condition_is_child_failure_exit_status"
    ;;
    "cctests_skip"
    "cctests_assert"
    "cctests_assert_true"
    "cctests_assert_false"
    "cctests_assert_asciiz"
    "cctests_assert_ascii"
    "cctests_assert_equal_char"
    "cctests_assert_equal_uchar"
    "cctests_assert_equal_int"
    "cctests_assert_equal_uint"
    "cctests_assert_equal_short"
    "cctests_assert_equal_ushort"
    "cctests_assert_equal_long"
    "cctests_assert_equal_ulong"
    "cctests_assert_equal_llong"
    "cctests_assert_equal_ullong"
    "cctests_assert_equal_int8"
    "cctests_assert_equal_uint8"
    "cctests_assert_equal_int16"
    "cctests_assert_equal_uint16"
    "cctests_assert_equal_int32"
    "cctests_assert_equal_uint32"
    "cctests_assert_equal_int64"
    "cctests_assert_equal_uint64"
    "cctests_assert_equal_float"
    "cctests_assert_equal_double"
    "cctests_assert_equal_pointer"
    "cctests_assert_equal_size"
    "cctests_assert_equal_ssize"
    "cctests_assert_equal_ptrdiff"
    "cctests_assert_equal_intptr"
    "cctests_assert_equal_uintptr"
    ;;
    "cctests_call_in_forked_process"
    "cctests_with_parent_and_child_process"
    ;;
    "cctests_debug_print"
    "cctests_debug_mark"
    "cctests_debug_question"))


;;;; CCMode font locking: CCMemory stuff

(defconst cclibraries-c-language-ccmemory-known-functions-list
  '("ccmem_malloc"
    "ccmem_realloc"
    "ccmem_calloc"
    "ccmem_free"
    "ccmem_std_malloc"
    "ccmem_std_realloc"
    "ccmem_std_calloc"
    "ccmem_std_free"
    "ccmem_malloc_guarded"
    "ccmem_realloc_guarded"
    "ccmem_calloc_guarded"
    "ccmem_std_malloc_guarded"
    "ccmem_std_realloc_guarded"
    "ccmem_std_calloc_guarded"
    "ccmem_new_block"
    "ccmem_new_block_null"
    "ccmem_new_block_from_ascii"
    "ccmem_new_block_from_asciiz"
    "ccmem_block_is_empty"
    "ccmem_block_is_null"
    "ccmem_block_equal"
    "ccmem_block_clean_memory"
    "ccmem_block_malloc"
    "ccmem_block_realloc"
    "ccmem_block_free"
    "ccmem_block_malloc_guarded"
    "ccmem_block_realloc_guarded"
    "ccmem_new_ascii"
    "ccmem_new_ascii_empty"
    "ccmem_new_ascii_null"
    "ccmem_new_ascii_from_str"
    "ccmem_new_ascii_from_block"
    "ccmem_new_ascii_from_asciiz"
    "ccmem_ascii_is_empty"
    "ccmem_ascii_is_null"
    "ccmem_ascii_equal"
    "ccmem_ascii_clean_memory"
    "ccmem_ascii_malloc"
    "ccmem_ascii_realloc"
    "ccmem_ascii_free"
    "ccmem_ascii_malloc_guarded"
    "ccmem_ascii_realloc_guarded"
    "ccmem_new_asciiz"
    "ccmem_new_asciiz_empty"
    "ccmem_new_asciiz_null"
    "ccmem_new_asciiz_from_str"
    "ccmem_new_asciiz_from_block"
    "ccmem_asciiz_is_empty"
    "ccmem_asciiz_is_null"
    "ccmem_asciiz_is_terminated"
    "ccmem_asciiz_equal"
    "ccmem_asciiz_clean_memory"
    "ccmem_asciiz_terminate"
    "ccmem_asciiz_malloc"
    "ccmem_asciiz_realloc"
    "ccmem_asciiz_free"
    "ccmem_asciiz_malloc_guarded"
    "ccmem_asciiz_realloc_guarded"))


;;;; CCMode font locking: CCStructs stuff

(defconst cclibraries-c-language-ccstructs-directives-list
  '("ccstructs_core"))

(defconst cclibraries-c-language-ccstructs-known-functions-list
  '("ccstructs_dtor_self"
    "ccstructs_dtor_destroy"
    "ccstructs_init_and_register_handler"
    ;;
    "ccstructs_dumpable_self"
    "ccstructs_dumpable_dump"
    ;;
    "ccstructs_serialiser_self"
    "ccstructs_serialiser_required_size"
    "ccstructs_serialiser_write"
    ;;
    "ccstructs_deserialiser_self"
    "ccstructs_deserialiser_required_size"
    "ccstructs_deserialiser_read"
    ;;
    "ccstructs_pathname_self"
    "ccstructs_pathname_asciiz"
    "ccstructs_pathname_is_static"
    "ccstructs_pathname_is_absolute"
    "ccstructs_pathname_is_relative"
    "ccstructs_pathname_is_normalised"
    "ccstructs_pathname_is_realpath"))


;;;; CCMode font locking: CCStrings stuff

(defconst cclibraries-c-language-ccstrings-known-functions-list
  '("ccstr_library_init"
    ;; buffers
    "ccstr_init_and_register_final_buffer_handler"
    "ccstr_init_and_register_delete_buffer_handler"
    "ccstr_buffer_format"
    "ccstr_buffer_vformat"
    "ccstr_buffer_fwrite"
    "ccstr_buffer_write"
    "ccstr_buffer_enlarge"
    "ccstr_buffer_is_full"
    "ccstr_buffer_output_block"
    "ccstr_buffer_output_ascii"
    "ccstr_buffer_target_block"
    "ccstr_buffer_target_ascii"
    ;; exceptional-condition objects
    "ccstr_condition_init_buffer_size_overflow"
    "ccstr_condition_new_buffer_size_overflow"
    "ccstr_condition_is_buffer_size_overflow"
    "ccstr_condition_init_buffer_output_incomplete"
    "ccstr_condition_new_buffer_output_incomplete"
    "ccstr_condition_is_buffer_output_incomplete"))


;;;; CCMode font locking: CCSys stuff

(defconst cclibraries-c-language-ccsys-known-functions-list
  '("ccsys_library_init"))


;;;; done

(provide 'cclibraries-addon-lists-of-symbols)
;;; cclibraries-addon-lists-of-symbols.el ends here
