SHELL = /bin/bash

include lib/riotsensors/riotmodule/Makefile.inc

# name of your application
APPLICATION = rs-example

# If no BOARD is found in the environment, use this default:
BOARD ?= msba2

# This has to be the absolute path to the RIOT base directory:
RIOTBASE ?= $(CURDIR)/lib/RIOT

# Comment this out to disable code in RIOT that does safety checking
# which is not needed in a production environment but helps in the
# development process:
CFLAGS += -DDEVELHELP

# Change this to 0 show compiler invocation lines by default:
QUIET ?= 1

# Modules to include:
USEMODULE += pthread
USEMODULE += posix

include $(RIOTBASE)/Makefile.include
