# riotsensors-example

A basic example application that can be deployed on a RIOT-OS supporting sensor board.

## Building

The settings in the Makefile default to the board msba2.

See the RIOT-OS documentation for more supported boards: [RIOT-Platforms](https://github.com/RIOT-OS/RIOT/wiki/RIOT-Platforms)

1. Clone from git with submodules
```
git clone <url> riotsensors-example
cd riotsensors-example
git submodule update --init
```

2. Build with:
```
make all
```

3. Flash with:
```
make flash
```

## riotsensors lambdas of this application

This application includes 3 lambdas that are handled like variables:

* `testint`, a static integer that is called once and then only retrieved from cache
* `testdouble`, a static double that is called once and then only retrieved from cache
* `teststring`, a static string that is called once and then only retrieved from cache