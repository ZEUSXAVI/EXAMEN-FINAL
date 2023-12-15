CREATE TABLE "Employees" (
	"EmployeeID" "int" PRIMARY KEY NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"Title" nvarchar (30) NULL ,
	"TitleOfCourtesy" nvarchar (25) NULL ,
	"BirthDate" "datetime" NULL ,
	"HireDate" "datetime" NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"HomePhone" nvarchar (24) NULL ,
	"Extension" nvarchar (4) NULL ,
	"Photo" "image" NULL ,
	"Notes" "ntext" NULL ,
	"ReportsTo" "int" NULL ,
	"PhotoPath" nvarchar (255) NULL 
)

CREATE TABLE [dbo].[Territories] 
	([TerritoryID] [nvarchar] (20) PRIMARY KEY NOT NULL ,
	[TerritoryDescription] [nchar] (50) NOT NULL ,
        [RegionID] [int] NOT NULL
)

CREATE TABLE TablaHechoEmpleadosTerritorios (
    EmployeeID INT,
    TerritoryID NVARCHAR(20),
    TipeJob NVARCHAR(50) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID),
    -- Añade otras claves foráneas según la estructura de tus tablas originales
    -- Las claves foráneas están asociadas a las tablas Employees y Territories con sus correspondientes columnas
    -- Esta clave foránea está asociada a la columna RegionID en la tabla Territories
);



--LLENAR DATOS

INSERT INTO nortmid.dbo.Employees
SELECT * 
FROM final.dbo.Employees

INSERT INTO nortmid.dbo.Territories
SELECT * 
FROM final.dbo.Territories


--TABLA DE HECHOS
INSERT INTO TablaHechoEmpleadosTerritorios (EmployeeID, TerritoryID, TipeJob)
SELECT e.EmployeeID, t.TerritoryID, 'programador'
FROM Employees e
CROSS JOIN Territories t;