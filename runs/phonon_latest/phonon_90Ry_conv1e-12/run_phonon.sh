#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
##SBATCH --mem-per-cpu=4.5GB
##SBATCH --exclusive
##SBATCH --nodelist=mrcd[89-90]

#SBATCH --partition  pi.dstrubbe # test, short, medium, long
#SBATCH --time=00:45:00

#SBATCH --job-name=SnTe_ph90
#SBATCH --export=ALL
#SBATCH --output=SnTe_%j.stdout

##SBATCH --mail-user=collinskariuki@ucmerced.edu
##SBATCH --mail-type=ALL

export OMP_NUM_THREADS=1

echo "now working in dir $(pwd)"
date
start_time=`date +%s.%N`

module load quantum-espresso

srun -n 4 pw.x < scf.in > scf.out
srun -n 4 ph.x < phonon.in > phonon.out
srun -n 4 dynmat.x < dynmat.in > dynmat.out

exit
