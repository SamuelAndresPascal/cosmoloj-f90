recursive function fac_fun(n) result(res)
  implicit none
  integer, intent(in) :: n
  integer :: res
  if (n <= 1) then
    res = 1
  else
    res = fac_fun(n - 1) * n
  end if
end function fac_fun

recursive subroutine fac_sub(n, res)
  implicit none
  integer, intent(in) :: n
  integer, intent(out) :: res
  if (n <= 1) then
    res = 1
  else
    call fac_sub(n - 1, res)
    res = res * n
  end if
end subroutine fac_sub

program sp
  implicit none
  
  interface
    ! interface obligatoire
    recursive function fac_fun(n) result(res)
      integer, intent(in) :: n
      integer :: res
    end function fac_fun
    
    ! interface obligatoire
    recursive subroutine fac_sub(n, res)
      integer, intent(in) :: n
      integer, intent(out) :: res
    end subroutine fac_sub
  end interface
  
  integer :: p, ros
  
  write(*, *) 'entrer un entier'
  read(*, *) p
  write(*, *) fac_fun(p)
  call fac_sub(p, ros)
  write(*, *) ros
  stop
end program sp
