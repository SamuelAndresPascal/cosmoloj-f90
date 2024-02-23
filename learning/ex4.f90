program ex4
  implicit none
  real :: x, y
  write(*, *) 'entrer deux nombres réels'
  read(*, *) x, y
  if (x < y) then
    write(*, *) ' ordre croissant'
  else
    write(*, *) ' ordre décroissant'
  end if
  stop
end program ex4
