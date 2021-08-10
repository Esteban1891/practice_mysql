#mostrar base de datos
show databases;
# borrar base de datos si existe camila
drop database if exists camila;
# crear base de datos si no existe camila;
create database if not exists camila;
#usar la base de datos
use camila;
# crear tabla sin no existe data cami, si existe genera un warning diciendo que no se puede
create table if not exists data_cami(
nombre varchar(69),
telefono varchar(70),
direccion varchar(60),
primary key(nombre)
);
# describe la informacion de loa tabla y sus campos
describe data_cami;

insert into data_cami() values('esteban','3008675188','calle112');
insert into data_cami() values('camila_andrea','39094847590','calle132');
# recuperando datos de la tabla

select * from data_cami; # consultar registros de la tabla

# borrar tabla data_cami
delete from data_cami; 

# borrar un dato de la tabla data_cami con la condicion de que sea solo los que sean esteban
delete from data_cami where nombre = 'esteban';


# ejemplo con identificador 

create table if not exists productos(
id int(11) not null auto_increment,
descripcion text not null,
producto varchar(50) not null,
precio float(11,3) not null,
primary key(id)
);
#borrar registros de tabla completa para que el identificado vuelva a cero con truncate
truncate table productos;
describe productos;

#insertando
insert into productos() values(null, 'auto alta calidad','chevrolet',200); 
insert into productos() values(null, 'auto baja calidad','renault',500); 
#mostrando datos de producto
select * from productos;
# elimina registros de la tabla la diferencia de delete es que es mas rapido ademas que los id no se repiten, vuelven a restablecer

truncate table data_cami; 


# unsigned permite solo trabajar con numeros y estos solo permiten datos positivos
create table if not exists `persona`(
`id` integer unsigned not null auto_increment,
`nombre` varchar(50) not null,
`edad` integer unsigned not null,
primary key(id)
);
describe persona;
#insert info de table person
insert into persona values(null,'esteban',11);
insert into persona values(null,'adrian',12);


# datos numericos

#enteros
tinyint # se puede usar para edad ya que nadie llega a mas de 100 old
tinyint -127 128; # esto es para datos minusculos , ademas si quiero sumar esa informacion -127 128 y de positivo colo unsigned
smallint #esto es para datos pequeños rango->32mil numeros
mediumint # esto es para datos medianos rango->
int # esto es el estandar rango->2 mil millones de datos
bigint # para datos super grandes rango->superior


# decimales

float(12,2) #permite 12 datos con 2 punto flotante y este no da precision en la informacion
double(12,2)#permite 12 datos con 2 punto flotante y este da precision en la informacion
decimal(1,21) #buscar

#cadenas
char #consume espacio por ejem si tengo juan y reserve 100 bits de memria 96quedan libres
varchar #consume menos espacio es mas eficiente ya que si por ejm tengo juan pues solo va obtener la memoria utizada
text # este es para textos full largos, tienes sus contras 
binary o varbinary #almacena bytes, poco usado
blob #se usan para guadar imagenes o artchivods comprimidos o zip, pero ya no se guadan a la base dde dtos
tinyblob # lo mismo de arriba solo que el almacenamiento es diferente 255 es el alto en byte
mediumblob
longblob #4gb de archivos
enum
set


#enum permite añadir columnas para las cadenas se puede indicar con el nombre o el numero en este caso es numero
CREATE TABLE tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    priority ENUM('Low', 'Medium', 'High') NOT NULL
);

insert into `tickets` values(null,'para vender ropa',2);
insert into `tickets` values(null,'para vender camisas','High');


select * from `tickets`;

create table if not exists casas(
id int primary key auto_increment,
tipo varchar(100) not null,
sector set('pobre','mediano','alto') not null
);

insert into casas values(null,'miramar',1), (null,'alameda',3);
insert into casas values(null,'juan mina',1), (null,'cuatro vocas',2);
select * from casas;
show tables;


#fechas y horas
#DATE: Válido para almacenar una fecha con año, mes y día, su rango oscila entre  ‘1000-01-01’ y ‘9999-12-31’.
#DATETIME: Almacena una fecha (año-mes-día) y una hora (horas-minutos-segundos), su rango oscila entre  ‘1000-01-01 00:00:00’ y ‘9999-12-31 23:59:59’.
#TIME: Válido para almacenar una hora (horas-minutos-segundos). Su rango de horas oscila entre -838-59-59 y 838-59-59. El formato almacenado es ‘HH:MM:SS’.
#TIMESTAMP: Almacena una fecha y hora UTC. El rango de valores oscila entre ‘1970-01-01 00:00:01’ y ‘2038-01-19 03:14:07’.
#YEAR: Almacena un año dado con 2 o 4 dígitos de longitud, por defecto son 4. El rango de valores oscila entre 1901 y 2155 con 4 dígitos. Mientras que con 2 dígitos el rango es desde 1970 a 2069  (70-69).




CREATE TABLE country (
   countryId int(10) unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
   country varchar(50) not null,
  UNIQUE KEY countryUIdx1 (country)
) ENGINE=InnoDB;

insert into country(country) values ("France");
insert into country(country) values ("China");
insert into country(country) values ("USA");
insert into country(country) values ("Italy");
insert into country(country) values ("UK");
insert into country(country) values ("Monaco");


CREATE TABLE city (
  cityId int(10) unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  countryId int(10) unsigned not null,
  city varchar(50) not null,
  hasAirport boolean not null default true,
  UNIQUE KEY cityUIdx1 (countryId,city),
  CONSTRAINT city_country_fk1 FOREIGN KEY (countryId) REFERENCES country (countryId)
) ENGINE=InnoDB;


insert into city (countryId,city,hasAirport) values (1,"Paris",true);
insert into city (countryId,city,hasAirport) values (2,"Bejing",true);
insert into city (countryId,city,hasAirport) values (3,"New York",true);
insert into city (countryId,city,hasAirport) values (4,"Napoli",true);
insert into city (countryId,city,hasAirport) values (5,"Manchester",true);
insert into city (countryId,city,hasAirport) values (5,"Birmingham",false);
insert into city (countryId,city,hasAirport) values (3,"Cincinatti",false);
insert into city (countryId,city,hasAirport) values (6,"Monaco",false);

-- Gah. Left outer join is now effectively an inner join 
-- because of the where predicate
select *
from country left join city using (countryId)
where hasAirport
; 

