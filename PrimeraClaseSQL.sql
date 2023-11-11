CREATE DATABASE PrimeraClaseNata
use PrimeraClaseNata
CREATE TABLE Factura (
ID int primary key identity (101,1)
not null,
FECHA date not null,
ID_CLIENTE int not null,
constraint fk_Cliente foreign key (ID_CLIENTE) references Clientes(ID),
)
GO
CREATE TABLE Ventas(
ID int primary key identity (200,1) not null, 
ID_FACTURA int not null, 
ID_PRODUCTO int not null,
Cantidad tinyint,
constraint fk_FACTURA foreign key (ID_FACTURA) references Factura(ID),
constraint fk_PRODUCTO foreign key (ID_PRODUCTO) references Productos(ID),
)
GO
CREATE TABLE Categoria(
ID int primary key identity (300,1) not null,
DESCRIPCION text not null,
)
GO
CREATE TABLE Proveedor(
ID int primary key identity(400,1) not null, 
NOMBRE varchar(40) not null, 
DIRECCION nvarchar(40) not null, 
TELEFONO char (10) not null, 
)
GO
CREATE TABLE Productos (
ID int primary key identity (500,1)not null, 
DESCRIPCION text not null,
PRECIO smallmoney not null, 
ID_CATEGORIA int not null,
ID_PROVEEDOR int not null,
constraint fk_Categoria foreign key (ID_CATEGORIA) references Categoria(ID),
constraint fk_Proveedor foreign key (ID_PROVEEDOR) references Proveedor(ID),
)
GO 
CREATE TABLE Clientes(
ID int primary key identity(1,1)not null, 
Nombre varchar(40) not null, 
Apellido varchar(40) not null, 
Email nvarchar(40), 
Telefono char(10) 
) 
GO 
--Clientes datos
INSERT INTO Clientes(Nombre,Apellido,Email,Telefono)
VALUES ('Kevin','Garcia','kevin@gmail.com','3146174303'),('Natalia','Jimenez','nata@gmail.com','3136174303'),('Pepito','Perez','pepito@gmail.com','3145174303')
select *from Clientes
select Nombre,Apellido from Clientes


--Proveedor datos
INSERT INTO Proveedor (NOMBRE,DIRECCION,TELEFONO)
VALUES ('Kevincito','carrera5#3','3102845449') 
select *from Proveedor

--Factura datos
set dateformat dmy
INSERT INTO Factura(FECHA,ID_CLIENTE)
VALUES ('10/02/2023',2),('20/06/2023',2)
select * from Factura 

--Categorias datos 
INSERT INTO Categoria(DESCRIPCION)
VALUES ('Alimento'),('Limpieza'),('Mecanica')
select *from Categoria

--Agregar columna y restricciones a tablas ya creadas 
ALTER TABLE Clientes 
ADD CONSTRAINT RD_Clientes default 'Desconocido' for email 

INSERT INTO Clientes(Nombre,Apellido,Telefono)
VALUES ('Paola','Sinisterra','31027589588')
--Borrar columna 
ALTER TABLE Clientes 
drop column Edad
--RESTRICCIONES
/*
DEFAULT: Agregar un valor por defecto->default 'desconocido'
CHECK: Validar si un valor cumple con ciertas condiciones check
UNIQUE: EVITA EL INGRESO DE VALORES DUPLICADOS 

ELIMINAR RESTRICCION 
Alter table nombre de la tabla 
Drop constraint nombre del constraint 

Validar en la tabla venta que la cantidad sea mayor o igual que 0 
*/ 
ALTER TABLE Venta 
ADD CONSTRAINT CK_Cantidad check 
(Cantidad >=0) 
INSERT INTO Ventas (ID_FACTURA,ID_PRODUCTO) 


--funciones 
/* 
count(campo): Cuenta registros de una tabla, incluyendo los nulos. (para todo tipo de dato).
MAX(): Muestra el valor mayor de un campo especifico. (para todo tipo de dato )
Min (): Muestra el valor menor de un campo en especifico (para todo tipo de dato)
AVG (): Calcula el promedio de u campo en especifico (solo para datos numericos )
sum(): Suma los valores de un campo en especifico(solo para datos numericos)
Distinct: Muestra informacion de un campo omitiendo duplicados
*/

--CONSULTAS
--Contar la cantidad de clientes:
SELECT count(*) as Total_Clientes
From Clientes 

--Cantidad de facturas:
SELECT count(*) as Total_Facturas
From Clientes

--Contar nombres de clientes q comiencen con C:
SELECT count(Nombre) 
From Clientes where Nombre like 'c%'

--Mostrar proovedores que suministran algun producto (sin duplicados):
SELECT DISTINCT (ID_Proveedor) 
From Productos

--Mostrar productos mas costosos y mas economico:
Select Max(Precio), min(Precio) 
From Productos as MaxYMin

--Calcular precio promedio de los productos:
SELECT AVG(Precio) 
From Productos as Promedio_Productos

--Contar proovedores que siministran algun producto sin duplicarlos:
SELECT count(DISTINCT(ID_Proveedor))
From Productos


--JOIN: consulta de muchas tablas 
/*
INNER JOIN: Solo muestra registros en comun en las tabas consultadas 
LEFT JOIN: Muestra todos los registros de la tabla de la izquierda y los registros que coinciden con la tabla de la derecha 
RIGHT JOIN: Muestra todos los registros de la tabla de la derecha y los registros que coinciden con la tabla de la izquierda 
FULL OUTER JOIN:Muestra todos los registros 
*/

--CONSULTAS:

--INNER JOIN:
--consultar nombre de los clientes que tienen factura (Cliente y factura):
SELECT C.Nombre , C.Apellido , Factura.ID, Factura.FECHA
From Clientes as C
inner join Factura
on C.ID = Factura.ID_CLIENTE
GO 
SELECT * From Clientes
--Consultar categorias a la que pertenecen los productos:
SELECT Productos.ID , Categoria.DESCRIPCION
From Categoria
inner join Productos 
on Categoria.ID = Productos.ID_CATEGORIA

--Consultar facturas generadas en cada venta 
--Consultar categoria de cada producto y proveedores que los suministran
--Proveedores que suministran algun producto



--LEFT JOIN
-- Todos los productos que contienen alguna categoria
--Todos los clientes que tienen alguna compra:
SELECT Clientes.Nombre , Clientes.Apellido , Factura.FECHA
from Clientes
left join Factura
on Clientes.ID = Factura.ID_CLIENTE
--Los vendedores que suministran algun producto
SELECT Proveedor.ID , Proveedor.NOMBRE , Productos.ID , Productos.DESCRIPCION
From Proveedor
left join Productos
on Proveedor.ID = Productos.ID_PROVEEDOR

--RIGHT JOIN:
--Todos los productos que fueron vendidos

--FULL OUTER JOIN:
--Facturas generadas a los clientes 



