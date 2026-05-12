-- =========================================
-- SUPERSTORE SALES ANALYSIS PROJECT
-- =========================================

-- =========================================
-- 1. DATA PREVIEW
-- Dataset structure review
-- =========================================

select *
from samplesuperstore
limit(5)





-- =========================================
-- 2. OVERALL BUSINESS PERFORMANCE
-- Total sales, profit and order count
-- =========================================

select
	count(*) as toplam_satis_adedi,
	round(sum(sales),2) as toplam_satis,
	round(sum(profit),2) as toplam_kar,
	ROUND(AVG(discount), 2) AS ortalama_indirim
	from samplesuperstore;





-- =========================================
-- 3. CATEGORY PERFORMANCE ANALYSIS
-- Compare sales and profitability by category
-- =========================================

select
	category,
	count(*) as toplam_satis_adedi,
	sum(sales) as toplam_satis,
	sum(profit) as toplam_kar,
	AVG(discount) AS ortalama_indirim
	from samplesuperstore
	group by category
	order by category desc;





-- =========================================
-- 4. DISCOUNT VS PROFIT ANALYSIS
-- Analyze impact of discount on profitability
-- =========================================

SELECT
	discount,
	round(avg(profit),2) as ortalama_kar
from samplesuperstore
group by discount
order by discount;





-- =========================================
-- 5. MONTHLY SALES TREND
-- Analyze seasonality and sales trend over time
-- =========================================

SELECT
	date_trunc(
		'month',
		strptime("Order Date", '%m/%d/%Y')
		) as month,
		
	sum(sales) as toplam_satis
	
from samplesuperstore
group by month
order by month;
