#!/bin/bash
echo "=========== Removing possible preexisting tap device"
ip tuntap del tap0 mode tap

set -e
echo "=========== Adding tap device"
ip tuntap add tap0 mode tap
ip link set tap0 up
echo "=========== Starting term in background"
BOARD=native make term &
sleep 2
coap-client 'coap://[fe80::e0e6:d4ff:fedf:3333%tap0]/list' | grep -q -P '(?=.*?testint)(?=.*?testdouble)(?=.*?teststr)^.*$'
echo "=========== Killing child processes"
pkill -TERM -P ${$}
echo "=========== Removing tap device"
ip tuntap del tap0 mode tap