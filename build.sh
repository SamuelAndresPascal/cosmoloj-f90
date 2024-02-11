#!/usr/bin/bash
gfortran -c unit-simple.f90
gfortran -o main main.f90 unit-simple.o
