program tab1
  implicit none
  integer, dimension(10) :: table
  integer :: i, produit
  
  do i = 1, 10
    write(*, *) 'entrer un nombre entier'
    read(*, *) table(i)
  end do
  
  produit = 1
  do i = 1, 10
    produit = produit * table(i)
    if (produit == 0) exit
  end do
  write(*, *) 'le produit est ', produit
  stop
end program tab1
