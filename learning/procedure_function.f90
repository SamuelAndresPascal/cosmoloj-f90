function descri1(a, b, c)
  implicit none
  real, intent(in) :: a, b, c
  real :: descri1 ! déclaration interne du type de la fonction
  descri1 = b ** 2 - 4 * a * c
end function descri1

real function descri2(a, b, c) ! déclaration en signature du type de la fonction
  implicit none
  real, intent(in) :: a, b, c
  descri2 = b ** 2 - 4 * a * c
end function descri2

subroutine descri3(a, b, c, res)
  implicit none
  real, intent(in) :: a, b, c
  real, intent(out) :: res
  res = b ** 2 - 4 * a * c
  return
end subroutine descri3

program toto
  implicit none
  real :: a1, b1, c1, y, descri1, descri2
  read(*, *) a1, b1, c1
  y = descri1(a1, b1, c1)
  write(*, *) y
  y = descri2(a1, b1, c1)
  write(*, *) y
  call descri3(a1, b1, c1, y)
  write(*, *) y
  stop
end program toto
