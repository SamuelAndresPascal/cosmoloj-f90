subroutine diago(tab, dg)
  implicit none
  real, dimension(:,:), intent(in) :: tab ! tab est un tableau de profil implicite de rang 2
  ! expression de spécification (variable mais connue à l'entrée de la procédure)
  real, intent(out), dimension(size(tab, 1)) :: dg ! dg est un tableau de rang 1 de profil contraint
  integer :: i
  
  do i = 1, size(tab, 1)
    dg(i) = tab(i, i)
  end do
end subroutine diago

program sp03
  implicit none
  
  interface
    ! interface obligatoire
    subroutine diago(tab, dg)
      implicit none
      real, dimension(:,:), intent(in) :: tab
      real, intent(out), dimension(size(tab, 1)) :: dg
    end subroutine diago
  end interface
  
  real, dimension(4, 4) :: taba = 2.5
  real, dimension(2, 2) :: tabb = -1.5
  real, dimension(4) :: dga
  real, dimension(2) :: dgb
  
  call diago(taba, dga)
  call diago(tabb, dgb)
  write(*, *) dga
  write(*, *) dgb
end program sp03
