program exemple_pointeurs6
  implicit none
  character(len=20), target :: ch1, ch2
  character(len=20), pointer :: ptc1, ptc2, ptcaux
  write(*, *) 'entre deux chaînes de 30 caractères'
  read(*, *) ch1
  read(*, *) ch2
  ptc1 => ch1
  ptc2 => ch2
  if (ptc1 > ptc2) then
    ptcaux => ptc1
    ptc1 => ptc2
    ptc2 => ptcaux
  end if
  write(*, *) ptc1, ptc2
  stop
end program exemple_pointeurs6
