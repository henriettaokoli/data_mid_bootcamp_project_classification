CREATE DATABASE credit_card_classification;
USE credit_card_classification;
CREATE TABLE credit_card_data (
    customer_number INT PRIMARY KEY,
    offer_accepted VARCHAR(10),
    reward VARCHAR(20),
    mailer_type VARCHAR(20),
    income_level VARCHAR(20),
    bank_account_open VARCHAR(20),
    overdraft_protection VARCHAR(20),
    credit_rating VARCHAR(20),
    credit_card_held INT,
    owns_home INT,
    household_size INT,
    own_your_home VARCHAR(20),
    average_balance DECIMAL(10,2),
    q1_balance INT,
    q2_balance INT,
    q3_balance INT,
    q4_balance INT
    
);

SELECT * FROM credit_card_data LIMIT 10;
ALTER TABLE credit_card_data DROP COLUMN q4_balance;
SELECT * FROM credit_card_data LIMIT 10;
SELECT COUNT(*) FROM credit_card_data;
-- Unique values in Offer_accepted
SELECT DISTINCT offer_accepted FROM credit_card_data;

-- Unique values in Reward
SELECT DISTINCT reward FROM credit_card_data;

-- Unique values in Mailer_type
SELECT DISTINCT mailer_type FROM credit_card_data;

-- Unique values in credit_cards_held
SELECT DISTINCT credit_cards_held FROM credit_card_data;

-- Unique values in household_size
SELECT DISTINCT household_size FROM credit_card_data;
SELECT customer_number
FROM credit_card_data
ORDER BY average_balance DESC
LIMIT 10;
SELECT AVG(average_balance) AS average_balance_all_customers
FROM credit_card_data;
SELECT income_level, AVG(average_balance) AS avg_balance
FROM credit_card_data
GROUP BY income_level;
SELECT number_of_bank_accounts_open, AVG(average_balance) AS avg_balance
FROM credit_card_data
GROUP BY number_of_bank_accounts_open;
SELECT credit_rating, AVG(credit_cards_held) AS avg_credit_cards_held
FROM credit_card_data
GROUP BY credit_rating;
SELECT credit_cards_held, AVG(number_of_bank_accounts_open) AS avg_bank_accounts
FROM credit_card_data
GROUP BY credit_cards_held
ORDER BY credit_cards_held;
SELECT *
FROM credit_card_data
WHERE credit_rating IN ('Medium', 'High')
AND credit_cards_held <= 2
AND owns_home = 'Yes'
AND household_size >= 3;
SELECT customer_number
FROM credit_card_data
WHERE average_balance < (SELECT AVG(average_balance) FROM credit_card_data);
CREATE VIEW low_balance_customers AS
SELECT customer_number
FROM credit_card_data
WHERE average_balance < (SELECT AVG(average_balance) FROM credit_card_data);
SELECT offer_accepted, COUNT(*) AS count
FROM credit_card_data
GROUP BY offer_accepted;
SELECT credit_rating, AVG(average_balance) AS avg_balance
FROM credit_card_data
WHERE credit_rating IN ('High', 'Low')
GROUP BY credit_rating;
SELECT mailer_type, COUNT(*) AS num_customers
FROM credit_card_data
GROUP BY mailer_type;
SELECT *
FROM credit_card_data
ORDER BY q1_balance
LIMIT 1 OFFSET 10;
