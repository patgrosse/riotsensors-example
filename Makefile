SHELL = /bin/bash

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

# Use this do disable the riotsensors networking environment
# No CoAP server will be started and no RIOT-OS networking packets
# will be included by riotsensors
# Use the C preprocessor macro RS_NO_COAP in your code to determine
# if networking should be initialized (will be defined by riotsensors)
# RS_NO_COAP = 1

# Change this to 0 show compiler invocation lines by default:
QUIET ?= 1

# Modules to include:
ifneq "native" "$(BOARD)"
  USEMODULE += pthread
  USEMODULE += posix
else
  CFLAGS += -pthread
  LINKFLAGS += -lpthread
endif

include lib/riotsensors/riotmodule/Makefile.inc
include $(RIOTBASE)/Makefile.include
