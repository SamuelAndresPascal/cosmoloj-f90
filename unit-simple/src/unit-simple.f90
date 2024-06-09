module unit_mod

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

    type, public :: factor_class
        integer, public :: numerator
        integer, public :: denominator

    contains
        procedure, public :: init => factor_init

    end type factor_class

    type, public, extends(factor_class) :: unit_class

    contains
        procedure, public :: print_age => animal_print_age

    end type unit_class

contains

    subroutine animal_print_age(this)
        class(unit_class), intent(inout) :: this
        print '("I am ", i0, " year(s) old")', this%numerator
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

    subroutine factor_init(this, num, den)
        class(factor_class), intent(inout), target :: this
        integer, intent(in) :: num
        integer, intent(in) :: den
        this%numerator = num
        this%denominator = den
    end subroutine factor_init

    ! class(unit_converter_class) function linear(this)
    !    class(unit_converter_class), intent(inout) :: this
    !    class(unit_converter_class), intent(inout) :: line
    ! end function linear

end module unit_mod

module fundamental_unit_mod

    use :: unit_mod
    implicit none
    private

    type, public, extends(unit_class) :: fundamental_unit_class
    contains
        procedure, public :: to_base => fundamental_to_base
    end type fundamental_unit_class

contains

    subroutine fundamental_to_base(this)
        class(fundamental_unit_class), intent(inout) :: this
        print '("fundamental_to_base")'
    end subroutine fundamental_to_base

end module fundamental_unit_mod

module transformed_unit_mod

    use :: unit_mod
    implicit none
    private

    type, public, extends(unit_class) :: transformed_unit_class
    contains
        procedure, public :: to_base => transformed_to_base
    end type transformed_unit_class

contains

    subroutine transformed_to_base(this)
        class(transformed_unit_class), intent(inout) :: this
        print '("transformed_to_base")'
    end subroutine transformed_to_base

end module transformed_unit_mod

module derived_unit_mod

    use :: unit_mod
    implicit none
    private

    type, public, extends(unit_class) :: derived_unit_class

    contains
        procedure, public :: to_base => derived_to_base
    end type derived_unit_class

contains

    subroutine derived_to_base(this)
        class(derived_unit_class), intent(inout) :: this
        print '("derived_to_base")'
    end subroutine derived_to_base

end module derived_unit_mod
