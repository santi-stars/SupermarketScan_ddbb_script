SET IDENTITY_INSERT [dbo].[Usuarios] ON
INSERT INTO [dbo].[Usuarios] ([IdUsuario], [Nombre], [Telefono], [Email], [Contraseña]) VALUES (2, N'pepotetos', N'654765645', N'3432423@tret.com', N'pepita')
INSERT INTO [dbo].[Usuarios] ([IdUsuario], [Nombre], [Telefono], [Email], [Contraseña]) VALUES (3, N'Manuela', N'654895645', N'toy32423@tret.com', N'manumanuelita')
INSERT INTO [dbo].[Usuarios] ([IdUsuario], [Nombre], [Telefono], [Email], [Contraseña]) VALUES (4, N'Federin', N'674895645', N'notoy32423@tret.com', N'federino')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF

SET IDENTITY_INSERT [dbo].[PaisOrigen] ON
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (1, N'Estados Unidos')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (2, N'China')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (3, N'India')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (4, N'Brasil')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (5, N'Rusia')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (6, N'Alemania')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (7, N'Indonesia')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (8, N'Reino Unido')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (9, N'Francia')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (10, N'Italia')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (11, N'Canadá')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (12, N'Australia')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (13, N'España')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (14, N'México')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (15, N'Corea del Sur')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (16, N'Turquía')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (17, N'Arabia Saudita')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (18, N'Suiza')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (19, N'Países Bajos')
INSERT INTO [dbo].[PaisOrigen] ([IdPaisOrigen], [NombrePais]) VALUES (20, N'Polonia')
SET IDENTITY_INSERT [dbo].[PaisOrigen] OFF

SET IDENTITY_INSERT [dbo].[Categorias] ON
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (1, N'Frutas y verduras')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (2, N'Carnes y aves')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (3, N'Pescados y mariscos')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (4, N'Panadería y repostería')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (5, N'Lácteos y huevos')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (6, N'Congelados')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (7, N'Alimentos enlatados y conservas')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (8, N'Snacks y golosinas')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (9, N'Bebidas')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (10, N'Productos de despensa')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (11, N'Alimentos de dieta y salud')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (12, N'Comida preparada')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (13, N'Artículos de limpieza')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (14, N'Higiene y cuidado personal')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (15, N'Productos para bebés')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (16, N'Mascotas')
INSERT INTO [dbo].[Categorias] ([IdCategoria], [NombreCategoria]) VALUES (17, N'Bebidas alcohólicas')
SET IDENTITY_INSERT [dbo].[Categorias] OFF

SET IDENTITY_INSERT [dbo].[IngestaReferencia] ON
INSERT INTO [dbo].[IngestaReferencia] ([IdIngestaRef], [ValorEnergeticoRef], [GrasasRef], [HidratosDeCarbonoRef], [FibraRef], [ProteinasRef], [SalRef]) VALUES (1, 2000, 66, 260, 90, 50, 6)
SET IDENTITY_INSERT [dbo].[IngestaReferencia] OFF

SET IDENTITY_INSERT [dbo].[Productos] ON
INSERT INTO [dbo].[Productos] ([IdProducto], [IdPaisOrigen], [IdCategoria], [Nombre], [Descripcion], [Precio], [Peso], [ValorEnergetico], [Grasas], [HidratosDeCarbono], [Fibra], [Proteinas], [Sal], [Imagen], [CodigoBarras]) VALUES (1, 14, 10, N'Arroz blanco', N'Arroz blanco de grano largo', CAST(1.49 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(129.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(28.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'', N'8480000050441')
INSERT INTO [dbo].[Productos] ([IdProducto], [IdPaisOrigen], [IdCategoria], [Nombre], [Descripcion], [Precio], [Peso], [ValorEnergetico], [Grasas], [HidratosDeCarbono], [Fibra], [Proteinas], [Sal], [Imagen], [CodigoBarras]) VALUES (2, 5, 5, N'Leche entera', N'Leche entera fresca', CAST(1.29 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(66.00 AS Decimal(10, 2)), CAST(3.60 AS Decimal(10, 2)), CAST(4.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(3.30 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), N'', N'8431876013405')
INSERT INTO [dbo].[Productos] ([IdProducto], [IdPaisOrigen], [IdCategoria], [Nombre], [Descripcion], [Precio], [Peso], [ValorEnergetico], [Grasas], [HidratosDeCarbono], [Fibra], [Proteinas], [Sal], [Imagen], [CodigoBarras]) VALUES (3, 14, 10, N'Huevos', N'Huevos muy gordos y muy ricos', CAST(1.69 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(290.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), CAST(230.00 AS Decimal(10, 2)), CAST(0.60 AS Decimal(10, 2)), CAST(2.70 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'', N'8420964120132')
INSERT INTO [dbo].[Productos] ([IdProducto], [IdPaisOrigen], [IdCategoria], [Nombre], [Descripcion], [Precio], [Peso], [ValorEnergetico], [Grasas], [HidratosDeCarbono], [Fibra], [Proteinas], [Sal], [Imagen], [CodigoBarras]) VALUES (4, 13, 10, N'Cous cous', N'Rico y saludable cous cous fácil de hacer', CAST(1.99 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(333.00 AS Decimal(10, 2)), CAST(0.06 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(0.90 AS Decimal(10, 2)), N'', N'8011033012108')
SET IDENTITY_INSERT [dbo].[Productos] OFF
