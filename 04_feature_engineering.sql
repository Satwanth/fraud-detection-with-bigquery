-- Create sample dataset with engineered features and undersampling
CREATE OR REPLACE TABLE finance.fraud_data_sample AS
SELECT
  type,
  amount,
  nameOrig,
  nameDest,
  oldbalanceOrg AS oldbalanceOrig,
  newbalanceOrig,
  oldbalanceDest,
  newbalanceDest,
  IF(oldbalanceOrg = 0.0, 1, 0) AS origzeroFlag,
  IF(newbalanceDest = 0.0, 1, 0) AS destzeroFlag,
  ROUND((newbalanceDest - oldbalanceDest - amount)) AS amountError,
  GENERATE_UUID() AS id,
  isFraud
FROM finance.fraud_data
WHERE type IN ("CASH_OUT", "TRANSFER")
  AND (isFraud = 1 OR RAND() < 0.1);

-- Create test dataset
CREATE OR REPLACE TABLE finance.fraud_data_test AS
SELECT *
FROM finance.fraud_data_sample
WHERE RAND() < 0.2;

-- Create model training dataset
CREATE OR REPLACE TABLE finance.fraud_data_model AS
SELECT *
FROM finance.fraud_data_sample
EXCEPT DISTINCT
SELECT * FROM finance.fraud_data_test;