if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast.lib]
create_library_set -name slow\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow.lib]
create_rc_corner -name Default_RC\
   -cap_table ${::IMEX::libVar}/mmmc/gpdk090.lef.extended.CapTbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/Default_RC/gpdk090_9l.tch
create_delay_corner -name min\
   -library_set fast\
   -rc_corner Default_RC
create_delay_corner -name max\
   -library_set slow\
   -rc_corner Default_RC
create_constraint_mode -name cons\
   -sdc_files\
    [list /dev/null]
create_analysis_view -name Bc -constraint_mode cons -delay_corner min
create_analysis_view -name Wc -constraint_mode cons -delay_corner max
set_analysis_view -setup [list Wc] -hold [list Bc]
