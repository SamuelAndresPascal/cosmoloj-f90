program exemple_pointeurs5
  implicit none
  character(len=6), target :: ch1, ch2 ! déclaration de 2 chaînes de 6 caractères susceptibles d'être cibles de pointeurs
  character(len=4), target :: ch3 ! déclaration d'une chaîne de 4 caractères susceptibles d'être cibles de pointeurs
  character(len=6), pointer :: ptc1, ptc2 ! déclaration de 2 pointeurs qui pourront être associés à des chaînes de 6 caractères
  character(len=4), pointer :: ptc3 ! déclaration d'un pointeur qui pourra être associé à des chaînes de 4 caractères
  ch1 = 'brebis'
  ch2 = 'agneau'
  ch3 = 'veau'
  ptc1 => ch1
  ptc2 => ch2
  write(*, *) ptc1
  write(*, *) ptc2
  ptc1 = 'porc'
  write(*, *) ch1
  ptc1 = ptc2
  write(*, *) ch1
  ptc1(2:4) = 'aaa'
  write(*, *) ch1
  ptc3 => ch3
  write(*, *) ptc3
  ptc3 => ch2(2:5)
  write(*, *) ptc3
  stop
end program exemple_pointeurs5
