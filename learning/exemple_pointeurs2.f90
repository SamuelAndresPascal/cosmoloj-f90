program exemple_pointeurs2
  implicit none
  integer, pointer :: pti
  real :: r
  r = 2.5
  pti => r
  write(*, *) pti, r
  stop
end program exemple_pointeurs2
