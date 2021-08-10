use practice_mysql;


create table if not exists usuarios(
nombre varchar(50)
);

#añadir con alter table
alter table usuarios add id int unsigned not null;
alter table usuarios add direccion varchar(50) default 'no direccion';
alter table usuarios add descripcion  varchar(50), add telefono integer;
describe usuarios;

#borrar registros de la tabla alter-Ando
alter table usuarios drop id, drop direccion;

#modificar registros de la tabla
alter table usuarios modify telefono integer unsigned not null;
alter table usuarios modify nombre varchar(100) default 'unknow', modify descripcion varchar(60);
alter table usuarios modify id integer not null;
alter table usuarios modify id  int auto_increment;


#cambiar registros de la tabla 
alter table usuarios change nombre casa varchar(60), change telefono edad integer unsigned;

##Agregando y eliminando clave Primaria ADD-DROP


alter table usuarios add primary key(id);
alter table productos add primary key(nombre);
alter table productos modify id int unsigned auto_increment not null;

alter table productos drop primary key;
alter table productos modify id int unsigned;

#agregar y borra indices
alter table usuarios add index i_descripcion(descripcion), add index i_edad(edad);
alter table usuarios drop index i_descripcion, drop index i_edad;

#agregando y borrando tabla porque no se como borrar el unique, tal vez modifando sus datos;
alter table usuarios add unique uq_edad(edad);
alter table usuarios drop edad;

## renombrar tablas
#se pueden las dos formas
show tables;
describe tables;
show index from usuarioss;
alter table usuarios rename usuarioss;
rename table usuarioss to users;
rename table users to usuarios;

