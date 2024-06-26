USE [SupermarketScan]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Categori__A3C02A10A98E5AAF] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaisOrigen]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaisOrigen](
	[IdPaisOrigen] [int] IDENTITY(1,1) NOT NULL,
	[NombrePais] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__PaisOrig__3712CD21B8989244] PRIMARY KEY CLUSTERED 
(
	[IdPaisOrigen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[IdPaisOrigen] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Peso] [decimal](10, 2) NULL,
	[ValorEnergetico] [decimal](10, 2) NULL,
	[Grasas] [decimal](10, 2) NULL,
	[HidratosDeCarbono] [decimal](10, 2) NULL,
	[Fibra] [decimal](10, 2) NULL,
	[Proteinas] [decimal](10, 2) NULL,
	[Sal] [decimal](10, 2) NULL,
	[Imagen] [nvarchar](max) NULL,
	[CodigoBarras] [nvarchar](50) NULL,
 CONSTRAINT [PK__Producto__09889210927295B0] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductosVistaDetalle]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE VIEW 
                    [dbo].[ProductosVistaDetalle] AS
                SELECT 
                    pro.CodigoBarras,
                    pro.Imagen, 
                    pro.Nombre, 
                    CONCAT(CAST(pro.Peso AS NVARCHAR(10)), ' Kg - ', pro.Descripcion) AS Descripcion,
                    pro.Precio, 
                    CAST(pro.Precio/pro.Peso AS DECIMAL(10, 2)) AS PrecioPorKg,
                    pro.ValorEnergetico, 
                    pro.Grasas, 
                    pro.HidratosDeCarbono, 
                    pro.Fibra, 
                    pro.Proteinas, 
                    pro.Sal,
                    c.NombreCategoria,
                    p.NombrePais
                FROM Productos pro
                    INNER JOIN Categorias c ON c.IdCategoria = pro.IdCategoria
                    INNER JOIN PaisOrigen p ON p.IdPaisOrigen = pro.IdPaisOrigen;
                
GO
/****** Object:  View [dbo].[ProductosVistaBase]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE VIEW 
                    [dbo].[ProductosVistaBase] AS
                SELECT 
                    pro.CodigoBarras,
                    pro.Imagen, 
                    pro.Nombre, 
                    CONCAT(CAST(pro.Peso AS NVARCHAR(10)), ' Kg - ', pro.Descripcion) AS Descripcion, 
                    pro.Precio, 
                    CAST(pro.Precio/pro.Peso AS DECIMAL(10, 2)) AS PrecioPorKg
                FROM Productos pro;
                
GO
/****** Object:  View [dbo].[ProductosVistaNutricional]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                CREATE VIEW 
                    [dbo].[ProductosVistaNutricional] AS
                SELECT 
                    pro.CodigoBarras,
                    pro.ValorEnergetico, 
                    CAST((pro.ValorEnergetico / ref.ValorEnergeticoRef) * 100 AS DECIMAL(10, 1)) AS PorcentajeValorEnergetico,
                    pro.Grasas, 
                    CAST((pro.Grasas / ref.GrasasRef) * 100 AS DECIMAL(10, 1)) AS PorcentajeGrasas,
                    pro.HidratosDeCarbono, 
                    CAST((pro.HidratosDeCarbono / ref.HidratosDeCarbonoRef) * 100 AS DECIMAL(10, 1)) AS PorcentajeHidratosDeCarbono,
                    pro.Fibra, 
                    CAST((pro.Fibra / ref.FibraRef) * 100 AS DECIMAL(10, 1)) AS PorcentajeFibra,
                    pro.Proteinas, 
                    CAST((pro.Proteinas / ref.ProteinasRef) * 100 AS DECIMAL(10, 1)) AS PorcentajeProteinas,
                    pro.Sal,
                    CAST((pro.Sal / ref.SalRef) * 100 AS DECIMAL(10, 1)) AS PorcentajeSal
                FROM Productos pro
                CROSS APPLY dbo.GetIngestaReferencia() ref
                
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngestaReferencia]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngestaReferencia](
	[IdIngestaRef] [int] IDENTITY(1,1) NOT NULL,
	[ValorEnergeticoRef] [decimal](10, 2) NOT NULL,
	[GrasasRef] [decimal](10, 2) NOT NULL,
	[HidratosDeCarbonoRef] [decimal](10, 2) NOT NULL,
	[FibraRef] [decimal](10, 2) NOT NULL,
	[ProteinasRef] [decimal](10, 2) NOT NULL,
	[SalRef] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__IngestaR__8A694C36C7CADB33] PRIMARY KEY CLUSTERED 
(
	[IdIngestaRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/05/2024 20:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Contraseña] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Usuarios__5B65BF975C327E27] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK__Productos__IdCat__44FF419A] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK__Productos__IdCat__44FF419A]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK__Productos__IdPai__440B1D61] FOREIGN KEY([IdPaisOrigen])
REFERENCES [dbo].[PaisOrigen] ([IdPaisOrigen])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK__Productos__IdPai__440B1D61]
GO
