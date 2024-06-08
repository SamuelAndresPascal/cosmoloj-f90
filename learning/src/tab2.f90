program tab2
  implicit none
  real, dimension(2,3) :: matri
  integer :: i, j
  real :: valmax
  valmax = 0
  
  do i = 1, 2
    do j = 1, 3
      write(*, *) 'entrer une valeur réelle'
      read(*, *) matri(i, j)
      if (abs(matri(i, j)) > valmax) valmax = abs(matri(i, j))
    end do
  end do
  write(*, *) 'la valeur absolue maximum est ', valmax
  stop
end program tab2
