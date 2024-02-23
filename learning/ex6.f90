program ex6
  implicit none
  integer :: age
  write(*, *) 'entrer un nombre entier'
  read(*, *) age
  select case(age > 90)
    case(.true.)
      write(*, *) ' vieillard'
    case(.false.)
      write(*, *) ' toujours jeune !'
  end select
  stop
end program ex6
