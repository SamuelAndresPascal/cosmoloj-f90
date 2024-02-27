function libel(n, car)
  implicit none
  integer, intent(in) :: n
  character, intent(in) :: car
  character(len=n) :: libel
  integer :: i
  do i=1, n
    libel(i:i) = car
  end do
end function libel

program sp14
  implicit none
  
  interface ! cette interface est obligatoire
    function libel(n, car)
      integer, intent(in) :: n
      character, intent(in) :: car
      character(len=n) :: libel
    end function libel
  end interface
  
  write(*, *) libel(8, 'D')
  write(*, *) libel(21, '+')
end program sp14

