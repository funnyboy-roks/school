#!/bin/sh

set -xe

make WeirdCalc

CLASSPATH=".:antlr-runtime-4.13.2.jar" java WeirdCalc $@
