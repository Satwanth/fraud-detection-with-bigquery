-- Predict fraud on test data using logistic regression model
SELECT
  id, label AS predicted, isFraud AS actual
FROM
  ML.PREDICT(MODEL `finance.model_supervised_initial`,
    (SELECT * FROM finance.fraud_data_test)
  ), UNNEST(predicted_isfraud_probs) AS p
WHERE p.label = 1 AND p.prob > 0.5;