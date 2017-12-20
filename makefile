#-------------------------------------------------------------------------------

HOST    := $(shell hostname -s)
OS      := $(shell uname)

# compiler and options
#
FC            = gfortran
FFLAGS        = -O2
LD            = $(FC)
LDFLAGS       = $(FFLAGS)
LIBS          =

# include the host compilation options
#
ifeq ($(wildcard make.$(HOST)),make.$(HOST))
$(info )
$(info Using host compilation options from "$(wildcard make.$(HOST))".)
$(info )
include make.$(HOST)
else
$(info )
$(info Using default compilation options.)
$(info )
endif

#-------------------------------------------------------------------------------

.SUFFIXES:
.SUFFIXES: .f90 .o

.f90.o:
	$(FC) -c $(FFLAGS) $*.f90

#-------------------------------------------------------------------------------

name = test_sedov

default: $(name).x

sources = test_sedov.f90
objects = test_sedov.o
files   = $(sources) makefile

$(name).x: $(objects)
	$(LD) $(LDFLAGS) $(objects) -o $(name).x $(LIBS)

clean:
	rm -rf *.x *.o *.mod

clean-all: clean

#-------------------------------------------------------------------------------

test_sedov.o     : test_sedov.f90

#-------------------------------------------------------------------------------
