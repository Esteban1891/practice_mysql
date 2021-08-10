use practice_mysql;


## tipo index comun
create table if not exists libro(
id integer unsigned primary key not null auto_increment,
titulo varchar(100),
autor varchar(100) not null,
descripcion text,
editorial varchar(100) not null,
index i_autor_Y_editorial(autor, editorial) #los valores unicos no puedes ser null asi que tienen que estar not null
);
describe libro;
drop table if exists libro;
show index from libro; #muestra los indicesde libro
drop index i_autor_Y_editorial on libro; # borra indices de una tabla

#tipo unique (unico)

create table if not exists libro(
id integer unsigned primary key not null auto_increment,
titulo varchar(100),
autor varchar(100) not null,          #tabla con los indices insertados
descripcion text,                     #
editorial varchar(100) not null,
index i_autor(autor), #los valores unicos  crean un alias iniciando con i_
unique uq_titulo(titulo)
);


create table if not exists libro(
id integer unsigned primary key not null auto_increment,
titulo varchar(100),
autor varchar(100) not null,          #usar tabla normal para insertar datos del indice de forma externa
descripcion text,                     #
editorial varchar(100) not null
);


show index  from libro;
#Eliminar un indice
drop index i_autor on libro;
drop index uq_titulo on libro;
show index from libro;

#crear indices
create index i_autor on libro  (editorial);
create unique index uq_descripcion on libro(editorial);
