create table Orders
(
OrderId int identity primary key,
Area nvarchar(50) not null
)
go
create table Deliverys
(
FoodId int identity primary key,
FoodName nvarchar(50) not null,
Price money not null,
Picture nvarchar(150) not null,
OrderId int not null references dbo.Orders(OrderId)
)
go
