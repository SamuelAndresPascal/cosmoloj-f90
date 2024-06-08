subroutine swap(x, y)
  implicit none
  real, intent(inout) :: x, y
  real :: aux
  aux = x
  x = y
  y = aux
  return
end subroutine swap

program toto
  implicit none
  real :: a1, b1
  a1 = 1
  b1 = 2
  write(*, *) a1, b1
  call swap(a1, b1)
  write(*, *) a1, b1
  stop
end program toto
