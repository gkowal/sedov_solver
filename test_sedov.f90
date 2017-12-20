!!******************************************************************************
!!
!!  This file is part of the SEDOV_SOLVER source code, a program to calculate
!!  analytical solution of a Sedov blast wave propagation.
!!
!!  Copyright (C) 2017 Grzegorz Kowal <grzegorz@amuncode.org>
!!
!!  This program is free software: you can redistribute it and/or modify
!!  it under the terms of the GNU General Public License as published by
!!  the Free Software Foundation, either version 3 of the License, or
!!  (at your option) any later version.
!!
!!  This program is distributed in the hope that it will be useful,
!!  but WITHOUT ANY WARRANTY; without even the implied warranty of
!!  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!!  GNU General Public License for more details.
!!
!!  You should have received a copy of the GNU General Public License
!!  along with this program.  If not, see <http://www.gnu.org/licenses/>.
!!
!!******************************************************************************
!!
!! program: TEST_SEDOV
!!
!!  This is a program to test the Sedov solver module. It demonstrates
!!  how to prepare the variables and parameters which later are passed
!!  to the solution subroutine. It also show what is the solver subroutine
!!  output.
!!
!!******************************************************************************
!
program test_sedov

! include subroutines and variables from other modules
!
  use sedov_solver, only : sedov_1d

  implicit none

! problem parameters
!
  character(len=80) :: outfile = 'spherical_standard_omega0p00.dat'
  integer           :: nmax    = 1000
  integer           :: nstep   = 120
  real(kind=16)     :: eblast  = 8.510721q-01
  real(kind=16)     :: xgeom   = 3.0q+00
  real(kind=16)     :: omega   = 0.0q+00
  real(kind=16)     :: time    = 1.0q+00
  real(kind=16)     :: rho0    = 1.0q+00
  real(kind=16)     :: vel0    = 0.0q+00
  real(kind=16)     :: ener0   = 0.0q+00
  real(kind=16)     :: pres0   = 0.0q+00
  real(kind=16)     :: cs0     = 0.0q+00
  real(kind=16)     :: gamma   = 1.4q+00
  real(kind=16)     :: rlo     = 0.0q+00
  real(kind=16)     :: rhi     = 1.2q+00

! local variables
!
  character(len=80) :: string
  integer           :: i, iargc
  real(kind=16)     :: rstep, value

! local vectors
!
  real(kind=16), dimension(:), allocatable :: rp, dn, en, pr, vl, cs

! formatting strings
!
  character(len=80), parameter :: fmt1 = "('#',1x,'npoints = ',i4,1x"          &
                                                   // ",', time = ',1p8e12.4)"
  character(len=80), parameter :: fmt2 = "('#',4x,t1,a,t8,a,t22,a,t36,a,t50"   &
                                                   // ",a,t64,a,t78,a,t92,a)"
  character(len=80), parameter :: fmt3 = "(1x,i4,1p8e14.6)"
!
!-------------------------------------------------------------------------------
!
! allocate vector variables
!
  allocate(rp(nmax), dn(nmax), en(nmax), pr(nmax), vl(nmax), cs(nmax))

! generate the radial coordinate
!
  rstep = (rhi - rlo) / float(nstep)
  do i = 1, nstep
    rp(i)   = rlo + 0.5q0 * rstep + float(i - 1) * rstep
  end do

! get the solution for all spatial points at once
!
   call sedov_1d(nmax, time, nstep, rp, eblast, omega, xgeom, rho0, vel0       &
               , ener0, pres0, cs0, gamma, dn, en, pr, vl, cs)

! store solution in the output file
!
  open(unit = 2, file = outfile, status = 'unknown')
  write(2,fmt1) nstep, time
  write(2,fmt2) 'i','x','den','ener','pres','vel','cs'
  do i = 1, nstep
    write(2,fmt3) i, rp(i), dn(i), en(i), pr(i), vl(i), cs(i)
  end do
  close(2)

! deallocate vector variables
!
  deallocate(rp, dn, en, pr, vl, cs)

!-------------------------------------------------------------------------------
!
end program
