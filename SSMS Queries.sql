--1. Which branch generates the highest revenue and profit?
SELECT TOP 1
    branch,
    SUM(unit_price * quantity) AS total_revenue
FROM Orderslist
GROUP BY branch
ORDER BY total_revenue DESC;
-- highest profit 
SELECT TOP 1
    branch,
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM Orderslist
GROUP BY branch
ORDER BY total_profit DESC;

--2. Which product categories contribute the most to revenue and profit?
SELECT
    category,
    ROUND(SUM(unit_price * quantity), 2) AS total_revenue,
    ROUND(SUM(unit_price * quantity * profit_margin), 2) AS total_profit,
    SUM(quantity) AS total_units_sold
FROM Orderslist
GROUP BY category
ORDER BY total_revenue DESC;

--3. Find the busiest days for each branch based on the number of transactions?
SELECT *
FROM
(
    SELECT
        branch,
        DATENAME(WEEKDAY, [date]) AS busiest_day,
        COUNT(invoice_id) AS total_transactions,
        RANK() OVER (
            PARTITION BY branch
            ORDER BY COUNT(invoice_id) DESC
        ) AS rank_num
    FROM Orderslist
    GROUP BY
        branch,
        DATENAME(WEEKDAY, [date])
) AS t
WHERE rank_num = 1;

--4. Which payment method is most preferred, and does it influence average purchase value?
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    ROUND(AVG(unit_price * quantity), 2) AS avg_transaction_value
FROM Orderslist
GROUP BY payment_method
ORDER BY total_transactions DESC;

--5. Which city and branch combination has the highest average customer rating?
SELECT
    city,
    branch,
    ROUND(AVG(rating), 2) AS average_rating,
    COUNT(*) AS total_transactions
FROM Orderslist
GROUP BY city, branch
ORDER BY average_rating DESC;

--6. Which categories have the highest profit margins and are they also the highest-selling?
SELECT
    category,
    ROUND(AVG(profit_margin), 2) AS avg_profit_margin,
    SUM(quantity) AS units_sold,
    ROUND(SUM(unit_price * quantity), 2) AS total_revenue
FROM Orderslist
GROUP BY category
ORDER BY avg_profit_margin DESC;

--7. How do monthly sales and profits trend over time?
SELECT
    DATENAME(MONTH, [date]) AS month_name,
    MONTH([date]) AS month_number,
    SUM(unit_price * quantity) AS total_revenue,
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM Orderslist
GROUP BY
    MONTH([date]),
    DATENAME(MONTH, [date])
ORDER BY
    month_number;

--8. Which are the top 5 highest-value transactions in each branch?
WITH ranked_transactions AS (
    SELECT
        invoice_id,
        branch,
        category,
        quantity,
        unit_price,
        (unit_price * quantity) AS transaction_value,
        ROW_NUMBER() OVER (
            PARTITION BY branch
            ORDER BY (unit_price * quantity) DESC
        ) AS rn
    FROM Orderslist
)

SELECT
    invoice_id,
    branch,
    category,
    quantity,
    unit_price,
    ROUND(transaction_value, 2) AS transaction_value
FROM ranked_transactions
WHERE rn <= 5
ORDER BY branch, transaction_value DESC;