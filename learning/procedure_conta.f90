program sp10
  implicit none
  integer :: i
  do i=1, 5
    call conta
  end do
end program sp10

subroutine conta
  implicit none
  integer :: n = 0
  n = n + 1
  write(*, *) n
end subroutine conta
