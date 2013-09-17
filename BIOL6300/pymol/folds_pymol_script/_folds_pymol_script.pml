#
#
#	Loren Williams
#	Georgia Tech
#
# cd ~/Sites/web_tech/structure/protein/folds/
#
reinitialize
bg_color white

#-----------alpha helica proteins


load 2F23.pdb, Gfh1_alpha
remove Gfh1_alpha and chain B
remove Gfh1_alpha and not resi 7-72

load 1CII.pdb, colicin_alpha

load 1PES.pdb, P53_alpha

load 1HMO.pdb, hemerythrin_alpha
remove hemerythrin and not chain A

load 2DN3.pdb, hemoglobin_alpha
remove hemoglobin_alpha and chain B

load 1X9F.pdb, hemoglobin_dodecamer_alpha

load 1N69.pdb, saposin_alpha
remove chain C and saposin_alpha


#load 1B4R.pdb, polycystein_beta
#-------------beta sheet proteins

load 1BDO.pdb, carboxylase_beta

load 2AD6.pdb, dehydrogenase_beta
remove dehydrogenase_beta and chain C+D

load 2ODL.pdb, secretion_beta

#a------------alpha/beta proteins
load 2QYQ.pdb, rkip_alph_beta

load 2WKX.pdb, amidase_alpha_beta

load 1P35.pdb, P35_alpha_beta
remove P35_alpha_beta and chain A+B

load 1TPB.pdb, TIM_alpha_beta
remove chain 1 and TIM_alpha_beta

load 1DFJ.pdb, ribonuclease_inhibitor_alpha_beta
remove ribonuclease_inhibitor_alpha_beta and chain E



hide everything, *
show cartoon, *
color blue, all


select hydrophobes,(resn ala+gly+val+ile+leu+phe+met)
#show sticks, (hydrophobes and (!name c+n+o))
color green, hydrophobes
disable hydrophobes
set cartoon_smooth_loops,0

show spheres, resn hem
color cyan, resn hem

remove resn hoh
disable all
enable Gfh1_alpha
zoom Gfh1_alpha