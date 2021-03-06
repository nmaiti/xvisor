#/**
# Copyright (c) 2010 Anup Patel.
# All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# @file Makefile
# @version 1.0
# @author Anup Patel (anup@brainfault.org)
# @brief toplevel makefile for Device Tree Compiler
# */

src_dir=$(CURDIR)
ifdef O
 build_dir=$(shell readlink -f $(O))
else
 build_dir=$(CURDIR)/build
endif

targets-y=$(build_dir)/dtc

dtc-deps-y =$(src_dir)/dtc-lexer.lex.c
dtc-deps-y+=$(src_dir)/dtc-parser.tab.c
dtc-deps-y+=$(src_dir)/dtc-parser.tab.h

dtc-objs-y =$(build_dir)/dtc.o
dtc-objs-y+=$(build_dir)/flattree.o
dtc-objs-y+=$(build_dir)/fstree.o
dtc-objs-y+=$(build_dir)/data.o
dtc-objs-y+=$(build_dir)/livetree.o
dtc-objs-y+=$(build_dir)/treesource.o
dtc-objs-y+=$(build_dir)/srcpos.o
dtc-objs-y+=$(build_dir)/checks.o
dtc-objs-y+=$(build_dir)/dtc-lexer.lex.o
dtc-objs-y+=$(build_dir)/dtc-parser.tab.o

dtc-cp=cp
dtc-cc=gcc
dtc-cflags=
dtc-ld=gcc
dtc-ldflags=

.PHONY: all
all: $(targets-y)

$(build_dir)/dtc: $(dtc-deps-y) $(dtc-objs-y)
	@mkdir -p `dirname $@`
	@echo " (host-ld)   $(subst $(build_dir)/,,$@)"
	@$(dtc-ld) $(dtc-ldflags) $(dtc-objs-y) -o $@

$(src_dir)/%.lex.c: %.lex.c_shipped 
	@mkdir -p `dirname $@`
	@echo " (copy)      $(subst $(src_dir)/,,$@)"
	@$(dtc-cp) $< $@

$(src_dir)/%.tab.c: %.tab.c_shipped
	@mkdir -p `dirname $@`
	@echo " (copy)      $(subst $(src_dir)/,,$@)"
	@$(dtc-cp) $< $@

$(src_dir)/%.tab.h: %.tab.h_shipped
	@mkdir -p `dirname $@`
	@echo " (copy)      $(subst $(src_dir)/,,$@)"
	@$(dtc-cp) $< $@

$(build_dir)/%.o: $(src_dir)/%.c
	@mkdir -p `dirname $@`
	@echo " (host-cc)   $(subst $(build_dir)/,,$@)"
	@$(dtc-cc) $(dtc-cflags) -I`dirname $<` -c $< -o $@

.PHONY: clean
clean:
	@echo " (rm)        *.lex.c"
	@rm -f $(src_dir)/*.lex.c
	@echo " (rm)        *.tab.c"
	@rm -f $(src_dir)/*.tab.c
	@echo " (rm)        *.tab.h"
	@rm -f $(src_dir)/*.tab.h

