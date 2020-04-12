;;; cclibraries-addon.el --- editing additions for C language mode

;; Copyright (C) 2020 Marco Maggi

;; Author: Marco Maggi <mrc.mgg@gmail.com>
;; Created: Mar 22, 2020
;; Time-stamp: <2020-04-12 06:17:10 marco>
;; Keywords: languages

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

;;

;;; Change Log:

;;

;;; Code:

(require 'cclibraries-addon-font-lock)


;;;; Templates insertion

(defun cclibraries-c-language-insert-cce-condition (PREFIX NAME STATIC_DESCRIPTION)
  "Insert the template of a CCExceptions definition.

Argument PREFIX a string representing the prefix of this API.

Argument  NAME  a  string  representing the  identifier  of  this
condition type.

Argument  STATIC_DESCRIPTION  must  be  the  string  returned  as
statically allocated exceptional condition description."

  (interactive "*sAPI prefix: \n\
sUnprefixed condition object name: \n\
sShort exceptional condition descriptiron: \n")

  (insert "/* Automatically generated with: (my-c-insert-cce-condition \"" PREFIX "\" \"" NAME "\" \"" STATIC_DESCRIPTION "\") */
// HEADER STUFF

typedef struct " PREFIX "_" NAME "_D_t {
  cce_condition_descriptor_t;
} " PREFIX "_" NAME "_D_t;

typedef struct " PREFIX "_" NAME "_C_t {
  cce_condition_t;
} " PREFIX "_" NAME "_C_t;

" PREFIX "_decl const " PREFIX "_" NAME "_D_t * " PREFIX "_" NAME "_D;

" PREFIX "_decl " PREFIX "_" NAME "_C_t * " PREFIX "_" NAME "_C (cce_location_t * L, ...)
  __attribute__((nonnull(1),returns_nonnull));

__attribute__((pure,nonnull(1),always_inline))
static inline bool
" PREFIX "_is_a_" NAME "_C (const cce_condition_t * C)
{
  return cce_is_a_condition(C, " PREFIX "_" NAME "_D);
}

// CODE STUFF
static void		" PREFIX "_" NAME "_C_destructor     (cce_condition_t * C);
static const char *	" PREFIX "_" NAME "_C_static_message (const cce_condition_t * C);

static const " PREFIX "_" NAME "_D_t " PREFIX "_" NAME "_D_stru = {
  .parent		= &" PREFIX "_root_D_stru,
  .free			= " PREFIX "_" NAME "_C_destructor,
  .static_message	= " PREFIX "_" NAME "_C_static_message
};

const " PREFIX "_" NAME "_D_t * " PREFIX "_" NAME "_D = &" PREFIX "_" NAME "_D_stru;

" PREFIX "_" NAME "_C_t *
" PREFIX "_" NAME "_C (cce_location_t * L, ...)
{
  " PREFIX "_" NAME "_C_t *	C = cce_sys_malloc(L, sizeof(" PREFIX "_" NAME "_C_t));
  C->descriptor = &" PREFIX "_" NAME "_D_stru;
  return C;
}
void
" PREFIX "_" NAME "_C_destructor (cce_condition_t * C)
{
  free(C);
}
const char *
" PREFIX "_" NAME "_C_static_message (const cce_condition_t * C " (upcase PREFIX) "_UNUSED)
{
  return \"" STATIC_DESCRIPTION "\";
}
/* End of generated code. */
"))


;;;; imenu customisation

;; (defconst cclibraries-imenu-generic-expression
;;   `(
;; ;;; functions, generic functions, methods, variables

;;     ;; (cclibraries-defmethod ?fun (?args) . ?body)
;;     ;; (mmux-defun ?fun (?args) . ?body)
;;     (nil
;;      ,(eval-when-compile
;; 	(concat "^\\s-*(\\s-*"
;; 		(regexp-opt '("mmec-defmethod"
;; 			      "mmec-defun"
;; 			      "mmec-defmacro")
;; 			    'symbols)
;; 		"\\(" cclibraries-identifiers-rex "\\)"))
;;      2)
;;     )
;;   "Customise imenu for Emacs Lisp editing using MMUX Emacs packages.

;; For details on how to use it see `imenu-generic-expression'.")

;; (defun cclibraries-setup-imenu ()
;;   "Setup imenu for MMEC mode."
;;   (interactive)
;;   (setq imenu-generic-expression (append imenu-generic-expression
;; 					 cclibraries-imenu-generic-expression)))


;;;; done

;;;###autoload
(defun cclibraries-addon ()
  "Setup editing addons for CCMode related to the CCLibraries packages."
  ;;(cclibraries-setup-imenu)
  ;;(cclibraries-setup-indentation)
  (message "Setting up support for CCLibraries in CCMode."))

(provide 'cclibraries-addon)
;;; mmec.el ends here
