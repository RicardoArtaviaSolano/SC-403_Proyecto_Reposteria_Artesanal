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
  correo VARCHAR(50) NULL,
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
INSERT INTO ReposteriaDB.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'administrador','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Daniel', 'Forrester Mora',    'dforrester20549@ufide.ac.cr',    '4556-8978', 'https://media.licdn.com/dms/image/D4E35AQHly98DWxqY4g/profile-framedphoto-shrink_200_200/0/1685726644709?e=1702861200&v=beta&t=0-DjSkYAkUdiNu-8xbjEZ1lPff24xhzHzTDZUoa9Hd0',true),
(2,'cocinero','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Ricardo',  'Artavia Solano', 'rartavia50691@ufide.ac.cr', '5456-8789','https://media.licdn.com/dms/image/C4E03AQHNE2JKyjiUxg/profile-displayphoto-shrink_800_800/0/1618331455828?e=1707955200&v=beta&t=k5ATfX0KieuRhcB9eXhoeuBOMJlg2aFumCfv3wt1lx4',true),
(3,'repartidor','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Alexis', 'Diaz Navarro',     'adiaz70805@ufide.ac.cr',      '7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',true);

/*Se insertan 3 categorias de productos como ejemplo */
INSERT INTO ReposteriaDB.categoria (id_categoria, descripcion, ruta_imagen, activo)
VALUES
  (1, 'Pasteles', 'https://cdn2.cocinadelirante.com/1020x600/filters:format(webp):quality(75)/sites/default/files/images/2023/08/receta-de-pastel-de-chocolate-facil.jpg', 1),
  (2, 'Galletas Caseras', 'https://www.hogarmania.com/archivos/201211/recetas-galletas-xl-848x477x80xX.jpg', 1),
  (3, 'Postres', 'https://www.recetasnestlecam.com/sites/default/files/styles/crop_article_banner_desktop_nes/public/2023-02/postres-con-mango.jpg.webp?itok=c6AgNlbK', 1),
  (4, 'CupCakes', 'https://www.bhg.com/thmb/Zok-bTT9bFLmh-ar1WxQSS3kdLY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/how-to-bake-how-to-make-cupcakes-hero-01-12c03f3eff374d569b0565bff7d9e597.jpg', 1),
  (5, 'Panaderia', 'https://thefoodtech.com/wp-content/uploads/2021/12/sector-panaderia-828x548.jpg', 1);


/*Se insertan 4 productos por categoria */
INSERT INTO ReposteriaDB.producto (id_producto, id_categoria, descripcion, detalle, precio, existencias, ruta_imagen, activo)
VALUES
  (1, 1, 'Pastel de Chocolate', 'Delicioso pastel de chocolate con relleno de crema.', 20.99, 50, 'https://images.app.goo.gl/7UgSP6NPYcPCvPmc7', 1),
  (2, 1, 'Pastel de Fresa', 'Delicioso pastel de fresa con crema batida.', 18.99, 40, 'https://images.app.goo.gl/...', 1),
  (3, 2, 'Galletas de Avena', 'Galletas caseras de avena con pasas.', 8.99, 100, 'https://images.app.goo.gl/...', 1),
  (4, 3, 'Tiramisú', 'Tiramisú italiano con capas de café y crema.', 25.99, 30, 'https://images.app.goo.gl/...', 1),
  (5, 4, 'Cupcake de Vainilla', 'Cupcake esponjoso de vainilla con glaseado.', 3.99, 80, 'https://images.app.goo.gl/...', 1),
  (6, 5, 'Pan Artesanal', 'Pan fresco y crujiente hecho a mano.', 5.99, 60, 'https://images.app.goo.gl/...', 1),
  (7, 1, 'Pastel de Zanahoria', 'Pastel húmedo de zanahoria con nueces.', 22.99, 25, 'https://images.app.goo.gl/...', 1),
  (8, 2, 'Galletas de Chocolate', 'Galletas caseras de chocolate con chispas.', 10.99, 90, 'https://images.app.goo.gl/...', 1),
  (9, 3, 'Cheesecake de Fresa', 'Cheesecake cremoso con cobertura de fresa.', 28.99, 35, 'https://images.app.goo.gl/...', 1),
  (10, 4, 'Cupcake de Chocolate', 'Cupcake esponjoso de chocolate con ganache.', 4.99, 75, 'https://images.app.goo.gl/...', 1);

/*Se crean 6 facturas */   /*'Activa','Pagada','Anulada')*/
INSERT INTO ReposteriaDB.factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2022-01-05',211560,2),
(2,2,'2022-01-07',554340,2),
(3,3,'2022-01-07',871000,2),
(4,1,'2022-01-15',244140,1),
(5,2,'2022-01-17',414800,1),
(6,3,'2022-01-21',420000,1);

INSERT INTO ReposteriaDB.venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,45000,3),
(2,1,3,15780,2),
(3,1,4,15000,3),
(4,2,3,45000,1),
(5,2,1,154000,3),
(6,2,2,15780,3),
(7,3,4,154000,1),
(8,3,2,57000,1),
(9,3,3,330000,2),
(10,1,4,57000,2),
(11,1,5,27600,3),
(12,1,3,15780,3),
(13,2,4,27600,3),
(14,2,1,154000,2),
(15,2,2,24000,1),
(16,3,1,330000,1),
(17,3,2,45000,1),
(18,3,1,15000,3);

create table ReposteriaDB.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

insert into ReposteriaDB.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);