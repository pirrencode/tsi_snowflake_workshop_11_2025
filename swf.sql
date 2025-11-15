-- Create the STUDENT_DPT table
CREATE TABLE STUDENT_DPT (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE,
    enrollment_date DATE NOT NULL,
    department VARCHAR(50) NOT NULL,
    major VARCHAR(100),
    gpa DECIMAL(3, 2),
    credits_completed INT DEFAULT 0,
    academic_status VARCHAR(20),
    phone_number VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(2),
    zip_code VARCHAR(10),
    country VARCHAR(50) DEFAULT 'USA',
    is_international BOOLEAN DEFAULT FALSE,
    graduation_year INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- ============================================
-- INSERT SYNTHETIC DATA
-- ============================================

INSERT INTO STUDENT_DPT (
    student_id, first_name, last_name, email, date_of_birth, 
    enrollment_date, department, major, gpa, credits_completed, 
    academic_status, phone_number, address, city, state, 
    zip_code, country, is_international, graduation_year
) VALUES
    -- Computer Science Department
    (1001, 'Emma', 'Johnson', 'emma.johnson@university.edu', '2003-05-15', '2021-09-01', 
     'Computer Science', 'Software Engineering', 3.85, 90, 'Good Standing', 
     '555-0101', '123 Campus Dr', 'Boston', 'MA', '02115', 'USA', FALSE, 2025),
    
    (1002, 'Liam', 'Smith', 'liam.smith@university.edu', '2002-11-22', '2020-09-01', 
     'Computer Science', 'Artificial Intelligence', 3.92, 105, 'Good Standing', 
     '555-0102', '456 College Ave', 'Boston', 'MA', '02116', 'USA', FALSE, 2024),
    
    (1003, 'Sophia', 'Chen', 'sophia.chen@university.edu', '2004-03-08', '2022-09-01', 
     'Computer Science', 'Data Science', 3.78, 60, 'Good Standing', 
     '555-0103', '789 University Blvd', 'Cambridge', 'MA', '02138', 'USA', FALSE, 2026),
    
    (1004, 'Noah', 'Patel', 'noah.patel@university.edu', '2003-07-30', '2021-09-01', 
     'Computer Science', 'Cybersecurity', 3.65, 88, 'Good Standing', 
     '555-0104', '321 Student St', 'Boston', 'MA', '02115', 'USA', FALSE, 2025),
    
    -- Business Administration Department
    (2001, 'Olivia', 'Williams', 'olivia.williams@university.edu', '2003-01-12', '2021-09-01', 
     'Business Administration', 'Finance', 3.71, 92, 'Good Standing', 
     '555-0201', '654 Market St', 'Boston', 'MA', '02117', 'USA', FALSE, 2025),
    
    (2002, 'Ethan', 'Brown', 'ethan.brown@university.edu', '2002-09-25', '2020-09-01', 
     'Business Administration', 'Marketing', 3.58, 110, 'Good Standing', 
     '555-0202', '987 Commerce Rd', 'Cambridge', 'MA', '02139', 'USA', FALSE, 2024),
    
    (2003, 'Ava', 'Garcia', 'ava.garcia@university.edu', '2004-06-18', '2022-09-01', 
     'Business Administration', 'Entrepreneurship', 3.88, 58, 'Good Standing', 
     '555-0203', '147 Business Ln', 'Boston', 'MA', '02118', 'USA', FALSE, 2026),
    
    -- Engineering Department
    (3001, 'Mason', 'Rodriguez', 'mason.rodriguez@university.edu', '2003-04-05', '2021-09-01', 
     'Engineering', 'Mechanical Engineering', 3.45, 85, 'Good Standing', 
     '555-0301', '258 Engineering Way', 'Boston', 'MA', '02115', 'USA', FALSE, 2025),
    
    (3002, 'Isabella', 'Martinez', 'isabella.martinez@university.edu', '2002-12-14', '2020-09-01', 
     'Engineering', 'Electrical Engineering', 3.95, 112, 'Dean''s List', 
     '555-0302', '369 Tech Park', 'Cambridge', 'MA', '02140', 'USA', FALSE, 2024),
    
    (3003, 'James', 'Lee', 'james.lee@university.edu', '2004-02-28', '2022-09-01', 
     'Engineering', 'Civil Engineering', 3.62, 62, 'Good Standing', 
     '555-0303', '741 Innovation Dr', 'Boston', 'MA', '02119', 'USA', FALSE, 2026),
    
    -- Biology Department
    (4001, 'Charlotte', 'Anderson', 'charlotte.anderson@university.edu', '2003-08-20', '2021-09-01', 
     'Biology', 'Molecular Biology', 3.82, 94, 'Good Standing', 
     '555-0401', '852 Science Cir', 'Boston', 'MA', '02115', 'USA', FALSE, 2025),
    
    (4002, 'Benjamin', 'Taylor', 'benjamin.taylor@university.edu', '2002-10-03', '2020-09-01', 
     'Biology', 'Biotechnology', 3.75, 108, 'Good Standing', 
     '555-0402', '963 Research Pkwy', 'Cambridge', 'MA', '02141', 'USA', FALSE, 2024),
    
    -- International Students
    (5001, 'Yuki', 'Tanaka', 'yuki.tanaka@university.edu', '2003-03-17', '2021-09-01', 
     'Computer Science', 'Software Engineering', 3.90, 91, 'Good Standing', 
     '555-0501', '159 Global Hall', 'Boston', 'MA', '02120', 'Japan', TRUE, 2025),
    
    (5002, 'Ahmed', 'Hassan', 'ahmed.hassan@university.edu', '2004-05-22', '2022-09-01', 
     'Engineering', 'Computer Engineering', 3.68, 64, 'Good Standing', 
     '555-0502', '357 International Ct', 'Cambridge', 'MA', '02142', 'Egypt', TRUE, 2026),
    
    (5003, 'Maria', 'Silva', 'maria.silva@university.edu', '2002-07-09', '2020-09-01', 
     'Business Administration', 'International Business', 3.80, 115, 'Good Standing', 
     '555-0503', '486 World Plaza', 'Boston', 'MA', '02121', 'Brazil', TRUE, 2024),
    
    -- Students with Different Academic Statuses
    (6001, 'Lucas', 'White', 'lucas.white@university.edu', '2003-09-11', '2021-09-01', 
     'Computer Science', 'Computer Science', 2.95, 78, 'Academic Probation', 
     '555-0601', '753 Campus Rd', 'Boston', 'MA', '02122', 'USA', FALSE, 2025),
    
    (6002, 'Mia', 'Thompson', 'mia.thompson@university.edu', '2004-11-30', '2022-09-01', 
     'Biology', 'Pre-Med', 3.98, 66, 'Dean''s List', 
     '555-0602', '864 Honor Dr', 'Cambridge', 'MA', '02143', 'USA', FALSE, 2026),
    
    (6003, 'Alexander', 'Moore', 'alexander.moore@university.edu', '2003-02-14', '2021-09-01', 
     'Engineering', 'Aerospace Engineering', 3.55, 89, 'Good Standing', 
     '555-0603', '975 Flight Path', 'Boston', 'MA', '02123', 'USA', FALSE, 2025),
    
    (6004, 'Harper', 'Jackson', 'harper.jackson@university.edu', '2002-04-26', '2020-09-01', 
     'Business Administration', 'Accounting', 3.72, 118, 'Good Standing', 
     '555-0604', '135 Finance St', 'Cambridge', 'MA', '02144', 'USA', FALSE, 2024),
    
    (6005, 'Elijah', 'Martin', 'elijah.martin@university.edu', '2004-08-07', '2022-09-01', 
     'Computer Science', 'Game Development', 3.50, 55, 'Good Standing', 
     '555-0605', '246 Gaming Ave', 'Boston', 'MA', '02124', 'USA', FALSE, 2026);
