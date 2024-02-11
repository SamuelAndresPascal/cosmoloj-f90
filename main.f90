! main.f90
! gfortran -c unit-simple.f90
! gfortran -o main main.f90 unit-simple.o
! ./main
program main
    use :: unit_mod
    use :: transformed_unit_mod
    use :: derived_unit_mod
    implicit none
    type(unit_converter_class) :: c
    type(unit_converter_class) :: i
    type(transformed_unit_class) :: m
    type(derived_unit_class) :: ms

    call c%init(2.0, 3.0)
    print '(f8.3)', c%scale
    print '(f8.3)', c%offset
    print '(f8.3)', c%inverse%scale
    print '(f8.3)', c%inverse%offset
    print '(f8.3)', c%inverse%inverse%scale
    print '(f8.3)', c%inverse%inverse%offset

    m%age = 6
    ms%age = 2

    call m%bark()
    call m%print_age()

    call ms%quack()
    call ms%print_age()
end program main
