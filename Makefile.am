## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS		= -I meta/autotools
AUTOMAKE_OPTIONS	= foreign
EXTRA_DIST		= INSTALL
dist_doc_DATA		= README COPYING
CLEANFILES		=
MAINTAINERCLEANFILES	=

## --------------------------------------------------------------------
## documentation

AM_MAKEINFOFLAGS		= --no-split
info_TEXINFOS			= doc/cclibraries-addon.texi
doc_cclibraries_addon_TEXINFOS	= \
	doc/fdl-1.3.texi	\
	doc/gpl-3.0.texi	\
	doc/macros.texi

## --------------------------------------------------------------------

MY_EMACS_DIRS		= \
	--directory $(srcdir)/src			\
	--directory $(builddir)/src			\
	--directory /usr/share/emacs/site-lisp		\
	--directory /usr/local/share/emacs/site-lisp

# This  variable is  reserved to  the  package author.   Users of  the
# package can set ELCFLAGS.
AM_ELCFLAGS	= --no-init-file $(MY_EMACS_DIRS)

sharelispdir		= $(datadir)/emacs/site-lisp
dist_sharelisp_LISP	= \
	src/cclibraries-addon.el			\
	src/cclibraries-addon-font-lock.el		\
	src/cclibraries-addon-lists-of-symbols.el

src/cclibraries-addon-font-lock.elc: src/cclibraries-addon-lists-of-symbols.el

src/cclibraries-addon.elc: src/cclibraries-addon-font-lock.elc

### end of file
