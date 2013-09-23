reinitialize
bg_color white

# Loren Williams, Georgia Tech
# pymol script for an Antiparallel Beta Sheet

load anti_par_sheet.pdb, sheet

#--------sticks---------temp file deleted at final--
create sticks, sheet
hide everything, sticks
show sticks, sticks

#-------- mainchain
create mainchain, name c+o+n+ca+cb and sheet
hide everything, mainchain
show lines, mainchain
show spheres, mainchain
alter mainchain, vdw=0.20
rebuild
set line_width, 8, mainchain

#-------- sidechains
create sidechains, sticks
hide everything, sidechains
show sticks, sidechains

#------------hydrogen bonds
dist hbond_N_O, (name O and sticks), (name N and sticks), 3.26, mode=2

color black, hbond_N_O
set label_size, -0.30, hbond_N_O
set dash_width, 4.0
set dash_gap, 0.15
set label_position, (1.2,0,0), hbond_N_O

#-------- cartoon
create cartoon, sheet
hide everything, cartoon
show cartoon, cartoon

#------------------flat boxs around peptide groups

create plane_4, /sticks/*//*`120/CA or /sticks/*//*`120/C or /sticks/*//*`120/O or /sticks/*//*`121/N or /sticks/*//*`121/CA

create plane_1, /sticks/*//*`121/CA or /sticks/*//*`121/C or /sticks/*//*`121/O or /sticks/*//*`122/N or /sticks/*//*`122/CA

create plane_2, /sticks/*//*`122/CA or /sticks/*//*`122/C or /sticks/*//*`122/O or /sticks/*//*`123/N or /sticks/*//*`123/CA

create plane_3, /sticks/*//*`123/CA or /sticks/*//*`123/C or /sticks/*//*`123/O or /sticks/*//*`124/N or /sticks/*//*`124/CA

hide everything, plane_*
show spheres, plane_*
alter plane_*, vdw=0.25
rebuild

bond /plane_4/*//*`120/CA, /plane_4/*//*`120/O
bond /plane_1/*//*`121/CA, /plane_1/*//*`121/O
bond /plane_2/*//*`122/CA, /plane_2/*//*`122/O
bond /plane_3/*//*`123/CA, /plane_3/*//*`123/O

bond /plane_4/*//*`120/C, /plane_4/*//*`120/CA
bond /plane_1/*//*`121/C, /plane_1/*//*`122/CA
bond /plane_2/*//*`122/C, /plane_2/*//*`123/CA
bond /plane_3/*//*`123/C, /plane_3/*//*`124/CA

bond /plane_4/*//*`121/CA, /plane_4/*//*`120/O
bond /plane_1/*//*`122/CA, /plane_1/*//*`121/O
bond /plane_2/*//*`123/CA, /plane_2/*//*`122/O
bond /plane_3/*//*`124/CA, /plane_3/*//*`123/O

bond /plane_4/*//*`120/CA, /plane_4/*//*`121/N
bond /plane_1/*//*`121/CA, /plane_1/*//*`122/N
bond /plane_2/*//*`122/CA, /plane_2/*//*`123/N
bond /plane_3/*//*`123/CA, /plane_3/*//*`124/N

bond /plane_4/*//*`121/CA, /plane_4/*//*`121/N
bond /plane_1/*//*`122/CA, /plane_1/*//*`122/N
bond /plane_2/*//*`123/CA, /plane_2/*//*`123/N
bond /plane_3/*//*`124/CA, /plane_3/*//*`124/N

color magenta, plane_1
color cyan, plane_2
color magenta, plane_3
color cyan, plane_4

create peptide_planes, plane_*
set line_width, 5, peptide_planes
show lines, peptide_planes

delete plane_*

#------------------------------phi/psi------torsion angles

#---------------phi

dihedral phi, /sticks/*//*`121/C, /sticks/*//*`122/N, /sticks/*//*`122/CA, /sticks/*//*`122/C

create phi_atoms, /sticks/*//*`121/C or /sticks/*//*`122/N or /sticks/*//*`122/CA or /sticks/*//*`122/C

show stick, phi_atoms
set stick_radius, 0.10, phi_atoms
label phi_atoms, name

show spheres, phi_atoms
alter phi_atoms, vdw=0.25
alter phi_atoms and name N, vdw=0.35
rebuild

set dihedral_size, 2.5, phi
set line_width, 6, phi
set label_color, red, phi
color red, phi
set label_color, red, phi_atoms

#---------------psi
dihedral psi, /sticks/*//*`122/N, /sticks/*//*`122/CA, /sticks/*//*`122/C, /sticks/*//*`123/N

create psi_atoms,  /sticks/*//*`122/N or/sticks/*//*`122/CA or /sticks/*//*`122/C or /sticks/*//*`123/N

show stick, psi_atoms
set stick_radius, 0.10, psi_atoms
label psi_atoms, name

show spheres, psi_atoms
alter psi_atoms, vdw=0.25
alter psi_atoms and name ca, vdw=0.35
rebuild


set dihedral_size, 1.5, psi
set line_width, 6, psi
set label_color, blue, psi
color blue, psi
set label_color, red, psi_atoms


#--------spacefill
create spacefill, alpha_helix
hide everything, spacefill
show spheres, spacefill

disable all
enable hbond_N_O
#enable peptide_planes
enable mainchain

delete sticks
delete sheet


set_view (\
     0.187989891,   -0.083903931,    0.978586197,\
    -0.579464138,    0.794997036,    0.179478481,\
    -0.793029845,   -0.600793123,    0.100835152,\
     0.000000000,    0.000000000,  -38.104927063,\
    18.991453171,  -23.764297485,   17.123645782,\
    20.304901123,   55.904937744,    0.000000000 )
