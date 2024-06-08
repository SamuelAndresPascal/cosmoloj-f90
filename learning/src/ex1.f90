program ex1
  implicit none
  integer :: n
  write(*, *) 'entrer un nombre entier'
  read(*, *) n
  if (mod(n, 2) == 0) then
    write(*, *) ' nombre pair'
  else
    write(*, *) ' nombre impair'
  end if
  stop
end program ex1
