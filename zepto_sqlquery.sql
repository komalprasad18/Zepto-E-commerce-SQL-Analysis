CREATE DATABASE ZeptoAnalysis;
GO

USE ZeptoAnalysis;
GO

CREATE TABLE zepto (
    sku_id INT IDENTITY(1,1) PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(10,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(10,2),
    weightInGms INT,
    outOfStock BIT,
    quantity INT
);

SELECT COUNT(*) AS total_records
FROM dbo.zepto_v2;

SELECT TOP 10 *
FROM dbo.zepto_v2;

SELECT
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS null_category,
    SUM(CASE WHEN mrp IS NULL THEN 1 ELSE 0 END) AS null_mrp,
    SUM(CASE WHEN discountedSellingPrice IS NULL THEN 1 ELSE 0 END) AS null_discounted_price,
    SUM(CASE WHEN availableQuantity IS NULL THEN 1 ELSE 0 END) AS null_available_quantity,
    SUM(CASE WHEN weightInGms IS NULL THEN 1 ELSE 0 END) AS null_weight
FROM dbo.zepto_v2;

SELECT DISTINCT category
FROM dbo.zepto_v2
ORDER BY category;

SELECT
    outOfStock,
    COUNT(*) AS product_count
FROM dbo.zepto_v2
GROUP BY outOfStock;

SELECT
    name,
    COUNT(*) AS sku_count
FROM dbo.zepto_v2
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY sku_count DESC;

SELECT
    COUNT(*) AS invalid_price_rows
FROM dbo.zepto_v2
WHERE mrp IS NULL
   OR mrp = 0
   OR discountedSellingPrice IS NULL
   OR discountedSellingPrice = 0;

   DELETE FROM dbo.zepto_v2
WHERE mrp IS NULL
   OR mrp = 0
   OR discountedSellingPrice IS NULL
   OR discountedSellingPrice = 0;

   SELECT COUNT(*) AS cleaned_total_rows
FROM dbo.zepto_v2;

SELECT
    MAX(mrp) AS max_mrp,
    MIN(mrp) AS min_mrp
FROM dbo.zepto_v2;

UPDATE dbo.zepto_v2
SET
    mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

    SELECT TOP 10
    name,
    mrp,
    discountedSellingPrice
FROM dbo.zepto_v2;

--Top 10 Best-Value Products (Highest Discount %)
SELECT TOP 10
    name,
    category,
    mrp,
    discountedSellingPrice,
    discountPercent
FROM dbo.zepto_v2
ORDER BY discountPercent DESC;

--High-MRP Products That Are Out of Stock
SELECT
    name,
    category,
    mrp
FROM dbo.zepto_v2
WHERE outOfStock = 1
ORDER BY mrp DESC;

--Potential Revenue by Product Category
SELECT
    category,
    SUM(discountedSellingPrice * availableQuantity) AS potential_revenue
FROM dbo.zepto_v2
WHERE outOfStock = 0
GROUP BY category
ORDER BY potential_revenue DESC;

--Expensive Products (MRP > ₹500) with Minimal Discount
SELECT
    name,
    category,
    mrp,
    discountPercent
FROM dbo.zepto_v2
WHERE mrp > 500
  AND discountPercent < 5
ORDER BY mrp DESC;

--Top 5 Categories with Highest Average Discount
SELECT TOP 5
    category,
    ROUND(AVG(discountPercent), 2) AS avg_discount
FROM dbo.zepto_v2
GROUP BY category
ORDER BY avg_discount DESC;

--Total Inventory Weight per Category
SELECT
    category,
    SUM(weightInGms * availableQuantity) AS total_inventory_weight_gms
FROM dbo.zepto_v2
WHERE outOfStock = 0
GROUP BY category
ORDER BY total_inventory_weight_gms DESC;

--Product Grouping by Weight (Low / Medium / Bulk)
SELECT
    CASE
        WHEN weightInGms < 500 THEN 'Low'
        WHEN weightInGms BETWEEN 500 AND 2000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category,
    COUNT(*) AS product_count
FROM dbo.zepto_v2
GROUP BY
    CASE
        WHEN weightInGms < 500 THEN 'Low'
        WHEN weightInGms BETWEEN 500 AND 2000 THEN 'Medium'
        ELSE 'Bulk'
    END;

--Price per Gram (Value-for-Money Products)
SELECT
    name,
    category,
    discountedSellingPrice,
    weightInGms,
    ROUND(discountedSellingPrice / NULLIF(weightInGms, 0), 4) AS price_per_gram
FROM dbo.zepto_v2
WHERE weightInGms > 0
ORDER BY price_per_gram;













