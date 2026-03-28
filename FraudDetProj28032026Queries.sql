-- =========================================
-- FRAUD DETECTION PROJECT
-- Author: Deva Eazhumalai
-- Description: SQL analysis on transaction fraud dataset
-- =========================================

SELECT COUNT(*) AS toal_transactions
FROM DBO.bs140513_032310

--FRAUD VS NON FRAUD
SELECT fraud, COUNT(*) AS Count
FROM dbo.bs140513_032310
GROUP BY fraud

--FRAUD PERCENTAGE BY CATEGORY
SELECT 
	category,
	count(category) as cat_count,
    SUM(CAST(fraud AS INT)) AS fraud_count,
	CAST(SUM(CAST(fraud AS INT)*100.00)/count(*) AS DECIMAL(5,2)) AS fraud_percentage
FROM dbo.bs140513_032310
GROUP BY category
ORDER BY fraud_percentage desc; 

--CATEGORIZING THE AMOUNT RANGE
SELECT
	CASE
		WHEN amount < 1000 THEN 'LOW'
		WHEN amount < 10000 THEN 'MEDIUM'
		ELSE 'HIGH'
	END AS amount_range,
	COUNT(*) AS total,
	SUM(CAST(fraud AS INT)) AS isFraud
FROM DBO.bs140513_032310
GROUP BY
	CASE WHEN amount < 1000 THEN 'LOW'
		WHEN amount < 10000 THEN 'MEDIUM'
		ELSE 'HIGH'
	END;

--FRAUD COUNT AS PER MERCHANT
SELECT
	zipcodeOri,
	zipMerchant,
	merchant,
	category,
	cast(amount as decimal(6,2)) as fraud_amount,
	SUM(CAST(fraud AS INT)) AS fraud_count
FROM dbo.bs140513_032310
GROUP BY zipcodeOri, zipMerchant, merchant, category, amount
HAVING SUM(CAST(fraud AS INT)) = 1
ORDER BY amount DESC;


--Fraud rate
SELECT 
	merchant,
	COUNT(*) AS total_transactions,
	SUM(CAST(fraud AS int)) AS fraud_transactions,
	CAST(SUM(CAST(fraud AS int)) * 100.0/COUNT(*) AS DECIMAL(5,2)) AS fraud_rate
FROM dbo.bs140513_032310
GROUP BY merchant
ORDER BY fraud_rate DESC;

--Time based fraud analysis

SELECT
	step,
	COUNT(*) AS total_transactions,
	SUM(CAST(fraud AS INT)) AS fraud_count
FROM dbo.bs140513_032310
GROUP BY step
ORDER BY step;

