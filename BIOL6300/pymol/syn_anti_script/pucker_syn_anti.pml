reinitialize
bg_color white

# Loren Williams, Georgia Tech
# pymol script for sugar pucker and glycosidic bond rotation

load 2_p_endo.pdb 
load 3_p_endo.pdb
load g_anti.pdb
load g_syn.pdb

hide everything, all
show stick, all

color wheat, name C1*+C2*+c3*+c4*+c5*
color wheat, name C1+C2+c3+c4+c5+c6+c7+c8
color blue, name N1+n2+N3++n6+n7+n9
color red, name O3*+O4*+O5*+O2+O4+O6
color cyan, name B
remove name OP1+OP2+P

set stick_radius, 0.1


#---------------------------C 2' Endo (DNA)
label name B and 2_p_endo, "Base"
label name C2* and 2_p_endo, "C2' Endo"
label name O5* and 2_p_endo, "O5'"
label name O3* and 2_p_endo, "O3'"

#---------------------------C 3' Endo (RNA)
label name B and 3_p_endo, "Base"
label name C3* and 3_p_endo, "C3' Endo"
label name O5* and 3_p_endo, "O5'"
label name O3* and 3_p_endo, "O3'"
label name O2* and 3_p_endo, "O2'"


set label_size, -0.3
set label_color, black
disable all
enable 2_p_endo
enable 3_p_endo

set_view (\
     0.957858443,   -0.172233164,   -0.229879603,\
     0.142759129,    0.979901731,   -0.139330491,\
     0.249254525,    0.100641817,    0.963199019,\
     0.000000000,    0.000000000,  -14.843638420,\
    -7.093333721,    0.006666660,    4.614222050,\
    11.702837944,   17.984439850,    0.000000000 )
    
set_view (\
     0.848976970,    0.398288041,    0.347300410,\
    -0.350270003,   -0.067964487,    0.934187591,\
     0.395677954,   -0.914750218,    0.081805132,\
     0.000000000,    0.000000000,  -14.178204536,\
    68.079605103,  118.372398376,   50.438701630,\
    11.178204536,   17.178203583,    0.000000000 )
### cut above here and paste into script ### 
