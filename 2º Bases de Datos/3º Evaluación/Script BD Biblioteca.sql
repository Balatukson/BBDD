CREATE DATABASE IF NOT EXISTS BD_BIBLIOTECA;
USE BD_BIBLIOTECA;

#Tabla AUTORES
CREATE TABLE IF NOT EXISTS autores (
  Id_Autor int(11) AUTO_INCREMENT PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  apellido1 varchar(100) NOT NULL,
  apellido2 varchar(100),
  pais varchar(20) NOT NULL
);

#Tabla EDITORIALES
CREATE TABLE IF NOT EXISTS editoriales (
  Id_Editorial int(11) AUTO_INCREMENT PRIMARY KEY,
  Nombre varchar(50) NOT NULL
);

#Tabla TEMAS
CREATE TABLE IF NOT EXISTS temas (
  Id_Tema int(11) AUTO_INCREMENT PRIMARY KEY,
  Nombre varchar(50) NOT NULL
);

#Tabla LIBROS
CREATE TABLE IF NOT EXISTS libros(
  Id_libro int(11) AUTO_INCREMENT PRIMARY KEY,
  título varchar(50) NOT NULL,
  tema int(11) NOT NULL,
  editorial int(11) NOT NULL,
  precio DECIMAL(5,2) UNSIGNED NOT NULL DEFAULT(0.00),
  fecha_compra date NOT NULL,
  páginas SMALLINT UNSIGNED NOT NULL,
  CONSTRAINT fk_editorial_libros FOREIGN KEY (editorial) REFERENCES editoriales(Id_Editorial) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_tema_libros FOREIGN KEY (tema) REFERENCES temas(Id_Tema) ON DELETE RESTRICT ON UPDATE CASCADE
);

#Tabla ESCRIBE
CREATE TABLE escribe (
  autor int(11) NOT NULL,
  libro int(11) NOT NULL,
  CONSTRAINT PK_ESCRIBE PRIMARY KEY (autor,libro),
  CONSTRAINT FK_libro_ESCRIBE FOREIGN KEY (libro) REFERENCES libros(Id_Libro) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_autor_ESCRIBE FOREIGN KEY (autor) REFERENCES autores(Id_autor) ON DELETE CASCADE ON UPDATE CASCADE
);

#DATOS AUTORES
INSERT INTO autores VALUES 
(1,'Lope','de Vega',NULL,'España'),
(2,'Gabriel','Garcia','Marquez','Colombia'),
(3,'Ernest','Hemmingway',NULL,'EEUU'),
(4,'Miguel','Delibes',NULL,'España'),
(5,'Terenci','Moix',NULL,'España'),
(6,'Edward','Morgan','Foster','Gran Bretaña'),
(7,'Danielle','Steel',NULL,'EEUU'),
(8,'George','Simenon',NULL,'Francia'),
(9,'Robert','Denis',NULL,'Francia'),
(10,'Andreu','Martin',NULL,'España'),
(11,'Gustavo Adolfo','Becquer',NULL,'España'),
(12,'Arthur','Conan','Doyle','Gran Bretaña'),
(13,'Amalia','Iglesias','Serna','España'),
(14,'Antonio','Machado',NULL,'España'),
(15,'Federico','Garcia','Lorca','España'),
(16,'Agatha','Cristie',NULL,'Gran Bretaña'),
(17,'Robert Louis','Stevenson',NULL,'Gran Bretaña'),
(18,'Ana','Frank',NULL,'Polonia'),
(19,'Camilo José','Cela',NULL,'España'),
(20,'Umberto','Eco',NULL,'Italia'),
(21,'Kleinbaum',NULL,NULL,'EEUU'),
(22,'John','Gray',NULL,'EEUU'),
(23,'Stephen','Hodge',NULL,'Gran Bretaña'),
(24,'Rosamunde','Pilcher',NULL,'EEUU'),
(25,'John','Irving',NULL,'EEUU'),
(26,'Michael','Crichton',NULL,'EEUU'),
(27,'Paul','Verhoeven',NULL,'Holanda'),
(28,'John','Grisham',NULL,'EEUU'),
(29,'Tolkien',NULL,NULL,'Gran Bretaña'),
(30,'Michael','Ende',NULL,'Gran Bretaña'),
(31,'Rafael','Alberti',NULL,'España'),
(32,'Gonzalo','Torrente','Ballester','España'),
(33,'Miguel','de Cervantes','y Saavedra','España'),
(34,'Robert','Mae',NULL,'EEUU');


#DATOS EDITORIALES
INSERT INTO editoriales VALUES 
(1,'Planeta'),
(2,'Universal'),
(3,'Meridian'),
(4,'Alianza'),
(5,'Salvat');


#DATOS TEMAS
INSERT INTO temas VALUES 
(1,'Comedia'),
(2,'Narrativa'),
(3,'Narrativa Contemporanea'),
(4,'Juvenil'),
(5,'Acción y misterio'),
(6,'Clasico universales'),
(7,'Obras completas'),
(8,'Prosa popular'),
(9,'Ensayo'),
(10,'Dramaturgia'),
(11,'Joyas Literarias'),
(12,'Historia'),
(13,'Romantica'),
(14,'Fantasía'),
(15,'Poesía');


#DATOS LIBROS
INSERT INTO libros VALUES 
(2,'Fuenteovejuna',2,1,5,'1992-10-09',130),
(3,'El otoño del patriarca',2,1,6.5,'1991-04-04',300),
(4,'Adios a las armas',3,2,5,'1972-10-15',250),
(6,'Señora de rojo sobre fondo gris',2,3,13.5,'1989-09-08',104),
(7,'Lieonard o el sexo de los ángeles',2,2,19.5,'1987-08-09',608),
(8,'Una habitación con vistas',3,1,13,'1988-08-07',224),
(9,'La Mansión',3,4,16.5,'1985-06-05',344),
(10,'La pena de Bélgica',3,4,23.5,'1990-02-15',688),
(11,'La caja negra',3,3,18.75,'1989-03-17',416),
(12,'Todos los detectives se llaman Flanagan',4,1,8.5,'1990-06-03',256),
(13,'La astilla',5,5,14.5,'1991-05-20',208),
(14,'Rimas y Leyendas',6,2,6,'1989-08-30',220),
(15,'Cartas desde mi celda',6,3,5,'1990-05-08',80),
(17,'Las aventuras de Sherlock Holmes',7,5,7,'1990-11-05',197),
(18,'Sherlock Holmes sigue en pie',7,3,4,'1991-09-09',87),
(19,'El archivo de Sherlock Holmes',7,5,4,'1990-11-05',70),
(20,'Soledades',8,3,5.5,'1989-06-12',130),
(21,'Poesías de la guerra',8,4,3.5,'1985-12-13',40),
(22,'Un mundo que agoniza',9,3,4.95,'1991-07-07',130),
(23,'El camino',2,2,7.5,'1986-11-09',223),
(24,'La casa de Bernarda Alba',10,5,5,'1987-03-15',175),
(25,'El romancero gitano',8,1,2.5,'1993-06-05',40),
(26,'El divan de Tamarit',8,1,2.5,'1985-09-08',40),
(27,'Asesinato en el Orient Express',5,1,7.5,'1991-05-07',230),
(28,'La isla del tesoro',4,1,4.5,'1992-03-07',275),
(29,'Peribáñez',1,2,5,'1987-11-02',160),
(30,'El diario de Ana Frank',4,5,16,'1991-05-02',300),
(31,'Viaje a la Alcarria',11,4,36,'1992-09-23',296),
(32,'San Camilo,1936',11,4,42.5,'1992-09-25',464),
(33,'Doce cuentos de peregrinos',2,4,16,'1991-09-02',224),
(34,'El nombre de la rosa',3,4,17,'1989-03-12',464),
(35,'El péndulo de Focault',3,1,23.5,'1992-10-23',592),
(36,'El club de los poetas muertos',3,1,12,'1986-11-09',162),
(37,'No sin mi hija',2,5,15,'1989-04-12',432),
(38,'Manuscritos del Mar muerto',12,5,16,'1992-09-12',288),
(39,'Los buscadores de conchas',13,1,17.5,'1992-03-12',576),
(40,'Una mujer en la tormenta',13,1,16.5,'1993-05-02',448),
(41,'Instinto Básico',5,4,13.5,'1991-03-03',208),
(42,'Parque Jurásico',5,2,17.5,'1994-01-02',512),
(43,'La tapadera',5,1,16,'1993-05-09',480),
(44,'El Hobbit',14,2,13.5,'1992-06-01',232),
(45,'El señor de los anillos',14,3,23.5,'1990-09-04',140),
(46,'Bestiario de Tolkien',14,3,39.5,'1991-08-07',328),
(47,'El Silmarillion',14,1,17.5,'1992-05-01',448),
(48,'La historia interminables',14,3,15.5,'1991-02-02',400),
(49,'Golfo de sombras',15,5,75,'1990-03-01',88),
(50,'El ceñidor de Venus vestido',15,4,75,'1992-02-03',64),
(51,'La arboleda perdida',11,4,36,'1991-05-05',364),
(52,'Los gozos y las sombras',11,4,26,'1992-04-03',456),
(53,'Don Quijote de la Mancha',11,1,59.5,'1990-03-02',392);

#DATOS ESCRIBE
INSERT INTO escribe VALUES 
(1,2),(1,29),(2,3),(2,13),(2,33),(3,4),(4,6),(4,22),(4,23),(5,7),(6,8),(7,9),(8,10),(9,11),(9,28),(10,12),
(11,14),(11,15),(12,17),(12,18),(12,19),(13,20),(14,21),(15,24),(15,25),(15,26),(16,27),(18,30),(19,31),
(19,32),(20,34),(20,35),(21,36),(22,37),(23,38),(24,39),(25,40),(26,42),(27,41),(28,43),(29,44),(29,45),
(29,46),(29,47),(30,48),(31,49),(31,50),(31,51),(32,52),(33,53);