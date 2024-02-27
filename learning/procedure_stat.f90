subroutine stat(man)
  implicit none
  type :: bra
    sequence
    integer :: age
    real :: poids
    character(len=10) :: nom
  end type bra
  type(bra), intent(in) :: man
  write(*, *) man%nom, man%poids, man%poids / man%age
end subroutine stat

program sp17
  implicit none
  type :: bra ! cette déclaration du type bra est obligatoire
    sequence ! facultatif
    integer :: age
    real :: poids
    character(len=10) :: nom
  end type bra
  
  interface ! cette interface est facultative
    subroutine stat(man)
      type :: bra ! cette déclaration est obligatoire ici si l'interface y figure
        sequence ! facultatif
        integer :: age
        real :: poids
        character(len=10) :: nom
      end type bra
      type(bra), intent(in) :: man
    end subroutine stat
  end interface
  
  type(bra) :: bz1=bra(27, 81.5, 'Jean')
  type(bra) :: bz2=bra(78, 51.3, 'Joséphine')
  
  call stat(bz1)
  call stat(bz2)
end program sp17

