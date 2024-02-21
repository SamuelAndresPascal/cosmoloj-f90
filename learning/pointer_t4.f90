program t4
  implicit none
  
  type :: ligne
    integer, dimension(:), pointer :: p
  end type ligne

  type(ligne), dimension(:), allocatable :: triangle
  integer :: i, n
  
  write(*, *) 'entrer un entier'
  read(*, *) n
  allocate(triangle(n)) ! allocation du nombre de lignes du triangle
  
  do i = 1, n
    allocate(triangle(i)%p(i)) ! pour chaque ligne, allocation du nombre de colonnes
    triangle(i)%p( (/1, i/) ) =1 ! valorisation des éléments extrêmes de la ligne
    
    if (i > 2) then ! à partir de la troisième ligne
      triangle(i)%p(2:i-1) = triangle(i-1)%p(2:i-1) + triangle(i-1)%p(1:i-2) ! valorisation des autres
    end if
  end do
  
  do i = 1, n
    write(*, '(20i5)') triangle(i)%p
  end do
  
  stop
end program t4
