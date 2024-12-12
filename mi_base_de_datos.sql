
-- Crear la base de datos
CREATE DATABASE mi_base_de_datos;


-- Crear la tabla "empleados"
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(100),
    salario NUMERIC(10, 2),
    fecha_contratacion DATE
);

-- Insertar algunos registros en la tabla "empleados"
INSERT INTO empleados (nombre, cargo, salario, fecha_contratacion) VALUES 
('Carlos López', 'Desarrollador Web', 3500.00, '2020-01-15'),
('María García', 'Diseñadora Gráfica', 3000.00, '2019-08-20'),
('Juan Martínez', 'Gerente de Proyectos', 5000.00, '2018-05-10'),
('Laura Rodríguez', 'Analista de Datos', 4000.00, '2021-03-05'),
('Pedro Sánchez', 'Administrador de Sistemas', 3800.00, '2022-09-12');

-- Crear la tabla "departamentos"
CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(200),
    telefono VARCHAR(20),
    responsable_id INTEGER REFERENCES empleados(id)
);

-- Insertar algunos registros en la tabla "departamentos"
INSERT INTO departamentos (nombre, ubicacion, telefono, responsable_id) VALUES 
('Desarrollo', 'Piso 3, Edificio Principal', '123456789', 1),
('Diseño', 'Piso 2, Edificio Principal', '987654321', 2),
('Gestión de Proyectos', 'Piso 4, Edificio Principal', '111222333', 3),
('Analítica', 'Piso 5, Edificio Principal', '444555666', 4),
('Tecnología de la Información', 'Piso 1, Edificio Principal', '777888999', 5);


select*from empleados;

select*from departamentos;


