SELECT 'Avg_Wines' AS Product_Type, AVG(MntWines) AS Avg_Value FROM `macro-shadow-352210.superstore.data` WHERE Response = 1
UNION ALL
SELECT 'Avg_Fruits', AVG(MntFruits) FROM `macro-shadow-352210.superstore.data` WHERE Response = 1
UNION ALL
SELECT 'Avg_Meat', AVG(MntMeatProducts) FROM `macro-shadow-352210.superstore.data` WHERE Response = 1
UNION ALL
SELECT 'Avg_Fish', AVG(MntFishProducts) FROM `macro-shadow-352210.superstore.data` WHERE Response = 1
UNION ALL
SELECT 'Avg_Sweets', AVG(MntSweetProducts) FROM `macro-shadow-352210.superstore.data` WHERE Response = 1
UNION ALL
SELECT 'Avg_Gold', AVG(MntGoldProds) FROM `macro-shadow-352210.superstore.data` WHERE Response = 1; 



SELECT
  Marital_Status,
  Education,
  ROUND(AVG(Income), 2) AS Avg_Income,
  ROUND(AVG(2023 - Year_Birth), 2) AS Avg_Age
FROM
  `macro-shadow-352210.superstore.data`
WHERE
  Response = 1
GROUP BY
  Marital_Status, Education



SELECT
  Recency,
  COUNT(*) AS Num_Customers
FROM
  `macro-shadow-352210.superstore.data`
WHERE
  Response = 1
GROUP BY
  Recency
ORDER BY
  Recency



SELECT
  NumWebPurchases,
  NumCatalogPurchases,
  NumStorePurchases,
  COUNT(*) AS Num_Customers
FROM
  `macro-shadow-352210.superstore.data`
WHERE
  Response = 1
GROUP BY
  NumWebPurchases, NumCatalogPurchases, NumStorePurchases



SELECT
  CASE
    WHEN Income < 30000 THEN 'Low'
    WHEN Income BETWEEN 30000 AND 60000 THEN 'Middle'
    ELSE 'High'
  END AS Income_Bracket,
  COUNT(*) AS Num_Responders
FROM
  `macro-shadow-352210.superstore.data`
WHERE
  Response = 1
GROUP BY
  Income_Bracket



SELECT
  Id,
  COUNT(*) AS Num_Transactions,
  AVG(NumWebVisitsMonth) AS Avg_Web_Visits
FROM
  `macro-shadow-352210.superstore.data`
WHERE
  Response = 1
GROUP BY
  Id
ORDER BY
  Num_Transactions DESC,
  Avg_Web_Visits DESC
LIMIT 5



SELECT
  CASE
  WHEN Complain = 1 
  THEN "Complain"
  ELSE "No Complain"
  END AS Complain,
  COUNT(*) AS Num_Complaints,
  COUNT(*) / (SELECT COUNT(*) FROM `macro-shadow-352210.superstore.data` WHERE Response = 1) AS Complaint_Rate
FROM
  `macro-shadow-352210.superstore.data`
WHERE
  Response = 1
GROUP BY
  Complain