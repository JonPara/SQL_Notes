USE mysql_course;
CREATE TABLE customers(
		id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        email VARCHAR(100)
        );

INSERT INTO customers(first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
	   ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gamil.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
CREATE TABLE orders(
		id INT AUTO_INCREMENT PRIMARY KEY,
        order_date DATE,
        amount DECIMAL(10,2),
        customer_id INT, 
        FOREIGN KEY(customer_id) REFERENCES customers(id)
        );
        
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
	   ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
DROP TABLE customers, orders;

SELECT * FROM customers;    
SELECT * FROM orders;


SELECT * FROM customers
WHERE last_name = 'George';

SELECT * FROM orders 
WHERE customer_id = 1;


SELECT * FROM customers
WHERE last_name in	
	(SELECT * FROM orders
    WHERE customer_id = 1);

-- INNER JOIN
SELECT first_name, last_name, order_date, amount FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;

-- LEFT JOINS
SELECT first_name, last_name, order_date, amount
FROM customers cus
LEFT JOIN orders ord
	ON cus.id = ord.customer_id
    GROUP BY first_name, last_name
	ORDER BY amount DESC;

CREATE TABLE students(
			student_id INT AUTO_INCREMENT PRIMARY KEY,
            first_name VARCHAR(100));
            
CREATE TABLE papers(
				title VARCHAR(100),
                grade INT,
                student_id INT);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT first_name, title, grade FROM students st
INNER JOIN papers pa ON st.student_id = pa.student_id 
ORDER BY grade DESC;

SELECT * FROM students st
LEFT JOIN papers pa ON st.student_id = pa.student_id;

SELECT first_name, IFNULL(title, 'Missing') as title, IFNULL(grade, 0)as grade,
	CASE
		WHEN AVG(grade) IS NULL THEN 'Failing'
        WHEN AVG(grade) >= 75 THEN 'Passing'
        ELSE 'Failing'
	END AS passing_status
FROM students st
LEFT JOIN papers pa ON st.student_id = pa.student_id
GROUP BY first_name
ORDER BY grade DESC;

SELECT first_name, IFNULL(AVG(grade), 0)as grade FROM students st
LEFT JOIN papers pa ON st.student_id = pa.student_id
GROUP BY first_name
ORDER BY grade DESC;














    