program ex7
  implicit none
  character(len=1) :: lettre
  write(*, *) 'entrer une lettre'
  read(*, *) lettre
  select case(lettre)
    case('A', 'E', 'I', 'O', 'U', 'Y', 'a', 'e', 'i', 'o', 'u', 'y')
      write(*, *) ' voyelle'
    case default
      write(*, *) ' consonne'
  end select
  stop
end program ex7
