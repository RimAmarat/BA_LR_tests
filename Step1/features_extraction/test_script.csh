#!/usr/bin/tcsh

#SBATCH --partition=gpu
#SBATCH --time=01:00:00
#SBATCH --job-name=ba_lr_test0
#SBATCH --gpus-per-node=2
#SBATCH --nodelist=heracles
#SBATCH --mem=30G
#SBATCH --output=/users/ramarat/BA_LR_tests/Step1/features_extraction/log/ba_lr_out.txt
#SBATCH --error=/users/ramarat/BA_LR_tests/Step1/features_extraction/log/ba_lr_err.log


conda activate rimsEnv 

perl feature-extraction.sh --nj 2 --data-in TEST_FILES --data-out out_folder --features-out extracted_features --kaldi-root /users/ramarat/kaldi
