

Create Database Sales;

use sales;

select * from Coffeeshopsales;

---Calculate Total sales for each respective month

select Round(sum(unit_price * transaction_qty),2) as Total_sales from 
Coffeeshopsales
where MONTH(transaction_date)=1; --jan

select Round(sum(unit_price * transaction_qty),2) as Total_sales from 
Coffeeshopsales
where MONTH(transaction_date)=1; --jan

select Round(sum(unit_price * transaction_qty),2) as Total_sales from 
Coffeeshopsales
where MONTH(transaction_date)=1; --jan

select Round(sum(unit_price * transaction_qty),2) as Total_sales from 
Coffeeshopsales
where MONTH(transaction_date)=1; --jan

select Round(sum(unit_price * transaction_qty),2) as Total_sales from 
Coffeeshopsales
where MONTH(transaction_date)=1; --jan

select Round(sum(unit_price * transaction_qty),2) as Total_sales from 
Coffeeshopsales
where MONTH(transaction_date)=1; --jan

select month(transaction_date),Round(sum(unit_price * transaction_qty),2) as Total_sales from 
Coffeeshopsales where transaction_date =
order by month(transaction_date);
