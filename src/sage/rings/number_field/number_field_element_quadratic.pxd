from sage.libs.gmp.types cimport mpz_t
from sage.libs.arb.types cimport arb_t
from sage.rings.integer cimport Integer
from sage.rings.rational cimport Rational
from .number_field_element cimport NumberFieldElement, NumberFieldElement_absolute


cdef class NumberFieldElement_quadratic(NumberFieldElement_absolute):
    # (a + b sqrt(D)) / denom
    cdef mpz_t a, b, denom
    cdef Integer D
    cdef bint standard_embedding
    cpdef NumberFieldElement galois_conjugate(self) noexcept

    cpdef list _coefficients(self) noexcept

    cdef int _randomize(self, num_bound, den_bound, distribution) except -1
    cdef int arb_set_real(self, arb_t x, long prec) except -1
    cdef void arb_set_imag(self, arb_t x, long prec) noexcept

    cpdef tuple parts(self) noexcept

cdef class NumberFieldElement_quadratic_sqrt(NumberFieldElement_quadratic):
    pass

cdef class NumberFieldElement_gaussian(NumberFieldElement_quadratic_sqrt):
    cpdef real_part(self) noexcept
    cpdef imag_part(self) noexcept

cdef class OrderElement_quadratic(NumberFieldElement_quadratic):
    pass

cpdef bint is_sqrt_disc(Rational ad, Rational bd) noexcept

