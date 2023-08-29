CREATE TABLE ArticleMaster(
	CompanyCode varchar(10) NOT NULL,
	CompanyType varchar(1) NOT NULL,
	PONo varchar(40) NULL,
	ItemNo varchar(50)  NULL,
	ShipmentNo varchar(5)  NULL,
	POSeq bigint  NULL,
	DestCode varchar(5)  NULL,
	OrderDetailKey varchar(30) NULL,
	CategoryCode varchar(30) NULL,
	ItemDepth numeric(18, 3) NULL,
	ItemHeight numeric(18, 3) NULL,
	ItemWidth numeric(18, 3) NULL,
	ItemDesc varchar(256) NULL,
	UnitWeight decimal(18, 3) NULL,
	CartonType varchar(20) NULL,
	AssignedSupplier varchar(3999) NULL,
	SupplierType varchar(3999) NULL,
	Barcode varchar(3999) NULL,
	BarcodeType varchar(3999) NULL,
	Seller bigint NULL,
	InnerQuantity int NULL,
	InnerDepth numeric(18, 3) NULL,
	InnerHeight numeric(18, 3) NULL,
	InnerWidth numeric(18, 3) NULL,
	InnerGrossWeight numeric(18, 3) NULL,
	OuterQuantity int NULL,
	OuterDepth numeric(18, 3) NULL,
	OuterHeight numeric(18, 3) NULL,
	OuterWidth numeric(18, 3) NULL,
	OuterGrossWeight decimal(18, 3) NULL,
	DisplaySetFlat varchar(30) NULL,
	MembersQuantity varchar(3999) NULL,
	MembersItemId varchar(3999) NULL,
	ItemPrice numeric(18, 3) NULL,
	ProcurementRule varchar(10) NULL,
	Status varchar(1) NULL,
	CreatedBy varchar(10) NULL,
	CreatedOn datetime NULL,
	UpdatedBy varchar(10) NULL,
	UpdatedOn datetime NULL,
	StyleNo nvarchar(256) NULL,
	ColourCode nvarchar(256) NULL,
	Size nvarchar(256) NULL,
	StyleName nvarchar(256) NULL,
	ColourName nvarchar(256) NULL,
	Id bigint NOT NULL,
	RowVersion timestamp NULL
);

CREATE TABLE InventoryTransactions(
	Id bigint IDENTITY(1,1) NOT NULL,
	ArticleId bigint NOT NULL,
	POId bigint NULL,
	ShippingOrderNo varchar(50) NULL,
	BillOfLadingNo varchar(50) NULL,
	DocumentNo varchar(50) NULL,
	FromOrgId bigint NULL,
	FromInvLocId bigint NOT NULL,
	ToOrgId bigint NULL,
	ToInvLocId bigint NOT NULL,
	TransTypeCode int NOT NULL,
	TransDate datetime2(7) NOT NULL,
	NoOfPackage int NULL,
	PackageUOM int NULL,
	Quantity int NOT NULL,
	QuantityUOM int NULL,
	VolumeCBM decimal(18, 4) NULL,
	GrossWeightKgs decimal(18, 2) NULL,
	Remarks text NULL,
	CreatedBy nvarchar(256) NOT NULL,
	CreatedDate datetime2(7) NOT NULL);
	
CREATE TABLE Locations(
	Id bigint NOT NULL,
	RowVersion timestamp NOT NULL,
	CreatedBy varchar(128) NULL,
	CreatedDate datetime2(7) NOT NULL,
	UpdatedBy varchar(128) NULL,
	UpdatedDate datetime2(7) NULL,
	Name nvarchar(128) NULL,
	CountryId bigint NOT NULL,
	EdiSonPortCode nvarchar(128) NULL,
	LocationDescription nvarchar(128) NOT NULL
);

CREATE TABLE [InvTransactions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransTypeId] [int] NOT NULL,
	[ArticleId] [bigint] NOT NULL,
	[POId] [bigint] NULL,
	[PrincipleId] [bigint] NOT NULL,
	[WarehouseId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[QuantityUOM] [int] NULL,
	[CreatedBy] [nvarchar](256) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL
);

CREATE TABLE Organizations(
	Id bigint NOT NULL,
	RowVersion timestamp NOT NULL,
	CreatedBy varchar(128) NULL,
	CreatedDate datetime2(7) NOT NULL,
	UpdatedBy varchar(128) NULL,
	UpdatedDate datetime2(7) NULL,
	Code varchar(35) NOT NULL,
	Name nvarchar(250) NOT NULL,
	ContactEmail varchar(128) NULL,
	ContactName nvarchar(256) NULL,
	ContactNumber varchar(32) NULL,
	Address nvarchar(500) NULL,
	EdisonInstanceId nvarchar(32) NULL,
	EdisonCompanyCodeId nvarchar(32) NULL,
	CustomerPrefix varchar(5) NULL,
	LocationId bigint NULL,
	OrganizationType int NOT NULL,
	ParentId varchar(256) NULL,
	Status int NOT NULL,
	IsBuyer bit NOT NULL,
	AdminUser text NULL,
	WebsiteDomain text NULL,
	AddressLine2 nvarchar(50) NULL,
	AddressLine3 nvarchar(50) NULL,
	AddressLine4 nvarchar(50) NULL,
	OrganizationLogo text NULL,
	AgentType int NULL
) ;

CREATE TABLE TransTypes(
	Id int IDENTITY(1,1) NOT NULL,
	Code nvarchar(100) NOT NULL,
	Description text NULL);
	
CREATE TABLE WarehouseAssignments(
	WarehouseLocationId bigint NOT NULL,
	OrganizationId bigint NOT NULL,
	RowVersion timestamp NOT NULL,
	CreatedBy varchar(128) NULL,
	CreatedDate datetime2(7) NOT NULL,
	UpdatedBy varchar(128) NULL,
	UpdatedDate datetime2(7) NULL,
	ContactEmail nvarchar(128) NULL,
	ContactPerson nvarchar(256) NULL,
	ContactPhone nvarchar(32) NULL
);	

CREATE TABLE WarehouseLocations(
	Id bigint NOT NULL,
	RowVersion timestamp NOT NULL,
	CreatedBy varchar(128) NULL,
	CreatedDate datetime2(7) NOT NULL,
	UpdatedBy varchar(128) NULL,
	UpdatedDate datetime2(7) NULL,
	Code nvarchar(128) NOT NULL,
	Name nvarchar(128) NOT NULL,
	AddressLine1 nvarchar(256) NOT NULL,
	AddressLine2 nvarchar(256) NULL,
	AddressLine3 nvarchar(256) NULL,
	AddressLine4 nvarchar(256) NULL,
	ContactPerson nvarchar(256) NULL,
	ContactPhone nvarchar(32) NULL,
	ContactEmail nvarchar(128) NULL,
	LocationId bigint NOT NULL,
	OrganizationId bigint NOT NULL,
	Remarks nvarchar(512) NULL,
	WorkingHours nvarchar(512) NULL
);

create table InvTransactionAdditional (
	Id bigint primary key references InvTransactions(Id),
	PoNumber nvarchar(50) null,
	SoNumber nvarchar(50) null,
	BLNumber nvarchar(50) null,
	DocumentNumber nvarchar(50) null,
	NoOfPackage int null,
	PackageUOM int null,
	VolumneCBM decimal(18, 4) null,
	GrossWeightKgs decimal(18, 2) null,
	Remarks text null
);