-- Create the Contacts table
CREATE TABLE Contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Create the Categories table
CREATE TABLE Categories (
    category_id VARCHAR(100) PRIMARY KEY,  -- Keep as VARCHAR for string IDs
    category VARCHAR(100) NOT NULL
);

-- Create the Subcategories table
CREATE TABLE Subcategories (
    subcategory_id VARCHAR(100) PRIMARY KEY,  -- Keep as VARCHAR for string IDs
    subcategory VARCHAR(100) NOT NULL
);

-- Create the Crowdfunding table
CREATE TABLE Crowdfunding (
    cf_id SERIAL PRIMARY KEY,
    contact_id INT REFERENCES Contacts(contact_id) ON DELETE CASCADE,
    company_name VARCHAR(100) NOT NULL,
    description TEXT,
    goal DECIMAL(10, 2) NOT NULL,
    pledged DECIMAL(10, 2) NOT NULL,
    outcome VARCHAR(50),
    backers_count INT,
    country VARCHAR(50),
    currency VARCHAR(10),
    launch_date DATE,
    end_date DATE,
    category_id VARCHAR(100) REFERENCES Categories(category_id) ON DELETE SET NULL,  -- Keep as VARCHAR
    subcategory_id VARCHAR(100) REFERENCES Subcategories(subcategory_id) ON DELETE SET NULL  -- Keep as VARCHAR
);

--Import CSV using pgAdmin features

--Verify Data Upload
SELECT * FROM Contacts LIMIT 100;
SELECT * FROM Categories LIMIT 100;
SELECT * FROM Subcategories LIMIT 100;
SELECT * FROM Crowdfunding LIMIT 100;