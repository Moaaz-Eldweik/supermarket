CREATE TABLE manger(
   ` id` integer(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cust-name varchar(15) NOT NULL,
    cust-first name varchar(15) NOT NULL,
    cust-last name varchar(15) NOT NULL,
    salary float(7) NOT NULL,
    created at datetime DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE employee(
    id integer(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    salary integer(5) NOT NULL,
   ` name` varchar(10) ,
    firstname varchar(15) NOT NULL,
    lastname varchar(15) NOT NULL,
    address varchar(25) ,
   ` created at` datetime DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE supplier (
    id integer(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    address varchar(20),
    phone varchar(15) NOT NULL,
    name varchar(10) NOT NULL,
   product-id integer(11) unsigned,
    mang-id integer(11) unsigned,
    created at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(product-id) REFERENCES product(id) ON UPDATE CASCADE ON DELETE CASCADE,
     FOREIGN KEY(mang-id) REFERENCES manger(id) ON UPDATE CASCADE ON DELETE CASCADE
)

INSERT INTO customer(name,email,` phone`) VALUES (' mohamed','mohamed@com',' 01142139320'),
( 'mmmmm','mmmmm@com', '01142139990'),(' moaz','moaz@com', '01142166620'),( 'ali','ali@com', '01142675320');

INSERT INTO employee (salary,` name`,firstname,lastname,address) VALUES(10000,'mohamed ahmed','mohamed','ahmed','cairo egpt'),
(10000,'ali ahmed','ali','ahmed','alex egpt'),(10000,'monir ahmed','monir','ahmed','giza egpt'),(10000,'fouad ahmed','fouad','ahmed','cairo egpt'),(10000,'mariam mohamed','mariam','mohamed','cairo egpt')

INSERT INTO manger(mang-name,mang-first name,mang-last name,salary) VALUES
('mohamed ahmed','mohamed','ahmed',10000),('ali ahmed','ali','ahmed',10000),('monir ahmed','monir','ahmed',10000),('mariam mohamed','mariam','mohamed',10000);

INSERT INTO orders(id,orders date) VALUES(777777,12/12/2024),
(55577,12/9/2024),(4447777,12/10/2024),(55447777,12/11/2024),(755577,12/8/2024);

INSERT INTO product(id,price,name,qantity) VALUES(l9933,999,'tomato',5),(l9933,999,'milk',5),(l3933,499,'oil',5),(l34233,999,'veg',5),(l4533,899,'botata',4);

