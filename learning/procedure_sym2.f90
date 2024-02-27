function sym(p)
  implicit none
  type :: point
    sequence ! facultatif
    real :: x, y
  end type point
  
  type(point), intent(in) :: p
  type(point) :: sym
  
  sym = point(-p%x, -p%y)
end function sym

program sp20
  implicit none
  type :: point ! cette déclaration du type bra est obligatoire
    sequence ! facultatif
    real :: x, y
  end type point
  
  ! déclaration en lieu et place de l'interface
  type(point) :: sym
  
  type(point) :: xer1 = point(-5.3, 8.9)
  type(point) :: xer2 = point(4.02, -0.69)
  write(*, *) sym(xer1)
  write(*, *) sym(xer2)
end program sp20

