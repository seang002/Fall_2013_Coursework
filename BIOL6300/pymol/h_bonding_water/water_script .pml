# pymol script for one molecule of water
# 
# by Loren Williams
# Georgia Tech
# remove all previous objects
reinitialize
# set background color white
bg_color white
#
# load coordinates (must use .pdb suffix)

load water_one.pdb, one
load water_one.pdb, one_sphere

load water_two.pdb, two
load water_two.pdb, two_sphere

load water_three.pdb, three
load water_three.pdb, three_sphere

load water_five.pdb, five
load water_five.pdb, five_sphere

load ice.pdb, ice
load ice.pdb, ice_sphere
#

color gray, (elem c)
color red, (elem o)
color yellow, (elem p)
color blue, (elem n)
#
show sticks, one
show sticks, two
show sticks, three
show sticks, five
show sticks, ice
#
show sphere, one_sphere
show sphere, two_sphere
show sphere, three_sphere
show sphere, five_sphere
show sphere, ice_sphere
#
#
set orthoscopic=1
set ambient=0.1
set antialias=1
#
zoom five
disable all
enable one
