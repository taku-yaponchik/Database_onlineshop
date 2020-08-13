/*Удаляем если есть такой база данных*/
DROP DATABASE IF EXISTS onlineshop;

/*содаем базу данных onlineshop*/
CREATE DATABASE onlineshop;

/*используем базу данных onlineshop*/
USE onlineshop;

/*Удаляем если есть такой таблицу в базе данных*/
DROP TABLE IF EXISTS customers;

/*создаем новую таблицу покупателя каторая имеет в себе id, имя покупателя, e-mail и тел.номер*/
CREATE TABLE customers(
    id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE, 
    phone_number INTEGER
    )ENGINE=INNODB;

/*данные о покупателях*/
INSERT INTO customers(name,email,phone_number) values('Mari','mari@gmail.com',0700123456);
INSERT INTO customers(name,email,phone_number) values('Sultan','sultan@gmail.com',0700111111);
INSERT INTO customers(name,email,phone_number) values('Nursultan','nursultan@gmail.com',0700222222);
INSERT INTO customers(name,email,phone_number) values('Zarema','zarema@gmail.com',0700333333);
INSERT INTO customers(name,email,phone_number) values('Aleksei','aleksey@gmail.com',0700444444);


/*создаем новую таблицу продуктах каторые есть в онлайн магазине и мееть они id, имя продукта и цены*/
DROP TABLE IF EXISTS product;
CREATE TABLE product(
    id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(255) UNIQUE, 
    price INTEGER NOT NULL
    )ENGINE=INNODB;

/*имеющаяся продукты в магазине*/
INSERT INTO product(name,price) values('Apple',25);
INSERT INTO product(name,price) values('Limon',50);
INSERT INTO product(name,price) values('Milck',45);
INSERT INTO product(name,price) values('Meat',350);
INSERT INTO product(name,price) values('Phone',60000);

/*создаем корзину которая отвечает за то что покупатель выбирает продукты и харанит в себе*/
DROP TABLE IF EXISTS carts;
CREATE TABLE carts(
    id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    customers_id INTEGER NOT NULL, 
    product_id INTEGER NOT NULL, 
    FOREIGN KEY(customers_id) REFERENCES customers(id),
    FOREIGN KEY(product_id) REFERENCES product(id)
    )ENGINE=INNODB;

INSERT INTO carts(customers_id,product_id) values(5,4);
INSERT INTO carts(customers_id,product_id) values(5,5);

/*создаем таблицу заказов которые были орплачены либо всё ещё не орлаченные*/
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
    id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    customers_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    FOREIGN KEY(customers_id) REFERENCES customers(id), 
    FOREIGN KEY(product_id) REFERENCES product(id),
    status BOOLEAN NOT NULL
    )ENGINE=INNODB;

INSERT INTO orders(customers_id,product_id,status) values(1,5,True);
INSERT INTO orders(customers_id,product_id,status) values(1,2,True);
INSERT INTO orders(customers_id,product_id,status) values(2,1,False);
INSERT INTO orders(customers_id,product_id,status) values(3,3,True);
INSERT INTO orders(customers_id,product_id,status) values(4,2,True);
INSERT INTO orders(customers_id,product_id,status) values(4,3,True);
INSERT INTO orders(customers_id,product_id,status) values(4,4,True);
INSERT INTO orders(customers_id,product_id,status) values(4,5,True);
 
-- ввывод всех данных о покупках
-- SELECT customers.id,customers.name as customers_name, product.name as product_name, product.price, orders.status 
-- FROM orders 
-- LEFT JOIN customers on orders.customers_id=customers.id
-- LEFT JOIN product on orders.product_id=product.id;

--  вывод суммы всего прайся которые были проданы
-- SELECT  customers.name,sum(product.price) as summa  
-- FROM orders 
-- LEFT JOIN customers on customers.id=orders.customers_id 
-- LEFT JOIN product on orders.product_id=product.id 
-- GROUP BY customers.name;
