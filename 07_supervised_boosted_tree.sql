-- Train a boosted tree model
CREATE OR REPLACE MODEL finance.model_supervised_boosted_tree
OPTIONS(model_type='BOOSTED_TREE_CLASSIFIER', input_label_cols=['isfraud']) AS
SELECT
  type, amount, oldbalanceOrig, newbalanceOrig,
  oldbalanceDest, newbalanceDest, isFraud
FROM finance.fraud_data_model;