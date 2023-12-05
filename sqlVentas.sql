CREATE DATABASE PuntoVenta


CREATE TABLE ROL(
Id_Rol			int primary key identity,
Descripcion		varchar(50),
Fecha_Registro	datetime default getdate()
)

CREATE TABLE PERMISO(
Id_Permiso		int primary key identity,
Id_Rol			int references ROL(Id_Rol),
Nombre_Menu		varchar(100),
Fecha_Registro	datetime default getdate()
)

CREATE TABLE PROVEEDOR(
Id_Proveedor	int primary key identity,
Documento		varchar(50),
Razon_Social	varchar(50),
Correo			varchar(50),
Telefono		varchar(50),
Estado			bit,
Fecha_Registro	datetime default getdate()
)

CREATE TABLE CLIENTE(
Id_Cliente		int primary key identity,
Documento		varchar(50),
Nombre_Completo	varchar(50),
Correo			varchar(50),
Telefono		varchar(50),
Estado			bit,
Fecha_Registro	datetime default getdate()
)

CREATE TABLE USUARIO(
Id_Usuario	int primary key identity,
Documento		varchar(50),
Nombre_Completo	varchar(50),
Correo			varchar(50),
Clave			varchar(50),
Id_Rol			int references ROL(Id_Rol),
Estado			bit,
Fecha_Registro	datetime default getdate()
)

INSERT INTO USUARIO(Documento,Nombre_Completo,Correo,Clave,Id_Rol,Estado)
	VALUES	('1','Estefania Trujillo','Fanny_elizondo23@outlook.es','1234',1,1)

	SELECT * FROM USUARIO

CREATE TABLE CATEGORIA(
Id_Categoria	int primary key identity,
Descripcion		varchar(100),
Estado			bit,
Fecha_Registro	datetime default getdate()
)

CREATE TABLE PRODUCTO(
Id_Producto		int primary key identity,
Codigo			varchar(50),
Nombre			varchar(50),
Descripcion		varchar(50),
Id_Categoria	int references CATEGORIA(Id_Categoria),
Stock			int not null default 0,
Precio_Compra	decimal(10,2) default 0,
Precio_Venta	decimal(10,2) default 0,
Estado			bit,
Fecha_Registro	datetime default getdate()
)

CREATE TABLE COMPRA(
Id_Compra		int primary key identity,
Id_Usuario		int references USUARIO(Id_Usuario),
Id_Proveedor	int references PROVEEDOR(Id_Proveedor),
Tipo_Documento	varchar(50),
Numero_Documento varchar(50),
Monto_Total		decimal(10,2),
Fecha_Registro	datetime default getdate()
)

CREATE TABLE DETALLE_COMPRA(
Id_Detalle_Compra	int primary key identity,
Id_Compra		int	references COMPRA(Id_Compra),
Id_Producto		int references PRODUCTO(Id_Producto),
Precio_Compra	decimal(10,2),
Precio_Venta	decimal(10,2),
Cantidad		int,
Monto_Total		decimal(10,2),
Fecha_Registro	datetime default getdate()
)

CREATE TABLE VENTA(
Id_Venta		int primary key identity,
Id_Usuario		int references USUARIO(Id_Usuario),
Tipo_Documento	varchar(50),
Numero_Documento varchar(50),
Documento_Cliente varchar(50),
Nombre_Cliente	varchar(100),
Monto_Pago		decimal(10,2),
Monto_Cambio	decimal(10,2),
Monto_Total		decimal(10,2),
Fecha_Registro	datetime default getdate()
)

CREATE TABLE DETALLE_VENTA(
Id_Detalle_Venta	int primary key identity,
Id_Venta		int	references VENTA(Id_Venta),
Id_Producto		int references PRODUCTO(Id_Producto),
Precio_Venta	decimal(10,2),
Cantidad		int,
Monto_Total		decimal(10,2),
Fecha_Registro	datetime default getdate()
)