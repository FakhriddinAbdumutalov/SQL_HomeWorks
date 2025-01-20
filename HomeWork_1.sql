create database CompanyDB;
go

use CompanyDB
go

create table Employees (
    EmployeeID int primary key identity(1,1), 
	FirstName nvarchar(30), 
	LastName nvarchar(30), 
	Department nvarchar(30),
	Salary decimal(10,2)
);

insert into Employees (FirstName, LastName, Department, Salary)
values
('Fakhriddin', 'Abdumutalov', 'Dispatch', 1500.00),
('Nurbek', 'Aliev', 'Manage', 6200.00),
('Jasur', 'Yo`ldoshev', 'HR', 6000.00),
('Bobur', 'Ergashev', 'Sales', 4200.00);


create table Departments (
    DepartmentID int primary key identity(1,1),
	DepartmentName nvarchar(40)
)

create table project (
    ProjectID int primary key identity(1,1),
	ProjectName nvarchar(50),
	Budget decimal(15,2)
);

Create table Tasks (
    TaskID int primary key identity(1,1),
	TaskName nvarchar(50),
	DueDate date
);

create table Customers (
   CustomerID int primary key identity(1,1),
   CustomerName nvarchar(30),
   ContactNumber nvarchar(15),
);

Create table Orders (
    OrderID int primary key identity(1,1),
	CustomerID int foreign key references Customers(CustomerID),
	OrderDate date
);

create table Products (
    ProductID int primary key identity(1,1),
	ProductName nvarchar(50),
	Price decimal(10,2)
);

create table Inventory ( 
    InvertoryID int primary key identity(1,1),
	ProductID int foreign key references Products(ProductID),
	Stock int
);

create table Suppliers (
    SupplierID int primary key identity(1,1),
	SupplierName nvarchar(50),
	ContactNumber nvarchar(15)
);

create table shipments (
    ShipmentID int primary key identity(1,1),
	OrderID int foreign key references Orders(OrderID),
	ShipmentDate date 
);

select * from sys.tables

create login DataUser with password = 'Welcome123$'
drop login DataUser 

create user User2 for login DataUser
drop user User2

create role UserRole
drop role UserRole

alter role UserRole add member User2

grant select, update on Employees to DataUser
grant select, update on Departments to DataUser
grant select, update on Projects to DataUser
grant select, update on Orders to DataUser
grant select, update on Products to DataUser