program ex3
  implicit none
  integer :: i
  write(*, *) 'entrer un nombre entier'
  read(*, *) i
  if (i > 0) then
    write(*, *) ' positif'
  else if (i < 0) then
    write(*, *) ' négatif'
  else
    write(*, *) ' zéro'
  end if
  stop
end program ex3
