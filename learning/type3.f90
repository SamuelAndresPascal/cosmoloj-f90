program exo3
  implicit none
  
  type point
    character :: ca
    integer :: x, y
  end type point
  
  type(point), dimension(3) :: cour
  cour = (/ point('A', -1, 4), point('T', 8, 3), point('H', 0, 4) /)
  write(*, *) cour(1)%ca
  write(*, *) cour(2)%x
  write(*, *) cour(3)
  write(*, *) cour
  stop
end program exo3
