subroutine clas(ch)
  implicit none
  integer :: k
  character(len=*), dimension(:), intent(inout) :: ch
  ! ch est un tableau de rang 1 de profil implicite
  ! chaque élément de ce tableau est une chaine de longueur variable
  character(len=maxval((/ (len(ch(k)), k = 1, size(ch)) /))) :: aux ! aux est une chaîne locale automatique
  integer :: i, j
  
  do i=1, size(ch) - 1
    do j=i+1, size(ch)
      if (ch(i) > ch(j)) then
        aux = ch(i)
        ch(i) = ch(j)
        ch(j) = aux
      end if
    end do
  end do
end subroutine clas

program sp16
  implicit none
  
  interface
    subroutine clas(ch)
      integer :: k
      character(len=*), dimension(:), intent(inout) :: ch
      character(len=maxval((/ (len(ch(k)), k = 1, size(ch)) /))) :: aux
    end subroutine clas
  end interface
  
  character(len=10), dimension(8) :: elev
  integer :: i
  
  do i = 1, 8
    write(*, *) 'entrer une chaîne '
    read(*, *) elev(i)
  end do
  
  call clas(elev)
  
  do i = 1, 8
    write(*, *) elev(i)
  end do
end program sp16

