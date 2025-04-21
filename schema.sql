CREATE TABLE bank_loan_data (
    id INT PRIMARY KEY,
    address_state VARCHAR(50),
    application_type VARCHAR(50),
    emp_length VARCHAR(50),
    emp_title VARCHAR(100),  -- allows NULLs by default
    grade VARCHAR(50),
    home_ownership VARCHAR(50),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_status VARCHAR(50),
    next_payment_date DATE,
    member_id INT,
    purpose VARCHAR(50),
    sub_grade VARCHAR(50),
    term VARCHAR(50),
    verification_status VARCHAR(50),
    annual_income FLOAT,
    dti FLOAT,  -- Debt-to-Income ratio
    installment FLOAT,
    int_rate FLOAT,  -- Interest rate
    loan_amount INT,
    total_acc INT,   -- Total number of credit accounts
    total_payment FLOAT
);
