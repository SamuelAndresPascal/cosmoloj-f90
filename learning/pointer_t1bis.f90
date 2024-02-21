program t1bis
  implicit none
  integer, dimension(:), pointer :: tab
  integer :: n, i
  write(*, *) 'entrer un nombre entier'
  read(*, *) n
  allocate(tab(n))
  tab = (/ (i, i=1, n) /)
  write(*, *) tab
  stop
end program t1bis
