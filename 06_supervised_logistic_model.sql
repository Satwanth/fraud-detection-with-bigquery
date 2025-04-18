-- Train a logistic regression model
CREATE OR REPLACE MODEL finance.model_supervised_initial
OPTIONS(model_type='LOGISTIC_REG', input_label_cols=['isfraud']) AS
SELECT
  type, amount, oldbalanceOrig, newbalanceOrig,
  oldbalanceDest, newbalanceDest, isFraud
FROM finance.fraud_data_model;

-- Feature importance (weights)
SELECT *
FROM ML.WEIGHTS(MODEL `finance.model_supervised_initial`,
  STRUCT(TRUE AS standardize));