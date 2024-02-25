recursive function fv(rad_ancien, n) result(resultat)
  implicit none
  integer, intent(in) :: n
  real, intent(in) :: rad_ancien
  real :: resultat
  real :: rad_nouv
  if (n == 0) then
    resultat = 1
  else
    rad_nouv = sqrt(0.5 + 0.5 * rad_ancien)
    resultat = rad_nouv * fv(rad_nouv, n - 1)
  end if
end function fv

program sp3
  implicit none
  
  interface
    recursive function fv(rad_ancien, n) result(resultat)
      integer, intent(in) :: n
      real, intent(in) :: rad_ancien
      real :: resultat
    end function fv
  end interface
  
  real :: rad, pi
  integer :: p
  
  p = 8
  rad = sqrt(0.5)
  pi = 2. / rad / fv(rad, p)
  write(*, *) pi
  stop
end program sp3

