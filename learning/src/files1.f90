program toto
  implicit none
  integer :: n, nc
  character(len=8) :: ft
  character(len=2) :: ncar
  write(*, *) 'entrer un entier'
  read(*, *) n
  ft(:5) = '(1x,i'
  ft(8:8) = ')'
  nc = log10(float(n)) + 1
  write(ncar, '(i2)') nc
  ft(6:7) = ncar
  write(*, ft) n
  stop
end program toto
