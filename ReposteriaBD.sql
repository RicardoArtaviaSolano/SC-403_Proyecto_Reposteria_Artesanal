drop schema if exists ReposteriaDB;
drop user if exists administrador;


CREATE SCHEMA ReposteriaDB;

/*Se crea un usuario para la base de datos llamado "usuario_prueba" y tiene la contraseña "Usuario_Clave."*/
create user 'administrador'@'%' identified by '123-admin';

/*Se asignan los prvilegios sobr ela base de datos TechShop al usuario creado */
grant all privileges on ReposteriaDB.* to 'administrador'@'%';
flush privileges;

/* la tabla de categoria contiene categorias de productos*/
create table ReposteriaDB.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table ReposteriaDB.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de clientes llamada cliente... igual que la clase Cliente */
CREATE TABLE ReposteriaDB.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table ReposteriaDB.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table ReposteriaDB.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_factura (id_factura) references factura(id_factura),
  foreign key fk_ventas_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se insertan 3 registros en la tabla cliente como ejemplo */
/*INSERT INTO ReposteriaDB.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'juan','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan', 'Castro Mora',    'jcastro@gmail.com',    '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true),
(2,'rebeca','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Rebeca',  'Contreras Mora', 'acontreras@gmail.com', '5456-8789','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',true),
(3,'pedro','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Pedro', 'Mena Loria',     'lmena@gmail.com',      '7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',true);*/

/*Se insertan 3 categorias de productos como ejemplo */
INSERT INTO ReposteriaDB.categoria (id_categoria, descripcion, ruta_imagen, activo)
VALUES
  (1, 'Pasteles', 'categoria_pasteles.jpg', 1),
  (2, 'Galletas', 'categoria_galletas.jpg', 1),
  (3, 'Bollería', 'categoria_bolleria.jpg', 1),
  (4, 'Cupcakes', 'categoria_cupcakes.jpg', 1),
  (5, 'Tartas', 'categoria_tartas.jpg', 1),
  (6, 'Brownies', 'categoria_brownies.jpg', 1),
  (7, 'Magdalenas', 'categoria_magdalenas.jpg', 1),
  (8, 'Panadería', 'categoria_panaderia.jpg', 1),
  (9, 'Postres Especiales', 'categoria_postres_especiales.jpg', 1),
  (10, 'Sin Gluten', 'categoria_sin_gluten.jpg', 1);

/*Se insertan 4 productos por categoria */
INSERT INTO ReposteriaDB.producto (id_producto, id_categoria, descripcion, detalle, precio, existencias, ruta_imagen, activo)
VALUES
  (1, 1, 'Pastel de Chocolate', 'Delicioso pastel de chocolate con relleno de crema.', 20.99, 50, 'pastel_chocolate.jpg', 1),
  (2, 1, 'Tarta de Fresa', 'Tarta fresca de fresa con cobertura de crema batida.', 18.99, 40, 'tarta_fresa.jpg', 1),
  (3, 2, 'Galletas de Mantequilla', 'Galletas caseras de mantequilla perfectas para el té.', 8.99, 100, 'galletas_mantequilla.jpg', 1),
  (4, 2, 'Cupcakes de Vainilla', 'Cupcakes de vainilla con decoraciones coloridas.', 12.99, 60, 'cupcakes_vainilla.jpg', 1),
  (5, 3, 'Croissants de Chocolate', 'Deliciosos croissants rellenos de chocolate.', 6.99, 80, 'croissants_chocolate.jpg', 1),
  (6, 3, 'Éclair de Café', 'Éclair relleno de crema de café y cubierto de chocolate.', 9.99, 30, 'eclair_cafe.jpg', 1),
  (7, 1, 'Tarta de Limón', 'Tarta refrescante de limón con merengue.', 17.99, 35, 'tarta_limon.jpg', 1),
  (8, 2, 'Magdalenas de Arándanos', 'Magdalenas esponjosas con arándanos frescos.', 7.99, 70, 'magdalenas_arandanos.jpg', 1),
  (9, 3, 'Brownies de Nuez', 'Brownies de chocolate con nueces crujientes.', 11.99, 45, 'brownies_nuez.jpg', 1),
  (10, 1, 'Tarta de Manzana', 'Tarta de manzana con canela y crujiente de almendras.', 19.99, 25, 'tarta_manzana.jpg', 1);

/*Se crean 6 facturas */   /*'Activa','Pagada','Anulada')*/
/*INSERT INTO ReposteriaDB.factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2022-01-05',211560,2),
(2,2,'2022-01-07',554340,2),
(3,3,'2022-01-07',871000,2),
(4,1,'2022-01-15',244140,1),
(5,2,'2022-01-17',414800,1),
(6,3,'2022-01-21',420000,1);*/

/*INSERT INTO ReposteriaDB.venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,45000,3),
(2,1,9,15780,2),
(3,1,10,15000,3),
(4,2,5,45000,1),
(5,2,14,154000,3),
(6,2,9,15780,3),
(7,3,14,154000,1),
(8,3,6,57000,1),
(9,3,15,330000,2),
(10,1,6,57000,2),
(11,1,8,27600,3),
(12,1,9,15780,3),
(13,2,8,27600,3),
(14,2,14,154000,2),
(15,2,3,24000,1),
(16,3,15,330000,1),
(17,3,12,45000,1),
(18,3,10,15000,3);*/

/*create table ReposteriaDB.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;*/

/*insert into ReposteriaDB.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);*/