subroutine echange_chaine(c1, c2)
  implicit none
  ! c1 et c2 sont des arguments de la liste d'entrée : ce sont des chaînes de longueur variable
  character(len=*), intent(inout) :: c1, c2
  ! caux est une chaîne automatique
  character(len=max(len(c1), len(c2))) :: caux
  caux = c1
  c1 = c2
  c2 = caux
end subroutine echange_chaine

program sp9
  implicit none
  
  interface ! cette interface est facultative
    subroutine echange_chaine(c1, c2)
      character(len=*), intent(inout) :: c1, c2
    end subroutine echange_chaine
  end interface
  
  character(len=15) :: ch1
  character(len=18) :: ch2
  ch1 = 'AEIOU'
  ch2 = 'voyelles'
  write(*, *) 'avant ', ch1, ch2
  call echange_chaine(ch1, ch2)
  write(*, *) 'apres ', ch1, ch2
end program sp9

