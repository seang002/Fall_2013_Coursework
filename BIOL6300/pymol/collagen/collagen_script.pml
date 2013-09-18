reinitialize
bg_color white

# Loren Williams, Georgia Tech
# pymol script for collagen
#
reinitialize
bg_color white

load collagen_1cgd.pdb, collagen
remove resn HOH
remove resn acy
create collagen_ribbon, collagen


color marine, resn pro
color pink, resn gly
color cyan, resn hyp
color yellow, resn ala

color blue, name N
color red, name O

distance hbond1= (name O and chain A), (name N and chain B), 3.8
distance hbond2= (name O and chain A), (name N and chain C), 3.8
distance hbond3= (name O and chain B), (name N and chain C), 3.8
color black, hbond*
set dash_gap, 0.2
set dash_width, 5

hide everything, collagen
show sticks, collagen
show cartoon, collagen_ribbon
disable collagen_ribbon
color red, collagen_ribbon and chain A
color green, collagen_ribbon and chain B
color blue, collagen_ribbon and chain C



set_view (\
     0.005986958,   -0.978977978,    0.203884602,\
    -0.935789108,    0.066388503,    0.346255422,\
    -0.352512211,   -0.192866474,   -0.915721118,\
    -0.000029698,   -0.000108950, -176.728347778,\
    41.824535370,    0.439930916,    6.071464062,\
   124.217338562,  229.235931396,    0.000000000 )
### cut above here and paste into script ### 




