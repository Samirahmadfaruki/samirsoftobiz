show tables;
use ecommerce;
select * from products;
----------------------categories-------------


create table product_categories( id int not null primary key auto_increment,
cayegory_name varchar(200));


--------------products---------------

create table products (id int NOT NULL PRIMARY KEY auto_increment,
    Product_name varchar(55) NOT NULL,
    Product_desc varchar(5500),
	Product_price Decimal(9,3),
    category_id int ,
	FOREIGN KEY(category_id ) REFERENCES product_categories(id ),
    suplier_username int 
	
);
----------------cartitem----------------


create table cart_item(cart_item_id int NOT NULL PRIMARY KEY auto_increment,
     quantity int ,
     Product_id int,
	 FOREIGN KEY(Product_id ) REFERENCES products(id ),
     price Decimal(9,3)
);

-----------order_items------------------------


create table order_items(id int NOT NULL PRIMARY KEY auto_increment,
      payment_id int,
     FOREIGN KEY(payment_id) REFERENCES payment_details(id ),
      Product_id int,
	 FOREIGN KEY(Product_id ) REFERENCES products(id ),
     quantity int
     
);
-----------------------user----------------


create table user(id int NOT NULL PRIMARY KEY auto_increment,
     first_name varchar(150),
     last_name varchar(150),
     username varchar(150),
     password varchar(150),
     address varchar(150),
     telephone int
	 
     
);

-----------------user address-------------------


create table user_address(id int NOT NULL PRIMARY KEY auto_increment,
user_id  int,
 	 FOREIGN KEY(user_id ) REFERENCES user(id ),
     country varchar(150),
     city varchar(150),
     postal_code varchar(150),
     address_line1 varchar(250),
     address_line2 varchar(250),
     telephone int,
     mobile int
	 
     
);

--------------------------user_payment--------------------------


create table user_payment(id int NOT NULL PRIMARY KEY auto_increment,
user_id  int,
 	 FOREIGN KEY(user_id ) REFERENCES user(id ),
     payment_type varchar(200),
     bank_name varchar(200),
     account_no int
	 
     
);

------------------------------order_details----------------


create table order_details(id int NOT NULL PRIMARY KEY auto_increment,
order_id int,
 	 FOREIGN KEY(order_id ) REFERENCES order_items(id ),
user_id int,
 	 FOREIGN KEY(user_id ) REFERENCES user(id ),
     total decimal(9,3),
	 payment_id int,
     FOREIGN KEY(payment_id) REFERENCES payment_details(id ),
     Delivery_partner_id int,
 	 FOREIGN KEY( Delivery_partner_id ) REFERENCES  Delivery_partner(id )
     
);


------------------------------payment_details-----------------------


create table payment_details(id int NOT NULL PRIMARY KEY auto_increment,
 	 mode_of_payment varchar(200),
     amount decimal(9,3),
     status varchar(200)
     
);


--------------------------------delivery_partner--------------------


create table Delivery_partner(id int NOT NULL PRIMARY KEY auto_increment,
 	  Delivery_partner_name varchar(200),
     Delivery_partner_contact varchar(200),
     Delivery_partner_email varchar(200)
     
     
);


---------------------------------vendor------------------------------------------ 


create table vendor(id int NOT NULL PRIMARY KEY auto_increment,
 	suppliername              VARCHAR(75) NOT NULL,
    supplier_username              VARCHAR(75) NOT NULL,
     supplierprimarycontact    CHAR(20) NOT NULL,
     suppliersecondarycontact  CHAR(20) NULL,
     supplieremail             VARCHAR(50) NULL,
     supplieraddress           VARCHAR(500) NOT NULL,
     suppliercity              VARCHAR(75) NOT NULL,
     supplierstate             VARCHAR(75) NOT NULL,
     suppliercountry           VARCHAR(75) NOT NULL,
     supplierzipcode           VARCHAR(75) NOT NULL
     
);
ALTER TABLE user
ADD  email varchar(200);
ALTER TABLE products
ADD  FOREIGN KEY( supplier_username ) REFERENCEs vendor( supplier_username );
insert into product_categories(cayegory_name) values("books");
insert into product_categories(cayegory_name) values("chocolates");
insert into product_categories(cayegory_name) values("baby products");
insert into product_categories(cayegory_name) values("computer games");
insert into product_categories(cayegory_name) values("music");
insert into product_categories(cayegory_name) values("sports");
insert into product_categories(cayegory_name) values("toys");
insert into ven(first_name ,
     last_name ,
     username ,
     password ,
     address ,
     telephone ,
     email) values
('samir','chawla','samir199','abc','civil,ludhiana','965432654','seh@gmail.com'),
('ahmad','arora','ahmad199','swd','flower,ludhiana','865432654','sha@gmail.com'),
('khusi','dey','khusi199','ytr','basant,ludhiana','665432654','rah@gmail'),
('rahul','kapoor','rahul199','uyhg','haibowal,ludhiana','565432654','ragv@gmail'),
('gurinder','singh','gurinder199','jhg','noida,delhi','465432654','guri@gmail')