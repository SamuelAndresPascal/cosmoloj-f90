program exemple_pointeurs4
  implicit none
  integer, pointer :: pti
  integer, target :: i, j
  i = 8
  pti => i
  j = pti
  write(*, *) i, j
  stop
end program exemple_pointeurs4
