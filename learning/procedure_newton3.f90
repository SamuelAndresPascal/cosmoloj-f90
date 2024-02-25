subroutine newton(f, fd, xdep, eps, nitermax, xresul, ir, niter)
  ! attention, ne pas mettre ici l'instruciton implicit none
  ! sans quoi l'interface de déclaration des fonction f et fd deviendrait obligatoire
  
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

real function f1(x)
  real, intent(in) :: x
  real :: aux1, aux2, aux3
  aux1 = exp(x)
  aux2 = exp(-x)
  aux3 = (aux1 + aux2) / (aux1 - aux2)
  f1 = aux3 - 0.5 * (aux1 + aux2)
  return
end function f1

real function fd1(x)
  real, intent(in) :: x
  real :: aux1
  aux1 = 0.5 * (exp(x) - exp(-x))
  fd1 = -1. / aux1 / aux1 - aux1
  return
end function fd1

program sp6
  ! version 3  minimaliste : aucune interface n'y figure
  ! les procédures sont déclarées avec l'attribut external
  ! aucune instruction implicit none n'apparaît
  
  real, external :: f1, fd1
  real :: x0, x
  integer :: n, ir
  
  write(*, *) 'entrer la valeur initiale'
  read(*, *) x0
  
  call newton(f1, fd1, x0, 1.e-06, 200, x, ir, n)
  
  write(*, *) 'indicateur de résolution ', ir
  write(*, *) 'résultat ', x
  write(*, *) 'nombre d''itérations nécessaires', n
  write(*, *) 'résidu', f1(x)

end program sp6

