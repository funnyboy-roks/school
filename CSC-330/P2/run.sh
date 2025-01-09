#!/bin/sh

make WeirdCalc

CLASSPATH=".:antlr-runtime-4.13.2.jar" java WeirdCalc $@
