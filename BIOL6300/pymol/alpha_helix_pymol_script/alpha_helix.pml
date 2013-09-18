reinitialize
bg_color white

# Loren Williams, Georgia Tech
# pymol script for an Alpha Helix


load alpha_helix.pdb, alpha_helix

#-------- mainchain
create mainchain, name c+o+n+ca and alpha_helix
hide everything, mainchain
show lines, mainchain
show spheres, mainchain
alter mainchain, vdw=0.20
rebuild


#-------- cartoon
create cartoon, alpha_helix
hide everything, cartoon
show cartoon, cartoon

#--------sticks
create sticks, alpha_helix
hide everything, sticks
show sticks, sticks

#------------hydrogen bonds
dist hbond_N_O, (name O and sticks), (name N and sticks), 3.26, mode=2
dist hbond_N_O, /sticks/1MBA//ASP`62/O, /sticks/1MBA//ARG`66/N, 3.4, mode=2
dist hbond_N_O, /sticks/1MBA//LYS`59/O, sticks/1MBA//VAL`63/N, 3.4, mode=2
dist hbond_N_O, /sticks/1MBA//THR`69/O, /sticks/1MBA//GLU`73/N, 3.4, mode=2 

color black, hbond_N_O
set label_size, -0.30, hbond_N_O
set dash_width, 4.0
set dash_gap, 0.15
set label_position, (1.1,0,0), hbond_N_O

#------------------flat boxs around peptide groups

create plane_1, /sticks/1MBA//*`66/N or /sticks/1MBA//*`66/CA or /sticks/1MBA//*`65/O or /sticks/1MBA//*`65/CA
hide everything, plane_1
show spheres, plane_1
alter plane_1, vdw=0.25
rebuild
bond /plane_1/1MBA//*`65/CA, /plane_1/1MBA//*`66/N
bond /plane_1/1MBA//*`66/N, /plane_1/1MBA//*`66/CA
bond /plane_1/1MBA//*`66/CA, /plane_1/1MBA//*`65/O
bond /plane_1/1MBA//*`65/O, /plane_1/1MBA//*`65/CA
color magenta, plane_1
show lines, plane_1

create plane_2, /sticks/1MBA//*`67/N or /sticks/1MBA//*`67/CA or /sticks/1MBA//*`66/O or /sticks/1MBA//*`66/CA
hide everything, plane_2
show spheres, plane_2
alter plane_2, vdw=0.25
rebuild
bond /plane_2/1MBA//*`66/CA, /plane_2/1MBA//*`67/N
bond /plane_2/1MBA//*`67/N, /plane_2/1MBA//*`67/CA
bond /plane_2/1MBA//*`67/CA, /plane_2/1MBA//*`66/O
bond /plane_2/1MBA//*`66/O, /plane_2/1MBA//*`66/CA
color cyan, plane_2
show lines, plane_2

create plane_3, /sticks/1MBA//*`68/N or /sticks/1MBA//*`68/CA or /sticks/1MBA//*`67/O or /sticks/1MBA//*`67/CA
hide everything, plane_3
show spheres, plane_3
alter plane_3, vdw=0.25
rebuild
bond /plane_3/1MBA//*`67/CA, /plane_3/1MBA//*`68/N
bond /plane_3/1MBA//*`68/N, /plane_3/1MBA//*`68/CA
bond /plane_3/1MBA//*`68/CA, /plane_3/1MBA//*`67/O
bond /plane_3/1MBA//*`67/O, /plane_3/1MBA//*`67/CA
color magenta, plane_3
show lines, plane_3

create plane_4, /sticks/1MBA//*`69/N or /sticks/1MBA//*`69/CA or /sticks/1MBA//*`68/O or /sticks/1MBA//*`68/CA
hide everything, plane_4
show spheres, plane_4
alter plane_4, vdw=0.25
rebuild
bond /plane_4/1MBA//*`68/CA, /plane_4/1MBA//*`69/N
bond /plane_4/1MBA//*`69/N, /plane_4/1MBA//*`69/CA
bond /plane_4/1MBA//*`69/CA, /plane_4/1MBA//*`68/O
bond /plane_4/1MBA//*`68/O, /plane_4/1MBA//*`68/CA
color cyan, plane_4
show lines, plane_4


create peptide_planes, plane_*
delete plane_*

#------------------------------phi/psi------torsion angles

#---------------phi

dihedral phi, /sticks/1MBA//SER`65/C, /sticks/1MBA//ARG`66/N, /sticks/1MBA//ARG`66/CA, /sticks/1MBA//ARG`66/C
#label  phi, "PHI"
set label_color, black, PHI

create phi_atoms, /sticks/1MBA//SER`65/C or /sticks/1MBA//ARG`66/N or  /sticks/1MBA//ARG`66/CA or /sticks/1MBA//ARG`66/C

show stick, phi_atoms
set stick_radius, 0.10, phi_atoms
label phi_atoms, name

show spheres, phi_atoms
alter phi_atoms, vdw=0.25
alter phi_atoms and name N, vdw=0.35
rebuild

set dihedral_size, 2.0
set line_width, 6
set label_color, red, phi
set label_color, red, phi_atoms
color red, phi

#---------------psi
dihedral psi, /sticks/1MBA//ARG`66/N, /sticks/1MBA//ARG`66/CA, /sticks/1MBA//ARG`66/C, /sticks/1MBA//ILE`67/N

create psi_atoms, /sticks/1MBA//ARG`66/N or /sticks/1MBA//ARG`66/CA or /sticks/1MBA//ARG`66/C or /sticks/1MBA//ILE`67/N

show stick, psi_atoms
set stick_radius, 0.10, psi_atoms
label psi_atoms, name

show spheres, psi_atoms
alter psi_atoms, vdw=0.25
alter psi_atoms and name ca, vdw=0.35
rebuild

set label_color, blue, psi
set label_color, red, psi_atoms
color blue, psi

#--------spacefill
create spacefill, alpha_helix
hide everything, spacefill
show spheres, spacefill

disable all
#enable sticks
enable hbond_N_O
#enable peptide_planes
enable mainchain

set_view (\
     0.757526636,    0.652551591,   -0.018448822,\
    -0.559246361,    0.663269520,    0.497320056,\
     0.336765409,   -0.366411954,    0.867378950,\
     0.000000000,    0.000000000,  -29.283208847,\
   -55.875202179,  -37.028495789,  -24.433790207,\
    14.980155945,   43.586261749,    0.000000000 )
