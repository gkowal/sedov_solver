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
!! module: SEDOV_SOLVER
!!
!!  This module contains all subroutines required to construct the analytical
!!  solution of a Sedov blast wave propagation.
!!
!!******************************************************************************
!
module sedov_solver

! module variables are not implicit by default
!
  implicit none

! by default everything is private
!
  private

! declare public subroutines
!
  public :: sedov_1d
!
!-------------------------------------------------------------------------------
!
  contains
!
!===============================================================================
!
! subroutine SEDOV_1D:
! -------------------
!
!   Subroutine converts a physical position to corresponding array index.
!
!   Input arguments:
!
!     time     - temporal point where solution is desired [seconds]
!     xpos(:)  - spatial points where solution is desired [cm]
!     eblast   - energy of blast [erg]
!     rho0     - ambient density [g/cm**3]  rho = rho0 * r**(-omega_in)
!     omega_in - density power law exponent rho = rho0 * r**(-omega_in)
!     vel0     - ambient material speed [cm/s]
!     pres0    - ambient pressure [erg/cm**3]
!     cs0      - ambient sound speed [cm/s]
!     gam0     - gamma law equation of state
!     xgeom_in - geometry factor, 3=spherical, 2=cylindircal, 1=planar
!
!   Output arguments:
!
!     den(:)   - density     [g/cm**3]
!     ener(:)  - specific internal energy [erg/g]
!     pres(:)  - presssure [erg/cm**3]
!     vel(:)   - velocity [cm/s]
!     cs(:)    - sound speed [cm/s]
!
!===============================================================================
!
  subroutine sedov_1d(n, time, nstep, xpos, eblast, omega_in, xgeom_in,        &
                      rho0, vel0, ener0, pres0, cs0, gam0,                     &
                      den, ener, pres, vel, cs)

! local variables are not implicit by default
!
    implicit none

! subroutine arguments
!
    integer                    , intent(in)  :: n, nstep
    real(kind=16)              , intent(in)  :: time, eblast, rho0, omega_in,  &
                                                vel0, ener0, pres0, cs0, gam0, &
                                                xgeom_in
    real(kind=16), dimension(n), intent(in)  :: xpos
    real(kind=16), dimension(n), intent(out) :: den, ener, pres, vel, cs
!
!-------------------------------------------------------------------------------
!
!
!-------------------------------------------------------------------------------
!
  end subroutine sedov_1d

!-------------------------------------------------------------------------------
!
end module sedov_solver
