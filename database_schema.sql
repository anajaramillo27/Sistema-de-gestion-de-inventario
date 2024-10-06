-- Script SQL para el Sistema de Gestión de Inventarios

-- Creación de la tabla Proveedor
CREATE TABLE Proveedor (
    ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Contacto VARCHAR(50),
    Correo VARCHAR(100)
);

-- Creación de la tabla Producto
CREATE TABLE Producto (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50),
    Precio DECIMAL(10, 2) NOT NULL,
    Cantidad_Stock INT NOT NULL,
    Descripcion TEXT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- Creación de la tabla Usuario
CREATE TABLE Usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Rol ENUM('Administrador', 'Vendedor') NOT NULL,
    Contrasena VARCHAR(255) NOT NULL
);

-- Creación de la tabla Venta
CREATE TABLE Venta (
    ID_Venta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Creación de la tabla Detalle_Venta
CREATE TABLE Detalle_Venta (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- Ejemplo de inserción de datos
INSERT INTO Proveedor (Nombre, Contacto, Correo) VALUES ('Proveedor 1', '123-4567', 'proveedor1@example.com');
INSERT INTO Producto (Nombre, Categoria, Precio, Cantidad_Stock, Descripcion, ID_Proveedor) 
VALUES ('Producto A', 'Categoría 1', 19.99, 50, 'Descripción del Producto A', 1);

-- Consultar todos los productos
SELECT * FROM Producto;

-- Borrar un producto por su ID
DELETE FROM Producto WHERE ID_Producto = 1;
