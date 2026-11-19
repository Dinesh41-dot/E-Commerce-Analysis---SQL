create schema EcommerceAnalytics;
use EcommerceAnalytics;

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    RegistrationDate DATE
);

CREATE TABLE Addresses
(
    AddressID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    HouseNo VARCHAR(20),
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Pincode VARCHAR(10),

    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
);

CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50),
    ParentCategory VARCHAR(50)
);

CREATE TABLE Suppliers
(
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);


CREATE TABLE Products
(
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    CategoryID INT,
    SupplierID INT,
    Brand VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2),
    LaunchDate DATE,
    Rating DECIMAL(2,1),

    FOREIGN KEY(CategoryID)    REFERENCES Categories(CategoryID),
    FOREIGN KEY(SupplierID)    REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Inventory
(
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    Warehouse VARCHAR(50),
    StockAvailable INT,
    ReorderLevel INT,
    LastUpdated DATE,

    FOREIGN KEY(ProductID)    REFERENCES Products(ProductID)
);

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(30),
    OrderTotal DECIMAL(10,2),
    CouponCode VARCHAR(20),
    FOREIGN KEY(CustomerID)    REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems
(
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(10,2),
    GST DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY(OrderID)   REFERENCES Orders(OrderID),
    FOREIGN KEY(ProductID)    REFERENCES Products(ProductID) );

CREATE TABLE Payments
(
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentMode VARCHAR(30),
    PaymentDate DATE,
    PaymentStatus VARCHAR(30),
    TransactionRef VARCHAR(50),

    FOREIGN KEY(OrderID)    REFERENCES Orders(OrderID)
);

CREATE TABLE Shipments
(
    ShipmentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    Courier VARCHAR(50),
    TrackingNumber VARCHAR(50),
    ShipmentDate DATE,
    DeliveryDate DATE,
    DeliveryStatus VARCHAR(30),

    FOREIGN KEY(OrderID)     REFERENCES Orders(OrderID)
);

CREATE TABLE ProductReviews
(
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    Rating INT,
    ReviewText VARCHAR(500),
    ReviewDate DATE,
    FOREIGN KEY(CustomerID)    REFERENCES Customers(CustomerID),
    FOREIGN KEY(ProductID)    REFERENCES Products(ProductID) );

CREATE TABLE Discounts
(
    DiscountID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    DiscountPercent DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,

    FOREIGN KEY(ProductID)    REFERENCES Products(ProductID)
);

		-------------------------------------------------------
        
INSERT INTO Categories
(CategoryName, ParentCategory)
VALUES
('Mobiles','Electronics'),
('Laptops','Electronics'),
('Accessories','Electronics'),
('Mens Fashion','Fashion'),
('Womens Fashion','Fashion'),
('Books','Education'),
('Home Appliances','Home'),
('Furniture','Home'),
('Groceries','Daily Needs'),
('Sports','Fitness');

INSERT INTO Suppliers
(SupplierName, City, State, Country, Phone, Email)
VALUES('TechWorld India','Bangalore','Karnataka','India','9876500011','techworld@gmail.com'),
('Digital Hub','Hyderabad','Telangana','India','9876500012','digitalhub@gmail.com'),
('Smart Electronics','Delhi','Delhi','India','9876500013','smartelectronics@gmail.com'),
('Fashion Planet','Mumbai','Maharashtra','India','9876500014','fashionplanet@gmail.com'),
('Style Mart','Ahmedabad','Gujarat','India','9876500015','stylemart@gmail.com'),
('Book House','Pune','Maharashtra','India','9876500016','bookhouse@gmail.com'),
('Home Comforts','Chennai','Tamil Nadu','India','9876500017','homecomforts@gmail.com'),
('Furniture World','Surat','Gujarat','India','9876500018','furnitureworld@gmail.com'),
('Fresh Basket','Vijayawada','Andhra Pradesh','India','9876500019','freshbasket@gmail.com'),
('Fit Zone','Kochi','Kerala','India','9876500020','fitzone@gmail.com');


INSERT INTO Products
(ProductName,CategoryID,SupplierID,Brand,CostPrice,SellingPrice,LaunchDate,Rating)
VALUES('iPhone 15',1,1,'Apple',60000,69999,'2025-01-10',4.8),
('Samsung Galaxy S25',1,2,'Samsung',45000,54999,'2025-02-15',4.7),
('OnePlus 13',1,2,'OnePlus',35000,42999,'2025-03-20',4.6),
('Dell Inspiron Laptop',2,1,'Dell',55000,65000,'2025-01-12',4.5),
('HP Pavilion Laptop',2,3,'HP',50000,62000,'2025-02-10',4.4),
('Wireless Mouse',3,3,'Logitech',700,1200,'2025-01-05',4.3),
('Bluetooth Headphones',3,2,'Sony',4000,6500,'2025-03-01',4.6),
('Mens Casual Shirt',4,4,'Peter England',900,1500,'2025-02-01',4.2),
('Mens Jeans',4,5,'Levis',1500,2500,'2025-01-20',4.5),
('Womens Kurti',5,5,'Biba',800,1400,'2025-02-14',4.4),
('Womens Handbag',5,4,'Lavie',1200,2200,'2025-03-05',4.3),
('Python Programming Book',6,6,'Wiley',300,600,'2025-01-15',4.7),
('Data Science Book',6,6,'McGraw Hill',400,800,'2025-02-18',4.6),
('Washing Machine',7,7,'LG',25000,35000,'2025-01-25',4.5),
('Microwave Oven',7,7,'Samsung',8000,12000,'2025-03-10',4.4),
('Office Chair',8,8,'Godrej',5000,8000,'2025-02-20',4.5),
('Study Table',8,8,'Nilkamal',4000,6500,'2025-03-12',4.2),
('Rice 25 Kg',9,9,'India Gate',1200,1500,'2025-01-30',4.6),
('Protein Powder',10,10,'MuscleBlaze',1500,2200,'2025-02-28',4.5),
('Yoga Mat',10,10,'Decathlon',500,900,'2025-03-15',4.4);

INSERT INTO Inventory
(ProductID,Warehouse,StockAvailable,ReorderLevel,LastUpdated)
VALUES (1,'Bangalore Warehouse',50,10,'2026-07-01'),
(2,'Hyderabad Warehouse',80,15,'2026-07-01'),
(3,'Delhi Warehouse',70,10,'2026-07-01'),
(4,'Bangalore Warehouse',40,5,'2026-07-01'),
(5,'Delhi Warehouse',60,10,'2026-07-01'),
(6,'Hyderabad Warehouse',150,20,'2026-07-01'),
(7,'Mumbai Warehouse',100,15,'2026-07-01'),
(8,'Ahmedabad Warehouse',120,20,'2026-07-01'),
(9,'Mumbai Warehouse',90,15,'2026-07-01'),
(10,'Ahmedabad Warehouse',100,20,'2026-07-01'),
(11,'Mumbai Warehouse',75,10,'2026-07-01'),
(12,'Pune Warehouse',200,30,'2026-07-01'),
(13,'Pune Warehouse',150,20,'2026-07-01'),
(14,'Chennai Warehouse',45,5,'2026-07-01'),
(15,'Chennai Warehouse',70,10,'2026-07-01'),
(16,'Surat Warehouse',60,10,'2026-07-01'),
(17,'Surat Warehouse',80,15,'2026-07-01'),
(18,'Vijayawada Warehouse',300,50,'2026-07-01'),
(19,'Kochi Warehouse',100,20,'2026-07-01'),
(20,'Kochi Warehouse',120,20,'2026-07-01');

				# Master Tables
SELECT * FROM Categories;
SELECT * FROM Suppliers;
SELECT * FROM Products;
SELECT * FROM Inventory;

		--------------------------------------------
        
INSERT INTO Customers
(FirstName, LastName, Gender, DOB, Email, Phone, RegistrationDate)
VALUES 
('Aarav','Patel','Male','1998-05-12','aarav.patel@gmail.com','9000000001','2025-01-10'),
('Priya','Sharma','Female','1996-08-20','priya.sharma@gmail.com','9000000002','2025-01-15'),
('Rahul','Mehta','Male','1995-03-25','rahul.mehta@gmail.com','9000000003','2025-02-05'),
('Sneha','Reddy','Female','1999-11-10','sneha.reddy@gmail.com','9000000004','2025-02-12'),
('Vikram','Singh','Male','1994-07-18','vikram.singh@gmail.com','9000000005','2025-02-20'),
('Neha','Joshi','Female','1997-01-22','neha.joshi@gmail.com','9000000006','2025-03-01'),
('Harsh','Shah','Male','1996-09-15','harsh.shah@gmail.com','9000000007','2025-03-10'),
('Kavya','Nair','Female','1998-12-05','kavya.nair@gmail.com','9000000008','2025-03-15'),
('Rohan','Gupta','Male','1995-06-30','rohan.gupta@gmail.com','9000000009','2025-03-20'),
('Ananya','Iyer','Female','2000-04-14','ananya.iyer@gmail.com','9000000010','2025-03-25'),
('Manish','Verma','Male','1993-02-11','manish.verma@gmail.com','9000000011','2025-04-01'),
('Pooja','Desai','Female','1997-07-19','pooja.desai@gmail.com','9000000012','2025-04-05'),
('Karan','Malhotra','Male','1994-10-09','karan.malhotra@gmail.com','9000000013','2025-04-10'),
('Divya','Rao','Female','1999-03-16','divya.rao@gmail.com','9000000014','2025-04-15'),
('Siddharth','Kulkarni','Male','1996-11-21','siddharth.k@gmail.com','9000000015','2025-04-20'),
('Meera','Kapoor','Female','1998-06-08','meera.kapoor@gmail.com','9000000016','2025-05-01'),
('Arjun','Mishra','Male','1995-12-25','arjun.mishra@gmail.com','9000000017','2025-05-05'),
('Isha','Patil','Female','2001-02-18','isha.patil@gmail.com','9000000018','2025-05-10'),
('Nitin','Yadav','Male','1993-09-28','nitin.yadav@gmail.com','9000000019','2025-05-15'),
('Riya','Choudhary','Female','1999-05-30','riya.choudhary@gmail.com','9000000020','2025-05-20');

INSERT INTO Addresses(CustomerID,HouseNo,Street,City,State,Country,Pincode)
VALUES(1,'12A','MG Road','Ahmedabad','Gujarat','India','380001'),
(2,'45B','Park Street','Kolkata','West Bengal','India','700016'),
(3,'21C','FC Road','Pune','Maharashtra','India','411005'),
(4,'33D','Banjara Hills','Hyderabad','Telangana','India','500034'),
(5,'18A','Connaught Place','Delhi','Delhi','India','110001'),
(6,'25B','Anna Nagar','Chennai','Tamil Nadu','India','600040'),
(7,'19C','CG Road','Ahmedabad','Gujarat','India','380009'),
(8,'55D','MG Road','Kochi','Kerala','India','682016'),
(9,'10A','Hitech City','Hyderabad','Telangana','India','500081'),
(10,'77B','Indiranagar','Bangalore','Karnataka','India','560038'),
(11,'90C','Vashi','Mumbai','Maharashtra','India','400703'),
(12,'22D','Navrangpura','Ahmedabad','Gujarat','India','380015'),
(13,'66A','Sector 18','Noida','Uttar Pradesh','India','201301'),
(14,'31B','Madhapur','Hyderabad','Telangana','India','500081'),
(15,'44C','Shivaji Nagar','Pune','Maharashtra','India','411016'),
(16,'28D','Andheri West','Mumbai','Maharashtra','India','400053'),
(17,'15A','Vijay Nagar','Indore','Madhya Pradesh','India','452010'),
(18,'62B','Kothrud','Pune','Maharashtra','India','411038'),
(19,'80C','Gomti Nagar','Lucknow','Uttar Pradesh','India','226010'),
(20,'11D','Salt Lake','Kolkata','West Bengal','India','700091');

SELECT * FROM Customers;

SELECT customerID,CONCAT(FirstName,' ',LastName) AS CustomerName,
	Email, RegistrationDate FROM Customers;

SELECT c.FirstName, c.LastName, a.City, a.State 
	FROM Customers c JOIN Addresses a ON c.CustomerID=a.CustomerID;

		-------------------------------------------------------
        
INSERT INTO Orders
(CustomerID, OrderDate, OrderStatus, OrderTotal, CouponCode)
VALUES(1,'2026-01-05','Delivered',72000,'NEW10'),
(2,'2026-01-08','Delivered',55000,NULL),
(3,'2026-01-12','Shipped',43000,'SAVE5'),
(4,'2026-01-15','Delivered',15000,NULL),
(5,'2026-01-18','Cancelled',65000,'WELCOME'),
(6,'2026-01-20','Delivered',2500,NULL),
(7,'2026-01-25','Delivered',8000,'FEST10'),
(8,'2026-02-02','Delivered',35000,NULL),
(9,'2026-02-05','Pending',12000,NULL),
(10,'2026-02-08','Delivered',2200,'NEWUSER'),
(11,'2026-02-12','Delivered',6000,NULL),
(12,'2026-02-15','Shipped',9000,'BOOK10'),
(13,'2026-02-18','Delivered',70000,NULL),
(14,'2026-02-20','Returned',1400,NULL),
(15,'2026-02-25','Delivered',6500,'SALE20'),
(16,'2026-03-01','Delivered',35000,NULL),
(17,'2026-03-05','Cancelled',2200,NULL),
(18,'2026-03-10','Delivered',1500,NULL),
(19,'2026-03-15','Shipped',22000,'FIT10'),
(20,'2026-03-20','Delivered',900,NULL);

SELECT * FROM Orders;

SELECT SUM(OrderTotal) AS TotalRevenue FROM Orders 
	WHERE OrderStatus='Delivered';
    
SELECT OrderStatus, COUNT(*) AS TotalOrders
	FROM Orders GROUP BY OrderStatus;

SELECT MONTH(OrderDate) AS Month, SUM(OrderTotal) AS Revenue
	FROM Orders WHERE OrderStatus='Delivered'
	GROUP BY MONTH(OrderDate) ORDER BY Month;
    
select concat(c.firstname,' ',c.lastname) as customer, sum(o.ordertotal) as totalspent 
	from customers c join orders o on c.customerID=o.customerID 
	where o.orderstatus='delivered' group by c.customerID order by totalspent desc;
		
			-----------------------------------------------------
            
INSERT INTO OrderItems
(OrderID, ProductID, Quantity, UnitPrice, Discount, GST, TotalPrice)
VALUES 
(1,1,1,69999,5000,11699,76698),
(1,7,1,6500,500,1080,7080),
(2,2,1,54999,3000,9359,61358),
(3,3,1,42999,2000,7379,48378),
(4,8,2,1500,200,468,3268),
(4,9,1,2500,300,396,2596),
(5,4,1,65000,5000,10800,70800),
(6,6,2,1200,100,396,2696),
(7,16,1,8000,500,1350,8850),
(8,14,1,35000,2000,5940,38940),
(9,15,1,12000,1000,1980,12980),
(10,11,1,2200,200,360,2360),
(11,12,2,600,100,180,1280),
(12,13,1,800,100,126,826),
(13,1,1,69999,4000,11200,77199),
(14,10,1,1400,100,234,1534),
(15,17,1,6500,500,1080,7080),
(16,14,1,35000,2000,5940,38940),
(17,20,2,900,100,288,1988),
(18,18,1,1500,100,252,1652),
(19,19,2,2200,200,720,4920),
(20,20,1,900,100,144,944); 
SELECT *FROM OrderItems;

SELECT p.ProductName, SUM(oi.Quantity) AS TotalSold
	FROM OrderItems oi JOIN Products p ON oi.ProductID=p.ProductID 
	GROUP BY p.ProductID ORDER BY TotalSold DESC;
    
SELECT p.ProductName, SUM(oi.TotalPrice) AS Revenue
	FROM OrderItems oi JOIN Products p
    ON oi.ProductID=p.ProductID GROUP BY p.ProductName ORDER BY Revenue DESC;

SELECT c.CategoryName, SUM(oi.TotalPrice) AS CategoryRevenue
	FROM OrderItems oi JOIN Products p ON oi.ProductID=p.ProductID
    JOIN Categories c ON p.CategoryID=c.CategoryID 
    GROUP BY c.CategoryName ORDER BY CategoryRevenue DESC;

SELECT p.ProductName, AVG(oi.UnitPrice) AS AveragePrice
	FROM OrderItems oi JOIN Products p ON oi.ProductID=p.ProductID GROUP BY p.ProductName;

SELECT p.ProductName, SUM(oi.Discount) AS TotalDiscount
	FROM OrderItems oi JOIN Products p ON oi.ProductID=p.ProductID GROUP BY p.ProductName
	ORDER BY TotalDiscount DESC;
    
INSERT INTO Payments
(OrderID, PaymentMode, PaymentDate, PaymentStatus, TransactionRef) VALUES
(1,'Credit Card','2026-01-05','Success','TXN10001'),
(2,'UPI','2026-01-08','Success','TXN10002'),
(3,'Debit Card','2026-01-12','Success','TXN10003'),
(4,'UPI','2026-01-15','Success','TXN10004'),
(5,'Credit Card','2026-01-18','Failed','TXN10005'),
(6,'Cash on Delivery','2026-01-20','Success','TXN10006'),
(7,'Wallet','2026-01-25','Success','TXN10007'),
(8,'UPI','2026-02-02','Success','TXN10008'),
(9,'Credit Card','2026-02-05','Pending','TXN10009'),
(10,'UPI','2026-02-08','Success','TXN10010'),
(11,'Debit Card','2026-02-12','Success','TXN10011'),
(12,'UPI','2026-02-15','Success','TXN10012'),
(13,'Credit Card','2026-02-18','Success','TXN10013'),
(14,'Cash on Delivery','2026-02-20','Success','TXN10014'),
(15,'UPI','2026-02-25','Success','TXN10015'),
(16,'Debit Card','2026-03-01','Success','TXN10016'),
(17,'Credit Card','2026-03-05','Failed','TXN10017'),
(18,'UPI','2026-03-10','Success','TXN10018'),
(19,'Wallet','2026-03-15','Success','TXN10019'),
(20,'Cash on Delivery','2026-03-20','Success','TXN10020');
select *from payments;

select paymentmode,count(*) as totaltransactions from payments 
	group by paymentmode order by totaltransactions desc;
    
select paymentstatus, count(*) as transactions from payments group by paymentstatus;

select p.paymentID, o.orderID, p.paymentmode, p.paymentstatus 
	from payments p join orders o on p.orderID=o.orderID where paymentstatus='failed';

select month(paymentdate) as month, count(*) as transactions from payments 
	where paymentstatus='success' group by month(paymentdate) order by month;
    
select p.paymentmode, sum(o.ordertotal) as revenue from payments p join orders o
	on p.orderID=o.orderID where p.paymentstatus='success' 
		group by p.paymentmode order by revenue desc;
        

INSERT INTO Shipments
(OrderID, Courier, TrackingNumber, ShipmentDate, DeliveryDate, DeliveryStatus)
VALUES
(1,'BlueDart','BD100001','2026-01-06','2026-01-10','Delivered'),
(2,'Delhivery','DL100002','2026-01-09','2026-01-13','Delivered'),
(3,'DTDC','DT100003','2026-01-13',NULL,'In Transit'),
(4,'BlueDart','BD100004','2026-01-16','2026-01-20','Delivered'),
(5,'Delhivery','DL100005','2026-01-19',NULL,'Cancelled'),
(6,'Amazon Logistics','AM100006','2026-01-21','2026-01-23','Delivered'),
(7,'DTDC','DT100007','2026-01-26','2026-01-30','Delivered'),
(8,'BlueDart','BD100008','2026-02-03','2026-02-07','Delivered'),
(9,'Delhivery','DL100009','2026-02-06',NULL,'Pending'),
(10,'Amazon Logistics','AM100010','2026-02-09','2026-02-12','Delivered'),
(11,'BlueDart','BD100011','2026-02-13','2026-02-17','Delivered'),
(12,'DTDC','DT100012','2026-02-16',NULL,'In Transit'),
(13,'Delhivery','DL100013','2026-02-19','2026-02-24','Delivered'),
(14,'Amazon Logistics','AM100014','2026-02-21',NULL,'Returned'),
(15,'BlueDart','BD100015','2026-02-26','2026-03-01','Delivered'),
(16,'Delhivery','DL100016','2026-03-02','2026-03-06','Delivered'),
(17,'DTDC','DT100017','2026-03-06',NULL,'Cancelled'),
(18,'Amazon Logistics','AM100018','2026-03-11','2026-03-13','Delivered'),
(19,'BlueDart','BD100019','2026-03-16','2026-03-21','Delivered'),
(20,'Delhivery','DL100020','2026-03-21','2026-03-24','Delivered');
select  *from shipments;

SELECT Courier, COUNT(*) AS TotalOrders, 
	SUM(CASE WHEN DeliveryStatus='Delivered' 
	THEN 1 ELSE 0 END) 
	AS SuccessfulDeliveries FROM Shipments GROUP BY Courier;

select avg(datediff(deliverydate,shipmentdate)) as avg_delivarydays from shipments
	where deliverystatus='delivered';
    
select orderID, courier, shipmentdate, deliverydate, datediff(deliverydate,shipmentdate)
	as deliverydays from shipments where DATEDIFF(DeliveryDate,ShipmentDate)>4;
    
    
INSERT INTO ProductReviews (CustomerID, ProductID, Rating, ReviewText, ReviewDate)
VALUES
(1,1,5,'Excellent phone with amazing camera quality','2026-01-15'),
(2,2,4,'Good performance but slightly expensive','2026-01-20'),
(3,3,5,'Amazing speed and battery backup','2026-01-25'),
(4,8,4,'Comfortable shirt with good fabric','2026-01-28'),
(5,4,3,'Laptop performance is average','2026-02-02'),
(6,6,5,'Very useful wireless mouse','2026-02-05'),
(7,16,4,'Chair quality is good','2026-02-10'),
(8,14,5,'Washing machine works perfectly','2026-02-15'),
(9,15,4,'Good microwave oven','2026-02-20'),
(10,11,5,'Beautiful handbag design','2026-02-25'),
(11,12,5,'Very helpful programming book','2026-03-01'),
(12,13,4,'Good book for beginners','2026-03-05'),
(13,1,5,'Premium smartphone experience','2026-03-10'),
(14,10,4,'Nice design and quality','2026-03-15'),
(15,17,3,'Table quality can be improved','2026-03-20'),
(16,14,5,'Excellent home appliance','2026-03-25'),
(17,20,4,'Good yoga mat material','2026-04-01'),
(18,19,5,'Best fitness product','2026-04-05'),
(19,18,4,'Good quality rice','2026-04-10'),
(20,7,5,'Sound quality is excellent','2026-04-15');
select *from productreviews;

select p.productname, avg(pr.rating) as avg_rating 
	from productreviews pr join products p on pr.productID=p.productID
    group by p.productname order by avg_rating;
    
select p.ProductName, COUNT(pr.ReviewID) AS Reviews, AVG(pr.Rating) AS Rating
	FROM ProductReviews pr JOIN Products p ON pr.ProductID=p.ProductID
    GROUP BY p.ProductName HAVING COUNT(pr.ReviewID)>=2 ORDER BY Rating DESC;

SELECT CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,
	p.ProductName, pr.Rating,pr.ReviewText 
    FROM ProductReviews pr JOIN Customers c ON pr.CustomerID=c.CustomerID
    JOIN Products p ON pr.ProductID=p.ProductID;
    
SELECT Rating, COUNT(*) AS TotalReviews FROM ProductReviews 
	GROUP BY Rating ORDER BY Rating DESC;

SELECT p.ProductName, AVG(pr.Rating) AS Rating FROM ProductReviews pr
	JOIN Products p ON pr.ProductID=p.ProductID 
    GROUP BY p.ProductName HAVING AVG(pr.Rating)<4;
    
    
INSERT INTO Discounts (ProductID, DiscountPercent, StartDate, EndDate) VALUES
(1,10.00,'2026-01-01','2026-01-15'),(2,15.00,'2026-01-10','2026-01-25'),
(3,5.00,'2026-02-01','2026-02-15'),(4,12.00,'2026-02-10','2026-02-28'),
(5,8.00,'2026-03-01','2026-03-15'),(6,20.00,'2026-03-05','2026-03-20'),
(7,15.00,'2026-03-10','2026-03-25'),(8,10.00,'2026-04-01','2026-04-15'),
(9,25.00,'2026-04-05','2026-04-20'),(10,15.00,'2026-04-10','2026-04-25'),
(11,20.00,'2026-05-01','2026-05-15'),(12,10.00,'2026-05-05','2026-05-20'),
(13,15.00,'2026-05-10','2026-05-25'),(14,12.00,'2026-05-15','2026-05-30'),
(15,18.00,'2026-06-01','2026-06-15'),(16,20.00,'2026-06-05','2026-06-20'),
(17,15.00,'2026-06-10','2026-06-25'),(18,8.00,'2026-06-15','2026-06-30'),
(19,25.00,'2026-06-20','2026-07-05'),(20,30.00,'2026-06-25','2026-07-10');
select *from discounts;

SELECT p.ProductName, d.DiscountPercent, d.StartDate, d.EndDate FROM Discounts d
	JOIN Products p ON d.ProductID=p.ProductID
    WHERE CURRENT_DATE  BETWEEN d.StartDate AND d.EndDate;

SELECT p.ProductName, d.DiscountPercent FROM Discounts d
	JOIN Products p ON d.ProductID=p.ProductID
    ORDER BY d.DiscountPercent DESC;

SELECT c.CategoryName, AVG(d.DiscountPercent) AS AverageDiscount FROM Discounts d
	JOIN Products p ON d.ProductID=p.ProductID
    JOIN Categories c ON p.CategoryID=c.CategoryID
    GROUP BY c.CategoryName;

SELECT p.ProductName, d.DiscountPercent FROM Discounts d
	JOIN Products p ON d.ProductID=p.ProductID 
    WHERE d.DiscountPercent>20;

SELECT p.ProductName,
DATEDIFF(
d.EndDate,
d.StartDate
)
AS CampaignDays FROM Discounts d
JOIN Products p ON d.ProductID=p.ProductID;

SELECT p.ProductName, p.SellingPrice,d.DiscountPercent,
(p.SellingPrice - (p.SellingPrice*d.DiscountPercent/100))
AS DiscountedPrice
FROM Products p JOIN Discounts d
ON p.ProductID=d.ProductID;

