-- Ejercicio 1: Gestión de una Biblioteca
-- Crear la base de datos y las tablas

CREATE DATABASE gestion_biblioteca;

\c gestion_biblioteca; 

CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE libros (
    id_libro SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_autor INT REFERENCES autores(id_autor)
);

CREATE TABLE lectores (
    id_lector SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE prestamos (
    id_prestamo SERIAL PRIMARY KEY,
    id_libro INT REFERENCES libros(id_libro),
    id_lector INT REFERENCES lectores(id_lector),
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE
);


-------------------------

INSERT INTO autores (nombre) VALUES
('Gabriel García Márquez'),
('George Orwell'),
('Jane Austen'),
('Antoine de Saint-Exupéry');

INSERT INTO libros (titulo, id_autor) VALUES
('Cien años de soledad', 1),
('1984', 2),
('Orgullo y prejuicio', 3),
('El principito', 4);

INSERT INTO lectores (nombre) VALUES
('Juan Pérez'),
('María Gómez'),
('Ana López'),
('Carlos Fernández');

INSERT INTO prestamos (id_libro, id_lector, fecha_prestamo, fecha_devolucion) VALUES
(1, 1, '2024-09-15', '2024-09-20'),
(2, 2, '2024-09-18', NULL),
(3, 3, '2024-09-20', '2024-09-25'),
(1, 4, '2024-09-22', NULL),
(4, 1, '2024-09-25', '2024-09-30');


------------------
-- Consigna

-- Realiza las siguientes consultas utilizando los conceptos enseñados:

-- a) Muestra el nombre del lector, el título del libro y las fechas de préstamo y devolución, usando un INNER JOIN para los registros donde hay coincidencia.
-- b) Muestra todos los lectores, incluso si no tienen un préstamo registrado, utilizando un LEFT JOIN.
-- c) Muestra todos los libros, incluso si no han sido prestados, utilizando un RIGHT JOIN.
-- d) Utiliza un FULL JOIN para mostrar todos los libros y lectores, incluso si no hay coincidencia entre ellos.
-- e) Calcula cuántos préstamos ha hecho cada lector, ordenando los resultados por la cantidad de préstamos de mayor a menor.
-- f) Muestra la cantidad de préstamos por cada libro, pero solo aquellos libros que han sido prestados más de una vez.
-- g) Muestra los libros prestados después del 01/09/2024, agrupados por el autor, y ordénalos por la fecha de préstamo.


-- Ejercicio 2: Gestión de Ventas en una Tienda
-- Crear la base de datos y las tablas

CREATE DATABASE gestion_ventas;

\c gestion_ventas; 

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    id_producto INT REFERENCES productos(id_producto),
    cantidad INT NOT NULL,
    fecha_venta DATE NOT NULL
);

------------------------
INSERT INTO productos (nombre, precio) VALUES
('Laptop', 1000.00),
('Celular', 800.00),
('Tablet', 400.00),
('Auriculares', 50.00);

INSERT INTO clientes (nombre) VALUES
('Lucas Gutiérrez'),
('Sofía Rodríguez'),
('Marcos Pérez'),
('Elena Díaz');

INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
(1, 1, 2, '2024-10-05'),
(2, 2, 1, '2024-10-06'),
(1, 3, 1, '2024-10-07'),
(3, 1, 1, '2024-10-08'),
(4, 4, 5, '2024-10-09');



-- Consigna

-- Realiza las siguientes consultas para practicar los conceptos vistos:

-- a) Muestra el nombre del cliente, el producto y la cantidad vendida, utilizando un INNER JOIN.
-- b) Lista todos los productos, incluso si no han sido vendidos, utilizando un LEFT JOIN.
-- c) Muestra todas las ventas realizadas, incluso si no hay cliente asociado, usando un RIGHT JOIN.
-- d) Calcula el total vendido por cada cliente y ordena los resultados de mayor a menor.
-- e) Muestra los productos que han sido vendidos más de una vez.
-- f) Agrupa las ventas por mes y muestra la cantidad total de productos vendidos en cada mes.
