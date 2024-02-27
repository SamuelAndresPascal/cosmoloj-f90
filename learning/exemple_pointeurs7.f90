program exemple_pointeurs7
  implicit none
  
  type :: point
    character(len=1) :: nom
    integer :: x, y
  end type point
  
  type(point), target :: p1, p2
  type(point), pointer :: ptp1, ptp2
  
  integer, pointer :: pti
  
  p1 = point('W', 2, 3)
  p2 = point('C', 1, 4)
  
  ptp1 => p1
  ptp2 => p2
  
  write(*, *) ptp1
  write(*, *) ptp2
  
  ptp1%y = 5
  
  write(*, *) p1
  
  ptp1 = ptp2
  
  write(*, *) p1
  
  ptp1 = point('S', 6, 3)
  
  write(*, *) p1
  
  pti => p1%x
  
  write(*, *) ptp1
  
  stop
end program exemple_pointeurs7
