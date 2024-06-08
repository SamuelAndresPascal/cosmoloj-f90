subroutine trace_dyn(tab, tr)
  implicit none
  ! tab est un tableau de profil implicite de rang 2
  real, dimension(:,:), intent(in) :: tab
  real, intent(out) :: tr
  integer :: i
  tr = 0.
  
  do i = 1, size(tab, 1)
    tr = tr + tab(i, i)
  end do
end subroutine trace_dyn

subroutine trace_sta(tab, tr, n)
  implicit none
  integer, intent(in) :: n
  ! tab est un tableau de profil ajustable ou variable dont les étendues figurent en arguments d'entrée
  real, dimension(n, n), intent(in) :: tab
  real, intent(out) :: tr
  integer :: i
  tr = 0.
  
  do i = 1, size(tab, 1)
    tr = tr + tab(i, i)
  end do
end subroutine trace_sta

program sp
  implicit none
  
  interface
    ! interface obligatoire pour une subroutine avec tableau dynamique en argument
    subroutine trace_dyn(tab, tr)
      implicit none
      real, dimension(:,:), intent(in) :: tab
      real, intent(out) :: tr
    end subroutine trace_dyn
  end interface
  
  real, dimension(4, 4) :: taba = 2.5
  real, dimension(2, 2) :: tabb = -1.5
  real :: ta, tb
  
  call trace_sta(taba, ta, 4)
  call trace_sta(tabb, tb, 2)
  write(*, *) ta
  write(*, *) tb
  
  call trace_dyn(taba, ta)
  call trace_dyn(tabb, tb)
  write(*, *) ta
  write(*, *) tb
end program sp
