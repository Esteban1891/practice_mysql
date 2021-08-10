use practice_mysql;

#unsigned more default
create table if not exists biblioteca(
id int unsigned primary key auto_increment,
libros varchar(50) not null,
autor varchar(50) default "desconocido",
precio decimal(10,3) default 0.000,
cantidad mediumint unsigned default 1
);
describe biblioteca;
insert into practice_mysql.biblioteca
values(
null,
'typescript',
'jose',
100.000,
5
);

insert into practice_mysql.biblioteca(libros,precio,cantidad) 
values(
'typescript',
100.000,
5
);

select * from biblioteca;
drop table if exists biblioteca;
update biblioteca set precio = 500.900, cantidad = 9 where id = 2;

#unsigned

#zerofill
#practicando decimal ya que se usa metodos de eleccion como este  10, 6 es 10-6 = 5 el primer dato solo acepta 5
create table if not exists biblioteca(
	id integer(6) zerofill primary key auto_increment, #esto se usa mucho en sistemas de facturacion 
	libros varchar(100) default "no asignado",
	autor varchar(50) default "desconocido",
	precio decimal(10,6) zerofill not null, #esto pone ceros a la izquiera
	cantidad mediumint default 1
);
describe biblioteca;
insert into biblioteca() values(null,'mysql','carlos',1234.123456,10); # 1.8 = 0001.800000 es 0001 porque 10-6 = 4 por eso son 4 numeross y 800000 es porque se asigno 6 numeros maximos
select * from biblioteca;
drop table biblioteca;
