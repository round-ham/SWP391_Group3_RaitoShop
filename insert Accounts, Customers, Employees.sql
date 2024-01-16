use SWP391_Project_SQLShoes
insert into Accounts("role", username, email, "password", createDate) values (1, 'customer1', 'customer1@gmail.com', 123, '2024-1-16')
insert into Accounts("role", username, email, "password", createDate) values (1, 'customer2', 'customer2@gmail.com', 123, '2024-1-16')
insert into Accounts("role", username, email, "password", createDate) values (1, 'customer3', 'customer3@gmail.com', 123, '2024-1-16')

insert into Accounts("role", username, email, "password", createDate) values (2, 'admin', 'admin@gmail.com', 123, '2024-1-16')
insert into Accounts("role", username, email, "password", createDate) values (3, 'marketingstaff', 'marketingstaff@gmail.com', 123, '2024-1-16')
insert into Accounts("role", username, email, "password", createDate) values (4, 'seller', 'seller@gmail.com', 123, '2024-1-16')
insert into Accounts("role", username, email, "password", createDate) values (5, 'shipper', 'shipper@gmail.com', 123, '2024-1-16')


insert into Employees(employeeName, title, gender, phone, "address", hireDate, birthDate, salary) values('John The Weeboo', 'admin', 1, '0967760888' ,'Hoai Duc, Hanoi' , '2024-1-16', '2002-6-15', 5000000)  
insert into Employees(employeeName, title, gender, phone, "address", hireDate, birthDate, salary) values('Marketing Staff', 'marketingstaff', 2, '0967780687' ,'Hoa Lac, Hanoi' , '2024-1-16', '2002-6-13', 4000000)  
insert into Employees(employeeName, title, gender, phone, "address", hireDate, birthDate, salary) values('Seller', 'seller', 1, '0852273235' ,'Thach That, Hanoi' , '2024-1-16', '2002-5-22', 4500000)  
insert into Employees(employeeName, title, gender, phone, "address", hireDate, birthDate, salary) values('Shipper', 'shipper', 1, '0852273857' ,'Ha Long, Quang Ninh' , '2024-1-16', '2002-8-22', 4500000)  

update Accounts set employeeId=2 where accountId=7
update Accounts set employeeId=3 where accountId=8
update Accounts set employeeId=4 where accountId=9
update Accounts set employeeId=5 where accountId=10

insert into Customers(customerName, gender, phone, "address") values ('Customer1', 1, '0123456789', 'Cai Lay, Tien Giang')
insert into Customers(customerName, gender, phone, "address") values ('Customer2', 2, '0987654321', 'Quan 1, Thanh pho Ho Chi Minh')
insert into Customers(customerName, gender, phone, "address") values ('Customer3', 1, '0967760897', 'Cu Chi, Thanh pho Ho Chi Minh')

update Accounts set customerId=1 where username= 'customer1'
update Accounts set customerId=2 where username= 'customer2'
update Accounts set customerId=3 where username= 'customer3'