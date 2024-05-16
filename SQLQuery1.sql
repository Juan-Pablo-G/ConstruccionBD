-- Crear la base de datos
CREATE DATABASE Tienda;

-- Usar la base de datos
USE Tienda;

-- Crear la tabla Persona
CREATE TABLE Persona (
    PersonaID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Edad INT,
    Ciudad VARCHAR(100)
);

-- Crear la tabla Producto
CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio DECIMAL(10, 2),
    Stock INT
);

-- Crear la tabla Venta
CREATE TABLE Venta (
    VentaID INT PRIMARY KEY,
    PersonaID INT,
    ProductoID INT,
    Cantidad INT,
    FechaVenta DATE,
    FOREIGN KEY (PersonaID) REFERENCES Persona(PersonaID),
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

-- Insertar algunos datos de ejemplo en las tablas

-- Insertar datos en la tabla Persona
INSERT INTO Persona (PersonaID, Nombre, Edad, Ciudad)
VALUES 
(1, 'Juan', 25, 'Madrid'),
(2, 'Ana', 30, 'Barcelona'),
(3, 'Pedro', 28, 'Sevilla');

-- Insertar datos en la tabla Producto
INSERT INTO Producto (ProductoID, Nombre, Precio, Stock)
VALUES
(1, 'Camisa', 20.00, 50),
(2, 'Pantalón', 30.00, 40),
(3, 'Zapatos', 50.00, 30);

-- Insertar datos en la tabla Venta
INSERT INTO Venta (VentaID, PersonaID, ProductoID, Cantidad, FechaVenta)
VALUES
(1, 1, 1, 2, '2024-05-01'),
(2, 2, 2, 1, '2024-05-02'),
(3, 3, 3, 1, '2024-05-03');

-- Consultas sobre las tablas

-- 1. Mostrar todas las personas
SELECT * FROM Persona;

-- 2. Mostrar todos los productos
SELECT * FROM Producto;

-- 3. Mostrar todas las ventas
SELECT * FROM Venta;

-- 4. Mostrar las ventas realizadas por una persona específica (por ejemplo, PersonaID = 1)
SELECT * FROM Venta WHERE PersonaID = 1;

-- 5. Mostrar el total de ventas por persona
SELECT Persona.Nombre, SUM(Producto.Precio * Venta.Cantidad) AS TotalVentas
FROM Persona
JOIN Venta ON Persona.PersonaID = Venta.PersonaID
JOIN Producto ON Venta.ProductoID = Producto.ProductoID
GROUP BY Persona.Nombre;

-- 6. Mostrar los productos que están agotados (Stock = 0)
SELECT * FROM Producto WHERE Stock = 0;

-- 7. Mostrar las ventas de un producto específico (por ejemplo, ProductoID = 1)
SELECT * FROM Venta WHERE ProductoID = 1;

-- 8. Mostrar el promedio de edad de todas las personas
SELECT AVG(Edad) AS PromedioEdad FROM Persona;

-- 9. Mostrar las ventas realizadas en una fecha específica (por ejemplo, '2024-05-01')
SELECT * FROM Venta WHERE FechaVenta = '2024-05-01';

-- 10. Mostrar las ventas realizadas por una persona en una fecha específica (por ejemplo, PersonaID = 2 y FechaVenta = '2024-05-02')
SELECT * FROM Venta WHERE PersonaID = 2 AND FechaVenta = '2024-05-02';
