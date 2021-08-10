#creando base de datos

create database practice_mysql;

#trabajando con creacion de tablas

use practice_mysql; # para elegir una base de datos para manipulat las tablas

create table user(
name varchar(50),
age int(15)
); #crea tabla en una base de atos

show tables; #muestra la tabla 
describe user; #muestra el contenido de una tabla
drop table user; #borra tabla

#trabajando con creacion de tablas

create table usuarios(
nombre varchar(50),
edad int(12),
telefono varchar(60)
);
describe usuarios; #muestra el contenido de la tabla

#trabajando con insert que añade datos(cargando registros)

insert into usuarios() values('esteban',20,'100128383832'); #añadir datos en una tabla
insert into usuarios(nombre, edad, telefono) values('eduardo', 23, '329323723'); #insertar datos especificos

# trabajando con seleccion que muestra los datos(recuperando registros=

select * from usuarios; #me selecciona todo los datos especificados de una tabla (me los muestra)
select edad, telefono from usuarios; #mostrar de la tabla datos especifos
select nombre, edad from usuarios where nombre = 'esteban'; # muestra solo los datos cuando sean esteban de la tabla usuarios 
select * from usuarios where edad = '23';

# trabajando con operadores relacionales


# = igual
# <> distinto
# < menos
# > mayor
# >= mayor o igual que
# <= menor o igual que

select * from usuarios where nombre = 'esteban'; # muestra contenido que sea igual a esteban
select nombre from usuarios where nombre <> 'eduardo'; #muestra contenido que sea diferente a esteban
select * from usuarios where edad <> 20;
select * from usuarios where edad >= 23; # solo toma 23 porque es el unico que es igual a 23 y en la base de datos no hay mayor a 23
select * from usuarios where edad > 20; # solo toma los que sean mayores pero no iguales a 20
select * from usuarios where edad <= 19; # solo toma a los que sean menor o igual a 19 y no hay 19 asi que tomara solo a los menores a el
select * from usuarios where edad < 23; # solo mostrara menores a 23

# borrar registros de tablas

delete from usuarios; # borra todo los registros de usuarios
delete from usuarios where nombre = 'esteban'; # elimina registros especificos, en este caso borro todo registro que tenga que ver con esteban

# actualizar registro de tablas

update usuarios set edad = 18; # cambia todas las edades de cuya tabla usuarios
update usuarios set edad = 26 where nombre = 'eduardo'; # cambia especificamente la edad que tenga el nombre eduardo


select * from usuarios;