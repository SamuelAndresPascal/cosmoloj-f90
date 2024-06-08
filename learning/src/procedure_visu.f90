subroutine visu(t, p)
  implicit none
  integer, intent(in) :: p
  integer, intent(in), dimension(:,:) :: t
  write(*, *) t(p,:)
  return
end subroutine visu

program ex1
  implicit none
  
  ! interface obligatoire
  interface
    subroutine visu(t, p)
      implicit none
      integer, intent(in) :: p
      integer, intent(in), dimension(:,:) :: t
    end subroutine visu
  end interface
  
  integer, dimension(2, 3) :: t1
  integer, dimension(-1:2, 0:5) :: t2
  integer, dimension(0:5, 12) :: t3
  t1 = 1
  t2 = 2
  t3 = 3
  call visu(t1, 2)
  call visu(t2, 2)
  call visu(t3, 3)
  stop
end program ex1
