function beau(n)
  implicit none
  integer, intent(in) :: n
  real, dimension(n, n) :: beau ! déclaration du profil variable mais connu
  integer :: i
  beau = reshape( (/ (i, i=1, n**2) /), (/n, n/) )
end function beau

program sp11
  implicit none
  integer, parameter :: dim = 4 ! déclaration d'une constante figurative
  integer :: i
  real, dimension(dim, dim) :: tab
  
  interface ! interface obligatoire
    function beau(n)
      implicit none
      integer, intent(in) :: n
      real, dimension(n, n) :: beau
    end function beau
  end interface
  
  tab = 1.5
  tab = tab + beau(dim)
  do i = 1, dim
    write(*, *) tab(i, :)
  end do
end program sp11

