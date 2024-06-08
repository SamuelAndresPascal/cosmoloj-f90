subroutine hori(n, beau)
  implicit none
  integer, intent(in) :: n
  real, dimension(:, :), intent(out) :: beau ! déclaration avec un profil implicite
  integer :: i
  beau = reshape( (/ (i, i=1, n**2) /), (/n, n/) )
end subroutine hori

program sp12
  implicit none
  integer, parameter :: dim = 4
  integer :: i
  real, dimension(dim, dim) :: tab
  real, dimension(dim, dim) :: bo ! utilisation obligatoire du tableau bo
  
  interface ! interface obligatoire
    subroutine hori(n, beau)
      integer, intent(in) :: n
      real, dimension(:, :), intent(out) :: beau
    end subroutine hori
  end interface
  
  tab = 1.5
  call hori(dim, bo)
  tab = tab + bo
  do i=1, dim
    write(*, *) tab(i, :)
  end do
end program sp12
  
