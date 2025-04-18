-- Count fraudulent transactions per type
SELECT type, isFraud, count(*) as cnt
FROM `finance.fraud_data`
GROUP BY isFraud, type
ORDER BY type;

-- Fraud count in TRANSFER and CASH_OUT
SELECT isFraud, count(*) as cnt
FROM `finance.fraud_data`
WHERE type IN ("CASH_OUT", "TRANSFER")
GROUP BY isFraud;

-- Top 10 highest amount transactions
SELECT *
FROM `finance.fraud_data`
ORDER BY amount DESC
LIMIT 10;