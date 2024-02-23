program ex4b
  implicit none
  real :: x, y
  write(*, *) 'entrer deux nombres réels'
  read(*, *) x, y
  vert: if (x < y) then
    write(*, *) ' ordre croissant'
  else
    write(*, *) ' ordre décroissant'
  end if vert
  stop
end program ex4b
