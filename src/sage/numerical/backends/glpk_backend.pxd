#*****************************************************************************
#       Copyright (C) 2010 Nathann Cohen <nathann.cohen@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#                  http://www.gnu.org/licenses/
#*****************************************************************************

from sage.libs.glpk.types cimport glp_prob, glp_iocp, glp_smcp
from .generic_backend cimport GenericBackend


# search_tree_data_t:
#
# This structure stores the data gathered by the callback function while the
# search tree is explored.
ctypedef struct search_tree_data_t:
    double mip_gap
    double best_bound

cdef class GLPKBackend(GenericBackend):
    cdef glp_prob * lp
    cdef glp_iocp * iocp
    cdef glp_smcp * smcp
    cdef int simplex_or_intopt
    cdef search_tree_data_t search_tree_data
    cpdef __copy__(self) noexcept
    cpdef int print_ranges(self, filename = *) except -1
    cpdef double get_row_dual(self, int variable) noexcept
    cpdef double get_col_dual(self, int variable) except? -1
    cpdef int get_row_stat(self, int variable) except? -1
    cpdef int get_col_stat(self, int variable) except? -1
    cpdef eval_tab_row(self, int k) noexcept
    cpdef eval_tab_col(self, int k) noexcept
    cpdef get_row_prim(self, int i) noexcept
    cpdef set_row_stat(self, int i, int stat) noexcept
    cpdef set_col_stat(self, int j, int stat) noexcept
    cpdef int warm_up(self) noexcept
