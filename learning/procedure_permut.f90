subroutine permut(tab, n1, n2)
  implicit none
  integer, dimension(:, :), intent(inout) :: tab ! tab est un tableau argument de profil implicite de rang 2
  integer, intent(in) :: n1, n2
  integer, dimension(size(tab, 2)) :: aux ! aux est un tableau local dynamique de rang 1
  aux = tab(n1, :)
  tab(n1, :) = tab(n2, :)
  tab(n2, :) = aux
end subroutine permut

program sp8
  implicit none
  
  interface ! cette interface est obligatoire à cause du profil implicite
    subroutine permut(tab, n1, n2)
      integer, dimension(:, :), intent(inout) :: tab
      integer, intent(in) :: n1, n2
    end subroutine permut
  end interface
  
  integer, dimension(4, 5) :: vrai
  integer :: i
  vrai = reshape( (/ (i, i = 1, 20) /), (/4, 5/))
  
  do i = 1, 4
    write(*, *) vrai(i, :)
  end do
  
  call permut(vrai, 2, 4)
  
  write(*, *)
  write(*, *) 'après'
  write(*, *)
  
  do i = 1, 4
    write(*, *) vrai(i, :)
  end do
end program sp8

