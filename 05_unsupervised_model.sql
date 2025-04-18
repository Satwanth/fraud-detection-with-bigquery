-- Train a K-Means clustering model
CREATE OR REPLACE MODEL finance.model_unsupervised
OPTIONS(model_type='kmeans', num_clusters=5) AS
SELECT
  amount, oldbalanceOrig, newbalanceOrig,
  oldbalanceDest, newbalanceDest,
  type, origzeroFlag, destzeroFlag, amountError
FROM finance.fraud_data_model;

-- Evaluate fraud distribution by cluster
SELECT
  centroid_id, SUM(isfraud) AS fraud_cnt, COUNT(*) AS total_cnt
FROM ML.PREDICT(MODEL `finance.model_unsupervised`,
  (SELECT * FROM finance.fraud_data_test))
GROUP BY centroid_id
ORDER BY centroid_id;