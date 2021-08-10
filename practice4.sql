drop database if exists practice_mysql;

create database if not exists practice_mysql;

use practice_mysql;


create table if not exists productos(
id integer unsigned auto_increment,
nombre varchar(60) not null,
proveedor varchar(69) not null,
descripcion varchar(60) not null,
precio float(6,3) unsigned,
cantidad smallint unsigned,
primary key(id)
);
describe productos;

insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Laptop HP','HP','Las mejores laptop',155.69,50);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Mouse','Logitech','Las mejores mouse',20.86,30);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Teclado','Logitech','Las mejores teclados',80.12,100);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Laptop DELL','Dell','Las mejores laptop',200.8,15);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Pantalla','HP','Las mejores Pantallas',155.69,50);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Impresora','HP','Las mejores Impresoras',155,70);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Camaras','logitech','Las mejores Camaras',500,20);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Xbox 360','Xbox Microsoft','Las mejores Consolas',103,10);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('PlayStation 4','Sony','Las mejores play',15.69,50);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Lenovo 310','Lenovo','Las mejores laptop',155.69,50);

select * from practice_mysql.productos;

## COLUMNAS CALCULADAS

#sacar el procentaje precio*10% or precio*0.1
#hacer el descuento del precio precio-(precio*0.1)

select nombre, precio, precio*0.2,precio-(precio*0.2) from practice_mysql.productos;
drop table if exists productos;

#FUNCIONES DE MANEJO DE CADENAS

select concat('esteban',' ','el',' ','pro'); #concatena datos
select concat_ws(' ','concatena','con', 'espacio'); #concatena With Space
select length('que vida'); #cuenta el largo mas el espacio
select left('esto qe es',7); #cuenta los dato de izquierda hasta derecha el limite a llegar es el largo de 7
select right('selecciona solo los datos de derecha hasta izquiera',31); #lo mismo que left solo que de derecha hasta izquiera
select ltrim('          esteban       '); #quita los espacios de la izquiera
select rtrim('            quita lo espacion de la derecha pero no el de la izquiera'          );
select trim('    quita todo los espacios de derecha e izquiera      ');
select lower('PONE TODO EN MINUSCULA');
select lcase('PONE TODO EN MINUSCULA TAMBIEN');
SELECT upper('pone todo en mayuscula');
select ucase('pone todo en mayuscula tambien');
select replace('xxx.google.com', 'x','w'); #datos, dato a seleccionar para remplazar, dato que va remplzar

#ejemplos con la tabla creada
select upper(nombre), upper(proveedor) from practice_mysql.productos;
select precio, left(precio,3),cantidad, length(cantidad) from practice_mysql.productos;
select concat_ws('/', nombre, precio), ucase(nombre) from practice_mysql.productos;
describe productos;

#funciones matematicas
select ceiling(12.39); # redondea hasta arriba si tiene puntos flotantes
select floor(12.39); #redondea hasta abajo si tengo punto flotantes osea, quita los puntos flotantes
select mod(4,2); #divide y devuelve el residuo par devuelve 0
select mod(4,3); #divide y devuelve el residuo este es imprar devuelve 1
select round(12.49); #redondea este si es menor los flotantes deja el 12 exacto si el flotante es mayor a 50 lo redondea aumentando el valor de 12 a 13
select power(12,2); #esto es potenciacion seria 12 a la 2 elevando el valor indicado 12 a ^2

#order by
#asc toma las letras primeras como a, b, c.. y los numero como 1, 2 , 3... de menor a mayor
#desc toma las letras ultimas como z, y, x.. y los numero como 10, 9 , 8... de mayor a menos

select * from practice_mysql.productos order by id asc;
select nombre, cantidad from practice_mysql.productos order by cantidad desc;
describe productos;

##OPERADORES LOGICOS AND OR XOR NOT

#and = "y"# las dos se deben cumplir
#or = "y/o"#las dos se pueden cumplir o solo 1 de las dos
#xor = "o" # solo una de las dos se puede cumplir si cumplen las dos fake si no son las dos fake
#not = "no" # arroja los datos que no sean los indiccado

select * from productos;
select * from productos where not (cantidad = 50);
select * from productos where (proveedor = upper("hp")) and (cantidad <= 100); # se debe cumplir las dos
select * from productos where (id > 4) or (proveedor = 'Dell'); # aqui en este caso las dos cumplen pero es mala practica el or es mejor usarlo cuando solo uno es verdadero si quieres que te muestre los dos usa and 
select * from productos where (id > 3) xor (cantidad = 50); # aqui solo se puede cumplir uno en este caso es cantidad
select * from productos where (cantidad > 577660) or (proveedor <> 'Dell'); #cantidad es falsa proveedor es verdadero por lo que mostrara potros productos que no sean dell


##betwen betwen-in
select * from productos where proveedor between 'Dell' and 'HP' ORDER by proveedor asc;
select * from productos where proveedor between 'Dell' and 'HP' ORDER by id asc;

select * from productos where not id between 3 and 5;
select * from productos where precio between 200.800 and 500.000;
select * from productos where cantidad between 50 and  70;

select * from productos;
select * from productos where proveedor in('Sony',50); #maneja el or tipo where (proveedor = 'sony') or(descripcion ='mejoreslaptop');
select * from productos where cantidad in(100,1);

## LIKE OR NOT LIKE
select * from productos;
select * from productos where proveedor like '%h'; #patron  de busqueda especifica por trozo donde busco todos que terminen con h
select * from productos where nombre like  'p%'; #patron  de busqueda especifica por trozo donde busco todos que empiezen con p
select * from productos where descripcion not like '%mejores l%';  # no muestra esto indicados con la identificacion 1, 4, 10 que contengan esta busqueda completa


##patrones de busqueda con regexp not regexp

select * from productos where nombre regexp 'Camaras'; # funciona igual que like me trae el dato que sea Camaras
select * from  productos where nombre regexp 'C'; #cualquier nombre que contenga la letra c
select * from productos where nombre regexp '^T'; #cualquier letra que empieza con T 
select * from productos where nombre regexp '[l]'; #cualquier nombre que tenga una l en ella en este caso mouse no tiene 
select * from productos where proveedor regexp '[a-c]'; #CUALQUIr que tenga de l hasta o ejem a,b, hasta c
select * from productos where proveedor regexp 'o..t'; # toma la primera letra 0 y los puntos indican cualquier cosa puede ir ahi pero debe terminar en t
select * from productos where nombre regexp 'L.*P';

#funcion para contar registros


select * from productos;

select count(*) from productos; # cuenta todas las columnas en total tengo 10 
select count(*) from productos where nombre like '%laptop%';
select count(*) from productos where not proveedor = 'HP';


#funciones de agrupamientos con avg sum min max
select * from productos;
select max(id) from productos;
select min(id) from productos;
select max(cantidad) from productos where proveedor like '%HP%';
select avg(cantidad) from productos where nombre regexp 'la.*to.';


#Funcion de Agrupamiento group by
create table visitantes(
  nombre varchar(30),
  edad tinyint unsigned,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal (6,2) unsigned
 );

insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);
  
  select * from visitantes;
  
  select ciudad, count(*) from visitantes where ciudad = 'cordoba';
  select count(ciudad) from visitantes; #tottal 10 ciudades
  select ciudad, count(*) from visitantes group by ciudad;
  select ciudad,sexo, count(*) from visitantes group by ciudad, sexo;
  select nombre, edad, sexo, count(*) from visitantes group by nombre, edad, sexo order by edad desc;
  select ciudad,sexo, count(ciudad),min(montocompra), max(nombre), min(nombre) from visitantes group by ciudad,sexo  order by ciudad desc;
  select ciudad, sexo, count(*) from visitantes where  ciudad <>  'Cordoba' group by ciudad, sexo ;
  
  ## registrado duplicado distinct
  
  select * from productos;
  
  select distinct proveedor from productos;
    select distinct proveedor from productos where proveedor <> 'Sony' group by proveedor asc;
    