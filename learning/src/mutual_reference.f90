module toto
  implicit none
  
  type unit
    type(unit), pointer :: u
    type(converter), pointer :: c
  end type unit
  
  type converter
    type(unit), pointer :: u
  end type converter
end module toto

program array
  implicit none
  write(*, *) "Bonjour"
  
end program array
