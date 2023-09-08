-- Crear una nueva base de datos llamada "DBContactos"
CREATE DATABASE DBContactos

-- Usar la base de datos recién creada
USE DBContactos

-- Crear una tabla llamada "Contacto" para almacenar información de contactos
CREATE TABLE Contacto(
    IDContacto int identity,   -- Columna autoincremental para identificación única
    Nombre varchar(100),
    Apellido varchar(100),
    Telefono varchar(100),
    Correo varchar(100)
)

-- Insertar dos registros de ejemplo en la tabla "Contacto"
INSERT INTO Contacto(Nombre, Apellido, Telefono, Correo) values
('Walter', 'Coto', '12345', 'prueba@gmail.com'),
('Juan', 'Rodriguez', '6789', 'prueba2@outlook.es')

-- Seleccionar y mostrar todos los registros de la tabla "Contacto"
SELECT * FROM Contacto

-- Crear un procedimiento almacenado "sp_Crear" para agregar un nuevo contacto
CREATE PROCEDURE sp_Crear(
    @Nombre varchar(100),
    @Apellido varchar(100),
    @Telefono varchar(100),
    @Correo varchar(100)
)
AS
BEGIN
    -- Insertar un nuevo registro en la tabla "Contacto" con los valores proporcionados
    INSERT INTO Contacto(Nombre, Apellido, Telefono, Correo) values (@Nombre, @Apellido, @Telefono, @Correo)
END

-- Crear un procedimiento almacenado "sp_Actualizar" para actualizar información de contacto
CREATE PROCEDURE sp_Actualizar(
    @IDContacto int,
    @Nombre varchar(100),
    @Apellido varchar(100),
    @Telefono varchar(100),
    @Correo varchar(100)
)
AS
BEGIN
    -- Actualizar los valores de un registro en la tabla "Contacto" según el ID proporcionado
    UPDATE Contacto set Nombre = @Nombre, Apellido = @Apellido, Telefono = @Telefono, Correo = @Correo WHERE IDContacto = @IDContacto
END

-- Crear un procedimiento almacenado "sp_Eliminar" para eliminar un contacto por ID
CREATE PROCEDURE sp_Eliminar(
    @IDContacto int
)
AS
BEGIN
    -- Eliminar un registro de la tabla "Contacto" según el ID proporcionado
    DELETE FROM Contacto WHERE IDContacto = @IDContacto
END
