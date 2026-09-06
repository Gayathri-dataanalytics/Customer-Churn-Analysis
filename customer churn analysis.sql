CREATE DATABASE IF NOT EXISTS customer_churn_analysis;
USE customer_churn_analysis;
CREATE TABLE customer_churn (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);
SELECT * FROM customer_churn;
SELECT COUNT(*) AS Total_Customers
FROM customer_churn;
SELECT COUNT(*) AS Total_Customers
FROM customer_churn;
SELECT COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn = 'Yes';
SELECT 
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate_Percentage
FROM customer_churn;
SELECT 
    ROUND(AVG(MonthlyCharges), 2) AS Average_Monthly_Charges
FROM customer_churn;
SELECT 
    ROUND(AVG(tenure), 2) AS Average_Tenure_Months
FROM customer_churn;
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract
ORDER BY Churn_Rate DESC;
SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY InternetService
ORDER BY Churn_Rate DESC;
SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure <= 24 THEN '13-24 Months'
        WHEN tenure <= 48 THEN '25-48 Months'
        ELSE '49-72 Months'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Tenure_Group
ORDER BY
    CASE
        WHEN Tenure_Group = '0-12 Months' THEN 1
        WHEN Tenure_Group = '13-24 Months' THEN 2
        WHEN Tenure_Group = '25-48 Months' THEN 3
        ELSE 4
    END;
    SELECT
    CASE
        WHEN MonthlyCharges <= 40 THEN 'Low'
        WHEN MonthlyCharges <= 70 THEN 'Medium'
        WHEN MonthlyCharges <= 100 THEN 'High'
        ELSE 'Very High'
    END AS Charges_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Charges_Group
ORDER BY
    CASE
        WHEN Charges_Group = 'Low' THEN 1
        WHEN Charges_Group = 'Medium' THEN 2
        WHEN Charges_Group = 'High' THEN 3
        ELSE 4
    END;
    SELECT
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior Citizen'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY SeniorCitizen
ORDER BY Churn_Rate DESC;
SELECT
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY TechSupport
ORDER BY Churn_Rate DESC;
SELECT
    OnlineSecurity,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY OnlineSecurity
ORDER BY Churn_Rate DESC;
SELECT
    Contract,
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract, PaymentMethod
ORDER BY Churn_Rate DESC;
SELECT
    Contract,
    InternetService,
    TechSupport,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS Churn_Rate
FROM customer_churn
GROUP BY Contract, InternetService, TechSupport
HAVING COUNT(*) >= 50
ORDER BY Churn_Rate DESC;