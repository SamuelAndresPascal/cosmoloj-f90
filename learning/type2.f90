program exo2
  implicit none
  
  type point
    real :: x, y
  end type point
  
  type cercle
    real :: rayon
    type(point) :: centre
  end type cercle
  
  type(cercle) :: cc1, cc2
  real :: dist, a1, a2, a3, a4
  
  a1 = -1.4
  a2 = 0.25
  a3 = 2.1
  a4 = 3.7
  
  cc1 = cercle(0.2, point(a1, a2))
  cc2 = cercle(4.1, point(a3, a4))
  
  write(*, *) cc1, cc2
  dist = sqrt((cc1%centre%x - cc2%centre%x) ** 2 + (cc1%centre%y - cc2%centre%y) ** 2)
  write(*, *) dist
  stop
end program exo2
