program exemple_pointeurs3
  implicit none
  integer, pointer :: pti
  integer, target :: i
  real :: r
  r = 2.5
  i = 8
  pti => i
  pti = r
  write(*, *) i
  stop
end program exemple_pointeurs3
