integer function so(tab, debut, fin)
  implicit none
  integer, intent(in), dimension(:) :: tab
  integer, intent(in), optional :: debut, fin
  integer :: debut1, fin1
  
  if (present(debut)) then
    debut1 = debut
  else
    debut1 = 1
  end if
  
  if (present(fin)) then
    fin1 = fin
  else
    fin1 = size(tab)
  end if
  so = sum(tab(debut1:fin1))
end function so

program sp22
  implicit none
  interface ! obligatoire
    integer function so(tab, debut, fin)
      integer, intent(in), dimension(:) :: tab
      integer, intent(in), optional :: debut, fin
    end function so
  end interface
  
  integer :: i
  integer, dimension(4) :: t1 = 2
  integer, dimension(8) :: t2 = 5
  integer, dimension(5) :: t3 = (/ (i, i = 1, 5) /)
  
  write(*, *) so(t1, 2, 3) ! de 2 à 3
  write(*, *) so(t2, 2) ! de 2 à la fin c'est à dire 8
  write(*, *) so(t3) ! tout c'est à dire de 1 à 5
  write(*, *) so(t2, fin=5) ! de 1 à 5 le mot-clef est indispensable

end program sp22

