-- Download dataset
gsutil cp gs://spls/gsp774/archive.zip .
-- Unzip
unzip archive.zip
-- Create env variable for the file
export DATA_FILE=PS_20174392719_1491204439457_log.csv
-- Create a dataset in BigQuery
bq mk --dataset $PROJECT_ID:finance
