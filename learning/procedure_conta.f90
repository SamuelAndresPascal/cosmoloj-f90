program sp10
  implicit none
  integer :: i
  
  ! statique avec initialisation dans la déclaration
  do i=1, 5
    call conta1
  end do
  
  ! statique avec save
  do i=1, 5
    call conta4
  end do
  
  ! statique non initialisé
  do i=1, 5
    call conta3
  end do
  
  ! local par initialisation en dehors de la déclaration
  do i=1, 5
    call conta2
  end do
  
  ! second appel de conta3 : non initialisé mais après conta2, on constate sans comprendre commencer à 2 et finir à 6
  do i=1, 5
    call conta3
  end do
end program sp10

subroutine conta1
  implicit none
  integer :: n1 = 0 ! n1 est statique car initialisé dans la déclaration
  n1 = n1 + 1
  write(*, *) n1
end subroutine conta1

subroutine conta2
  implicit none
  integer :: n2
  n2 = 0 ! l'initialisation en dehors de la déclaration casse le caractère statique
  n2 = n2 + 1
  write(*, *) n2
end subroutine conta2

subroutine conta3
  implicit none
  integer :: n3 ! n3 est statique bien que non initialisé dans la déclaration. Mais il n'est pas du tout initialisé.
  n3 = n3 + 1
  write(*, *) n3
end subroutine conta3

subroutine conta4
  implicit none
  integer, save :: n4 ! n4 est statique et initialisé du fait de l'attribut save
  n4 = n4 + 1
  write(*, *) n4
end subroutine conta4
