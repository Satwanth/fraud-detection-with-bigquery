-- Evaluate logistic regression model
CREATE OR REPLACE TABLE finance.table_perf AS
SELECT "Initial_reg" AS model_name, *
FROM ML.EVALUATE(MODEL `finance.model_supervised_initial`,
  (SELECT * FROM finance.fraud_data_model));

-- Evaluate boosted tree model
INSERT INTO finance.table_perf
SELECT "improved_reg" AS model_name, *
FROM ML.EVALUATE(MODEL `finance.model_supervised_boosted_tree`,
  (SELECT * FROM finance.fraud_data_model));