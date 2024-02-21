program t3
  implicit none
  
  type :: ligne
    integer, dimension(:), pointer :: p
  end type ligne

  type(ligne), dimension(:), allocatable :: triangle
  integer :: i, n, k, j
  
  write(*, *) 'entrer un entier'
  read(*, *) n
  allocate(triangle(n)) ! allocation du nombre de lignes du triangle
  k = 0
  
  do i = 1, n
    allocate(triangle(i)%p(i)) ! pour chaque ligne, allocation du nombre de colonnes
    triangle(i)%p = (/ (j, j = k + 1, k + i) /)
    k = k + i
  end do
  
  do i = 1, n
    write(*, '(20i5)') triangle(i)%p
  end do
  
  stop
end program t3
