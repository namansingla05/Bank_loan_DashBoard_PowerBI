select * from bank_loan_data;


--DashBoard 1
--Total Loan Apllication

select count(id) as Total_Loan_Applications from bank_loan_data;

--MTD Total Loan Application
select count(id) as MTD_Total_Loan_Applications from bank_loan_data
where extract(month FROM issue_date) = 12 and extract(year FROM issue_date)=2021;

--PMTD Total Loan Application(P stands for previous)
select count(id) as PMTD_Total_Loan_Applications from bank_loan_data
where extract(month FROM issue_date) = 11 and extract(year FROM issue_date)=2021;

--MoM Change (%) = ((This Month - Last Month) / Last Month) × 100

/*If a bank had:
Loan applications in March = 1000
Loan applications in April = 1200
Then: MoM Change = ((1200 - 1000) / 1000) × 100 = 20% */
--------------------------------------------------------------------

--toatl funded amount
select sum(loan_amount) as Total_funded_amount from bank_loan_data;

--MTD total funded AMOUNT
select sum(loan_amount) as MTD_Total_funded_amount from bank_loan_data
where extract(month FROM issue_date) = 12 and extract(year FROM issue_date)=2021;

--PMTD total funded AMOUNT
select sum(loan_amount) as PMTD_Total_funded_amount from bank_loan_data
where extract(month FROM issue_date) = 11 and extract(year FROM issue_date)=2021;

-----------------------------------------------------------------------------------------
--toatl amount recieved
select sum(total_payment) as Total_amount_received from bank_loan_data;

--MTD toatl amount recieved
select sum(total_payment) as MTD_Total_amount_received from bank_loan_data
where extract(month FROM issue_date) = 12 and extract(year FROM issue_date)=2021;

--PMTD toatl amount recieved
select sum(total_payment) as PMTD_Total_amount_received from bank_loan_data
where extract(month FROM issue_date) = 11 and extract(year FROM issue_date)=2021;

-----------------------------------------------------------------------------------------

--Avg intrest Rate
select round((avg(int_rate)*100)::numeric,2) as avg_intrest_rate from bank_loan_data;

--MTD Avg intrest Rate
select round((avg(int_rate)*100)::numeric,2) as MTD_avg_intrest_rate from bank_loan_data
where extract(month FROM issue_date) = 12 and extract(year FROM issue_date)=2021;

--PMTD Avg intrest Rate
select round((avg(int_rate)*100)::numeric,2) as PMTD_avg_intrest_rate from bank_loan_data
where extract(month FROM issue_date) = 11 and extract(year FROM issue_date)=2021;

-------------------------------------------------------------------------------------------

--Avg DTI
select round((avg(dti)*100)::numeric,2) as avg_dti from bank_loan_data;

--MTD Avg intrest Rate
select round((avg(dti)*100)::numeric,2) as MTD_avg_dti from bank_loan_data
where extract(month FROM issue_date) = 12 and extract(year FROM issue_date)=2021;

--PMTD Avg intrest Rate
select round((avg(dti)*100)::numeric,2) as PMTD_avg_dti from bank_loan_data
where extract(month FROM issue_date) = 11 and extract(year FROM issue_date)=2021;

-------------------------------------------------------------------------------------------

--Good Loan Bad Loan

select distinct loan_status from bank_loan_data;

--Good Loan percentage
select round(sum(case when loan_status = 'Fully Paid' or loan_status = 'Current' then 1 else 0 end)::decimal*100/count(id),2)
as good_loan_percentage from bank_loan_data;

--count of good loan
select count(id) as good_loan_applications from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current';

--good loan funded amount
select sum(loan_amount) as good_loan_funded_amount from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current';

--good loan recieved amount
select sum(total_payment) as good_loan_recieved_amount from bank_loan_data
where loan_status='Fully Paid' or loan_status='Current';

------------------------------------------------------------------

--bad Loan percentage
select round(sum(case when loan_status = 'Charged Off' then 1 else 0 end)*100.0/count(id),2)
as bad_loan_percentage from bank_loan_data;

--count of bad loan
select count(id) as bad_loan_applications from bank_loan_data
where loan_status='Charged Off';

--bad loan funded amount
select sum(loan_amount) as bad_loan_funded_amount from bank_loan_data
where loan_status='Charged Off';


--bad loan recieved amount
select sum(total_payment) as bad_loan_recieved_amount from bank_loan_data
where loan_status='Charged Off';

--------------------------------------------------------------------------

--Loan Status Grid View

SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        1;

--Loan Status Grid View MTD

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE extract(month from issue_date) = 12 
GROUP BY 1;

-----------------------------------------------------------------------------

--DashBoard 2

--Monthly Trends by Issue Date

SELECT 
  EXTRACT(MONTH FROM issue_date) AS month_number,
  TO_CHAR(issue_date, 'Month') AS month_name,
  COUNT(id) AS total_loan_applications,
  SUM(loan_amount) AS total_funded_amount,
  SUM(total_payment) AS total_amount_received
FROM bank_loan_data
GROUP BY 1,2
ORDER BY 1;


--Regional Analysis by State

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY 1
ORDER BY 2 desc;

--Loan Term Analysis(leangth of loan in months)

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY 1
ORDER BY 2 desc;

--Employee Length Analysis

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY 1
ORDER BY 2 desc;

--Loan Purpose Breakdown 
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY 1
ORDER BY 2 desc;

--Home Ownership Analysis 
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY 1
ORDER BY 2 desc;

--we can check for filters(that we apply in power BI) by applying where clause in the queris

--For e.g See the results when we hit the Grade A in the filters for dashboards.
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY 1
ORDER BY 2 desc;
