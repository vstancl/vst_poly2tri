set(P2T_SOURCES common/shapes.cc sweep/advancing_front.cc sweep/cdt.cc sweep/sweep.cc sweep/sweep_context.cc )
set(P2T_HEADERS common/shapes.h common/utils.h sweep/advancing_front.h sweep/cdt.h sweep/sweep.h sweep/sweep_context.h poly2tri.h)

add_library(poly2tri ${P2T_SOURCES} ${P2T_HEADERS})