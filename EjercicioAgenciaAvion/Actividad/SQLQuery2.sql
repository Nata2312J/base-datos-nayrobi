CREATE DATABASE Agencia 
USE Agencia
--Crear tablas 
create table Actividad (
ID_ACTIVIDAD int primary key identity (200,1) not null, 
NombreActividad varchar(40) not null, 
Ubicacion varchar(50) not null, 
Precio int not null, 
Descripcion text default 'Desconocido', 
Fecha varchar(20) not null, 
)
alter table Actividad 
alter column Fecha varchar(30) not null

alter table Actividad 
alter column Fecha varchar(30) not null

insert into Actividad(NombreActividad,Ubicacion,Precio,Descripcion,Fecha) 
values ('Piscina','Caño cristales', 1500000, '', '23/12/2023'), ('Acampar','Rionegro', 500000, 'A las afueras del pueblo', '20/10/2023'),
 ('Picnic','Cartagena', 1600000, '', '10/11/2023'), ('Acampar','Rionegro', 1500000, 'A las afueras del pueblo', '12/05/2023'), ('Visita','Venezuela', 2500000, 'Ciudad', '06/10/2023'), ('Acampar','Rionegro', 1500000, 'A las afueras del pueblo','23/12/2023'), ('Visita','cancun', 2500000, 'Familia', '13/12/2023'), ('Turismo','Polonia', 3000000, 'Explorar', '23/10/2023')

create table Viaje_DestinoActividad( 
ID_VIAJE int primary key identity (300,1) not null, 
CiudadOrigen_Pasajero varchar(40) not null, 
Ciudad_Destino_Actividad varchar(40) not null, 
FechaSalida varchar(30) not null, 
FechaRegreso varchar(30) not null, 
PrecioVuelo int not null, 
IdaActividad varchar(50) default 'Desconocido', 
) 
go
insert into Viaje_DestinoActividad(CiudadOrigen_Pasajero, Ciudad_Destino_Actividad , FechaSalida ,FechaRegreso, PrecioVuelo ,IdaActividad )
values ('España', 'Colombia' , '12/09/2005' , '25/10/2023' , 2000000 , 'Vivir') , ('España', 'Colombia' , '12/09/2005' , '25/10/2023' , 2000000 , 'Vivir')  , 
('Peru ', 'Colombia' , '18/10/2005' , '01/12/2023' , 2000000 , 'pasear'),  ('Canada', 'Costa Rica' , '12/09/2005' , '25/10/2008' , 3200000 , 'visita')  , 
('Colombia', 'Colombia' , '10/01/2005' , '25/10/2023' , 2000000 , 'Visita') ,  ('España', 'Colombia' , '12/09/2005' , '25/10/2023' , 2000000 , 'Vivir')  ,
 ('Rusia', 'Panama' , '10/10/2007' , '25/10/2023' , 2500000 , 'Turismo') ,  ('medellin', 'cucuta' , '12/09/2051' , '32/10/2052' , 30000000 , 'Volar')  



create table Estadia ( 
ID_ESTADIA int primary key identity (400,1) not null, 
NombreHotel varchar(40) not null, 
CategoriaHotel varchar(50) not null, 
Telefono varchar(20) not null, 
Ciudad varchar(30) not null, 
Direccion nvarchar(30) not null, 
NumHabitacion varchar (10) not null, 
DescripcionHotel text default 'Desconocido', 
PrecioComida int not null, 
) 

insert into Estadia (NombreHotel, CategoriaHotel, Telefono, Ciudad, Direccion, NumHabitacion, DescripcionHotel, PrecioComida )
values ('Angeles' , '5 estrellas' , '3187763667' , 'Medellin' , 'Cra39A','120' , 'melo' , '20000'), ('Medallo' , '2 estrellas' , '3187763875' , 'Medellin' , 'Cra39A','10' , 'Aceptable' , '200000' ) , ('Licuadora' , '1 estrella' , '3237763667' , 'Panama' ,'Cra39A', '1200' , 'Ready' , '100000' ) , ('Speed' , '2 estrellas' , '3109663667' , 'Lituania' ,'Cra39A', '20' , 'Aceptable' , '18000' ) , ('Angeles' , '5 estrellas' , '3187763667' , 'Medellin' ,'Cra39A', '129' , 'melo' , '20000' ) , ('camaitas' , '3 estrellas' , '3197863667' , 'Bogota' ,'Cra39A', '001' , 'Ready' , '2000' ) , ('Compu' , '5 estrellas' , '3187763667' , 'Prado' ,'Cra39A', '30' , 'melo' , '48000' ), ('Angeles' , '2 estrellas' , '3187763667' ,'Cra39A', 'EEUU' , '120' , 'melo' , '2000000' )


create table Tour( 
ID_TOUR int primary key identity(500,1) not null, 
Ciudad_Destino varchar(40) not null, 
Descripcion text default 'Desconocido' , 
Precio int not null,
) 
INSERT INTO Tour(Ciudad_Destino,Descripcion,Precio) 
VALUES('Buenos Aires', 'Visita',2000000),('Caracas,Venezuela', 'Turismo',1000000),('Bikersfield,California', '',2000000),('Cancun', 'Vivir',2000000), 
('tokio', 'Vivir',6000000),('California', 'Visita',2000000),('Madrid', 'casa de su madre',2000000), ('washington', '',2000000)

create table Traslado (
ID_TRANSPORTE int primary key identity(600,1)  not null, 
Tipo varchar(20)default 'Desconocido' ,
Origen varchar(30)default 'Desconocido',
Destino varchar (50) not null, 
FechaSalida date not null, 
HoraSalida datetime not null, 
FechaRegreso varchar(30) not null, 
HoraRegreso varchar(30) not null,
EmpresaTransporte varchar (40) not null, 
Precio int not null, 
) 
alter table Traslado 
alter column FechaSalida varchar (30) not null 

alter table Traslado 
alter column HoraSalida varchar (30) not null

INSERT INTO Traslado(Tipo, Origen, Destino,FechaSalida,HoraSalida,FechaRegreso,HoraRegreso,EmpresaTransporte,Precio)
VALUES('Bus','Venezuela','Ecuador', '12/03/2020','10:00am','01/02/2025','10:00pm','Ochoa',600000 ),
('Avion','Peru','Argentina', '06/02/2020','07:00pm','01/06/2020','10:00am','La milagrosa',7000000 )
,('','Venezuela','Ecuador', '12/03/2020','8:00am','01/02/2025','10:00pm','Ochoa',600000 ) ,
('','Venezuela','Ecuador', '12/03/2020','8:00am','01/02/2025','10:00','Ochoa',600000 ) ,
('avion','Venezuela','colombia', '12/13/2020','05:00 am','01/02/2029','8:00am','suramericana',900000 ) ,
('Barco','mexico','colombia', '10/12/2010','11:00pm','01/02/2025','8:00am','ochoa',600000 ) ,
('','Venezuela','Ecuador', '12/03/2023','6:00am','01/02/2021','8:00am','Ochoa',600000 ) ,
('','mexico','colombia', '12/03/2023','02:00pm','01/02/2021','8:00am','Ochoa',900000 )


create table ContratoTour( 
ID_VIAJE int not null, 
ID_CLIENTE int not null, 
ID_EMPLEADO int not null, 
FechaInicial varchar(30) not null, 
FechaFinal varchar(30) not null, 
FormaPago varchar (50) not null, 
CantidadAdultos varchar (10) , 
CantidadMenoresEdad varchar(10)default 'No aplica' , 
constraint fk_Empleado foreign key(ID_EMPLEADO) references Empleado(ID_EMPLEADO), 
constraint fk_Cliente foreign key (ID_CLIENTE) references Cliente(ID_CLIENTE), 
constraint fk_Viaje foreign key (ID_VIAJE) references Viaje_DestinoActividad(ID_VIAJE),  
)
INSERT INTO ContratoTour(FechaInicial , FechaFinal , FormaPago, CantidadAdultos, CantidadMenoresEdad)
VALUES('10/05/2022','11/06/2022','Tarjeta de credito','6','2'),('9/05/2022','30/06/2022','Tarjeta de credito','6','2'),
('19/15/2020','30/01/2021','Tarjeta de credito','1','6'),('9/05/2022','30/06/2022','Efectivo','6','2'),
('9/15/2022','30/07/2022','Tarjeta de debito','1','2'),('06/05/2022','30/06/2023','Tarjeta de credito','1','5'),
('9/25/2022','30/07/2022','Efectivo','3','2'),('19/05/2022','30/06/2012','Tarjeta de debito','9','1')



create table Empleado (
ID_EMPLEADO int primary key identity (700,1) not null,
Nombre varchar(30) not null, 
Apellido varchar (30) not null, 
TelefonoEmpleado varchar(30)default 'Desconocido' , 
DireccionEmpleado nvarchar(50)default 'Desconocido' , 
) 
--Agregar columnas 
alter table Empleado 
add Cargo varchar(30) 
alter table Empleado 
add Sueldo int not null

INSERT INTO Empleado(Nombre, Apellido, TelefonoEmpleado, DireccionEmpleado,Cargo,Sueldo)
VALUES ('kevin' , 'apellido' , '3187763667' , 'crr17b #36c71','Jefe',5000000), ('natalia' , 'cardona' , '3123763667' , 'crr #36c81','Empleada',1500000), 
('luis' , 'guitierrez' , '3187763098' , 'crr17b #36c89','Secretario',1500000) ,  ('marcela' , 'palacio' , '3187767654' , 'crr17b #35s65','Administradora',3000000) ,
 ('diana' , 'garcia' , '3188765467' , 'crr19b #36c71','Contadora',2500000) ,  ('paola' , 'cardona' , '3207675588' , 'crr20g #36c71','Diseñadora',3000000) ,
  ('cristian' , 'marin' , '3187987657' , 'crr17b #39b98','Empleado',1700000) ,  ('alex' , 'cardona' , '3207874490' , 'crr17b #36c71','Matematico',5000000)
  --Consultar empleados letras empiezen y terminen por elejidas 
  select Nombre from Empleado where Nombre like 'k%n'
  --Salario mayor a la cantidad escogida
  select Nombre from Empleado where Sueldo>=2160000

create table Cliente ( 
ID_CLIENTE int primary key identity (800,1) not null, 
NombreCliente varchar(30) not null, 
ApellidoCliente varchar(30) not null, 
TelefonoCliente varchar(20) default 'Desconocido' ,
DirreccionCliente nvarchar (40) default 'Desconocido' , 
EmailCliente nvarchar(50) default 'Desconocido' ,  
EdadCliente int not null, 
)

INSERT INTO Cliente (NombreCliente, ApellidoCliente , TelefonoCliente , DirreccionCliente , EmailCliente , EdadCliente )
VALUES ('Pablo','Gutierrez','3208694635','crr34c56','pablito1@gmail.com', 45),  ('Luis','Gutierrez','3287594635','crr90c6','luis1@gmail.com', 95),
 ('Jaime','Perez','3108694635','crr09a56','Jaime1@gmail.com', 15), ('Laura','Perez','3208694608','crr34O56','Laura9@gmail.com', 18),
  ('Natalia','Palacio','3188944635','crr117c56','palacio1@gmail.com', 20), ('Mohamed','Ali','3208694035','crr34c57','Lindoyo1@gmail.com', 45),
   ('Kevin','Gutierrez','3107494635','crr90P56','Kevincho009@gmail.com', 28),('Kevin','Ali','3100994635','crr0u56','KevinAlii009@gmail.com', 30)
   

--Consultar todos los registros de la tabla clientes
select*from Cliente
--Consultar datos de clientes mayores de edad 
select NombreCliente,ApellidoCliente,EmailCliente,TelefonoCliente from Cliente
where EdadCliente>=18 

--Ordenar clientes forma ascendente
select * from Cliente order by NombreCliente asc;



alter table Tour 
add ciudad_Origen varchar(30) default 'Desconocido' 

-- 9
--A
select NombreCliente from Cliente
select Ciudad_Destino_Actividad, IdaActividad from Viaje_DestinoActividad 
select Origen from Traslado


--B
select FormaPago from ContratoTour

--C. No tenemos los datos dela ventas de los empleados

--D
select NombreHotel from Estadia


--E
select  IdaActividad from Viaje_DestinoActividad 

--F
select c.NombreCliente from Cliente c 
join ContratoTour ct on c.ID_CLIENTE=ct.ID_CLIENTE 
join Tour t on ct.ID_VIAJE=t.ID_TOUR 
where t.Ciudad_Destino='Buenos aires' 

--G 
select c.NombreCliente ,c.ApellidoCLiente from Cliente c
join ContratoTour ct on c.ID_CLIENTE=ct.ID_CLIENTE join Traslado t on ct.ID_VIAJE=t.ID_TRANSPORTE
where t.Origen='Bogota' 








