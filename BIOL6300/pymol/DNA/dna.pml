
# Loren Williams, Georgia Tech
# pymol script for looking at B-Form DNA
# also contains A and Z helices 

reinitialize
bg_color white


load ideal_bdna_gcgcaaatttcgc.pdb, b_dna_1
load ideal_bdna_gcgcaaatttcgc.pdb, b_dna_2
load ideal_bdna_gcgcaaatttcgc.pdb, stick_b_dna
load ideal_bdna_gcgcaaatttcgc.pdb, space_b_dna

#-------- carton duplex_1
set cartoon_ring_mode=2, b_dna_1
hide everything, b_dna_1
set cartoon_tube_radius=0.4, b_dna_1
show cartoon, b_dna_1


#-------- Stick duplex_2
show stick, b_dna_2
remove /b_dna_2//*/*/O*P

#create b_dna, b_dna_1 + b_dna_2

#-------- Stick duplex
show stick, stick_b_dna
color wheat, (stick_b_dna and name C*)
color red, (stick_b_dna and name O*)
color blue, (stick_b_dna and name N*)
color yelloworange, (stick_b_dna and name P)

#-------- Space fill duplex
show sphere, space_b_dna
color wheat, (space_b_dna and name C*)
color red, (space_b_dna and name O*)
color blue, (space_b_dna and name N*)
color yelloworange, (space_b_dna and name P)
remove /space_b_dna//C/Y`1/lab
remove /space_b_dna//C/X`1/lab

#---------------hydrogen bonds----------------

distance WC_Hbond, (name O2,N3,N4 and resn C and b_dna_2 ), (name N2,N1,O6 and resn G and b_dna_2 ), 3.1
distance WC_Hbond, (name N3,O4 and resn T and b_dna_2 ), (name N1,N6 and resn A and b_dna_2 ), 3.1
color black, WC_Hbond
hide labels, WC_Hbond
set dash_width, 3
set dash_gap, 0.4


#-------- Label the grooves
create maj_groove, resn X and b_dna_1
show line, maj_groove
label maj_groove, "Major Groove"

create min_groove, resn Y and b_dna_1
show line, min_groove
label min_groove, "Minor Groove"


set label_size, -1.0
set label_color, magenta, min_groove
set label_color, deepteal, maj_groove
set label_outline_color, black
set label_shadow_mode, 2

#-------- color the duplex bases

color red, (resn ADE or resn A) and (b_dna_1 or b_dna_2)
color blue, (resn URA or resn U or resn THY or resn T) and (b_dna_1 or b_dna_2)
color forest, (resn CYT or resn C) and (b_dna_1 or b_dna_2)
color violetpurple, (resn GUA or resn G) and (b_dna_1 or b_dna_2)

#-------- color the duplex backbone
color yelloworange, (b_dna_1 and name P)
color yelloworange, (b_dna_1 and name O5*)
color yelloworange, (b_dna_1 and name O3*)
color yelloworange, (b_dna_1 and name O1P)
color yelloworange, (b_dna_1 and name O2P)


#-------- make one strand stick 
create strand_1_stick, b_dna_1 and resi 1-12 and chain A
hide everything, strand_1_stick 
show stick, strand_1_stick
color wheat, (strand_1_stick and name C*)
color red, (strand_1_stick and name O*)
color blue, (strand_1_stick and name N*)
color white, (strand_1_stick and name H*)
color yelloworange, (strand_1_stick and name P)

#-------- Make the other strand stick
create strand_2_stick, b_dna_1 and resi 1-12 and Chain B
hide everything, strand_2_stick 
show stick, strand_2_stick
color wheat, (strand_2_stick and name C*)
color red, (strand_2_stick and name O*)
color blue, (strand_2_stick and name N*)
color white, (strand_2_stick and name H*)
color yelloworange, (strand_2_stick and name P)


#-------- make an A-T base pair
create AT_base_pair,/b_dna_1//A/A`4/* or /b_dna_1//B/T`9/*
show sticks, AT_base_pair
remove name P+O1P+O2P and AT_base_pair
color wheat, (AT_base_pair and name C*)
color red, (AT_base_pair and name O*)
color blue, (AT_base_pair and name N*)
color white, (AT_base_pair and name H*)
dist hbond_AT, (/b_dna_1//A/A`4/*), (/b_dna_1//B/T`9/*), mode=2
color black, hbond_AT
set label_size, -0.8, hbond_AT


#-------- make a G-C base pair
create GC_base_pair, /b_dna_1//A/G`3/* or /b_dna_1//B/C`10/*
show sticks, GC_base_pair
remove name P+O1P+O2P and GC_base_pair
color wheat, (GC_base_pair and name C*)
color red, (GC_base_pair and name O*)
color blue, (GC_base_pair and name N*)
color white, (GC_base_pair and name H*)
dist hbond_GC, (/b_dna_1//A/G`3/*), (/b_dna_1//B/C`10/*), mode=2
color black, hbond_GC
set label_size, -0.8, hbond_GC

#-------- load an a-dna helix
load ideal_a_dna.pdb, a_dna
hide everything, a_dna
set cartoon_ring_mode=3, a_dna
show cartoon, a_dna

#-------- load a z-dna helix
load ideal_z_dna.pdb, z_dna
hide everything, z_dna
set cartoon_ring_mode=3, z_dna
show cartoon, z_dna


disable all
enable b_dna_1
enable b_dna_2
enable maj_groove
enable min_groove
enable WC_hbond*
remove name lab and b_dna_*
remove hydrogens and b_dna_1
remove hydrogens and b_dna_2


set_view (\
     0.688322425,    0.013336160,    0.725283682,\
     0.725364685,   -0.001360372,   -0.688371658,\
    -0.008193815,    0.999912441,   -0.010609686,\
    -0.000003239,    0.000002742,  -67.914283752,\
     1.110138893,   -0.088923298,    0.582374036,\
    42.429508209,   93.399085999,    0.000000000 )
### cut above here and paste into script ### 
ray