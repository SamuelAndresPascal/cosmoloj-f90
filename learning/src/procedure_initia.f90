subroutine initia(ch, om)
  implicit none
  character(len=*), intent(in) :: ch ! ch est une chaîne de longeur variable
  character(len=2), intent(out) :: om
  om(1:1) = ch(1:1)
  om(2:2) = ch(len_trim(ch):len_trim(ch))
end subroutine initia

program sp04
  implicit none
  
  interface
    ! interface facultative
    subroutine initia(ch, om)
      implicit none
      character(len=*), intent(in) :: ch
      character(len=2), intent(out) :: om
    end subroutine initia
  end interface
  
  character(len=8) :: ph1='bob juby'
  character(len=15) :: ph2='francois cramer'
  character(2) :: it1, it2
  call initia(ph1, it1)
  call initia(ph2, it2)
  write(*, *) it1
  write(*, *) it2
end program sp04
