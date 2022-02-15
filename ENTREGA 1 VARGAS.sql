CREATE database WORKSHOP;
USE WORKSHOP;

create TABLE VUELO(
Id_vuelo INT NOT NULL,
ORIGEN VARCHAR(50) NOT NULL,
DESTINO VARCHAR(50) NOT NULL,
FECHA_SALIDA VARCHAR(50) NOT NULL,
FECHA_LLEGADA  VARCHAR(50) NOT NULL, 
primary key(Id_vuelo)
);

create table AEROPUERTO(
Id_aeropuerto INT NOT NULL,
NOMBRE VARCHAR(50) NOT NULL, 
DIRECCION varchar(50) NOT NULL, 
TELEFONO VARCHAR(50) NOT NULL, 
PAIS VARCHAR(50) NOT NULL, 
HORA_LLEGA VARCHAR(50) NOT NULL, 
HORA_SALIDA VARCHAR(50) NOT NULL, 
primary key(Id_aeropuerto)
);

Create table VUELO_AEROP(
Id_vuelo int not null,
Id_aeropuerto Int not null, 
DESTINO VARCHAR(50) NOT NULL, 
primary key(Id_vuelo, Id_aeropuerto),
FOREIGN key(Id_vuelo)
References VUELO(Id_vuelo),
FOREIGN key(Id_aeropuerto)
References AEROPUERTO(Id_aeropuerto)
);


create TABLE AVION(
Id_avion int not null, 
Fabricante varchar(50) not null, 
Modelo varchar(50) not null, 
Capacidad_pasajeros varchar(50) not null,
Id_vuelo int not null, 
primary key(Id_avion),
FOREIGN KEY (Id_vuelo) REFERENCES VUELO(Id_vuelo)
);


create table PASAJERO(
Id_pasajero INT NOT NULL,
Nombre  varchar(50) NOT NULL,
Id_pasaporte VARCHAR(50) NOT NULL,
DNI VARCHAR(50) NOT NULL,
Direccion  varchar(50) NOT NULL,
Telefono VARCHAR(50) NOT NULL,
Nro_VUELO varchar(50) NOT NULL,
Id_avion Int not null,
primary key(Id_pasajero),
foreign key(Id_avion) references AVION(Id_avion)
);

create table TRIPULACION(
Id_tripulacion int not null,
Nombre_apellido varchar(50) not null, 
DNI varchar(50) not null,
Nro_legajo varchar(50) not null, 
Direccion varchar(50) not null,
Telefono varchar(50) not null,
Id_avion int not null,
primary key(Id_tripulacion),
foreign key(Id_avion) references AVION(Id_avion)
);

Create table EQUIPAJE(
Id_equipaje INT NOT NULL,
Peso VARCHAR(50) NOT NULL,
Cantidad VARCHAR(50) NOT NULL,
Id_pasajero int not null,
primary key(Id_equipaje),
foreign key(Id_pasajero) references pasajero(Id_pasajero)
);