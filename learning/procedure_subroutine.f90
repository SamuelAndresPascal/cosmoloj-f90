subroutine affiche(nf)
  implicit none
  integer, intent(in) :: nf
  integer :: i
  
  do i = 1, nf
    write(*, *) 'coucou'
  end do
  return
end subroutine affiche


program toto
  implicit none
  integer, parameter :: n = 2
  call affiche(n)
  call affiche(n ** 2 + 1)
  stop
end program toto
