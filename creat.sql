create table estudiantes (id int primary key identity (1,1), nombre varchar (50))
create table autores (idAutor int primary key identity (1,1), nombreAutor varchar (50), nacionalidad varchar (50))
create table editorial (idEditorial int primary key identity (1,1), nombre varchar (50))
create table libros (idLibro int primary key identity (1,1),
						nombre varchar (50), 
						idAutor int, 
						idEditorial int, 
						año int,
						CONSTRAINT fk_idAutor FOREIGN KEY (idAutor) REFERENCES autores (idAutor),
						CONSTRAINT fk_idEditorial FOREIGN KEY (idEditorial) REFERENCES editorial (idEditorial))

alter table dbo.estudiantes add fecha date not null 

create table prestamos (idPrestamo int primary key,
						idEstudiante int,
						idLibro int,
						fechaPrestamo date
						CONSTRAINT fk_idEstudiante FOREIGN KEY (idEstudiante) REFERENCES estudiantes (id),
						CONSTRAINT fk_idLibro FOREIGN KEY (idLibro) REFERENCES libros (idLibro)
						)

create table devoluciones (idDevolucion int, 
						   fechaDevo date
						   CONSTRAINT fk_idDevolucion FOREIGN KEY (idDevolucion) REFERENCES prestamos (idPrestamo))