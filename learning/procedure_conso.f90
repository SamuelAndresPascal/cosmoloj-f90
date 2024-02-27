function conso(ch)
  implicit none
  character(len=*), intent(in) :: ch ! ch est une chaîne de longeur variable
  character(len=len(ch)) :: conso
  character(len=6) :: voy = 'AEIOUY'
  integer :: i, j, k
  k = 0
  
  bb: do i = 1, len(ch)
    do j = 1, 6
      if (ch(i:i) == voy(j:j)) cycle bb
    end do
    k = k + 1
    conso(k:k) = ch(i:i)
  end do bb
end function conso
  
program sp15
  implicit none
  interface ! cette interface est obligatoire
    function conso(ch)
      character(len=*), intent(in) :: ch
      character(len=len(ch)) :: conso
    end function conso
  end interface
  write(*, *) conso('AZERTYUIOP')
  write(*, *) conso('WDRTYKOA')
end program sp15

