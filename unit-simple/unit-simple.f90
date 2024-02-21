module unit_mod
    ! The animal module.
    implicit none
    private
    
    type, public :: unit_converter_class
    
        real, public :: scale
        real, public :: offset
        class(unit_converter_class), public, pointer :: inverse
    
    contains
        procedure, public :: init => unit_converter_init
        procedure, public :: convert => unit_converter_convert
    
    end type unit_converter_class

    ! The animal class.
    type, public :: unit_class
        integer, public :: age
        real,    public :: size
        
    contains
        procedure, public :: print_age => animal_print_age
        ! procedure, public :: get_converter_to => unit_get_converter_to
        
    end type unit_class
    
contains

    subroutine animal_print_age(this)
        !! Prints the animal's age to stdout.
        class(unit_class), intent(inout) :: this
        print '("I am ", i0, " year(s) old")', this%age
    end subroutine animal_print_age
    
    subroutine unit_converter_init(this, s, o)
        class(unit_converter_class), intent(inout), target :: this
        real, intent(in) :: s
        real, intent(in) :: o
        class(unit_converter_class), pointer :: c
        class(unit_converter_class), pointer :: i
        allocate(i)
        i%scale = 1 / s
        i%offset = -o / s
        allocate(c)
        c => this
        i%inverse => c
        call unit_converter_internal_init(c, s, o, i)
    end subroutine unit_converter_init
    
    subroutine unit_converter_internal_init(c, s, o, i)
        class(unit_converter_class), pointer :: c
        class(unit_converter_class), pointer :: i
        real, intent(in) :: s
        real, intent(in) :: o
        c%scale = s
        c%offset = o
        c%inverse => i
    end subroutine unit_converter_internal_init
    
    real function unit_converter_convert(this, v)
        class(unit_converter_class), intent(inout) :: this
        real, intent(in) :: v
        unit_converter_convert = v * this%scale + this%offset
    end function unit_converter_convert
    
    ! class(unit_converter_class) function linear(this)
    !    class(unit_converter_class), intent(inout) :: this
    !    class(unit_converter_class), intent(inout) :: line
    ! end function linear
    
end module unit_mod

module fundamental_unit_mod
    ! The dog module.
    use :: unit_mod
    implicit none
    private

    ! The dog class.
    type, public, extends(unit_class) :: fundamental_unit_class
    contains
        procedure, public :: bark => dog_bark
    end type fundamental_unit_class
    
contains

    subroutine dog_bark(this)
        !! Barks to stdout.
        class(fundamental_unit_class), intent(inout) :: this
        print '("woof")'
    end subroutine dog_bark
    
end module fundamental_unit_mod

module transformed_unit_mod
    ! The dog module.
    use :: unit_mod
    implicit none
    private

    ! The dog class.
    type, public, extends(unit_class) :: transformed_unit_class
    contains
        procedure, public :: bark => dog_bark
    end type transformed_unit_class
    
contains

    subroutine dog_bark(this)
        !! Barks to stdout.
        class(transformed_unit_class), intent(inout) :: this
        print '("woof")'
    end subroutine dog_bark
    
end module transformed_unit_mod

module derived_unit_mod
    ! The duck module.
    use :: unit_mod
    implicit none
    private

    ! The duck class.
    type, public, extends(unit_class) :: derived_unit_class
    
    contains
        procedure, public :: quack => duck_quack
    end type derived_unit_class
    
contains
    subroutine duck_quack(this)
        !! Quacks to stdout.
        class(derived_unit_class), intent(inout) :: this
        print '("quack")'
    end subroutine duck_quack
    
end module derived_unit_mod
