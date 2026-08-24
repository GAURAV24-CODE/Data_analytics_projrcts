INSERT INTO customers
(first_name, last_name, email, city, state, country, signup_date)
SELECT
    'Customer' || gs,
    'User' || gs,
    'customer' || gs || '@example.com',

    (ARRAY[
        'Mumbai',
        'Pune',
        'Nashik',
        'Jalgaon',
        'Nagpur',
        'Delhi',
        'Bangalore',
        'Hyderabad',
        'Chennai',
        'Ahmedabad',
        'Kolkata',
        'Jaipur'
    ])[floor(random() * 12 + 1)::int],

    (ARRAY[
        'Maharashtra',
        'Delhi',
        'Karnataka',
        'Telangana',
        'Tamil Nadu',
        'Gujarat',
        'West Bengal',
        'Rajasthan'
    ])[floor(random() * 8 + 1)::int],

    'India',

    DATE '2023-01-01'
    + floor(random() * 1095)::int

FROM generate_series(1, 500) AS gs;



SELECT COUNT(*) AS total_customers
FROM customers;


SELECT *
FROM customers
ORDER BY customer_id
LIMIT 10;