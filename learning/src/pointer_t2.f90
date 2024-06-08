program t2
  implicit none

  type :: ligne
    integer, dimension(:), pointer :: ptlig
  end type ligne

  type(ligne), dimension(7) :: triang
  integer :: i, j
  
  do i = 1, 7
    allocate(triang(i)%ptlig(i + 2))
    triang(i)%ptlig = (/ (j, j = 1, i + 2) /)
  end do
  
  do i = 1, 7
    write(*, '(10i7)') triang(i)%ptlig
  end do
  stop
end program t2
