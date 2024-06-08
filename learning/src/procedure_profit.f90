subroutine profit(valeur, quantite, resultat)
  implicit none
  real, intent(in) :: valeur
  integer, intent(in) :: quantite
  real, intent(out) :: resultat
  resultat = quantite * valeur
end subroutine profit

program sp21
  implicit none
  
  interface ! obligatoire
    subroutine profit(valeur, quantite, resultat)
      real, intent(in) :: valeur
      integer, intent(in) :: quantite
      real, intent(out) :: resultat
    end subroutine profit
  end interface
  
  real :: a, b, z
  a = 15.5
  b = 33.25
  
  call profit(a + b, 5, z) ! appel classique par position
  write(*, *) z
  
  call profit(valeur = a + b, quantite = 5, resultat = z) ! appel par mot-clef respectant l'ordre
  write(*, *) z
  
  call profit(resultat = z, valeur = a + b, quantite = 5) ! appel par mot-clef dans le désordre
  write(*, *) z
  
  call profit(a + b, resultat = z, quantite = 5) ! mélange appels par mot-clef et par position
  write(*, *) z
end program sp21 
  
