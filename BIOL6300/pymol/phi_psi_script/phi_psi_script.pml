
reinitialize
bg_color white

# Loren Williams, Georgia Tech
#		Phi/Psi pymol script

#-------------------phi

load coords/phi_pos_120.pdb
dihedral angle_phi_pos_120, name C' and resi 1 and phi_pos_120, name N and resi 2 and phi_pos_120, name Ca and resi 3 and phi_pos_120, name C' and resi 4 and phi_pos_120

load coords/phi_pos_90.pdb 
dihedral angle_phi_pos_90, name C' and resi 1 and phi_pos_90, name N and resi 2 and phi_pos_90, name Ca and resi 3 and phi_pos_90, name C' and resi 4 and phi_pos_90

load coords/phi_neg_60.pdb
dihedral angle_phi_neg_60, name C' and resi 1 and phi_neg_60, name N and resi 2 and phi_neg_60, name Ca and resi 3 and phi_neg_60, name C' and resi 4 and phi_neg_60

load coords/phi_neg_90.pdb
dihedral angle_phi_neg_90, name C' and resi 1 and phi_neg_90, name N and resi 2 and phi_neg_90, name Ca and resi 3 and phi_neg_90, name C' and resi 4 and phi_neg_90

load coords/phi_neg_120.pdb
dihedral angle_phi_neg_120, name C' and resi 1 and phi_neg_120, name N and resi 2 and phi_neg_120, name Ca and resi 3 and phi_neg_120, name C' and resi 4 and phi_neg_120

#-------------------psi

load coords/psi_pos_45.pdb
dihedral angle_psi_pos_45, name N and resi 1 and psi_pos_45, name Ca and resi 2 and psi_pos_45, name C' and resi 3 and psi_pos_45, name N and resi 4 and psi_pos_45 

load coords/psi_0.pdb
dihedral angle_psi_0, name N and resi 1 and psi_0, name Ca and resi 2 and psi_0, name C' and resi 3 and psi_0, name N and resi 4 and psi_0 

load coords/psi_neg_45.pdb
dihedral angle_psi_neg_45, name N and resi 1 and psi_neg_45, name Ca and resi 2 and psi_neg_45, name C' and resi 3 and psi_neg_45, name N and resi 4 and psi_neg_45 

show sticks, *
set stick_radius, 0.10


color limon, name c'
color limegreen, name c' and resi I-1
color magenta, name ca
color blue, name N
label phi_*, name
label psi_*, name
set label_size, -0.30,

show spheres, phi_*
alter phi_*, vdw=0.25
alter phi_* and name CA, vdw=0.40
set label_position, (0,0,0), angle_phi_*
set label_position, (0.7,-1,0), angle_phi_*
rebuild

show spheres, psi_*
alter psi_*, vdw=0.25
alter psi_* and name C', vdw=0.40
set label_position, (0,0,0), angle_psi_*
set label_position, (0.7,-1,0), angle_psi_*
rebuild



set dihedral_size, 1.5
set line_width, 6
set label_color, black, *
color black, angle*

disable all
enable phi_pos_120
enable angle_phi_pos_120

set_view (\
     0.261051655,    0.882389367,    0.391492248,\
    -0.196230739,    0.445585221,   -0.873482466,\
    -0.945181668,    0.151207298,    0.289468288,\
    -0.000119073,    0.000315855,  -11.654953003,\
    12.497931480,    3.098671675,    5.186441898,\
     5.375273705,   20.090738297,    0.000000000 )

