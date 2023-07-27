#####################################################################################################################################

-- 1). WEEKDAY VS WEEKEND PAYMENT STATISTICS:
SELECT day_type,
concat('$',round(sum(payment_value),2)) as Payment,
concat('$',round(avg(payment_value),2)) as "Average Pay"
from kpi1_table
group by day_type;

######################################################################################################################################

-- 2).Number of Orders with review score 5 and payment type as credit card:
select review_score as Review_Score,
count(order_id) as Number_of_Orders,
payment_type as Payment_type
from kpi2_table
where review_score=5
and payment_type= "credit_card";

######################################################################################################################################

-- 3) Average number of days taken for order_delivered_customer_date for pet_shop:
select product_category_name as Product_Name,
round(avg(datediff(order_delivered_customer_date, order_purchase_timestamp)),0) as Average_days_taken_to_deliver_customer
from kpi3_table
where product_category_name="pet_shop";

######################################################################################################################################

-- 4) Average price and payment values from customers of sao paulo city:
select customer_city,
concat('$',format(avg(price),2)) as Avg_Price,
concat('$',format(avg(payment_value),2)) as Avg_Payment_value 
from kpi4_table
where customer_city="sao paulo";

######################################################################################################################################

-- 5) Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores:
select review_score as Review_score, round(avg(datediff(order_delivered_customer_date,order_purchase_timestamp)),0) as Avg_Shipping_Days
from kpi5_table
group by review_score
order by review_score;

######################################################################################################################################