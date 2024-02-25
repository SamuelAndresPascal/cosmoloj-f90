subroutine newton(xdep, eps, nitermax, xresul, ir, niter)
  ! attention, ne pas mettre ici l'instruciton implicit none
  
  real, intent(in) :: xdep, eps
  integer, intent(in) :: nitermax
  real, intent(out) :: xresul
  integer, intent(out) :: ir, niter
  
  real :: fx, fdx, delta
  
  xresul = xdep
  
  do niter = 1, nitermax
    fx = f(xresul)
    fdx = fd(xresul)
    
    if (fx == 0.) then
      ir = 0
      return
    else if (fdx == 0.) then
      ir = 2
      return
    else
      delta = -fx / fdx
      xresul = xresul + delta
      if (abs(delta / xresul) < eps) then
        ir = 0
        return
      end if
    end if
  end do
  
  ir = 1
end subroutine newton

! contrairement aux versions précédentes avec f1 et fd1, les fonctions f et fd appelées depuis le sous-programme newton
! ne sont plus des variables muettes mais de vraies fonctions
! l'utilisateur doit donc obligatoirement appeler ses fonctions f et fd s'il ne veut pas toucher au sous-programme 
! newton

real function f(x)
  real, intent(in) :: x
  real :: aux1, aux2, aux3
  aux1 = exp(x)
  aux2 = exp(-x)
  aux3 = (aux1 + aux2) / (aux1 - aux2)
  f = aux3 - 0.5 * (aux1 + aux2)
  return
end function f

real function fd(x)
  real, intent(in) :: x
  real :: aux1
  aux1 = 0.5 * (exp(x) - exp(-x))
  fd = -1. / aux1 / aux1 - aux1
  return
end function fd

program sp7
  ! version 4 le nom de la fonction et de sa dérivée n'apparaît pas dans la liste d'entrée
  ! version à éviter puisqu'il n'y a plus de paramétrage de ces noms
  ! attention, ne pas mettre l'instruction implicit none
  
  real :: x0, x
  integer :: n, ir
  
  write(*, *) 'entrer la valeur initiale'
  read(*, *) x0
  
  call newton(x0, 1.e-06, 200, x, ir, n)
  
  write(*, *) 'indicateur de résolution ', ir
  write(*, *) 'résultat ', x
  write(*, *) 'nombre d''itérations nécessaires', n
  write(*, *) 'résidu', f(x)

end program sp7

