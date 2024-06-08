program exemple_pointeurs1
  implicit none
  integer, pointer :: ptin, ptip
  integer, target :: n, p
  n = 100
  p = 200
  ptin => n
  write(*, *) 'n vaut', n, ' ptin vaut', ptin
  ptin => p
  write(*, *) 'p vaut', p, ' ptin vaut', ptin
  ptin = 50
  write(*, *) 'p vaut', p, ' ptin vaut', ptin
  ptin = ptin + 1
  write(*, *) 'p vaut', p, ' ptin vaut', ptin
  n = 100
  p = 200
  ptin => n
  ptip => p
  write(*, 100) n, ptin, p, ptip
  100 format(' n vaut', i5, ' ptin vaut', i5, ' p vaut', i5, ' ptip vaut', i5)
  ptin = ptip
  write(*, 100) n, ptin, p, ptip
  n = 100
  p = 200
  ptin => n
  ptip => p
  ptin => ptip
  write(*, 100) n, ptin, p, ptip
  stop
end program exemple_pointeurs1
