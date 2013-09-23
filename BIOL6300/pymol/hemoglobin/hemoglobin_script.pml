#
reinitialize
bg_color white
#
#
# 	Loren Williams, Georgia Tech
# 	pymol script for hemoglobin (deoxy, oxy and carbonmomoxy)
#   for the oxy and carbon-monoxy forms, I had to use symmetry to 
#	generate the biological unit (tetramer). Hence the dimer_1 and dimer_2

load deoxy_hemoglobin_2DN2.pdb, hemoglobin_deoxy

create heme_deoxy, resn hem and hemoglobin_deoxy 
create his_deoxy, /hemoglobin_deoxy//A/HIS`87/* or /hemoglobin_deoxy//B/HIS`92/* or /hemoglobin_deoxy//C/HIS`87/* or /hemoglobin_deoxy//D/HIS`92/*

hide everything, hemoglobin_deoxy
show cartoon, hemoglobin_deoxy
color cyan, hemoglobin_deoxy

hide everything, heme_deoxy
show spheres, heme_deoxy
show spheres, his_deoxy

#---------------------------------------------oxy_hemoglobin

load oxy_hemoglobin_2DN1.pdb, hemoglobin_dimer1_oxy

create heme_dimer1_oxy, resn hem and hemoglobin_dimer1_oxy 

create his_dimer1_oxy, /hemoglobin_dimer1_oxy//A/HIS`87/* or /hemoglobin_dimer1_oxy//B/HIS`92/*

create O2_dimer1_oxy, /hemoglobin_dimer1_oxy//B/OXY`148/* or /hemoglobin_dimer1_oxy//A/OXY`143/*


hide everything, hemoglobin_dimer1_oxy
show cartoon, hemoglobin_dimer1_oxy
color cyan, hemoglobin_dimer1_oxy

hide everything, heme_dimer1_oxy
show spheres, heme_dimer1_oxy

hide everything, his_dimer1_oxy 
show spheres, his_dimer1_oxy

hide everything, O2_dimer1_oxy 
show spheres, O2_dimer1_oxy


#-form the biological unit

symexp s_, hemoglobin_dimer1_oxy, hemoglobin_dimer1_oxy, 10
create hemoglobin_dimer2_oxy, s_05000000
delete s_*
----
create heme_dimer2_oxy, resn hem and hemoglobin_dimer2_oxy 

create his_dimer2_oxy, /hemoglobin_dimer2_oxy//A/HIS`87/* or /hemoglobin_dimer2_oxy//B/HIS`92/*

create O2_dimer2_oxy, /hemoglobin_dimer2_oxy//B/OXY`148/* or /hemoglobin_dimer2_oxy//A/OXY`143/*


hide everything, hemoglobin_dimer2_oxy
show cartoon, hemoglobin_dimer2_oxy
color cyan, hemoglobin_dimer2_oxy

hide everything, heme_dimer2_oxy
show spheres, heme_dimer2_oxy
color wheat, name C* and heme_dimer2_oxy

hide everything, his_dimer2_oxy 
show spheres, his_dimer2_oxy

hide everything, O2_dimer2_oxy 
show spheres, O2_dimer2_oxy


#---------------------------------------------CO_hemoglobin

load carbonmonoxy_hemoglobin_2DN3.pdb, hemoglobin_dimer1_CO

create heme_dimer1_CO, resn hem and hemoglobin_dimer1_CO 

create his_dimer1_CO, /hemoglobin_dimer1_CO//A/HIS`87/* or /hemoglobin_dimer1_CO//B/HIS`92/*

create CO_dimer1_CO, /hemoglobin_dimer1_CO//A/CMO`143/* or /hemoglobin_dimer1_CO//B/CMO`148/* 

hide everything, hemoglobin_dimer1_CO
show cartoon, hemoglobin_dimer1_CO
color cyan, hemoglobin_dimer1_CO

hide everything, heme_dimer1_CO
show spheres, heme_dimer1_CO
color wheat, name C* and heme_dimer1_CO

hide everything, his_dimer1_CO 
show spheres, his_dimer1_CO

hide everything, CO_dimer1_CO 
show spheres, CO_dimer1_CO



#-form the biological unit

symexp s_, hemoglobin_dimer1_CO, hemoglobin_dimer1_CO, 10
create hemoglobin_dimer2_CO, s_05000000
delete s_*
----
create heme_dimer2_CO, resn hem and hemoglobin_dimer2_CO 

create his_dimer2_CO, /hemoglobin_dimer2_CO//A/HIS`87/* or /hemoglobin_dimer2_CO//B/HIS`92/*

create CO_dimer2_CO, /hemoglobin_dimer2_CO//A/CMO`143/* or /hemoglobin_dimer2_CO//B/CMO`148/* 

hide everything, hemoglobin_dimer2_CO
show cartoon, hemoglobin_dimer2_CO
color cyan, hemoglobin_dimer2_CO

hide everything, heme_dimer2_CO
show spheres, heme_dimer2_CO
color wheat, name C* and heme_dimer2_CO

hide everything, his_dimer2_CO 
show spheres, his_dimer2_CO

hide everything, CO_dimer2_CO 
show spheres, CO_dimer2_CO


#---------------------------------------------

color gray60, name C* and (CO_*)  
color orange, name fe
color wheat, name C* and heme_*
color paleyellow, name C* and his_*
color blue, name N*
color red, name O*

disable all
#enable hemoglobin_deoxy+heme_deoxy+his_deoxy
enable hemoglobin_dimer1_oxy+heme_dimer1_oxy+his_dimer1_oxy+O2_dimer1_oxy
enable hemoglobin_dimer2_oxy+heme_dimer2_oxy+his_dimer2_oxy+O2_dimer2_oxy

set_view (\
     0.916844368,    0.153137237,   -0.368716508,\
    -0.003937065,    0.926942468,    0.375190049,\
     0.399233133,   -0.342537731,    0.850461721,\
     0.000203243,    0.000194803, -159.110641479,\
    32.970733643,   24.077411652,   -8.909167290,\
    74.886917114,  188.688827515,    0.000000000 )
