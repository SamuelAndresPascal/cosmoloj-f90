program exo1
  implicit none
  
  type ident
    character(len=10) :: nom
    integer, dimension(3) :: age
  end type ident
  
  type(ident) :: paul
  paul = ident('Jules', (/ 66, 90, 12 /))
  write(*, *) paul%nom(1:3)
  write(*, *) paul%age(2)
  write(*, *) paul%age
  stop
end program exo1
