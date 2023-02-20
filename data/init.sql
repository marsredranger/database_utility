CREATE DATABASE IF NOT EXISTS DEV_DB;
USE DEV_DB;

CREATE TABLE IF NOT EXISTS customers(
  cust_id INT NOT NULL AUTO_INCREMENT,
  cust_first_name VARCHAR(256) NOT NULL,
  cust_last_name VARCHAR(256) NOT NULL,
  PRIMARY KEY ( cust_id )
);

CREATE TABLE IF NOT EXISTS products(
	prdct_id INT NOT NULL AUTO_INCREMENT,
	price DECIMAL(20,2) NOT NULL,
  prdct_name VARCHAR(256) NOT NULL,
	PRIMARY KEY ( prdct_id )
 );
  
CREATE TABLE IF NOT EXISTS transactions(
  trans_id INT NOT NULL AUTO_INCREMENT,
  amt DECIMAL(20,2) NOT NULL,
  cust_id INT NOT NULL,
  prdct_id INT NOT NULL,
  PRIMARY KEY (trans_id),
  FOREIGN KEY ( cust_id ) REFERENCES customers(cust_id),
  FOREIGN KEY ( prdct_id ) REFERENCES products(prdct_id)
);

INSERT INTO customers (cust_first_name, cust_last_name) VALUES ('JOHN', 'SMITH');
INSERT INTO customers (cust_first_name, cust_last_name) VALUES ('LARRY', 'JONES');
INSERT INTO customers (cust_first_name, cust_last_name) VALUES ('ELIZABETH', 'RICHARDSON');


INSERT INTO products (price, prdct_name) VALUES (9.99, 'CUP');
INSERT INTO products (price, prdct_name) VALUES (17.49, 'HAMMER');
INSERT INTO products (price, prdct_name) VALUES (49.99, 'ADOBE PLANT POT');
INSERT INTO products (price, prdct_name) VALUES (18.25, 'TWINE');
