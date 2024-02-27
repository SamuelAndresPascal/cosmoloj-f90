program array
  implicit none
  
  ! comparaison de l'odre de parcourt des indices d'un tableau de rang > 1 en fortran
  
  integer :: n = 20000
  integer(kind=8) :: i, j
  integer, dimension(20000, 20000) :: tab
  real :: start, finish
  tab = reshape( (/ (i, i=1, n**2) /), (/ n, n /) )
  
  ! parcourt dans l'ordre java : 4.7s pour n = 20000
  call cpu_time(start)
  do i = 1, n
    do j = 1, n
      tab(i,j) = tab(i,j) + 1
    end do
  end do
  call cpu_time(finish)
  write(*, *) finish - start

  ! parcourt dans l'ordre C : 0.8s pour n = 20000
  call cpu_time(start)
  do j = 1, n
    do i = 1, n
      tab(i,j) = tab(i,j) + 1
    end do
  end do
  call cpu_time(finish)
  write(*, *) finish - start
  
end program array
