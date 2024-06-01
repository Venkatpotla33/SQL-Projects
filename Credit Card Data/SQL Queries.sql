select * from Credit_card;

--1.Count the Number of Customers

select COUNT(distinct client_Num) as Total_customers from Credit_card;

--2.Customers Distribution by Card Categories

select card_category,COUNT(distinct client_Num) as Total_customers 
from Credit_card
group BY card_category;

--3. Average Annual Fees by Card Category

select card_category, AVG(Annual_fees) as Avg_Annualfee 
from Credit_card
group by card_category;

---4.Total Interest Earned by Card Category

select card_category, Round(SUM(Interest_earned),2) as Total_Interest_earned
from Credit_card
group by card_category;

--5.Average Utilization Ratio by Card Category

select card_category , ROUND(AVG(Avg_Utilization_Ratio),4) as Avg_Utilization_Ratio 
from Credit_card
group BY card_category;


---6.Number of Customers Who Activated Within 30 Days

select COUNT(distinct client_Num) as Activated_customers
 from Credit_card
 WHERE Activation_30_Days =1;

---7.Total Transaction Amount and Volume by Expense Type

select Exp_Type,SUM(Total_Trans_Amt) as Total_tran_amount,SUM(Total_Trans_Vol)
as Total_Tran_volume 
FROM Credit_card
group by Exp_Type;


---8.Average Credit Limit by Card Category

select card_category, Round(AVG(Credit_Limit),2) as Avg_Creditlimit
from Credit_card 
group by card_category;

----9.Total Revolving Balance by Use Chip (Chip/Swipe/Online)

select Use_Chip ,SUM(Total_Revolving_Bal) as Total_Revolving_Bal
from Credit_card
GROUP by Use_Chip;

----10. Count of Delinquent Accounts by Card Category

select card_category, COUNT(Delinquent_Acc) as Delinquent_Acc 
from Credit_card
where Delinquent_Acc=1 GROUP by card_category;

----11.Average Interest Earned by Whether the Customer Used Chip or Not

select Use_Chip,Round(AVG(Interest_earned),2) as Avg_Interest_earned from 
Credit_card group by Use_Chip;


---12.Top 5 Customers by Total Transaction Amount

select top 5 client_Num,Total_Trans_Amt as Total_Trans_Amount from 
Credit_card ORDER by Total_Trans_Amt DESC ;


---13.Total Customer Acquisition Cost by Card Category

select card_category, SUM(Customer_Acq_Cost) as Customer_Acq_Cost from Credit_card
GROUP by card_category;

---14.Average Total Transaction Volume for Clients with Platinum Cards

select AVG(Total_Trans_Vol) as avg_Total_Trans_Vol from Credit_card
where card_category= 'Platinum';

---15.Average and Total Credit Limit for Customers with a Delinquent Account

select Round(AVG(Credit_Limit),2) as avg_Credit_Limit,Round(SUM(Credit_Limit),2) as Total_Credit_Limit from 
Credit_card where Delinquent_Acc= 1;

---16.Number of Clients by Week Number

select Week_Num, COUNT(client_Num) as Total_customers from Credit_card
group by Week_Num;


---17.Total Interest Earned by Week Number

select Week_Num, SUM(Interest_earned) as Total_Interest_earned from Credit_card
group by Week_Num;

---18. Count of Customers with High Utilization Ratio (>0.5)

select COUNT(client_Num) as Customers_count from Credit_card where Avg_Utilization_Ratio > 0.5;

----19. Average Customer Acquisition Cost by Week

select week_Num, AVG(Customer_Acq_Cost) as Customer_Acq_Cost from Credit_card
group by Week_Num;

---20.Total Transaction Amount by Expense Type for Customer with Delinquent Accounts

select Exp_Type, SUM(Total_Trans_Amt) as Total_Trans_Amt from Credit_card where Delinquent_Acc=1
group by Exp_Type;

----21.Customer Average Income by Card Category

select cc.Card_Category, AVG(c.Income) as avg_Income from Credit_card cc 
join Customer c on cc.client_Num=c.client_Num
group By cc.Card_Category;

---22.Customer Satisfaction Score by Card Category

select cc.Card_Category,avg(c.Cust_Satisfaction_Score) as Customer_Satisfaction_Score  from Customer c join 
Credit_card cc on cc.client_Num=c.client_Num group By cc.Card_Category;

----23.Total Interest Earned by Gender

select c.Gender, Round(SUM(cc.Interest_Earned),2) as Total_Interest_Earned from Credit_Card cc join Customer c
on cc.client_Num=c.client_Num group by c.Gender;


---24.Number of Delinquent Accounts by Education Level

select c.Education_Level,count(cc.Delinquent_Acc) as Delinquent_Accounts from Credit_Card cc join 
Customer c on cc.client_Num=c.client_Num where cc.Delinquent_Acc = 1 group by c.Education_Level;

---25.Total Transaction Amount by Job Type

select c.Customer_Job, SUM(cc.Total_Trans_Amt) as Total_Trans_Amt from Credit_Card cc join 
Customer c on cc.client_Num=c.client_Num group By c.Customer_Job;


----26. Total Transaction amount by Gender

select c.Gender, c.Customer_Job,ROUND(SUM(cc.Total_Trans_Amt),2) as Total_Trans_Amount from Credit_Card cc join 
Customer c on cc.client_Num=c.client_Num group by c.Gender,c.Customer_Job;


----27. Customers By Gender

select Gender,count(distinct client_Num) as Total_Customers from Customer GROUP by Gender;

----28. Top 5 Customers by age

select top 5 Customer_Age, count(distinct client_Num) as Total_Customers from Customer
group by Customer_Age
order by Total_Customers DESC;


----29. Customers by job type

select Customer_Job, count(distinct client_Num) as Total_Customers from Customer
GROUP by Customer_Job;

-----30. Customers by Marital Status

select Marital_Status,count(distinct client_Num) as Total_Customers from Customer
GROUP by Marital_Status;

----31. Customers by Education Level

select Education_Level,count(distinct client_Num) as Total_Customers from Customer
GROUP by Education_Level;

----32. Number of Customers Having House and Car

select count(distinct client_Num) as Total_Customers from Customer

where Car_Owner=1 and House_Owner=1;

------33. Top 5 Customer age Having High Income

select top 5 Customer_Age, sum(Income) as Income from Customer group by Customer_Age
ORDER by Income DESC;

----34. Top 3 Average Customer satisfaction Score by Gender, Job Type, Education, Marital Status

select top 3 Gender,Customer_Job,Education_Level,Marital_Status, AVG(Cust_Satisfaction_Score) as Customer_Statisfaction_Score from Customer

group by Gender,Customer_Job,Education_Level,Marital_Status ORDER by Customer_Statisfaction_Score desc;


----35. Monthly avg Interest Earned and Total Interest earned


select FORMAT(Week_Start_Date,'MMMM') as Month_name , round(AVG(Interest_Earned),2) AS Avg_Interest_Earned ,
ROUND(sum(Interest_Earned),2) as Total_Interest_Earned
from Credit_Card GROUP BY FORMAT(Week_Start_Date,'MMMM');

----- 36. Customer Transactions by Expense Type and Job Type

select c.Customer_Job,cc.Exp_Type,sum(cc.Total_Trans_Amt) as Total_Trans_Amt from Credit_Card cc JOIN 
Customer c on cc.client_Num=c.client_Num group by c.Customer_Job,cc.Exp_Type; 


-----37. Top card Avg_Utilization_Ratio by Customer age

select top 5 c.Customer_Age,Round(AVG(cc.Avg_Utilization_Ratio),3) as Avg_Utilization_Ratio from Credit_Card cc join 
Customer c on c.client_Num=cc.client_Num group by c.Customer_Age order by Avg_Utilization_Ratio DESC;

-----38. Transaction Amount and Interest Earned by Quarter 

select Qtr, ROUND(sum(Total_Trans_Amt),2) as Total_Trans_Amount, ROUND(sum(Interest_Earned),2)
 as Interest_earned from Credit_Card GROUP by Qtr;


------39.Transaction Amount and Interest Earned by Customer Personal Loan

select c.Personal_loan, ROUND(sum(cc.Total_Trans_Amt),2) as Total_Trans_Amount, ROUND(sum(cc.Interest_Earned),2)
 as Interest_earned from Credit_Card cc join Customer c on c.client_Num=cc.client_Num
group by c.Personal_loan;


-----40.Monthly Revolving Balance Distribution

select FORMAT(Week_Start_Date,'MMMM') as Month_Name, ROUND(sum(Total_Revolving_Bal),2) as Total_Revolving_Bal 
from Credit_Card GROUP by FORMAT(Week_Start_Date,'MMMM');

