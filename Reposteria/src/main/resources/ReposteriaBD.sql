
drop schema if exists ReposteriaDB;
drop user if exists administrador;

CREATE SCHEMA ReposteriaDB;
USE ReposteriaDB;
create user 'administrador'@'%' identified by '123-admin';
grant all privileges on ReposteriaDB.* to 'administrador'@'%';
flush privileges;

CREATE TABLE ReposteriaDB.Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Categoria VARCHAR(50),
    Imagen VARCHAR(255),
    activo bool
);

CREATE TABLE ReposteriaDB.Ventas (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Cliente VARCHAR(100),
    Total DECIMAL(10, 2) NOT NULL,
    activo bool
);

CREATE TABLE ReposteriaDB.DetalleVentas (
    VentaID INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),

    activo bool
);

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

INSERT INTO Productos (Nombre, Descripcion, Precio, Stock, Categoria, Imagen)
VALUES
    ('Pastel de Chocolate', 'Delicioso pastel de chocolate casero', 4200, 20, 'Pasteles', 'imagen_pastel_chocolate.jpg'),
    ('Cupcakes de Vainilla', 'Mini cupcakes de vainilla con frosting', 5200, 30, 'Cupcakes', 'imagen_cupcakes_vainilla.jpg'),
    ('Galletas de Mantequilla', 'Crujientes galletas de mantequilla', 4900, 40, 'Galletas', 'imagen_galletas_mantequilla.jpg'),
    ('Tarta de Manzana', 'Tarta clásica de manzana con canela', 10200, 15, 'Tartas', 'imagen_tarta_manzana.jpg'),
    ('Donas Glaseadas', 'Donas esponjosas con glaseado de colores', 9300, 25, 'Donas', 'imagen_donas_glaseadas.jpg'),
    ('Crepas de Nutella', 'Crepas rellenas de Nutella y plátano', 4900, 20, 'Crepas', 'imagen_crepas_nutella.jpg'),
    ('Brownies de Nuez', 'Brownies densos con nueces y chocolate', 11000, 18, 'Brownies', 'imagen_brownies_nuez.jpg'),
    ('Muffins de Arándanos', 'Muffins esponjosos con arándanos frescos', 11100, 30, 'Muffins', 'imagen_muffins_arandanos.jpg'),
    ('Tarta de Limón', 'Tarta de limón con merengue tostado', 13100, 12, 'Tartas', 'imagen_tarta_limon.jpg'),
    ('Cookies de Chocolate', 'Cookies con trozos de chocolate', 5200, 35, 'Galletas', 'imagen_cookies_chocolate.jpg');

INSERT INTO Ventas (Fecha, Cliente, Total)
VALUES ('2023-10-27', 'Cliente Anónimo', 25.99);

INSERT INTO DetalleVentas (VentaID, ProductoID, Cantidad)
VALUES (1, 1, 2); -- Agrega 2 pasteles de chocolate a la primera venta.

SELECT * FROM Productos;

SELECT * FROM Ventas;
