function produit(a, b)
  implicit none
  ! a et b sont de profil implicite
  real, intent(in), dimension(:, :) :: a, b
  real, dimension(size(a, 1), size(b, 2)) :: produit
  
  real :: aux
  integer :: i, j, k

  do i = 1, size(a, 1)
    do j = 1, size(b, 2)
      aux = 0.
      do k = 1, size(a, 2)
        aux = aux + a(i, k) * b(k, j)
      end do
      produit(i, j) = aux
    end do
  end do
end function produit

program sp13
  implicit none
  
  interface
    function produit(a, b)
      real, intent(in), dimension(:, :) :: a, b
      real, dimension(size(a, 1), size(b, 2)) :: produit
    end function produit
  end interface
  
  real, dimension(4, 3) :: ta
  real, dimension(3, 2) :: tb
  real, dimension(4, 2) :: total
  integer :: i
  
  ta = 1.
  tb = 2.
  
  total = produit(ta, tb)
  do i = 1, size(total, 1)
    write(*, *) total(i, :)
  end do
end program sp13

