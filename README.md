# riotsensors-example

A basic example application that can be deployed on a RIOT-OS supporting sensor board.

## Building

The settings in the Makefile default to the board msba2.

See the RIOT-OS documentation for more supported boards: [RIOT-Platforms](https://github.com/RIOT-OS/RIOT/wiki/RIOT-Platforms)

1. Clone from git and load libraries
```bash
# Clone the repository
git clone <url> riotsensors-example
cd riotsensors-example
# Clone libraries in lib folder
./prebuild.sh
```

2. Build with:
```bash
make all
```
This may require a toolchain or other external programs (e.g. gcc-arm-none-eabi for board msba2)

3. Flash with:
```bash
make flash
```
This may require a flash tool (e.g. lpc2k_pgm for boards msba2)

## riotsensors lambdas of this application

This application includes 3 lambdas that are handled like variables:

* `testint`, a static integer that is called once and then only retrieved from cache
* `testdouble`, a static double that is called once and then only retrieved from cache
* `teststring`, a static string that is called once and then only retrieved from cache