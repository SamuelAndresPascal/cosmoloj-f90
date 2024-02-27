subroutine stati(man)
  implicit none
  
  type :: bra
    sequence
    integer :: age
    real :: poids
    character(len=10) :: nom
  end type bra
  
  type(bra), intent(in), dimension(:) :: man ! man est un tableau de rang 1 de profil implicite de structures bra
  
  integer :: i
  real :: mio
  character(10) :: ny
  
  mio = 1e+38
  do i=1, size(man)
    if (man(i)%poids / man(i)%age < mio) then
      mio = man(i)%poids / man(i)%age
      ny = man(i)%nom
    end if
  end do
  write(*, *) ny, mio
end subroutine stati

program sp18
  implicit none
  
  type :: bra ! cette déclaration du type bra est obligatoire
    sequence
    integer :: age
    real :: poids
    character(len=10) :: nom
  end type bra
  
  interface ! cette interface est facultative
    subroutine stati(man)
      type :: bra ! cette déclaration est obligatoire ici si l'interface y figure
        sequence
        integer :: age
        real :: poids
        character(len=10) :: nom
      end type bra
  
      type(bra), intent(in), dimension(:) :: man 
    end subroutine stati
  end interface
  
  type(bra), dimension(5) :: tab
  tab = (/ bra(78, 51.3, 'Joséphine'),&
           bra(25, 60.2, 'Jane'),&
           bra(7, 20.4, 'Baby'),&
           bra(41, 54.4, 'Brea'),&
           bra(45, 90.5, 'Pierre') /)
  call stati(tab)
end program sp18

