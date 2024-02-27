function sym1(p)
  implicit none
  type :: point
    sequence ! facultatif
    real :: x, y
  end type point
  
  type(point), intent(in) :: p
  type(point) :: sym1
  
  sym1 = point(-p%x, -p%y)
end function sym1

type(point) function sym2(p)
  implicit none
  type :: point
    sequence ! facultatif
    real :: x, y
  end type point
  
  type(point), intent(in) :: p
  
  sym2 = point(-p%x, -p%y)
end function sym2

program sp19
  implicit none
  type :: point ! cette déclaration du type bra est obligatoire
    sequence ! facultatif
    real :: x, y
  end type point
  
  interface ! cette interface est obligatoire
    function sym1(p)
      type :: point
        sequence
        real :: x, y
      end type point
      type(point), intent(in) :: p
      type(point) :: sym1
    end function sym1
    
    type(point) function sym2(p)
      type :: point
        sequence
        real :: x, y
      end type point
      type(point), intent(in) :: p
    end function sym2
  end interface
  
  type(point) :: xer1 = point(-5.3, 8.9)
  type(point) :: xer2 = point(4.02, -0.69)
  write(*, *) sym1(xer1)
  write(*, *) sym1(xer2)
  write(*, *) sym2(xer1)
  write(*, *) sym2(xer2)
end program sp19

