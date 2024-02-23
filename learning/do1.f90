program do1
  implicit none
  integer :: i, j, s, k
  character(len=5) :: jour
  do i = 1, 10
    write(*, *) i
  end do
  
  write (*, *) '****************************************'
  
  s = 0
  do j = 1, 13, 2
    s = s + j
  end do
  write(*, *) s
  
  write (*, *) '****************************************'
  
  jour = 'lundi'
  do k = len(jour), 1, -1
    write(*, *) jour(k:k)
  end do
  stop
end program do1
