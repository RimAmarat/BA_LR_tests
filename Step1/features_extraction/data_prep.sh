#!/bin/bash

#
# Copyright (c) 2023. Imen Ben Amor
#
# Delete .Backup
#rm '/users/ramarat/BA_LR_tests/Step1/features_extraction/TEST_FILES/.backup'


# Output file for <utt_id> <spk_id>
output_file1="utt2spk"

# Output file for <utt_id> <file_name>
output_file2="wav.scp"

# Path to input files
cd TEST_FILES

#touch '/users/ramarat/BA_LR_tests/Step1/features_extraction/TEST_FILES/'$output_file1
#touch '/users/ramarat/BA_LR_tests/Step1/features_extraction/TEST_FILES/'$output_file2
# empty config files
#echo > "$output_file1"
#echo > "$output_file2"

# Loop through all the wav files in the folder
for file in *.wav; do
    # Extract spk_id and utt_id from the file name
    spk_id=$(echo "$file" | cut -d'_' -f1)
    utt_id=$(echo "$file" | cut -d'_' -f2 | cut -d'.' -f1)
    bare_file=$(echo "$file" | cut -d'.' -f1)

    # Append <utt_id> <spk_id> to output_file1

    echo "$bare_file $spk_id" >> "$output_file1"

    # Append <utt_id> <file_name> to output_file2
    echo "$utt_id $file" >> "$output_file2"
done

echo "Mapping files created:"
echo "1. $output_file1"
echo "2. $output_file2"
