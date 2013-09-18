# Torsion angles of an RNA tetraloop
# 
# Loren Williams, Georgia Tech

reinitialize
bg_color white
set dihedral_size, 1.5
set line_width, 6
set label_color, black, *

load 805.pdb, tetraloop

color gray, (elem c)
color red, (elem o)
color yellow, (elem p)
color blue, (elem n)
#

# tetraloop
hide everything, tetraloop
show lines, tetraloop

#	alpha

dihedral alpha_tor,  (name O3* and resi 804 and tetraloop), (name P and resi 805 and tetraloop), (name O5* and resi 805 and tetraloop),  (name C5* and resi 805 and tetraloop) 

create alpha_atoms,  (name O3* and resi 804 and tetraloop) or (name P and resi 805 and tetraloop) or (name O5* and resi 805 and tetraloop) or (name C5* and resi 805 and tetraloop) 

show spheres, alpha_atoms 
alter alpha_atoms, vdw=0.15
alter alpha_atoms and name O5*, vdw=0.25
rebuild
color black, alpha_tor

#----------------------

#		beta

dihedral beta_tor, (name P and resi 805 and tetraloop), (name O5* and resi 805 and tetraloop),  (name C5* and resi 805 and tetraloop),  (name C4* and resi 805 and tetraloop) 

create beta_atoms,  (name P and resi 805 and tetraloop) or (name O5* and resi 805 and tetraloop) or (name C5* and resi 805 and tetraloop) or (name C4* and resi 805 and tetraloop) 

show spheres, beta_atoms 
alter beta_atoms, vdw=0.15
alter beta_atoms and name C5*, vdw=0.25
rebuild
color black, beta_tor


#----------------------

#		gamma

dihedral gamma_tor, (name O5* and resi 805 and tetraloop), (name C5* and resi 805 and tetraloop), (name C4* and resi 805 and tetraloop), (name C3* and resi 805 and tetraloop) 

create gamma_atoms, (name O5* and resi 805 and tetraloop) or (name C5* and resi 805 and tetraloop) or (name C4* and resi 805 and tetraloop) or (name C3* and resi 805 and tetraloop) 

show spheres, gamma_atoms 
alter gamma_atoms, vdw=0.15
alter gamma_atoms and name C4*, vdw=0.25
rebuild
color black, gamma_tor

#----------------------
#		delta

dihedral delta_tor, (name C5* and resi 805 and tetraloop), (name C4* and resi 805 and tetraloop), (name C3* and resi 805 and tetraloop), (name O3* and resi 805 and tetraloop) 

create delta_atoms, (name C5* and resi 805 and tetraloop) or (name C4* and resi 805 and tetraloop) or (name C3* and resi 805 and tetraloop) or (name O3* and resi 805 and tetraloop) 

show spheres, delta_atoms 
alter delta_atoms, vdw=0.15
alter delta_atoms and name C3*, vdw=0.25
rebuild

color black, delta_tor

#----------------------

#		epsilon

dihedral ep_tor, (name C4* and resi 805 and tetraloop), (name C3* and resi 805 and tetraloop), (name O3* and resi 805 and tetraloop), (name P and resi 806 and tetraloop)    

create ep_atoms, (name C4* and resi 805 and tetraloop) or (name C3* and resi 805 and tetraloop) or (name O3* and resi 805 and tetraloop) or (name P and resi 806 and tetraloop)

show spheres, ep_atoms 
alter ep_atoms, vdw=0.15
alter ep_atoms and name O3*, vdw=0.25
rebuild

color black, ep_tor

#----------------------

hide everything, tetraloop
show stick, tetraloop
set stick_transparency=0.7, tetraloop
set stick_radius, 0.1

disable all
enable alpha*


set_view (\
    -0.529671609,    0.846199691,    0.058305930,\
    -0.470754832,   -0.350451261,    0.809681833,\
     0.705584407,    0.401415050,    0.583975673,\
    -0.001110669,    0.000748556,  -10.243294716,\
   146.965789795,  163.349105835,  101.204650879,\
    -5.982799530,   26.688457489,    0.000000000 )
