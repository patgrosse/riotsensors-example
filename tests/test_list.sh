#!/bin/bash
echo "=========== Removing possible preexisting tap device"
ip tuntap del tap0 mode tap

set -e
echo "=========== Adding tap device"
ip tuntap add tap0 mode tap
ip link set tap0 up
echo "=========== Starting term in background"
PID=`(./bin/native/rs-example.elf tap0 -d) | grep -Eo '[0-9]+'`
echo Started with PID ${PID}
sleep 2
echo "=========== Print network configuration"
ip a
echo "=========== Calling CoAP client"
krams=`coap-client 'coap://[fe80::e0e6:d4ff:fedf:3333%tap0]/list'`
echo "CoAP output was:"
echo $krams
coap-client 'coap://[fe80::e0e6:d4ff:fedf:3333%tap0]/list' | grep -q -P '(?=.*?testint)(?=.*?testdouble)(?=.*?teststr)^.*$'
val=$?
echo "=========== Killing child processes"
kill -SIGTERM ${PID}
echo "=========== Removing tap device"
ip tuntap del tap0 mode tap

if [ $? = 0 ]; then
	echo "Success"
else
	echo "Test failed"
	exit 1
fi
