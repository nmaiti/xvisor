#/**
# Copyright (c) 2011 Pranav Sawargaonkar.
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
# @file objects.mk
# @version 1.0
# @author Pranav Sawargaonkar (pranav.sawargaonkar@gmail.com)
# @brief list of OMAP3 SOC objects.
# */

board-common-objs-$(CONFIG_OMAP3)+= omap3/prcm.o
board-common-objs-$(CONFIG_OMAP3)+= omap3/intc.o
board-common-objs-$(CONFIG_OMAP3)+= omap3/gpt.o

