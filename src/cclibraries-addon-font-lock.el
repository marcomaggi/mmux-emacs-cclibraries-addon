;;; cclibraries-font-lock.el --- custom font locking for C language mode

;;Copyright (C) 2020 Marco Maggi <mrc.mgg@gmail.com>

;;Author: Marco Maggi <mrc.mgg@gmail.com>
;;Maintainer: Marco Maggi <mrc.mgg@gmail.com>
;;Created: Mar 22, 2020
;;Keywords: languages, lisp, faces, matching
;;Version: 1.0

;;This file is part of MMUX Emacs CCLibraries Addon.

;;This program is free software: you can redistribute it and/or modify it under the terms of the GNU
;;General Public  License as  published by  the Free Software  Foundation, either  version 3  of the
;;License, or (at your option) any later version.

;;This program is distributed in the hope that  it will be useful, but WITHOUT ANY WARRANTY; without
;;even the  implied warranty of MERCHANTABILITY  or FITNESS FOR  A PARTICULAR PURPOSE.  See  the GNU
;;General Public License for more details.

;;You should  have received a copy  of the GNU General  Public License along with  this program.  If
;;not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;This file should be loaded with:
;;
;;  (require 'cclibraries-font-lock)
;;
;;upon loading: the font-locking for Emacs Lisp mode is configured at the top-level.

;;; Change Log:

;;; Code:

(eval-when-compile
  (require 'cclibraries-addon-lists-of-symbols))
(require 'cc-mode)


;;; Documentation:

;;Introduction
;;------------
;;
;;To understand what is going  on read the Emacs guide (node "Font Lock")  and the Elisp guide (node
;;"Font Lock Mode").  Here we give a brief description, cutting out the alternatives and focusing on
;;the choices made for this customisation.
;;
;;There are a plethora of font locking related  variables; here we have to understand the two buffer
;;local  variables `font-lock-defaults'  and `font-lock-keywords',  and how  they interact  with the
;;`font-lock-add-keywords' function.
;;
;;Inspection
;;----------
;;
;;At  any  instant  we  can  inspect  the  list  of faces  defined  in  a  buffer  by  issuing  `M-x
;;list-faces-display': it will open a buffer with a table of faces and examples.
;;
;;To  try  the  colour  configuration  of  a  face:  open  a  buffer  with  the  mode  on,  do  `M-x
;;set-face-foreground' then type the  name of the face and the name of  the colour.  The change will
;;be applied instantly to all the text marked with the selected face.
;;
;;When debugging keep an eye on the "*Messages*" buffer: if a face is not recognised there should be
;;a message there.
;;
;;To test if a string matches a regexp: in the *scratch* buffer apply `C-j' to:
;;
;;   (let ((rex "'[[:alnum:]-\\?]+")
;;         (text "'woppa-wippa?"))
;;      (list (string-match rex text)
;;            (match-end 0)))
;;
;;the result should be a list of indexes specifying the matching portion.
;;
;;For reasons currently unknown  to me: to update the font locking configuration  we have to restart
;;Emacs  and load  the updated  files anew.   This is  not required  with other  customisations, for
;;example custom indentation, but with font locking that is the way it is.
;;
;;Keywords
;;--------
;;
;;To get what we want, our target is  to put The Right Value(tm) in `font-lock-keywords'.  We SHOULD
;;NOT do it directly with:
;;
;;   (setq font-lock-keywords ...)  ;; NO!!!
;;
;;rather  we   should  store   a  statically   computed,  full   font  locking   specification  into
;;`font-lock-defaults' (this  is done by the  mode's code); then, optionally,  we should dynamically
;;compute other specifications and activate them using `font-lock-add-keywords'.
;;
;;The value of  `font-lock-keywords' has two parts.  The  first is computed by Emacs  as selected by
;;Emacs Lisp mode, and we do not touch it.  The second part is initialised from `font-lock-defaults'
;;and optionally updated by `font-lock-add-keywords'.
;;
;;There are 3 mutually exclusive levels of font  locking: light, medium, heavy.  We can change this,
;;in a mode  specific manner, by appropriately setting  the variable `font-lock-maximum-decoration'.
;;We do not go into  details here, suffice it to say that the high level  is selected for Emacs Lisp
;;mode by doing:
;;
;;   (setq font-lock-maximum-decoration '((emacs-lisp-mode . 3)))
;;
;;for details read the Emacs guide.
;;
;;The value  of `font-lock-defaults' is a  list.  Its first element  can be a list  of symbols, each
;;symbol being the name of a variable holding the font locking specification for a level.
;;
;;Notes on regular expressions
;;----------------------------
;;
;;We need regular expressions to match portions of Scheme code.  We must remember that:
;;
;;* Basically  a regular  expression should  be a  string like  "\\(...\\)", in  which the  dots are
;;  replaced by the pattern, and the quoted parentheses select a grouping pattern.
;;
;;* When a regular expression is composed by more,  alternative, patterns we join them with a quoted
;;  bar: "...\\|...".
;;
;;* The regexp  for an optional  white space  is: "\\s-*", where  "\\s-" represents any  white space
;;  character.
;;
;;* The regexp for a mandatory white space is: "\\s-+".
;;
;;* The regexp for a mandatory white space followed by an optional open parenthesis is: "\\s-+(?".
;;
;;* The  "\\<" and  "\\>" match  the empty  strings  at the  beginning and  end of  a "word".   What
;;  constitutes a "word" is defined by the Emacs syntax table active in Emacs Lisp mode.
;;
;;  We DO NOT want to change the definition of "word", because it is used, for example, with the key
;;  commands [M-f] and [M-b].
;;
;;* To  test a  set  of regexps  definitions:  write them  in  a buffer,  evaluate  the buffer  with
;;  `eval-buffer', then, in the "*scratch*" buffer, try something like:
;;
;;     (string-match mmec-identifier-rex "->ciao")
;;     (string-match mmec-identifier-rex "ciao")
;;     (string-match mmec-identifier-rex "ciao-hello")
;;     (string-match mmec-identifier-rex "ciao,hello")
;;
;;  the return value of `string-match' is the index of  the first char that matched, or nil if there
;;  is no match.
;;
;;To build  optimised regular expressions for  lists of words,  we use `regexp-opt'; notice  that it
;;automatically quotes  special characters in the  input strings and it  automatically adds grouping
;;parentheses at the beginning and end if the  second argument is non-`nil', for example `t'.  Usage
;;example:
;;
;;  (eval-when-compile
;;    (regexp-opt '("define" "define*") 'symbols))
;;
;;To build a regexp  for a list of words the  second argument should be `words'; to  match a list of
;;symbols, like the programming language keywords, the second argument should be `symbols'.
;;
;;To match at  the beginning of a  Lisp form, we prepend  an open parenthesis and  an optional white
;;space and append a mandatory white space:
;;
;;  (eval-when-compile
;;    (concat "(\\s-*"
;;            (regexp-opt '("define" "define*") 'symbols)
;;            "\\s-+"))
;;
;;Notes on faces
;;--------------
;;
;;To define and use a  face we do 2 steps: define the customisation  item, define a variable holding
;;the name of the face.  For unfathomable reasons, we need both.
;;
;;The namespace of faces is separated from the others, so  it is not mandatory to name a face with a
;;symbol ending with `-face'.  Here we do it nevertheless.
;;
;;We define a set of  faces with `defface' forms and a set of  variables with `defconst' forms.  The
;;variables can reference both a built in Emacs face or a custom face.
;;
;;To search for colour names, see the Wikipedia page:
;;
;;   <https://en.wikipedia.org/wiki/X11_color_names>
;;


;;;; custom faces
;;
;;To search for colour names, see the Wikipedia page:
;;
;;   <https://en.wikipedia.org/wiki/X11_color_names>
;;

;;;; font lock face definitions

(defface cclibraries-c-language-known-functions-face
  `((t (:foreground "LightSteelBlue")))
  "CCMode custom face used for custom functions in the CCLibraries projects."
  :group 'custom-faces)

(defconst cclibraries-c-language-known-functions-face
  'cclibraries-c-language-known-functions-face
  "CCMode custom face used for custom functions in the CCLibraries projects.")


;;;; regular expressions

;; (defconst cclibraries-c-language-known-types-rex
;;   (eval-when-compile
;;     (regexp-opt
;;      '()
;;      'symbols))
;;   "List of known C language type names that will be highlighted with `font-lock-type-face'.")

(defconst cclibraries-c-language-known-functions-rex
  (eval-when-compile
    (regexp-opt
     (append cclibraries-c-language-ccexceptions-known-functions-list
	     cclibraries-c-language-cctests-known-functions-list
	     cclibraries-c-language-ccmemory-known-functions-list
	     cclibraries-c-language-ccstructs-known-functions-list
	     cclibraries-c-language-ccstrings-known-functions-list
	     cclibraries-c-language-ccsys-known-functions-list)
     'symbols))
  "List of known C language function names that will be highlighted with `cclibraries-c-language-known-functions-face'.")

(defconst cclibraries-c-language-known-directives-rex
  (eval-when-compile
    (regexp-opt
     (append cclibraries-c-language-ccexceptions-directives-list
	     cclibraries-c-language-ccstructs-directives-list
	     cclibraries-c-language-cctests-directives-list
	     cclibraries-c-language-cdecls-directives-list
	     cclibraries-c-language-cast-directives-list
	     cclibraries-c-language-attributes-directives-list)
     'symbols))
  "List of known C language directive names that will be highlighted with `font-lock-keyword-face'.")

(defconst cclibraries-c-language-ccnames-macros-rex
  (eval-when-compile
    (regexp-opt cclibraries-c-language-ccnames-macros-list 'symbols)))


;;;; main hook

;;This specification  highlights trait and  trait type  names as defined  by CCStructs: with  a "_T"
;;suffix.
(dolist (item '("\\sw+_T"))
  (setq c-font-lock-extra-types (cons item c-font-lock-extra-types)))

;;We perform this  call to `font-lock-add-keywords' at  the top-level, so the  configuration is done
;;only once at file-loading time.
;;
(font-lock-add-keywords
    ;;This argument MODE  is set to `c-mode' because  this call is performed at  the top-level.  See
    ;;the documentation of `font-lock-add-keywords' for details.
    'c-mode

  ;;Here  we need  to  remember that  "(regexp-opt  ... 'symbols)"  encloses  the generated  regular
  ;;expression between  '\_<\(' and  '\)\_>' so  the SUBEXP  number must  be 1  to match  the actual
  ;;symbol.
  ;;
  `(
    ;;(,cclibraries-c-language-known-types-rex 1 font-lock-type-face keep)
    (,cclibraries-c-language-known-functions-rex 1 cclibraries-c-language-known-functions-face keep)

    ;;Abuse the keyword face to fontify some directives names.
    ;;
    (,cclibraries-c-language-known-directives-rex 1 font-lock-keyword-face keep)

    ;;Abuse the  keyword face to  fontify some CCNames macro  names.  We
    ;;use  t  as  OVERRIDE  argument to  override  an  already  existent
    ;;fontification with this specification.
    (,cclibraries-c-language-ccnames-macros-rex 1 font-lock-keyword-face t)

    ;; --------------------------------------------------------------------

    ;;In macro uses like:
    ;;
    ;;  cclib_init(ccptn_t, clean)
    ;;  cclib_init(ccptn_t, error)
    ;;  cclib_init(ccptn_t, pointer, clean)
    ;;  cclib_init(ccptn_t, pointer, error)
    ;;  cclib_init(ccptn_t, pointer, dup, clean)
    ;;  cclib_init(ccptn_t, pointer, dup, error)
    ;;
    ;;we want to highlight "clean" and "error" and "copy".
    ;;
    (,(concat "cclib_\\(init\\|final\\|new\\|delete\\|alloc\\|release\\|make\\)\\("
	      "([^,]+,[[:blank:]\n]*\\(clean\\|error\\|copy\\))"
	      "\\|"
	      "([^,]+,[^,]+,[[:blank:]\n]*\\(clean\\|error\\|copy\\))"
	      "\\|"
	      "([^,]+,[^,]+,[^,]+,[[:blank:]\n]*\\(clean\\|error\\|copy\\))"
	      "\\)")
     3 font-lock-keyword-face t)

    ;;In macro uses like:
    ;;
    ;;  cclib_type(cce_condition_t, root)
    ;;
    ;;we want to highlight "root" with the type face.
    ;;
    ("cclib_type([^,]+,[[:blank:]\n]*\\([^)]+\\))" 1 font-lock-type-face t)

    ;;In macro uses like:
    ;;
    ;;  cclib_is(cce_condition_t, root)
    ;;
    ;;we want to highlight "root" with the type face.
    ;;
    ("cclib_is([^,)]+,[[:blank:]\n]*\\([^)]+\\))" 1 font-lock-type-face t)

    ;;In macro uses like:
    ;;
    ;;  cclib_method_type(cce_condition_t, delete)
    ;;
    ;;we want to highlight "delete" with the type face.
    ;;
    ("cclib_method_type([^,]+,[[:blank:]\n]*\\([^)]+\\))" 1 font-lock-type-face t)

    ;; --------------------------------------------------------------------
    ;; These are the old ones using "ccname" as preix.

    ;;In macro uses like:
    ;;
    ;;  ccname_init(ccptn_t, clean)
    ;;  ccname_init(ccptn_t, error)
    ;;  ccname_init(ccptn_t, pointer, clean)
    ;;  ccname_init(ccptn_t, pointer, error)
    ;;  ccname_init(ccptn_t, pointer, dup, clean)
    ;;  ccname_init(ccptn_t, pointer, dup, error)
    ;;
    ;;we want to highlight "clean" and "error" and "copy".
    ;;
    (,(concat "ccname_\\(init\\|new\\|alloc\\)\\("
	      "([^,]+,[[:blank:]\n]*\\(clean\\|error\\|copy\\))"
	      "\\|"
	      "([^,]+,[^,]+,[[:blank:]\n]*\\(clean\\|error\\|copy\\))"
	      "\\|"
	      "([^,]+,[^,]+,[^,]+,[[:blank:]\n]*\\(clean\\|error\\|copy\\))"
	      "\\)")
     3 font-lock-keyword-face t)

    ;;In macro uses like:
    ;;
    ;;  ccname_type(cce_condition_t, root)
    ;;
    ;;we want to highlight "root" with the type face.
    ;;
    ("ccname_type([^,]+,[[:blank:]\n]*\\([^)]+\\))" 1 font-lock-type-face t)

    ;;In macro uses like:
    ;;
    ;;  ccname_is(cce_condition_t, root)
    ;;
    ;;we want to highlight "root" with the type face.
    ;;
    ("ccname_is([^,)]+,[[:blank:]\n]*\\([^)]+\\))" 1 font-lock-type-face t)

    ;;In macro uses like:
    ;;
    ;;  ccname_method_type(cce_condition_t, delete)
    ;;
    ;;we want to highlight "delete" with the type face.
    ;;
    ("ccname_method_type([^,]+,[[:blank:]\n]*\\([^)]+\\))" 1 font-lock-type-face t)
    )

  ;;This  true value  as HOW  argument causes  this specification  to be  appended to  the value  of
  ;;`font-lock-keywords'.
  ;;
  ;;We need it to  allow correct fontification of known function names, which  must happen after the
  ;;fontification built into `c-mode'.
  t)


;;;; done

(provide 'cclibraries-addon-font-lock)

;;; cclibraries-addon-font-lock.el ends here
