program ex5
  implicit none
  integer :: n
  write(*, *) 'entrer un nombre entier'
  read(*, *) n
  select case(n)
    case(0)
      write(*, *) ' zéro'
    case(1,2)
      write(*, *) ' tout petit'
    case(3:100)
      write(*, *) ' moyen'
    case(101:)
      write(*, *) ' grand'
    case default
      write(*, *) ' négatif'
  end select
  stop
end program ex5
