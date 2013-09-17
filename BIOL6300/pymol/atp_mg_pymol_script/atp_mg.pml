# Loren Williams, Georgia Tech
# pymol script for looking at ATP and Magnesium

reinitialize
bg_color white

load atp_mg.pdb, complex

show sphere, resi 500
alter resi 500, vdw=.4 
rebuild

show stick, resi 501
color wheat, (name C2)
color wheat, (name C3)
color wheat, (name C3)
color wheat, (name C4)
color wheat, (name C5)
color wheat, (name C6)
color wheat, (name C8)
color wheat, (name C1*)
color wheat, (name C2*)
color wheat, (name C3*)
color wheat, (name C4*)
color wheat, (name C5*)

color red, (name O2*)
color red, (name O3*)
color red, (name O4*)
color red, (name O5*)


create 1st_shell_sphere, resi 500
show spheres, 1st_shell
disable 1st_shell

distance distances = (resi 500 and name Mg), (resi 500 and name O*), 2.2
color black, distances

set_view (\
     0.314700007,   -0.842682719,    0.436876774,\
    -0.929473102,   -0.366919965,   -0.038202360,\
     0.192490473,   -0.394041866,   -0.898715377,\
    -0.000440141,    0.000265062,  -40.855953217,\
    38.877117157,   35.478275299,   -4.364456177,\
    33.544811249,   48.184574127,  -20.000000000 )
### cut above here and paste into script ###

