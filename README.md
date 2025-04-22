# Bank Loan Analysis Dashboard 

This project presents an interactive **Bank Loan Report Dashboard** built using **Power BI**, aimed at providing deep insights into loan applications, funding, repayments, interest rates, and borrower behavior.

---

## Project Files
- **PBIX File**: Contains Power BI dashboard visuals.
- **Three Main Dashboards**:
  - **Summary View**
  - **Overview View**
  - **Detailed View**

---

## Project Overview
The dashboard analyzes and visualizes data related to loan applications and disbursements across various dimensions such as state, purpose, term, ownership, grade, and more.

Key KPIs include:
- Total Loan Applications
- Total Funded Amount
- Total Amount Received
- Average Interest Rate
- Average Debt-to-Income Ratio (DTI)

---

## Data Validation & Testing
All Figures and summaries shown in the dashboards have been **independently verified** using SQL queries.

This validation ensures the Power BI visualizations are:
- **Accurate**
- **Consistent with the underlying data**
- **Aligned with business logic**

**SQL Example Queries:**
```sql
-- Total Loan Applications
SELECT COUNT(*) FROM bank_loan_data;

-- Total Funded Amount
SELECT SUM(funded_amount) FROM bank_loan_data;

-- Average Interest Rate
SELECT AVG(interest_rate) FROM bank_loan_data;
```

> This form of **data testing using SQL** is a standard best practice in Data Analytics to ensure the reliability and correctness of dashboard outputs.

---

## Dashboard Snapshots

### 1. Summary Page
- Displays total applications, good vs bad loans, and loan status summary.
- Highlights:
  - 86.2% of loans are categorized as good.
  - 13.8% are identified as bad loans.
- Key KPIs displayed at the top provide an at-a-glance view of total funded amount, amount received, average interest rate, and average debt-to-income ratio (DTI).
- Donut charts clearly visualize the proportion of good vs. bad loan issuance based on approval and repayment metrics.
- A detailed loan status table breaks down loan counts and amounts across different statuses like Current, Fully Paid, and Charged Off.
- The page uses **interactive slicers** for:
  - **State**
  - **Grade**
  - **Loan Purpose**
  These slicers enable dynamic filtering, allowing users to drill down into specific regions, borrower credit grades, or loan categories for focused analysis.
- This summary page acts as the primary performance dashboard for decision-makers, offering high-level insights supported by real-time data segmentation.

![Summary Dashboard Preview](https://github.com/namansingla05/Bank_loan_DashBoard_PowerBI/blob/main/Summary_DashBoard.png)

---

### 2. Overview Page
- Provides monthly, state-wise, and demographic-based analytics for deeper loan insights.
- Breakdown by:
  - **Employment Length**
  - **Home Ownership**
  - **Loan Purpose**
  - **Loan Term**

- A line chart shows the month-over-month trend in total loan applications, helping track seasonal or monthly patterns.
- The U.S. map visual highlights state-wise loan distribution, enabling geo-spatial understanding of loan demand and penetration.
- A donut chart illustrates the proportion of loans based on their **term durations** — 36 vs. 60 months — offering insights into borrower preferences and risk exposure.
- Bar charts segment loan applications by:
  - **Employee tenure** — revealing stability patterns tied to loan approvals.
  - **Purpose of loan** — debt consolidation and credit card purposes dominate.
  - **Home ownership status** — a majority of applicants are renters.
- Interactive **slicers** are used for:
  - **State**
  - **Grade**
  - **Good vs Bad Loan Classification**
  - **Measure Selection** (Total Loan Applications, Total Funded Amount, Total Recieved Amount)
- This page is key for stakeholder analysis and targeting, offering demographic and regional breakdowns that can shape business strategy and marketing focus.


![Overview Dashboard Preview](https://github.com/namansingla05/Bank_loan_DashBoard_PowerBI/blob/main/Overview_DashBoard.png)

---

### 3. Details Page
- Presents a granular, record-level view of each individual loan entry for detailed auditing and analysis.
- Key fields included:
  - **Loan ID**
  - **Loan Purpose**
  - **Home Ownership**
  - **Grade** and **Sub-grade**
  - **Issue Date**
  - **Funded Amount**
  - **Interest Rate**
  - **Installment Amount**
  - **Amount Received**

- Ideal for:
  - Data validation and deep dives.
  - Spot-checking unusual values or outliers.
  - Investigating relationships between loan features and repayment patterns.

- The top section continues to show aggregated KPIs for quick context:
  - **Total Loan Applications**
  - **Total Funded and Received Amounts**
  - **Average Interest Rate**
  - **Average Debt-to-Income Ratio (DTI)**

- Integrated **slicers** allow users to filter by:
  - **State**
  - **Grade**
  - **Good vs Bad Loan Category**
- This page enables analysts to drill down from high-level insights into raw data for reporting, debugging, and business intelligence tasks.

![Details Dashboard Preview](https://github.com/namansingla05/Bank_loan_DashBoard_PowerBI/blob/main/Detail_DashBoard.png)

---

## Data Insights

- **Debt Consolidation & Credit Cards** are the most common loan purposes.
- A **larger portion of applicants are renters**, indicating a potentially less stable financial background.
- **Charged-off loans show significantly higher interest rates**, signaling higher risk profiles.
- **60-month loans**, though less common, are more prone to default compared to 36-month loans.
- **Employment length** and **DTI** have noticeable correlations with loan outcomes.

---

## Recommendations

1. **Risk-Based Loan Approval**  
   Prioritize applications from individuals with a longer employment history and lower debt-to-income ratio.

2. **Dynamic Interest Rate Policies**  
   Implement a flexible interest strategy based on risk profiles and repayment histories.

3. **Enhanced Monitoring of High-Risk Loans**  
   Set up early warning systems and alerts for loans that show default risk indicators.

4. **Geo-Targeted Marketing & Investment**  
   Allocate more resources to states with high-performing loans and better repayment trends.

---

## How to Use

1. Open the `.pbix` file using **Power BI Desktop**.
2. Interact with slicers and filters such as:
   - State
   - Loan Grade
   - Loan Purpose
   - Loan Term
   - Good vs Bad Loan
3. Use the dashboard to explore trends, patterns, and KPIs effectively.

---

