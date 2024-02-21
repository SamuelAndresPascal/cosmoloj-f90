program t1
  implicit none
  integer, dimension(:), allocatable :: tab
  integer :: n, i
  write(*, *) 'entrer un nombre entier'
  read(*, *) n
  allocate(tab(n))
  tab = (/ (i, i=1, n) /)
  write(*, *) tab
  stop
end program t1
