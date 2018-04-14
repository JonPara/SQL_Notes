CREATE DATABASE Second_International_Bank;

USE Second_International_Bank;

CREATE TABLE Customers(
	ID INT(50) AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Loan DECIMAL(20,2),
    Checking DECIMAL(20,2),
    Savings DECIMAL(20,2),
    PRIMARY KEY(ID)
  );
  
INSERT INTO Customers(FirstName,LastName,Loan,Checking,Savings)
VALUES("Jacob","Deming",2000.00,1000.00,23424.50);

INSERT INTO Customers(FirstName,LastName,Loan,Checking,Savings)
VALUES("Rob","Someone",2000.00,1000.00,45895.50);

INSERT INTO Customers(FirstName,LastName,Loan,Checking,Savings)
VALUES("Shannon","Waffles",2000.00,1000.00,58434.50);

UPDATE Customers SET LastName = "Name" WHERE Loan > 30000.00;

TRUNCATE Customers;

SELECT file_id,genus,country FROM birdsong
WHERE country = "United Kingdom"
ORDER BY country DESC, genus ASC;

SELECT country, count(*) FROM birdsong
GROUP BY country
ORDER BY country DESC, genus ASC;

SELECT * FROM birdsong;

SELECT country, count(*) FROM birdsong
GROUP BY country;
HAVING COUNT(country) > 10;

SELECT country, species, COUNT(species) FROM birdsong
GROUP BY country;

SELECT players.player, players.height, players.weight, players.collage, players.born, seasons_stats.pos, seasons_stats.tm
FROM players
INNER JOIN seasons_stats.player;

SELECT p.player_id FROM players AS p;


SELECT * FROM actor, address
GROUP BY address

