--Just to check incrementality table
--This is to make sure I am aware of this whatever
SELECT 
DATE (product_issued_date) AS issued_date,
COUNT(DISTINCT order_id) as Orders,
SUM(m_net_sales_amount_gbp) as NTS,
ROUND((SUM(m_net_sales_amount_gbp) / COUNT(DISTINCT order_id)),2) as AOV
FROM bi_dwh.fm_products
WHERE record_type = 'SALES'
  AND product_gross_sales_flag = 'Y'
  AND product_issued_date >= DATE '2026-04-01'
GROUP BY 1;


SELECT
        channel_0,
        channel_1,
        channel_2,
        SUM(net_sales_gbp) AS nts_gbp
    FROM de_dwh_lf.marketing_orders mo
    WHERE region = 'United Kingdom'
        AND DATE(activity_date) = DATE'2026-01-01'
        AND channel_0 != 'Unknown'
    GROUP BY 1,2,3