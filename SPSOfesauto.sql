USE [Ofesauto]
GO
/****** Object:  User [IIS APPPOOL\AdministrationManager]    Script Date: 9/06/2021 9:13:14 a. m. ******/
CREATE USER [IIS APPPOOL\AdministrationManager] FOR LOGIN [IIS APPPOOL\AdministrationManager] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\AdministrationManager]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\AdministrationManager]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\AdministrationManager]
GO
/****** Object:  Table [dbo].[ActionsHistory]    Script Date: 9/06/2021 9:13:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionsHistory](
	[ActionHistoryId] [int] NOT NULL,
	[OfesautoProcessId] [int] NOT NULL,
	[StateId] [tinyint] NOT NULL,
	[Observations] [nvarchar](max) NOT NULL,
	[AttachmentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimProcessorId] [int] NULL,
	[ActionDate] [datetime] NOT NULL,
	[ActionTypeId] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DeclareVAActions] PRIMARY KEY CLUSTERED 
(
	[ActionHistoryId] ASC,
	[OfesautoProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionType](
	[ActionTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ActionTypeName] [nvarchar](50) NOT NULL,
	[ActionTypeDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[SendCommunication] [bit] NULL,
 CONSTRAINT [PK_ActionType] PRIMARY KEY CLUSTERED 
(
	[ActionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccountType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccountType](
	[BankAccountTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[BankAccountTypeName] [nvarchar](50) NOT NULL,
	[BankAccountTypeDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BankAccountType] PRIMARY KEY CLUSTERED 
(
	[BankAccountTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](80) NOT NULL,
	[CountryId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimProcessor]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimProcessor](
	[ClaimProcessorId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimProcessorName] [nvarchar](50) NOT NULL,
	[ClaimProcessorEmail] [nvarchar](20) NOT NULL,
	[ClaimProcessorEmailRedirect] [nvarchar](20) NULL,
	[StateId] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ClaimProcessor] PRIMARY KEY CLUSTERED 
(
	[ClaimProcessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimProcessorCountry]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimProcessorCountry](
	[CountryClaimProcessorId] [int] IDENTITY(1,1) NOT NULL,
	[ClaimProcessorId] [int] NOT NULL,
	[AccidentCountryId] [int] NOT NULL,
	[CauseRegistrationCountryId] [int] NOT NULL,
	[OpeningReasonId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CountryProcessor] PRIMARY KEY CLUSTERED 
(
	[CountryClaimProcessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunicationAttachments]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationAttachments](
	[AttachmentId] [int] NOT NULL,
	[DeclareVehicleAccidentId] [int] NOT NULL,
	[AttachmentDate] [datetime] NULL,
	[AttachmentFileName] [nvarchar](50) NULL,
	[AttachmentPath] [nvarchar](50) NULL,
	[AttachmentDescription] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[AttachmentId] ASC,
	[DeclareVehicleAccidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunicationsHistory]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationsHistory](
	[CommunicationId] [int] NOT NULL,
	[DeclareVehicleAccidentId] [int] NOT NULL,
	[CommunicationDate] [datetime] NOT NULL,
	[CommunicationTo] [nvarchar](50) NOT NULL,
	[CommunicationSubject] [nvarchar](100) NOT NULL,
	[CommunicationText] [nvarchar](max) NOT NULL,
	[CommunicationFileNameHtml] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CommunicationFrom] [nvarchar](50) NULL,
 CONSTRAINT [PK_CommunicationsHistory_1] PRIMARY KEY CLUSTERED 
(
	[CommunicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactType](
	[ContactTypeId] [tinyint] NOT NULL,
	[ContactTypeName] [nvarchar](50) NOT NULL,
	[ContactTypeDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactType] PRIMARY KEY CLUSTERED 
(
	[ContactTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](80) NULL,
	[PhoneCodeId] [varchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeclareVehicleAccident]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeclareVehicleAccident](
	[DeclareVehicleAccidentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimantFax] [nvarchar](15) NULL,
	[ClaimantReference] [nvarchar](15) NOT NULL,
	[DocumentTypeId] [int] NULL,
	[ApplicationType] [nvarchar](10) NULL,
	[AccidentDate] [date] NOT NULL,
	[AccidentCountryId] [int] NULL,
	[AccidentRegionId] [int] NULL,
	[AccidentVersion] [nvarchar](max) NOT NULL,
	[ReasonForOpeningId] [int] NULL,
	[CauseVehicleCategoryId] [tinyint] NULL,
	[CauseVehicleBrandId] [tinyint] NULL,
	[CauseVehicleModelId] [tinyint] NULL,
	[CauseVehicleRegistration] [nvarchar](15) NULL,
	[CauseCountryRegistrationId] [tinyint] NULL,
	[CauseInsuranceCompanyId] [tinyint] NOT NULL,
	[CauseNumberPolicy] [nvarchar](10) NULL,
	[CauseAddress] [nvarchar](50) NULL,
	[Comments] [nvarchar](max) NULL,
	[StateId] [tinyint] NOT NULL,
	[AffectedVehicleBrandId] [tinyint] NULL,
	[AffectedVehicleCategoryId] [tinyint] NULL,
	[AffectedVehicleModelId] [tinyint] NULL,
	[AffectedVehicleRegistration] [nvarchar](15) NULL,
	[AffectedCountryRegistrationId] [int] NULL,
	[AffectedInsuranceCompanyId] [int] NULL,
	[AffectedNumberPolicy] [nvarchar](10) NULL,
	[AffectedName] [nvarchar](50) NOT NULL,
	[AffectedSurname] [nvarchar](50) NOT NULL,
	[AffectedAddress] [nvarchar](50) NULL,
	[AffectedCityId] [int] NULL,
	[AffectedRegionId] [int] NULL,
	[AffectedEmail] [nvarchar](50) NOT NULL,
	[AffectedPhoneNumber] [nvarchar](15) NULL,
	[AffectedDamageMaterials] [bit] NULL,
	[AffectedDamagePersonals] [bit] NULL,
	[AcceptRgpd] [bit] NULL,
	[OrganismId] [int] NULL,
	[ClaimsProcessorId] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DeclareVehicleAccident] PRIMARY KEY CLUSTERED 
(
	[DeclareVehicleAccidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentType](
	[DocumentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentTypeName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurer]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurer](
	[InsurerId] [int] IDENTITY(1,1) NOT NULL,
	[InsurerCode] [nvarchar](10) NOT NULL,
	[InsurerName] [nvarchar](50) NOT NULL,
	[InsurerAddress] [nvarchar](50) NOT NULL,
	[InsurerPostalCode] [nvarchar](15) NULL,
	[InsurerCountryId] [int] NOT NULL,
	[InsurerPhone] [nvarchar](15) NOT NULL,
	[InsurerEmail] [nvarchar](20) NOT NULL,
	[InsurerFax] [nvarchar](15) NULL,
	[InsurerNif] [nvarchar](15) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Insurers] PRIMARY KEY CLUSTERED 
(
	[InsurerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvestigationRecord]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvestigationRecord](
	[InvestigationRecordId] [int] NOT NULL,
	[InvestigationRecordNumber] [nvarchar](15) NOT NULL,
	[InvestigationRecordDateHigh] [datetime] NOT NULL,
	[DeclareVehicleAccidentId] [int] NOT NULL,
	[StateId] [tinyint] NOT NULL,
	[InvestigationRecordClosingDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_InvestigationFile] PRIMARY KEY CLUSTERED 
(
	[InvestigationRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfesautoProcess]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfesautoProcess](
	[OfesautoProcessId] [int] IDENTITY(1,1) NOT NULL,
	[OfesautoProcessName] [nvarchar](30) NULL,
	[OfesautoProcessNamEnglish] [nvarchar](30) NULL,
	[OfesautoProcessDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OfesautoProcess] PRIMARY KEY CLUSTERED 
(
	[OfesautoProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfesautoProcesState]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfesautoProcesState](
	[OfesautoStateId] [tinyint] NOT NULL,
	[OfesautoProcessId] [tinyint] NOT NULL,
	[OfesautoStateName] [nvarchar](50) NOT NULL,
	[OfesautoStateNamEnglish] [nvarchar](50) NULL,
	[OfesautoStateDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OfesautoProcesState] PRIMARY KEY CLUSTERED 
(
	[OfesautoStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organism]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organism](
	[OrganismId] [int] IDENTITY(1,1) NOT NULL,
	[OrganismTypeId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[OrganismName] [nvarchar](50) NOT NULL,
	[OrganismLastName] [nvarchar](50) NULL,
	[DocumentTypeId] [int] NOT NULL,
	[OrganismAddress] [nvarchar](50) NOT NULL,
	[OrganismPostalCode] [nchar](15) NULL,
	[OrganismCIF] [nvarchar](15) NOT NULL,
	[OrganismWebSite] [nvarchar](50) NULL,
	[OrganismCode] [nvarchar](15) NULL,
	[OrganismReasonLowId] [tinyint] NULL,
	[OrganismLowDate] [datetime] NULL,
	[OrganismIdPassTo] [int] NULL,
	[OrganismHightDate] [datetime] NOT NULL,
	[OrganismSubTypeId] [int] NOT NULL,
	[OfesautoStateId] [tinyint] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Organisms] PRIMARY KEY CLUSTERED 
(
	[OrganismId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismBankAccount](
	[OrganismId] [int] NOT NULL,
	[BankAccountId] [tinyint] NOT NULL,
	[BankAccountTypeId] [tinyint] NOT NULL,
	[CountryId] [int] NOT NULL,
	[BankAccountNumber] [nvarchar](15) NOT NULL,
	[BankAccountSwift] [nvarchar](15) NOT NULL,
	[OrganismReasonLowId] [int] NULL,
	[BankAccountLowDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[BankAccountPrincipal] [bit] NULL,
 CONSTRAINT [PK_OrganismBankAccount] PRIMARY KEY CLUSTERED 
(
	[OrganismId] ASC,
	[BankAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismContact](
	[OrganismId] [int] NOT NULL,
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[ContactTypeId] [tinyint] NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactLastname] [nvarchar](50) NULL,
	[ContactPhone] [nvarchar](15) NOT NULL,
	[ContactFax] [nvarchar](15) NULL,
	[ContactEmail] [nvarchar](50) NOT NULL,
	[ContactPrincipal] [bit] NULL,
	[OrganismReasonLowId] [int] NULL,
	[ContactLowDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrganismContact_1] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismOffice]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismOffice](
	[OrganismId] [int] IDENTITY(1,1) NOT NULL,
	[OfficeId] [tinyint] NOT NULL,
	[CountryId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[OfficeAddress] [nvarchar](50) NOT NULL,
	[OfficePostalCode] [nvarchar](15) NOT NULL,
	[OfficeHightDate] [datetime] NOT NULL,
	[OrganismReasonLowId] [int] NULL,
	[OfficeLowDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ORGANISMOFFICE] PRIMARY KEY CLUSTERED 
(
	[OrganismId] ASC,
	[OfficeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismOfficeBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismOfficeBankAccount](
	[OrganismId] [int] NOT NULL,
	[OfficeId] [tinyint] NOT NULL,
	[BankAccountId] [tinyint] NOT NULL,
	[BankAccountName] [nvarchar](50) NOT NULL,
	[BankAccountTypeId] [tinyint] NOT NULL,
	[CountryId] [int] NOT NULL,
	[BankAccountNumber] [nvarchar](15) NOT NULL,
	[BankAccountSwift] [nvarchar](15) NOT NULL,
	[OrganismReasonLowId] [int] NULL,
	[OfficeBankAccountLowDate] [datetime] NULL,
	[OfficeBankAccountPrincipal] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrganismOfficeBankAccount] PRIMARY KEY CLUSTERED 
(
	[OrganismId] ASC,
	[OfficeId] ASC,
	[BankAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismOfficeContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismOfficeContact](
	[OrganismId] [tinyint] IDENTITY(1,1) NOT NULL,
	[OfficeId] [tinyint] NOT NULL,
	[ContactId] [tinyint] NOT NULL,
	[ContactTypeId] [tinyint] NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactLastname] [nvarchar](50) NOT NULL,
	[ContactPhone] [nvarchar](15) NOT NULL,
	[ContactFax] [nvarchar](15) NULL,
	[ContactEmail] [nvarchar](50) NOT NULL,
	[OrganismReasonLowId] [int] NULL,
	[OfficeContactLowDate] [datetime] NULL,
	[OfficeContactPrincipal] [bit] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrganismOfficeContact] PRIMARY KEY CLUSTERED 
(
	[OrganismId] ASC,
	[OfficeId] ASC,
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismOfficeProcessor]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismOfficeProcessor](
	[OrganismId] [int] NOT NULL,
	[OfficeId] [tinyint] NOT NULL,
	[OfficeProcessorId] [tinyint] NOT NULL,
	[OfficeProcessorName] [nvarchar](50) NOT NULL,
	[OfficeProcessorLastName] [nvarchar](50) NOT NULL,
	[ContactTypeId] [tinyint] NULL,
	[OfficeProcessorPhone] [nvarchar](15) NOT NULL,
	[OfficeProcessorFax] [nvarchar](15) NULL,
	[OfficeProcessorEmail] [nvarchar](50) NOT NULL,
	[OfficeProcessorPrincipal] [bit] NULL,
	[OrganismReasonLowId] [int] NULL,
	[OfficeProcessorLowDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrganismOfficeProcessor] PRIMARY KEY CLUSTERED 
(
	[OrganismId] ASC,
	[OfficeId] ASC,
	[OfficeProcessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismReasonLow]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismReasonLow](
	[OrganismReasonLowId] [tinyint] IDENTITY(1,1) NOT NULL,
	[OrganismReasonLowName] [nvarchar](50) NOT NULL,
	[OrganismReasonLowDescription] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrganismReasonLow] PRIMARY KEY CLUSTERED 
(
	[OrganismReasonLowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismRepresentation]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismRepresentation](
	[RepresentationId] [int] NOT NULL,
	[RepresentativeOrganismId] [int] NOT NULL,
	[RepresentedOrganismId] [int] NOT NULL,
	[RepresentationStartDate] [datetime] NOT NULL,
	[RepresentationFinishDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_OrganismRepresentation] PRIMARY KEY CLUSTERED 
(
	[RepresentationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismSubType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismSubType](
	[OrganismSubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[OrganismSubTypeName] [nvarchar](50) NOT NULL,
	[OrganismSubTypeDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrganismSubType] PRIMARY KEY CLUSTERED 
(
	[OrganismSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganismType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganismType](
	[OrganismTypeId] [int] NOT NULL,
	[OrganismTypeName] [nvarchar](50) NOT NULL,
	[OrganismTypeDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OrganismType] PRIMARY KEY CLUSTERED 
(
	[OrganismTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionId] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](80) NULL,
	[CountryId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [tinyint] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[StateNamEnglish] [nvarchar](50) NULL,
	[StateDescription] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_State_1] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[UserTypeId] [int] NULL,
	[UserName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[DocumentTypeId] [int] NULL,
	[UserIdNumber] [varchar](15) NULL,
	[UserAddress] [varchar](100) NULL,
	[CountryId] [int] NULL,
	[RegionId] [int] NULL,
	[CitytId] [int] NULL,
	[PostalCode] [varchar](30) NULL,
	[PhoneCodeId] [int] NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[VerificationCode] [varchar](5) NULL,
	[Photo] [varchar](256) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleBrand]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleBrand](
	[VehicleBrandId] [tinyint] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
	[BrandNamEnglish] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_VehicleBrand] PRIMARY KEY CLUSTERED 
(
	[VehicleBrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleCategory]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleCategory](
	[VehicleCategoryId] [tinyint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryNamEnglish] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_VehicleCategory] PRIMARY KEY CLUSTERED 
(
	[VehicleCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleModel]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleModel](
	[VehicleModelId] [tinyint] NOT NULL,
	[VehicleBrandId] [tinyint] NOT NULL,
	[ModelName] [nvarchar](50) NOT NULL,
	[ModelNamEnglish] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_VehicleModel] PRIMARY KEY CLUSTERED 
(
	[VehicleModelId] ASC,
	[VehicleBrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (1, 1, 1, N'Lo que sea', 1, 1, 2, CAST(N'2021-04-27T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (2, 1, 1, N'Se crea prueba', 2, 3, 2, CAST(N'2021-05-07T06:37:40.450' AS DateTime), 1, CAST(N'2021-05-07T06:37:42.000' AS DateTime), CAST(N'2021-05-07T06:37:42.683' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (3, 1, 1, N'Se crea prueba', 2, 3, 2, CAST(N'2021-05-07T06:53:51.773' AS DateTime), 1, CAST(N'2021-05-07T06:53:51.773' AS DateTime), CAST(N'2021-05-07T06:53:51.773' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (4, 1, 1, N'Se crea prueba', 2, 3, 2, CAST(N'2021-05-07T06:56:02.223' AS DateTime), 1, CAST(N'2021-05-07T06:56:02.223' AS DateTime), CAST(N'2021-05-07T06:56:02.223' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (5, 1, 1, N'Se crea prueba1', 2, 3, 5, CAST(N'2021-05-07T07:00:58.233' AS DateTime), 1, CAST(N'2021-05-07T07:00:58.627' AS DateTime), CAST(N'2021-05-07T07:00:59.500' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (6, 1, 1, N'Se crea prueba1', 2, 3, 5, CAST(N'2021-05-07T07:03:44.017' AS DateTime), 1, CAST(N'2021-05-07T07:03:44.397' AS DateTime), CAST(N'2021-05-07T07:03:44.830' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (7, 1, 2, N'Se cambio de estado', 1, 1, 5, CAST(N'2021-05-07T16:30:35.990' AS DateTime), 1, CAST(N'2021-05-07T16:30:36.747' AS DateTime), CAST(N'2021-05-07T16:30:37.117' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (8, 1, 2, N'Se cambio de estado', 1, 1, 2, CAST(N'2021-05-07T16:42:43.280' AS DateTime), 1, CAST(N'2021-05-07T16:42:43.760' AS DateTime), CAST(N'2021-05-07T16:42:43.917' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (9, 1, 1, N'Se crea prueba1', 2, 3, 5, CAST(N'2021-05-07T17:23:59.150' AS DateTime), 1, CAST(N'2021-05-07T17:23:59.150' AS DateTime), CAST(N'2021-05-07T17:23:59.150' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (10, 18, 1, N'prueba 2', 9, 1, 5, CAST(N'2021-05-07T22:02:34.740' AS DateTime), 1, CAST(N'2021-05-07T22:02:35.223' AS DateTime), CAST(N'2021-05-07T22:02:35.497' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (11, 2, 2, N'Ninguna', 3, 10, NULL, CAST(N'2021-05-11T16:34:08.987' AS DateTime), 1, CAST(N'2021-05-11T16:34:11.803' AS DateTime), CAST(N'2021-05-11T16:34:12.567' AS DateTime))
INSERT [dbo].[ActionsHistory] ([ActionHistoryId], [OfesautoProcessId], [StateId], [Observations], [AttachmentId], [UserId], [ClaimProcessorId], [ActionDate], [ActionTypeId], [CreateDate], [UpdateDate]) VALUES (12, 1, 1, N'Si', 4, 12, NULL, CAST(N'2021-05-11T16:51:51.460' AS DateTime), 1, CAST(N'2021-05-11T16:51:52.320' AS DateTime), CAST(N'2021-05-11T16:51:52.860' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ActionType] ON 

INSERT [dbo].[ActionType] ([ActionTypeId], [ActionTypeName], [ActionTypeDescription], [CreateDate], [UpdateDate], [SendCommunication]) VALUES (1, N'Solicitud de información', N'Declaración de Accidente de Vehículo', CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ActionType] ([ActionTypeId], [ActionTypeName], [ActionTypeDescription], [CreateDate], [UpdateDate], [SendCommunication]) VALUES (2, N'Solicitud de Indemnización', N'Declaración de Accidente de Vehículo', CAST(N'2021-05-07T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ActionType] ([ActionTypeId], [ActionTypeName], [ActionTypeDescription], [CreateDate], [UpdateDate], [SendCommunication]) VALUES (3, N'Creación de Investigación', N'Creación de un Expediente en una Investigación', CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ActionType] ([ActionTypeId], [ActionTypeName], [ActionTypeDescription], [CreateDate], [UpdateDate], [SendCommunication]) VALUES (4, N'Envio de comunicación', N'Envio de comunicación', CAST(N'2021-05-07T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ActionType] ([ActionTypeId], [ActionTypeName], [ActionTypeDescription], [CreateDate], [UpdateDate], [SendCommunication]) VALUES (5, N'Comunicación con Adjuntos', N'Comunicación con Adjuntos', CAST(N'2021-05-07T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ActionType] OFF
GO
SET IDENTITY_INSERT [dbo].[BankAccountType] ON 

INSERT [dbo].[BankAccountType] ([BankAccountTypeId], [BankAccountTypeName], [BankAccountTypeDescription], [CreateDate], [UpdateDate]) VALUES (1, N'Pagos', N'Starling Bank', CAST(N'2021-05-13T00:00:00.000' AS DateTime), CAST(N'2021-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[BankAccountType] ([BankAccountTypeId], [BankAccountTypeName], [BankAccountTypeDescription], [CreateDate], [UpdateDate]) VALUES (2, N'Efectivo', N'Banco Santander', CAST(N'2021-05-15T00:00:00.000' AS DateTime), CAST(N'2021-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[BankAccountType] ([BankAccountTypeId], [BankAccountTypeName], [BankAccountTypeDescription], [CreateDate], [UpdateDate]) VALUES (3, N'Cheque', N'Caja Compensación', CAST(N'2021-05-15T00:00:00.000' AS DateTime), CAST(N'2021-05-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BankAccountType] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (1, N'Sevilla', 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (2, N'Málaga', 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (3, N'Cádiz', 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (4, N'Granada', 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (5, N'Córdoba', 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (6, N'Almería', 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (7, N'Jaén', 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (8, N'Huelva', 1, 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (9, N'Huesca', 1, 2, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (10, N'Teruel', 1, 2, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (11, N'Zaragoza', 1, 2, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (12, N'Asturias', 1, 3, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (13, N'Las Palmas', 1, 4, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (14, N'Santa Cruz de Tenerife', 1, 4, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (15, N'Cantabria', 1, 5, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (16, N'Albacete', 1, 6, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (17, N'Ciudad Real', 1, 6, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (18, N'Cuenca', 1, 6, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (19, N'Guadalajara', 1, 6, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (20, N'Toledo', 1, 6, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (21, N'Ávila', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (22, N'Burgos', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (23, N'León', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (24, N'Palencia', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (25, N'Salamanca', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (26, N'Segovia', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (27, N'Soria', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (28, N'Valladolid', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (29, N'Zamora', 1, 7, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (30, N'Barcelona', 1, 8, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (31, N'Gerona', 1, 8, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (32, N'Lérida', 1, 8, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (33, N'Tarragona', 1, 8, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (34, N'Alicante', 1, 9, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (35, N'Castellón', 1, 9, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (36, N'Valencia', 1, 9, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (37, N'Badajoz', 1, 10, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (38, N'Cáceres', 1, 10, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (39, N'La Coruña', 1, 11, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (40, N'Lugo', 1, 11, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (41, N'Orense', 1, 11, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (42, N'Pontevedra', 1, 11, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (43, N'Baleares', 1, 12, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (44, N'La Rioja', 1, 13, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (45, N'Madrid', 1, 14, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (46, N'Murcia', 1, 15, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (47, N'Álava', 1, 16, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (48, N'Guipúzcoa', 1, 16, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (49, N'Vizcaya', 1, 16, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (50, N'Pamplona', 1, 17, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (51, N'Tudela', 1, 17, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (52, N'Estella', 1, 17, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (53, N'Olite', 1, 17, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (54, N'Sangüesa', 1, 17, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (55, N'Ceuta', 1, 18, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[City] ([CityId], [CityName], [CountryId], [RegionId], [CreatedDate], [UpdatedDate]) VALUES (56, N'Melilla', 1, 19, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[ClaimProcessor] ON 

INSERT [dbo].[ClaimProcessor] ([ClaimProcessorId], [UserId], [ClaimProcessorName], [ClaimProcessorEmail], [ClaimProcessorEmailRedirect], [StateId], [CreateDate], [UpdateDate]) VALUES (2, 1, N'Erwin', N'eparales@syntax.es', N'eparales@syntax.es', 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[ClaimProcessor] ([ClaimProcessorId], [UserId], [ClaimProcessorName], [ClaimProcessorEmail], [ClaimProcessorEmailRedirect], [StateId], [CreateDate], [UpdateDate]) VALUES (5, 2, N'Brandon', N'bbrandon@syntax.es', N'bbrandon@syntax.es', 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[ClaimProcessor] ([ClaimProcessorId], [UserId], [ClaimProcessorName], [ClaimProcessorEmail], [ClaimProcessorEmailRedirect], [StateId], [CreateDate], [UpdateDate]) VALUES (6, 3, N'Camilo', N'cbayona@syntax.es', N'cbayona@syntax.es', 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ClaimProcessor] OFF
GO
SET IDENTITY_INSERT [dbo].[ClaimProcessorCountry] ON 

INSERT [dbo].[ClaimProcessorCountry] ([CountryClaimProcessorId], [ClaimProcessorId], [AccidentCountryId], [CauseRegistrationCountryId], [OpeningReasonId], [CreateDate], [UpdateDate]) VALUES (2, 2, 1, 1, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[ClaimProcessorCountry] ([CountryClaimProcessorId], [ClaimProcessorId], [AccidentCountryId], [CauseRegistrationCountryId], [OpeningReasonId], [CreateDate], [UpdateDate]) VALUES (11, 5, 1, 12, 1, CAST(N'2021-04-27T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ClaimProcessorCountry] OFF
GO
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (1, 1, CAST(N'2021-04-13T20:08:34.553' AS DateTime), N'Cambiar PopUp.pdf', N'', N'Esto es una prueba', CAST(N'2021-04-13T20:10:34.983' AS DateTime), CAST(N'2021-04-13T20:10:34.983' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (2, 1, CAST(N'2021-04-13T21:31:54.713' AS DateTime), N'Cambiar PopUp.pdf', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf', N'Esto es una prueba en Postman', CAST(N'2021-04-13T21:31:54.713' AS DateTime), CAST(N'2021-04-13T21:31:54.713' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (3, 1, CAST(N'2021-04-13T21:38:44.277' AS DateTime), N'Cambiar PopUp.pdf', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf', N'Esto es una prueba en Postman', CAST(N'2021-04-13T21:38:44.277' AS DateTime), CAST(N'2021-04-13T21:38:44.277' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (4, 1, CAST(N'2021-04-13T21:44:30.340' AS DateTime), N'Cambiar PopUp.pdf', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf', N'Esto es una prueba en Postman', CAST(N'2021-04-13T21:44:30.340' AS DateTime), CAST(N'2021-04-13T21:44:30.340' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (5, 1, CAST(N'2021-04-13T22:16:11.277' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax,Cambio o ', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf,C:User', N'Esto es una prueba en Postman', CAST(N'2021-04-13T22:16:11.277' AS DateTime), CAST(N'2021-04-13T22:16:11.277' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (6, 1, CAST(N'2021-04-13T22:22:59.387' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax,Cambio o ', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf,C:User', N'Esto es una prueba en Postman', CAST(N'2021-04-13T22:22:59.387' AS DateTime), CAST(N'2021-04-13T22:22:59.387' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (7, 1, CAST(N'2021-04-13T22:28:22.040' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax,Cambio o ', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf,C:User', N'Esto es una prueba en Postman', CAST(N'2021-04-13T22:28:22.040' AS DateTime), CAST(N'2021-04-13T22:28:22.040' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (8, 3, CAST(N'2021-04-19T22:28:34.070' AS DateTime), N'CambiarPopUp.pdf,Manual Intranet Syntax,Cambio o p', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman', CAST(N'2021-04-19T22:28:34.070' AS DateTime), CAST(N'2021-04-19T22:28:34.070' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (9, 3, CAST(N'2021-04-19T22:28:34.070' AS DateTime), N'CambiarPopUp.pdf,Manual Intranet Syntax,Cambio o p', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman', CAST(N'2021-04-19T22:28:34.070' AS DateTime), CAST(N'2021-04-19T22:28:34.070' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (10, 3, CAST(N'2021-04-21T01:10:50.083' AS DateTime), N'CambiarPopUp.pdf', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf', N'Esto es una prueba desde Postman inserta archivo', CAST(N'2021-04-21T01:10:50.083' AS DateTime), CAST(N'2021-04-21T01:10:50.083' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (11, 3, CAST(N'2021-04-21T05:40:46.117' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax.pdf,Cambi', N'C:Users/Usuario/Downloads/Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman insertar archivos', CAST(N'2021-04-21T05:40:46.117' AS DateTime), CAST(N'2021-04-21T05:40:46.117' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (12, 3, CAST(N'2021-04-21T05:53:58.143' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax.pdf,Cambi', N'C:Users\Usuario\Downloads\Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman insertar archivos', CAST(N'2021-04-21T05:53:58.143' AS DateTime), CAST(N'2021-04-21T05:53:58.143' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (13, 3, CAST(N'2021-04-21T17:03:19.263' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax.pdf,Cambi', N'C:Users\Usuario\Downloads\Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman insertar archivos', CAST(N'2021-04-21T17:03:19.263' AS DateTime), CAST(N'2021-04-21T17:03:19.263' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (14, 3, CAST(N'2021-04-21T17:03:19.263' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax.pdf,Cambi', N'C:Users\Usuario\Downloads\Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman insertar archivos', CAST(N'2021-04-21T17:03:19.263' AS DateTime), CAST(N'2021-04-21T17:03:19.263' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (15, 3, CAST(N'2021-04-21T17:03:19.263' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax.pdf,Cambi', N'C:Users\Usuario\Downloads\Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman insertar archivos', CAST(N'2021-04-21T17:03:19.263' AS DateTime), CAST(N'2021-04-21T17:03:19.263' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (16, 3, CAST(N'2021-04-21T17:03:19.263' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax.pdf,Cambi', N'C:Users\Usuario\Downloads\Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman insertar archivos', CAST(N'2021-04-21T17:03:19.263' AS DateTime), CAST(N'2021-04-21T17:03:19.263' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (17, 3, CAST(N'2021-04-21T17:03:19.263' AS DateTime), N'Cambiar PopUp.pdf,Manual Intranet Syntax.pdf,Cambi', N'C:Users\Usuario\Downloads\Cambiar PopUp.pdf,C:User', N'Esto es una prueba desde Postman insertar archivos', CAST(N'2021-04-21T17:03:19.263' AS DateTime), CAST(N'2021-04-21T17:03:19.263' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (18, 5, CAST(N'2021-04-23T17:21:54.157' AS DateTime), N'CambiarPopUp.pdf,', N'C:Users\Usuario\Downloads\CambiarPopUp.pdf', N'Esto es una prueba desde Postman insertar 1 archivo', CAST(N'2021-04-23T17:21:54.157' AS DateTime), CAST(N'2021-04-23T17:21:54.157' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (19, 7, CAST(N'2021-04-23T17:24:53.497' AS DateTime), N'CambiarPopUp.pdf,', N'C:Users\Usuario\Downloads\CambiarPopUp.pdf', N'Esto es una prueba desde Postman insertar 1 archivo', CAST(N'2021-04-23T17:24:53.497' AS DateTime), CAST(N'2021-04-23T17:24:53.497' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (20, 3, CAST(N'2021-04-23T17:40:10.120' AS DateTime), N'CambiarPopUp.pdf,', N'C:Users\Usuario\Downloads\CambiarPopUp.pdf', N'Esto es una prueba desde Postman insertar 1 archivo', CAST(N'2021-04-23T17:40:10.120' AS DateTime), CAST(N'2021-04-23T17:40:10.120' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (21, 7, CAST(N'2021-04-30T16:13:01.960' AS DateTime), N'MER - OFESAUTO - V2.png', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Esto es una prueba desde swagger', CAST(N'2021-04-30T16:13:14.137' AS DateTime), CAST(N'2021-04-30T16:13:14.680' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (22, 9, CAST(N'2021-05-07T16:32:05.377' AS DateTime), N'ultimocorreoPruebas.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'prueba', CAST(N'2021-05-07T16:32:06.787' AS DateTime), CAST(N'2021-05-07T16:32:07.207' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (23, 4, CAST(N'2021-05-10T00:18:06.683' AS DateTime), N'Adjunto agregado a la declaraciónAccesDbOfesautoAz', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Ensayo', CAST(N'2021-05-10T00:19:06.093' AS DateTime), CAST(N'2021-05-10T00:19:06.823' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (24, 3, CAST(N'2021-05-10T00:49:16.367' AS DateTime), N'ApiLogin.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Test', CAST(N'2021-05-10T00:49:16.367' AS DateTime), CAST(N'2021-05-10T00:49:16.367' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (25, 7, CAST(N'2021-05-10T11:14:06.690' AS DateTime), N'insertArchivos.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Documentos', CAST(N'2021-05-10T11:14:10.393' AS DateTime), CAST(N'2021-05-10T11:14:11.143' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (26, 9, CAST(N'2021-05-10T11:19:08.263' AS DateTime), N'CorregirCorreoAsiDebeQuedar.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'hola', CAST(N'2021-05-10T11:19:09.293' AS DateTime), CAST(N'2021-05-10T11:19:09.717' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (27, 1, CAST(N'2021-05-10T11:20:40.793' AS DateTime), N'IniciosesionController.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'si', CAST(N'2021-05-10T11:20:42.133' AS DateTime), CAST(N'2021-05-10T11:20:42.670' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (28, 5, CAST(N'2021-05-10T11:22:06.267' AS DateTime), N'insertdva y organism.png', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Lo que sea', CAST(N'2021-05-10T11:22:07.080' AS DateTime), CAST(N'2021-05-10T11:22:07.283' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (29, 1, CAST(N'2021-05-10T11:24:08.790' AS DateTime), N'insertOrganism.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'funciona', CAST(N'2021-05-10T11:24:09.623' AS DateTime), CAST(N'2021-05-10T11:24:09.867' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (30, 1, CAST(N'2021-05-10T11:31:22.063' AS DateTime), N'GestorSiniestros.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Mas pruebas', CAST(N'2021-05-10T11:31:23.123' AS DateTime), CAST(N'2021-05-10T11:31:23.507' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (31, 1, CAST(N'2021-05-10T11:45:35.313' AS DateTime), N'TablaDVAorganismos.jpg', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'nuevo', CAST(N'2021-05-10T11:45:36.427' AS DateTime), CAST(N'2021-05-10T11:45:36.807' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (32, 1, CAST(N'2021-05-10T15:04:31.617' AS DateTime), N'IniciosesionController.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Ensayos', CAST(N'2021-05-10T15:04:32.770' AS DateTime), CAST(N'2021-05-10T15:04:33.157' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (33, 1, CAST(N'2021-05-10T15:23:54.803' AS DateTime), N'uploadimage.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'evidencia', CAST(N'2021-05-10T15:23:55.617' AS DateTime), CAST(N'2021-05-10T15:23:55.857' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (34, 1, CAST(N'2021-05-10T15:36:16.613' AS DateTime), N'TableRelationalOfesauto.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'sisi', CAST(N'2021-05-10T15:36:16.613' AS DateTime), CAST(N'2021-05-10T15:36:16.613' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (35, 10, CAST(N'2021-05-10T15:42:58.307' AS DateTime), N'ApiLogin.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Esto es una prueba', CAST(N'2021-05-10T15:42:58.307' AS DateTime), CAST(N'2021-05-10T15:42:58.307' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (36, 12, CAST(N'2021-05-10T15:51:55.430' AS DateTime), N'ErrorEncontradoAlDebugearEnReact.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'mi archivo', CAST(N'2021-05-10T15:51:55.430' AS DateTime), CAST(N'2021-05-10T15:51:55.430' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (37, 1, CAST(N'2021-05-10T16:18:53.010' AS DateTime), N'Captura.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'dddd', CAST(N'2021-05-10T16:18:53.010' AS DateTime), CAST(N'2021-05-10T16:18:53.010' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (38, 1, CAST(N'2021-05-10T16:25:44.300' AS DateTime), N'ErrorEncontradoAlDebugearEnReact.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'jejeje', CAST(N'2021-05-10T16:25:44.300' AS DateTime), CAST(N'2021-05-10T16:25:44.300' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (39, 4, CAST(N'2021-05-10T19:03:41.903' AS DateTime), N'SQLCiuntryRegionCity.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'ggfhgghgh', CAST(N'2021-05-10T19:03:42.793' AS DateTime), CAST(N'2021-05-10T19:03:43.317' AS DateTime))
INSERT [dbo].[CommunicationAttachments] ([AttachmentId], [DeclareVehicleAccidentId], [AttachmentDate], [AttachmentFileName], [AttachmentPath], [AttachmentDescription], [CreateDate], [UpdateDate]) VALUES (40, 5, CAST(N'2021-05-11T00:58:49.503' AS DateTime), N'uploadimage.PNG', N'C:\SyntaxOfesauto\OfesautoBackend\GestionarReclama', N'Mi  accidente', CAST(N'2021-05-11T00:58:51.217' AS DateTime), CAST(N'2021-05-11T00:58:51.703' AS DateTime))
GO
INSERT [dbo].[CommunicationsHistory] ([CommunicationId], [DeclareVehicleAccidentId], [CommunicationDate], [CommunicationTo], [CommunicationSubject], [CommunicationText], [CommunicationFileNameHtml], [CreateDate], [UpdateDate], [CommunicationFrom]) VALUES (1, 1, CAST(N'2021-05-11T05:38:56.570' AS DateTime), N'Tramitador', N'Envío de documento', N'Esto es un envío de una declaración de accidente', N'Captura.PNG', CAST(N'2021-05-11T05:38:57.667' AS DateTime), CAST(N'2021-05-11T05:38:57.907' AS DateTime), N'Reclamante')
INSERT [dbo].[CommunicationsHistory] ([CommunicationId], [DeclareVehicleAccidentId], [CommunicationDate], [CommunicationTo], [CommunicationSubject], [CommunicationText], [CommunicationFileNameHtml], [CreateDate], [UpdateDate], [CommunicationFrom]) VALUES (2, 3, CAST(N'2021-05-11T05:38:56.570' AS DateTime), N'Tramitador', N'Se envía documento', N'Se envía foto', N'Datos.Jpg', CAST(N'2021-05-11T05:38:56.570' AS DateTime), CAST(N'2021-05-11T05:38:56.570' AS DateTime), N'Reclamante')
INSERT [dbo].[CommunicationsHistory] ([CommunicationId], [DeclareVehicleAccidentId], [CommunicationDate], [CommunicationTo], [CommunicationSubject], [CommunicationText], [CommunicationFileNameHtml], [CreateDate], [UpdateDate], [CommunicationFrom]) VALUES (3, 1, CAST(N'2020-06-10T00:00:00.000' AS DateTime), N'Tramitador', N'Documento', N'Se envía documento', N'Foto.pdf', CAST(N'2020-06-10T00:00:00.000' AS DateTime), CAST(N'2020-06-10T00:00:00.000' AS DateTime), N'Reclamante')
GO
INSERT [dbo].[ContactType] ([ContactTypeId], [ContactTypeName], [ContactTypeDescription], [CreateDate], [UpdateDate]) VALUES (100, N'Abogado', NULL, CAST(N'2021-05-11T22:22:55.970' AS DateTime), CAST(N'2021-05-11T22:22:55.970' AS DateTime))
INSERT [dbo].[ContactType] ([ContactTypeId], [ContactTypeName], [ContactTypeDescription], [CreateDate], [UpdateDate]) VALUES (101, N'Ingeniero', NULL, CAST(N'2021-05-11T22:22:55.970' AS DateTime), CAST(N'2021-05-11T22:22:55.970' AS DateTime))
INSERT [dbo].[ContactType] ([ContactTypeId], [ContactTypeName], [ContactTypeDescription], [CreateDate], [UpdateDate]) VALUES (102, N'Abogado Civil', NULL, CAST(N'2021-05-11T22:22:55.970' AS DateTime), CAST(N'2021-05-11T22:22:55.970' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (1, N'España', N'+34', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (2, N'Marruecos', N'+212', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (3, N'República de Moldavia', N'+373', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (4, N'Polonia', N'+48', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (5, N'Reino Unido', N'+44', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (6, N'República Checa', N'+42', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (7, N'Federación de Rusia', N'+7', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (8, N'Azerbaiyán', N'+994', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (9, N'Finlandia', N'+358', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (10, N'Letonia', N'+371', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (11, N'Luxemburgo', N'+352', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (12, N'Francia', N'+33', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (13, N'Albania', N'+355', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (14, N'Alemania', N'+49', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (15, N'Andorra', N'+376', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (16, N'Austria', N'+43', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (17, N'Bélgica', N'+32', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (18, N'Bielorrusia', N'+375', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (19, N'Bosnia y Herzegovina', N'+387', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (20, N'Bulgaria', N'+359', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (21, N'Chipre', N'+357', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (22, N'Croacia', N'+385', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (23, N'Dinamarca', N'+45', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (24, N'Eslovaquia', N'+421', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (25, N'Eslovenia', N'+386', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (26, N'Estonia', N'+372', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (27, N'Grecia', N'+30', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (28, N'Países Bajos', N'+31', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (29, N'Hungría', N'+36', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (30, N'República Islámica de Irán', N'+98', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (31, N'Irlanda', N'+353', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (32, N'Islandia', N'+354', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (33, N'Israel', N'+972', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (34, N'Italia', N'+39', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (35, N'Lituania', N'+370', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (36, N'Malta', N'+356', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (37, N'Noruega', N'+47', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (38, N'Portugal', N'+351', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (39, N'Rumania', N'+40', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (40, N'Suecia', N'+46', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (41, N'Suiza', N'+41', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (42, N'Túnez', N'+216', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (43, N'Turquía', N'+90', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (44, N'Ucrania', N'+380', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (45, N'Serbia', N'+381', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (46, N'Macedonia', N'+389', NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [PhoneCodeId], [CreatedDate], [UpdatedDate]) VALUES (47, N'Montenegro', N'+382', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (0, 1, N'2345678', N'65004521S', 1, N'bsbdshd', CAST(N'2021-04-19' AS Date), 1, 8, N'Impacto en la parte frontal', 1, 1, 4, 1, N'AS455', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 1, 1, 1, 1, N'Si puede ser', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 0, 1, 1, NULL, 2, CAST(N'2021-04-19T21:45:04.803' AS DateTime), CAST(N'2021-04-19T21:45:04.803' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (1, 2, N'9876543', N'A123456789', 6, N'Ensayo', CAST(N'2021-04-12' AS Date), 1, 8, N'Impacto en la parte delantera', 1, 1, 4, 1, N'E4655', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 2, CAST(N'2021-04-12T04:43:50.363' AS DateTime), CAST(N'2021-04-12T04:43:50.363' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (3, 7, N'4356732', N'S1234567R', 2, N'bsbdshd', CAST(N'2021-04-19' AS Date), 1, 8, N'Impacto en la parte techo', 1, 1, 4, 1, N'R7654', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 5, CAST(N'2021-04-19T21:48:01.677' AS DateTime), CAST(N'2021-04-19T21:48:01.677' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (4, 3, N'6789012', N' M1234567F', 4, N'sfefsf', CAST(N'2021-04-19' AS Date), 1, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'ZF456', 14, 5, N'9658765', N'Calle los colores', N'No tengo', 4, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 0, NULL, 5, CAST(N'2021-04-19T21:50:45.063' AS DateTime), CAST(N'2021-04-19T21:50:45.063' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (5, 2, N'2245678', N'AEST3537HD', 3, N'bsbdshd', CAST(N'2021-04-12' AS Date), 1, 8, N'Impacto en el parachoques', 1, 1, 4, 1, N'UYT345', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 5, CAST(N'2021-04-23T23:20:04.607' AS DateTime), CAST(N'2021-04-23T23:20:04.607' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (6, 2, N'1456789', N'92384756S', 1, N'bsbdshd', CAST(N'2021-04-12' AS Date), 1, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'BCH567', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 5, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 2, CAST(N'2021-04-23T23:20:04.607' AS DateTime), CAST(N'2021-04-23T23:20:04.607' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (7, 4, N'1029384', N'0123456789', 5, N'bsbdshd', CAST(N'2021-04-12' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'POQ987', 14, 5, N'9658765', N'Calle los colores', N'No tengo', 4, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 5, CAST(N'2021-04-29T06:12:16.897' AS DateTime), CAST(N'2021-04-29T06:12:16.897' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (8, 8, N'2039485', N' S1234567E', 4, N'bsbdshd', CAST(N'2021-04-12' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'BVN098', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 2, CAST(N'2021-04-29T06:16:08.237' AS DateTime), CAST(N'2021-04-29T06:16:08.237' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (9, 34, N'3948576', N'31054856S', 1, N'bsbdshd', CAST(N'2021-04-12' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'QAZ345', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 4, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 0, NULL, 2, CAST(N'2021-04-29T06:24:18.117' AS DateTime), CAST(N'2021-04-29T06:24:18.117' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (10, 9, N'9182734', N'CVND2345WS', 3, N'bsbdshd', CAST(N'2021-04-12' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'TRD105', 14, 5, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 0, NULL, 5, CAST(N'2021-04-29T06:24:18.117' AS DateTime), CAST(N'2021-04-29T06:24:18.117' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (11, 23, N'8234567', N'S1234567S', 2, N'bsbdshd', CAST(N'2021-04-12' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'YHB601', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 1, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 1, 1, NULL, 2, CAST(N'2021-04-29T23:47:29.077' AS DateTime), CAST(N'2021-04-29T23:47:29.077' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (12, 6, N'3456783', N' H1234567D', 4, N'bsbdshd', CAST(N'2021-04-12' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'MNB409', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 5, CAST(N'2021-04-30T06:39:12.900' AS DateTime), CAST(N'2021-04-30T06:39:12.900' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (13, 33, N'5463210', N'023456789', 5, N'bsbdshd', CAST(N'2021-04-12' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'WER345', 14, 5, N'9658765', N'Calle los colores', N'No tengo', 4, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 5, CAST(N'2021-04-30T22:21:49.610' AS DateTime), CAST(N'2021-04-30T22:21:49.610' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (14, 15, N'4567890', N'E123456780', 6, N'bsbdshd', CAST(N'2021-05-06' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'XVY246', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 5, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 2, CAST(N'2021-05-06T21:46:08.977' AS DateTime), CAST(N'2021-05-06T21:46:08.977' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (15, 10, N'9870654', N'WPOE32039FH', 3, N'bsbdshd', CAST(N'2021-05-06' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'LGD192', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 0, NULL, 2, CAST(N'2021-05-06T21:57:32.647' AS DateTime), CAST(N'2021-05-06T21:57:32.647' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (16, 19, N'8123455', N' E1234567V', 4, N'si no', CAST(N'2021-05-06' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'BDL567', 14, 5, N'9658765', N'Calle los colores', N'No tengo', 4, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 5, CAST(N'2021-05-06T22:00:29.363' AS DateTime), CAST(N'2021-05-06T22:00:29.363' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (17, 22, N'7123456', N'034567890', 5, N'bsbdshd', CAST(N'2021-05-06' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'IUR098', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 1, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 2, CAST(N'2021-05-06T22:04:22.417' AS DateTime), CAST(N'2021-05-06T22:04:22.417' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (18, 48, N'61234512', N'5678123R', 1, N'bsbdshd', CAST(N'2021-05-06' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'GFJ543', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, 5, CAST(N'2021-05-06T22:04:22.417' AS DateTime), CAST(N'2021-05-06T22:04:22.417' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (19, 55, N'3546345', N'S1234567A', 2, N'No lo se', CAST(N'2021-05-08' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'ERD654', 14, 5, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, NULL, CAST(N'2021-05-08T00:20:16.023' AS DateTime), CAST(N'2021-05-08T00:20:16.023' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (20, 5, N'2356890', N'45679875N', 1, N'si', CAST(N'2021-05-11' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'No lo se', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'Hamilton', N'Scott', N'Street 34 89', 33, 53, N'acothamilton@gmail.com', N'876543657', 1, 0, 1, NULL, NULL, CAST(N'2021-05-11T22:22:55.970' AS DateTime), CAST(N'2021-05-11T22:22:56.600' AS DateTime))
INSERT [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId], [UserId], [ClaimantFax], [ClaimantReference], [DocumentTypeId], [ApplicationType], [AccidentDate], [AccidentCountryId], [AccidentRegionId], [AccidentVersion], [ReasonForOpeningId], [CauseVehicleCategoryId], [CauseVehicleBrandId], [CauseVehicleModelId], [CauseVehicleRegistration], [CauseCountryRegistrationId], [CauseInsuranceCompanyId], [CauseNumberPolicy], [CauseAddress], [Comments], [StateId], [AffectedVehicleBrandId], [AffectedVehicleCategoryId], [AffectedVehicleModelId], [AffectedVehicleRegistration], [AffectedCountryRegistrationId], [AffectedInsuranceCompanyId], [AffectedNumberPolicy], [AffectedName], [AffectedSurname], [AffectedAddress], [AffectedCityId], [AffectedRegionId], [AffectedEmail], [AffectedPhoneNumber], [AffectedDamageMaterials], [AffectedDamagePersonals], [AcceptRgpd], [OrganismId], [ClaimsProcessorId], [CreatedDate], [UpdateDate]) VALUES (21, 0, N'', N'23345', 1, N'nomo', CAST(N'2021-05-18' AS Date), 11, 8, N'Impacto en la parte trasera', 1, 1, 4, 1, N'No lo se', 14, 1, N'9658765', N'Calle los colores', N'No tengo', 2, 1, 1, 1, N'No lo se', 1, 2, N'98765345', N'pruebas', N'Scott', N'Street 34 89', 33, 53, N'pruebas@gmail.com', N'876543657', 1, 0, 1, NULL, NULL, CAST(N'2021-05-18T22:59:28.970' AS DateTime), CAST(N'2021-05-18T22:59:28.970' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DocumentType] ON 

INSERT [dbo].[DocumentType] ([DocumentTypeId], [DocumentTypeName], [CreatedDate], [UpdatedDate]) VALUES (1, N'DNI', CAST(N'2021-05-11T05:56:52.140' AS DateTime), CAST(N'2021-05-11T05:56:52.140' AS DateTime))
INSERT [dbo].[DocumentType] ([DocumentTypeId], [DocumentTypeName], [CreatedDate], [UpdatedDate]) VALUES (2, N'NIE', CAST(N'2021-05-11T05:56:52.140' AS DateTime), CAST(N'2021-05-11T05:56:52.140' AS DateTime))
INSERT [dbo].[DocumentType] ([DocumentTypeId], [DocumentTypeName], [CreatedDate], [UpdatedDate]) VALUES (3, N'Pasaporte', CAST(N'2021-05-11T05:56:52.140' AS DateTime), CAST(N'2021-05-11T05:56:52.140' AS DateTime))
INSERT [dbo].[DocumentType] ([DocumentTypeId], [DocumentTypeName], [CreatedDate], [UpdatedDate]) VALUES (4, N'NIF', CAST(N'2021-05-11T05:56:52.140' AS DateTime), CAST(N'2021-05-11T05:56:52.140' AS DateTime))
INSERT [dbo].[DocumentType] ([DocumentTypeId], [DocumentTypeName], [CreatedDate], [UpdatedDate]) VALUES (5, N'Permiso de Conducir', CAST(N'2021-05-11T05:56:52.140' AS DateTime), CAST(N'2021-05-11T05:56:52.140' AS DateTime))
INSERT [dbo].[DocumentType] ([DocumentTypeId], [DocumentTypeName], [CreatedDate], [UpdatedDate]) VALUES (6, N'Permiso de Residencia UE', CAST(N'2021-05-11T05:56:52.140' AS DateTime), CAST(N'2021-05-11T05:56:52.140' AS DateTime))
INSERT [dbo].[DocumentType] ([DocumentTypeId], [DocumentTypeName], [CreatedDate], [UpdatedDate]) VALUES (7, N'CIF', CAST(N'2021-05-11T05:56:52.140' AS DateTime), CAST(N'2021-05-11T05:56:52.140' AS DateTime))
SET IDENTITY_INSERT [dbo].[DocumentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Insurer] ON 

INSERT [dbo].[Insurer] ([InsurerId], [InsurerCode], [InsurerName], [InsurerAddress], [InsurerPostalCode], [InsurerCountryId], [InsurerPhone], [InsurerEmail], [InsurerFax], [InsurerNif], [CreatedDate], [UpdatedDate]) VALUES (1, N'9090', N'MAPFRE', N'Castellana, 90', N'28100', 1, N'902010101', N'mapfre@mapfre.es', N'902232323', N'A909999', CAST(N'2021-04-10T00:00:00.000' AS DateTime), CAST(N'2021-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Insurer] ([InsurerId], [InsurerCode], [InsurerName], [InsurerAddress], [InsurerPostalCode], [InsurerCountryId], [InsurerPhone], [InsurerEmail], [InsurerFax], [InsurerNif], [CreatedDate], [UpdatedDate]) VALUES (2, N'987', N'British Empire Assurance Company', N'Oxford st, 102', N'B9012', 5, N'329001001', N'info@beac.uk', N'320909011', N'A888888', CAST(N'2021-04-10T00:00:00.000' AS DateTime), CAST(N'2021-04-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Insurer] OFF
GO
INSERT [dbo].[InvestigationRecord] ([InvestigationRecordId], [InvestigationRecordNumber], [InvestigationRecordDateHigh], [DeclareVehicleAccidentId], [StateId], [InvestigationRecordClosingDate], [CreateDate], [UpdateDate]) VALUES (1, N'1001', CAST(N'2021-05-07T07:03:44.397' AS DateTime), 1, 1, CAST(N'2021-05-07T07:03:44.397' AS DateTime), CAST(N'2021-05-07T07:03:44.397' AS DateTime), CAST(N'2021-05-07T07:03:44.397' AS DateTime))
INSERT [dbo].[InvestigationRecord] ([InvestigationRecordId], [InvestigationRecordNumber], [InvestigationRecordDateHigh], [DeclareVehicleAccidentId], [StateId], [InvestigationRecordClosingDate], [CreateDate], [UpdateDate]) VALUES (2, N'1002', CAST(N'2021-05-10T06:53:01.253' AS DateTime), 5, 1, CAST(N'2021-05-10T06:53:02.317' AS DateTime), CAST(N'2021-05-10T06:53:02.710' AS DateTime), CAST(N'2021-05-10T06:53:03.220' AS DateTime))
INSERT [dbo].[InvestigationRecord] ([InvestigationRecordId], [InvestigationRecordNumber], [InvestigationRecordDateHigh], [DeclareVehicleAccidentId], [StateId], [InvestigationRecordClosingDate], [CreateDate], [UpdateDate]) VALUES (3, N'1003', CAST(N'2021-05-11T05:56:52.140' AS DateTime), 2, 2, CAST(N'2021-05-11T05:56:54.227' AS DateTime), CAST(N'2021-05-11T05:56:54.757' AS DateTime), CAST(N'2021-05-11T05:56:55.300' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[OfesautoProcess] ON 

INSERT [dbo].[OfesautoProcess] ([OfesautoProcessId], [OfesautoProcessName], [OfesautoProcessNamEnglish], [OfesautoProcessDescription], [CreateDate], [UpdateDate]) VALUES (1, N'Declarar accidente de vehiculo', N'Declare a vehicle accident', NULL, CAST(N'2021-04-25T00:00:00.000' AS DateTime), CAST(N'2021-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[OfesautoProcess] ([OfesautoProcessId], [OfesautoProcessName], [OfesautoProcessNamEnglish], [OfesautoProcessDescription], [CreateDate], [UpdateDate]) VALUES (2, N'Incidencia', N'Incident record', NULL, CAST(N'2021-04-25T00:00:00.000' AS DateTime), CAST(N'2021-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[OfesautoProcess] ([OfesautoProcessId], [OfesautoProcessName], [OfesautoProcessNamEnglish], [OfesautoProcessDescription], [CreateDate], [UpdateDate]) VALUES (3, N'Investigación', N'Investigation record', NULL, CAST(N'2021-04-25T00:00:00.000' AS DateTime), CAST(N'2021-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[OfesautoProcess] ([OfesautoProcessId], [OfesautoProcessName], [OfesautoProcessNamEnglish], [OfesautoProcessDescription], [CreateDate], [UpdateDate]) VALUES (4, N'Indemnización', N'Compensation record', NULL, CAST(N'2021-04-25T00:00:00.000' AS DateTime), CAST(N'2021-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[OfesautoProcess] ([OfesautoProcessId], [OfesautoProcessName], [OfesautoProcessNamEnglish], [OfesautoProcessDescription], [CreateDate], [UpdateDate]) VALUES (5, N'Pagos', N'Pay', NULL, CAST(N'2021-05-07T00:00:00.000' AS DateTime), CAST(N'2021-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[OfesautoProcess] ([OfesautoProcessId], [OfesautoProcessName], [OfesautoProcessNamEnglish], [OfesautoProcessDescription], [CreateDate], [UpdateDate]) VALUES (7, N'Organismo', N'Organism', NULL, CAST(N'2021-07-05T00:00:00.000' AS DateTime), CAST(N'2021-07-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OfesautoProcess] OFF
GO
INSERT [dbo].[OfesautoProcesState] ([OfesautoStateId], [OfesautoProcessId], [OfesautoStateName], [OfesautoStateNamEnglish], [OfesautoStateDescription], [CreateDate], [UpdateDate]) VALUES (1, 7, N'ACTIVO', N'ACTIVE', NULL, CAST(N'2021-07-05T00:00:00.000' AS DateTime), CAST(N'2021-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OfesautoProcesState] ([OfesautoStateId], [OfesautoProcessId], [OfesautoStateName], [OfesautoStateNamEnglish], [OfesautoStateDescription], [CreateDate], [UpdateDate]) VALUES (2, 7, N'DADO DE BAJA', N'UNSUBSCRIBE', NULL, CAST(N'2021-07-05T00:00:00.000' AS DateTime), CAST(N'2021-07-05T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Organism] ON 

INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (1, 1, 1, 8, 8, N'SUAC', N'S.A', 1, N'Calle falsa 23A 34', NULL, N'C5103', N'tucarro.com', N'2223', NULL, CAST(N'2021-05-10T00:00:00.000' AS DateTime), 22, CAST(N'2021-04-19T20:54:21.967' AS DateTime), 1, 2, CAST(N'2021-04-19T20:54:21.967' AS DateTime), CAST(N'2021-04-19T20:54:21.967' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (2, 1, 1, 1, 1, N'Colmena', N'S.A', 1, N'Calle 45A sur', NULL, N'B3456', N'www.colmena.com', N'2035', 10, CAST(N'2021-06-04T16:05:01.243' AS DateTime), NULL, CAST(N'2021-05-06T23:23:01.797' AS DateTime), 1, 1, CAST(N'2021-04-19T20:54:21.967' AS DateTime), CAST(N'2021-05-06T23:23:01.797' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (3, 1, 1, 1, 1, N'Villas', N'S.A', 3, N'Calle false 123', N'98765          ', N'V2345', N'www.villassecurity.es', N'V2343', NULL, CAST(N'2021-06-08T12:36:49.130' AS DateTime), NULL, CAST(N'2021-06-08T12:36:50.563' AS DateTime), 1, 2, CAST(N'2021-06-08T12:36:50.563' AS DateTime), CAST(N'2021-06-08T12:36:50.563' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (4, 7, 14, 54, 1, N'Blind Securoty', N'S.A', 1, N'Calle falsa 23A 34', NULL, N'R7888', N'blindsecurity.de', N'8768', NULL, CAST(N'2021-05-10T00:00:00.000' AS DateTime), 6, CAST(N'2021-04-19T21:28:37.300' AS DateTime), 3, 1, CAST(N'2021-04-19T21:28:37.300' AS DateTime), CAST(N'2021-04-19T21:28:37.300' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (5, 7, 12, 8, 8, N'Martellini', N'S.A', 2, N'Calle falsa 23A 34', NULL, N'H1234', N'www.martinelli.it', N'8769', 10, CAST(N'2021-06-01T00:06:11.833' AS DateTime), NULL, CAST(N'2021-04-19T21:39:35.083' AS DateTime), 5, 1, CAST(N'2021-04-19T21:39:35.083' AS DateTime), CAST(N'2021-04-19T21:39:35.083' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (6, 1, 11, 8, 8, N'Security VIP', N'S.A', 1, N'Calle falsa 23A 34', NULL, N'L4650', N'www.securityvip.uk', N'8770', NULL, CAST(N'2021-04-19T14:14:49.027' AS DateTime), NULL, CAST(N'2021-04-19T14:14:49.027' AS DateTime), 1, 2, CAST(N'2021-04-24T00:13:55.427' AS DateTime), CAST(N'2021-04-24T00:13:55.427' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (7, 1, 1, 1, 1, N'Personal Security', N'S.A', 3, N'Calle falsa 23A 34', NULL, N'V7642', N'www.personalsecurity.uk', N'0076', NULL, CAST(N'2021-04-28T22:53:46.573' AS DateTime), NULL, CAST(N'2021-04-28T22:53:46.573' AS DateTime), 3, 2, CAST(N'2021-04-28T22:53:46.573' AS DateTime), CAST(N'2021-04-28T22:53:46.573' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (8, 6, 1, 8, 8, N'RioYa', N'S.A.S', 1, N'Calle falsa 23A 34', NULL, N'X9874', N'www.rioya.po', N'1001', NULL, CAST(N'2021-05-10T22:25:02.947' AS DateTime), 10, CAST(N'2021-04-30T06:47:53.913' AS DateTime), 1, 2, CAST(N'2021-04-30T06:47:53.913' AS DateTime), CAST(N'2021-04-30T06:47:53.913' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (9, 2, 14, 55, 8, N'Finance Person', N'S.A', 1, N'Calle falsa 23A 34', NULL, N'S9238', N'www.financepersonal.es', N'2002', NULL, CAST(N'2021-04-30T06:59:14.890' AS DateTime), NULL, CAST(N'2021-04-30T06:59:14.890' AS DateTime), 3, 1, CAST(N'2021-04-30T06:59:14.890' AS DateTime), CAST(N'2021-04-30T06:59:14.890' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (10, 1, 12, 8, 8, N'Ensayo', N'S.A', 2, N'Calle falsa 23A 34', NULL, N'B4756', N'www.ensayo.es', N'8765', NULL, CAST(N'2021-04-30T21:56:51.583' AS DateTime), NULL, CAST(N'2021-04-30T21:56:51.583' AS DateTime), 1, 1, CAST(N'2021-04-30T21:56:51.583' AS DateTime), CAST(N'2021-04-30T21:56:51.583' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (11, 6, 5, 8, 8, N'Security Zan', N'S.A.S', 1, N'Calle falsa 23A 34', NULL, N'A1029', N'www.security.fr', N'8765', NULL, CAST(N'2021-05-05T23:04:50.363' AS DateTime), NULL, CAST(N'2021-05-05T23:04:50.363' AS DateTime), 1, 1, CAST(N'2021-05-05T23:04:50.363' AS DateTime), CAST(N'2021-05-05T23:04:50.363' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (12, 6, 1, 8, 8, N'Palet Seguros', N'S.A', 1, N'Calle falsa 23A 34', NULL, N'W2938', N'www.paletseguros.fr', N'8765', NULL, CAST(N'2021-05-05T23:07:21.823' AS DateTime), NULL, CAST(N'2021-05-05T23:07:21.823' AS DateTime), 1, 1, CAST(N'2021-05-05T23:07:21.823' AS DateTime), CAST(N'2021-05-05T23:07:21.823' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (13, 1, 1, 8, 8, N'MeAyuda', N'S.A', 1, N'Calle falsa 23A 34', NULL, N'N4857', N'www.meayuda.es', N'8765', NULL, CAST(N'2021-05-05T23:09:14.360' AS DateTime), NULL, CAST(N'2021-05-05T23:09:14.360' AS DateTime), 3, 2, CAST(N'2021-05-05T23:09:14.360' AS DateTime), CAST(N'2021-05-05T23:09:14.360' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (14, 2, 5, 8, 8, N'Security Global', N'S.A.S', 3, N'Calle falsa 23A 34', NULL, N'M3049', N'www.securityglobal.uk', N'8765', 4, CAST(N'2021-06-03T20:42:30.173' AS DateTime), NULL, CAST(N'2021-05-05T23:13:48.803' AS DateTime), 5, 1, CAST(N'2021-05-05T23:13:48.803' AS DateTime), CAST(N'2021-05-05T23:13:48.803' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (15, 1, 1, 8, 8, N'Security Allianz', N'S.A', 1, N'Calle falsa 23A 34', NULL, N'P5867', N'www.securityallianz.ad', N'8765', NULL, CAST(N'2021-05-05T23:23:00.403' AS DateTime), NULL, CAST(N'2021-05-05T23:23:00.403' AS DateTime), 1, 2, CAST(N'2021-05-05T23:23:00.403' AS DateTime), CAST(N'2021-05-05T23:23:00.403' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (16, 2, 5, 1, 1, N'Alhy Secure', N'S.A', 1, N'Calle 23A 45 89', NULL, N'O5069', N'www.alhysecurity.', N'2256', NULL, CAST(N'2021-05-06T16:12:52.850' AS DateTime), NULL, CAST(N'2021-05-06T16:12:56.430' AS DateTime), 1, 1, CAST(N'2021-05-06T16:12:57.147' AS DateTime), CAST(N'2021-05-06T16:12:57.573' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (17, 1, 1, 1, 1, N'Security', N'S.A.S', 1, N'calle falsa 345', NULL, N'T6079', N'www.security.be', N'3456', NULL, CAST(N'2021-05-06T16:23:58.760' AS DateTime), NULL, CAST(N'2021-05-06T19:55:17.590' AS DateTime), 3, 1, CAST(N'2021-05-06T16:24:00.297' AS DateTime), CAST(N'2021-05-06T19:55:44.003' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (18, 2, 12, 3, 1, N'ALBUS', N'S.A', 1, N'Calle 45A 34C', NULL, N'G2255', N'www.hisecurity.de', N'3456', NULL, CAST(N'2021-05-06T19:41:36.490' AS DateTime), NULL, CAST(N'2021-05-06T19:41:37.190' AS DateTime), 4, 2, CAST(N'2021-05-06T19:41:37.540' AS DateTime), CAST(N'2021-05-06T19:41:38.023' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (19, 1, 1, 1, 1, N'Dibola Security', N'S.A', 1, N'Calle 45A 34C', NULL, N'J2345', N'www.dibola.it', N'4400', NULL, CAST(N'2021-05-06T19:43:43.623' AS DateTime), NULL, CAST(N'2021-05-06T19:43:43.623' AS DateTime), 5, 1, CAST(N'2021-05-06T19:43:43.623' AS DateTime), CAST(N'2021-05-06T19:43:43.623' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (20, 2, 14, 1, 1, N'NOSEAZ', N'S.A.S', 1, N'Calle 45A 34C', NULL, N'C9992', N'www.noseaz.uk', N'4400', NULL, CAST(N'2021-05-06T20:25:23.920' AS DateTime), NULL, CAST(N'2021-05-06T20:25:33.890' AS DateTime), 7, 2, CAST(N'2021-05-06T20:25:35.717' AS DateTime), CAST(N'2021-05-06T20:25:36.477' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (21, 1, 1, 1, 1, N'Prueba Security', N'S.A', 1, N'calle falsa 345', NULL, N'I2345', N'www.pruebasecurity.es', N'3456', 1, CAST(N'2021-05-08T21:52:10.950' AS DateTime), NULL, CAST(N'2021-05-06T20:55:53.827' AS DateTime), 4, 1, CAST(N'2021-05-06T20:56:16.677' AS DateTime), CAST(N'2021-05-06T20:56:18.060' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (22, 6, 1, 1, 1, N'Caja Familiar', N'S.A', 1, N'Avenida Los lamentos 24 Sur', N'3459           ', N'A5677', N'www.cajafamiliar.fr', N'0967', 1, CAST(N'2021-05-08T05:36:38.473' AS DateTime), NULL, CAST(N'2021-05-08T05:42:35.857' AS DateTime), 1, 1, CAST(N'2021-05-08T05:36:40.483' AS DateTime), CAST(N'2021-05-08T05:42:37.953' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (23, 1, 1, 1, 1, N'LoqueseaSecurity', N'S.A', 1, N'Calle 9A sur', N'87653          ', N'A3456', N'Loqueseasecurit', N'2122', NULL, CAST(N'2021-05-14T13:35:23.433' AS DateTime), NULL, CAST(N'2021-05-14T13:35:27.483' AS DateTime), 1, 1, CAST(N'2021-05-14T13:35:28.750' AS DateTime), CAST(N'2021-05-14T13:35:29.203' AS DateTime))
INSERT [dbo].[Organism] ([OrganismId], [OrganismTypeId], [CountryId], [RegionId], [CityId], [OrganismName], [OrganismLastName], [DocumentTypeId], [OrganismAddress], [OrganismPostalCode], [OrganismCIF], [OrganismWebSite], [OrganismCode], [OrganismReasonLowId], [OrganismLowDate], [OrganismIdPassTo], [OrganismHightDate], [OrganismSubTypeId], [OfesautoStateId], [CreateDate], [UpdateDate]) VALUES (25, 1, 1, 1, 1, N'Villas', N'S.A', 1, N'Calle false 123', N'98765          ', N'V2345', N'www.villassecurity.es', N'V2343', NULL, CAST(N'2021-05-25T18:07:39.507' AS DateTime), NULL, CAST(N'2021-05-25T18:07:39.507' AS DateTime), 1, 1, CAST(N'2021-05-25T18:07:39.507' AS DateTime), CAST(N'2021-05-25T18:07:39.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[Organism] OFF
GO
INSERT [dbo].[OrganismBankAccount] ([OrganismId], [BankAccountId], [BankAccountTypeId], [CountryId], [BankAccountNumber], [BankAccountSwift], [OrganismReasonLowId], [BankAccountLowDate], [CreateDate], [UpdateDate], [BankAccountPrincipal]) VALUES (1, 1, 1, 5, N'GHG23837373773', N'SRLGGB2L', NULL, NULL, CAST(N'2021-04-19T20:54:21.967' AS DateTime), CAST(N'2021-04-19T20:54:21.967' AS DateTime), 1)
INSERT [dbo].[OrganismBankAccount] ([OrganismId], [BankAccountId], [BankAccountTypeId], [CountryId], [BankAccountNumber], [BankAccountSwift], [OrganismReasonLowId], [BankAccountLowDate], [CreateDate], [UpdateDate], [BankAccountPrincipal]) VALUES (1, 4, 1, 1, N'YHGF435677890', N'SPMAD4E', NULL, NULL, CAST(N'2021-06-02T00:00:00.000' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[OrganismBankAccount] ([OrganismId], [BankAccountId], [BankAccountTypeId], [CountryId], [BankAccountNumber], [BankAccountSwift], [OrganismReasonLowId], [BankAccountLowDate], [CreateDate], [UpdateDate], [BankAccountPrincipal]) VALUES (2, 2, 2, 14, N'DUB73591204522', N'DUEUTSCHE7G', 10, CAST(N'2021-06-04T16:05:51.047' AS DateTime), CAST(N'2021-05-16T06:11:28.110' AS DateTime), CAST(N'2021-05-16T06:11:28.110' AS DateTime), NULL)
INSERT [dbo].[OrganismBankAccount] ([OrganismId], [BankAccountId], [BankAccountTypeId], [CountryId], [BankAccountNumber], [BankAccountSwift], [OrganismReasonLowId], [BankAccountLowDate], [CreateDate], [UpdateDate], [BankAccountPrincipal]) VALUES (3, 3, 3, 1, N'05416584254', N'FRXV2021', NULL, NULL, CAST(N'2021-05-17T22:31:51.830' AS DateTime), CAST(N'2021-05-17T22:31:52.327' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[OrganismContact] ON 

INSERT [dbo].[OrganismContact] ([OrganismId], [ContactId], [ContactTypeId], [ContactName], [ContactLastname], [ContactPhone], [ContactFax], [ContactEmail], [ContactPrincipal], [OrganismReasonLowId], [ContactLowDate], [CreateDate], [UpdateDate]) VALUES (1, 1, 100, N'Julio', N'Sánchez', N'987654324', N'78563413', N'pedroMartinezA@gmail.com', 1, NULL, NULL, CAST(N'2021-05-13T06:27:26.203' AS DateTime), CAST(N'2021-05-13T06:27:26.203' AS DateTime))
INSERT [dbo].[OrganismContact] ([OrganismId], [ContactId], [ContactTypeId], [ContactName], [ContactLastname], [ContactPhone], [ContactFax], [ContactEmail], [ContactPrincipal], [OrganismReasonLowId], [ContactLowDate], [CreateDate], [UpdateDate]) VALUES (2, 2, 101, N'Ricardo', N'Dominguez', N'923648690', N'56789012', N'AleDominguez@outlook.com', NULL, 10, CAST(N'2021-06-04T16:05:47.103' AS DateTime), CAST(N'2021-05-12T21:47:55.627' AS DateTime), CAST(N'2021-05-12T21:47:55.627' AS DateTime))
INSERT [dbo].[OrganismContact] ([OrganismId], [ContactId], [ContactTypeId], [ContactName], [ContactLastname], [ContactPhone], [ContactFax], [ContactEmail], [ContactPrincipal], [OrganismReasonLowId], [ContactLowDate], [CreateDate], [UpdateDate]) VALUES (1, 3, 102, N'Pedro', N'Cervantes', N'992837455', N'55123467', N'AntonioCervantes123@gmail.com', NULL, NULL, NULL, CAST(N'2021-05-12T21:49:44.613' AS DateTime), CAST(N'2021-05-12T21:49:44.613' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrganismContact] OFF
GO
SET IDENTITY_INSERT [dbo].[OrganismOffice] ON 

INSERT [dbo].[OrganismOffice] ([OrganismId], [OfficeId], [CountryId], [RegionId], [CityId], [OfficeAddress], [OfficePostalCode], [OfficeHightDate], [OrganismReasonLowId], [OfficeLowDate], [CreateDate], [UpdateDate]) VALUES (1, 1, 1, 1, 1, N'Calle las palmas 123', N'098876', CAST(N'2021-05-20T19:51:02.680' AS DateTime), 4, CAST(N'2021-05-20T19:51:03.063' AS DateTime), CAST(N'2021-05-20T19:51:03.450' AS DateTime), CAST(N'2021-05-20T19:51:03.997' AS DateTime))
INSERT [dbo].[OrganismOffice] ([OrganismId], [OfficeId], [CountryId], [RegionId], [CityId], [OfficeAddress], [OfficePostalCode], [OfficeHightDate], [OrganismReasonLowId], [OfficeLowDate], [CreateDate], [UpdateDate]) VALUES (2, 2, 1, 4, 3, N'Diagonal 28A Norte Palmar', N'876543', CAST(N'2021-06-02T00:00:00.000' AS DateTime), 10, CAST(N'2021-06-04T16:06:00.753' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismOffice] ([OrganismId], [OfficeId], [CountryId], [RegionId], [CityId], [OfficeAddress], [OfficePostalCode], [OfficeHightDate], [OrganismReasonLowId], [OfficeLowDate], [CreateDate], [UpdateDate]) VALUES (3, 2, 1, 2, 2, N'Avenida Sur C 28 56', N'341298', CAST(N'2021-06-02T00:00:00.000' AS DateTime), NULL, NULL, CAST(N'2021-06-02T00:00:00.000' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrganismOffice] OFF
GO
INSERT [dbo].[OrganismOfficeBankAccount] ([OrganismId], [OfficeId], [BankAccountId], [BankAccountName], [BankAccountTypeId], [CountryId], [BankAccountNumber], [BankAccountSwift], [OrganismReasonLowId], [OfficeBankAccountLowDate], [OfficeBankAccountPrincipal], [CreateDate], [UpdateDate]) VALUES (1, 1, 1, N'Sterling Bank', 1, 1, N'EDDFS450000', N'LTUK1A', NULL, NULL, 1, CAST(N'2021-05-27T18:01:29.430' AS DateTime), CAST(N'2021-05-28T16:12:21.930' AS DateTime))
INSERT [dbo].[OrganismOfficeBankAccount] ([OrganismId], [OfficeId], [BankAccountId], [BankAccountName], [BankAccountTypeId], [CountryId], [BankAccountNumber], [BankAccountSwift], [OrganismReasonLowId], [OfficeBankAccountLowDate], [OfficeBankAccountPrincipal], [CreateDate], [UpdateDate]) VALUES (2, 1, 2, N'BCH', 2, 11, N'BCHE2300000', N'BCH1E', 10, CAST(N'2021-06-04T16:06:12.087' AS DateTime), NULL, CAST(N'2021-06-03T00:00:00.000' AS DateTime), CAST(N'2021-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismOfficeBankAccount] ([OrganismId], [OfficeId], [BankAccountId], [BankAccountName], [BankAccountTypeId], [CountryId], [BankAccountNumber], [BankAccountSwift], [OrganismReasonLowId], [OfficeBankAccountLowDate], [OfficeBankAccountPrincipal], [CreateDate], [UpdateDate]) VALUES (3, 2, 2, N'BNP SUDAMERIS', 3, 16, N'BNPS5000000', N'BNP1R', NULL, NULL, NULL, CAST(N'2021-06-03T00:00:00.000' AS DateTime), CAST(N'2021-06-03T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[OrganismOfficeContact] ON 

INSERT [dbo].[OrganismOfficeContact] ([OrganismId], [OfficeId], [ContactId], [ContactTypeId], [ContactName], [ContactLastname], [ContactPhone], [ContactFax], [ContactEmail], [OrganismReasonLowId], [OfficeContactLowDate], [OfficeContactPrincipal], [CreateDate], [UpdateDate]) VALUES (1, 1, 1, 100, N'Ernesto', N'Araíz', N'92348514', N'981266', N'EnestoAraizz@gmail.com', NULL, NULL, 1, CAST(N'2021-05-21T22:19:01.903' AS DateTime), CAST(N'2021-05-21T22:19:02.087' AS DateTime))
INSERT [dbo].[OrganismOfficeContact] ([OrganismId], [OfficeId], [ContactId], [ContactTypeId], [ContactName], [ContactLastname], [ContactPhone], [ContactFax], [ContactEmail], [OrganismReasonLowId], [OfficeContactLowDate], [OfficeContactPrincipal], [CreateDate], [UpdateDate]) VALUES (2, 2, 1, 101, N'Ximena', N'Orduz', N'923401822', N'345102', N'ximenaOrduz@outlook.es', 10, CAST(N'2021-06-04T16:06:05.630' AS DateTime), NULL, CAST(N'2021-06-02T00:00:00.000' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismOfficeContact] ([OrganismId], [OfficeId], [ContactId], [ContactTypeId], [ContactName], [ContactLastname], [ContactPhone], [ContactFax], [ContactEmail], [OrganismReasonLowId], [OfficeContactLowDate], [OfficeContactPrincipal], [CreateDate], [UpdateDate]) VALUES (3, 3, 2, 100, N'Gonzalo', N'Jiménez', N'991238426', N'471839', N'Gozalo_jimenez@gmail.com', NULL, NULL, NULL, CAST(N'2021-06-02T00:00:00.000' AS DateTime), CAST(N'2021-06-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrganismOfficeContact] OFF
GO
INSERT [dbo].[OrganismOfficeProcessor] ([OrganismId], [OfficeId], [OfficeProcessorId], [OfficeProcessorName], [OfficeProcessorLastName], [ContactTypeId], [OfficeProcessorPhone], [OfficeProcessorFax], [OfficeProcessorEmail], [OfficeProcessorPrincipal], [OrganismReasonLowId], [OfficeProcessorLowDate], [CreateDate], [UpdateDate]) VALUES (1, 1, 1, N'Alberto', N'Ríos', 100, N'992345678', N'32674012', N'AlbertoRios@gmail.com', 1, NULL, NULL, CAST(N'2021-05-28T05:13:26.683' AS DateTime), CAST(N'2021-05-28T11:33:14.270' AS DateTime))
INSERT [dbo].[OrganismOfficeProcessor] ([OrganismId], [OfficeId], [OfficeProcessorId], [OfficeProcessorName], [OfficeProcessorLastName], [ContactTypeId], [OfficeProcessorPhone], [OfficeProcessorFax], [OfficeProcessorEmail], [OfficeProcessorPrincipal], [OrganismReasonLowId], [OfficeProcessorLowDate], [CreateDate], [UpdateDate]) VALUES (2, 2, 2, N'Inés', N'Contreras', 101, N'91824567', N'29186356', N'InesContrerasC@outlook.es', NULL, 10, CAST(N'2021-06-04T16:06:13.717' AS DateTime), CAST(N'2021-05-28T05:16:47.787' AS DateTime), CAST(N'2021-05-28T05:16:48.517' AS DateTime))
INSERT [dbo].[OrganismOfficeProcessor] ([OrganismId], [OfficeId], [OfficeProcessorId], [OfficeProcessorName], [OfficeProcessorLastName], [ContactTypeId], [OfficeProcessorPhone], [OfficeProcessorFax], [OfficeProcessorEmail], [OfficeProcessorPrincipal], [OrganismReasonLowId], [OfficeProcessorLowDate], [CreateDate], [UpdateDate]) VALUES (3, 2, 1, N'Jorge', N'Robledo', 101, N'992648561', N'23095823', N'jorgerobledo@gmail.com', NULL, NULL, NULL, CAST(N'2021-06-03T00:00:00.000' AS DateTime), CAST(N'2021-06-03T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[OrganismReasonLow] ON 

INSERT [dbo].[OrganismReasonLow] ([OrganismReasonLowId], [OrganismReasonLowName], [OrganismReasonLowDescription], [CreatedDate], [UpdatedDate]) VALUES (1, N'ABSORCIÓN', NULL, CAST(N'2021-04-30T21:56:51.583' AS DateTime), CAST(N'2021-04-30T21:56:51.583' AS DateTime))
INSERT [dbo].[OrganismReasonLow] ([OrganismReasonLowId], [OrganismReasonLowName], [OrganismReasonLowDescription], [CreatedDate], [UpdatedDate]) VALUES (2, N'CAMBIO DE CÓDIGO CARTA VERDE', NULL, CAST(N'2021-04-06T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismReasonLow] ([OrganismReasonLowId], [OrganismReasonLowName], [OrganismReasonLowDescription], [CreatedDate], [UpdatedDate]) VALUES (4, N'CESE DE ACTIVIDAD', NULL, CAST(N'2021-04-06T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismReasonLow] ([OrganismReasonLowId], [OrganismReasonLowName], [OrganismReasonLowDescription], [CreatedDate], [UpdatedDate]) VALUES (5, N'FALTA EN LISTA BUREAUX', NULL, CAST(N'2021-04-06T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismReasonLow] ([OrganismReasonLowId], [OrganismReasonLowName], [OrganismReasonLowDescription], [CreatedDate], [UpdatedDate]) VALUES (6, N'FUSIÓN', NULL, CAST(N'2021-04-06T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismReasonLow] ([OrganismReasonLowId], [OrganismReasonLowName], [OrganismReasonLowDescription], [CreatedDate], [UpdatedDate]) VALUES (7, N'LIQUIDACIÓN', NULL, CAST(N'2021-04-06T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismReasonLow] ([OrganismReasonLowId], [OrganismReasonLowName], [OrganismReasonLowDescription], [CreatedDate], [UpdatedDate]) VALUES (9, N'EN SUSPENSO', NULL, CAST(N'2021-04-06T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismReasonLow] ([OrganismReasonLowId], [OrganismReasonLowName], [OrganismReasonLowDescription], [CreatedDate], [UpdatedDate]) VALUES (10, N'MOTIVO DESCONOCIDO', NULL, CAST(N'2021-04-06T00:00:00.000' AS DateTime), CAST(N'2021-04-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrganismReasonLow] OFF
GO
INSERT [dbo].[OrganismRepresentation] ([RepresentationId], [RepresentativeOrganismId], [RepresentedOrganismId], [RepresentationStartDate], [RepresentationFinishDate], [CreateDate], [UpdateDate]) VALUES (1, 2, 9, CAST(N'2021-01-06T00:00:00.000' AS DateTime), NULL, CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismRepresentation] ([RepresentationId], [RepresentativeOrganismId], [RepresentedOrganismId], [RepresentationStartDate], [RepresentationFinishDate], [CreateDate], [UpdateDate]) VALUES (2, 2, 15, CAST(N'2021-01-06T00:00:00.000' AS DateTime), NULL, CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismRepresentation] ([RepresentationId], [RepresentativeOrganismId], [RepresentedOrganismId], [RepresentationStartDate], [RepresentationFinishDate], [CreateDate], [UpdateDate]) VALUES (3, 9, 2, CAST(N'2021-01-06T00:00:00.000' AS DateTime), NULL, CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismRepresentation] ([RepresentationId], [RepresentativeOrganismId], [RepresentedOrganismId], [RepresentationStartDate], [RepresentationFinishDate], [CreateDate], [UpdateDate]) VALUES (4, 15, 2, CAST(N'2021-01-06T00:00:00.000' AS DateTime), NULL, CAST(N'2021-01-06T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismRepresentation] ([RepresentationId], [RepresentativeOrganismId], [RepresentedOrganismId], [RepresentationStartDate], [RepresentationFinishDate], [CreateDate], [UpdateDate]) VALUES (5, 2, 10, CAST(N'2021-06-01T00:00:00.000' AS DateTime), NULL, CAST(N'2021-06-01T00:00:00.000' AS DateTime), CAST(N'2021-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismRepresentation] ([RepresentationId], [RepresentativeOrganismId], [RepresentedOrganismId], [RepresentationStartDate], [RepresentationFinishDate], [CreateDate], [UpdateDate]) VALUES (6, 2, 5, CAST(N'2021-06-01T00:00:00.000' AS DateTime), NULL, CAST(N'2021-06-01T00:00:00.000' AS DateTime), CAST(N'2021-06-01T23:57:08.743' AS DateTime))
INSERT [dbo].[OrganismRepresentation] ([RepresentationId], [RepresentativeOrganismId], [RepresentedOrganismId], [RepresentationStartDate], [RepresentationFinishDate], [CreateDate], [UpdateDate]) VALUES (7, 0, 0, CAST(N'2021-06-03T15:25:16.393' AS DateTime), CAST(N'2021-06-03T15:25:16.393' AS DateTime), CAST(N'2021-06-03T15:25:16.393' AS DateTime), CAST(N'2021-06-03T15:25:16.393' AS DateTime))
INSERT [dbo].[OrganismRepresentation] ([RepresentationId], [RepresentativeOrganismId], [RepresentedOrganismId], [RepresentationStartDate], [RepresentationFinishDate], [CreateDate], [UpdateDate]) VALUES (8, 2, 11, CAST(N'2021-06-03T16:59:59.803' AS DateTime), CAST(N'2021-06-03T17:00:00.277' AS DateTime), CAST(N'2021-06-03T17:00:00.797' AS DateTime), CAST(N'2021-06-03T17:00:01.813' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[OrganismSubType] ON 

INSERT [dbo].[OrganismSubType] ([OrganismSubTypeId], [OrganismSubTypeName], [OrganismSubTypeDescription], [CreateDate], [UpdateDate]) VALUES (1, N'Abogados colaboradores', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismSubType] ([OrganismSubTypeId], [OrganismSubTypeName], [OrganismSubTypeDescription], [CreateDate], [UpdateDate]) VALUES (3, N'Agentes SEFRON', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismSubType] ([OrganismSubTypeId], [OrganismSubTypeName], [OrganismSubTypeDescription], [CreateDate], [UpdateDate]) VALUES (4, N'Juzgados', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismSubType] ([OrganismSubTypeId], [OrganismSubTypeName], [OrganismSubTypeDescription], [CreateDate], [UpdateDate]) VALUES (5, N'Hospitales', N'Centros Asistenciales', CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismSubType] ([OrganismSubTypeId], [OrganismSubTypeName], [OrganismSubTypeDescription], [CreateDate], [UpdateDate]) VALUES (7, N'Administraciones públicas', N'Ministerios', CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrganismSubType] OFF
GO
INSERT [dbo].[OrganismType] ([OrganismTypeId], [OrganismTypeName], [OrganismTypeDescription], [CreateDate], [UpdateDate]) VALUES (1, N'ASEGURADORA ESPAÑOLA', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismType] ([OrganismTypeId], [OrganismTypeName], [OrganismTypeDescription], [CreateDate], [UpdateDate]) VALUES (2, N'REPRESENTANTE ESPAÑOL ASEGURADORA EXTRANJERA', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismType] ([OrganismTypeId], [OrganismTypeName], [OrganismTypeDescription], [CreateDate], [UpdateDate]) VALUES (3, N'BUREAUX', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismType] ([OrganismTypeId], [OrganismTypeName], [OrganismTypeDescription], [CreateDate], [UpdateDate]) VALUES (4, N'FONDO DE GARANTIA', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismType] ([OrganismTypeId], [OrganismTypeName], [OrganismTypeDescription], [CreateDate], [UpdateDate]) VALUES (5, N'ORGANISMO DE INDEMNIZACION', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismType] ([OrganismTypeId], [OrganismTypeName], [OrganismTypeDescription], [CreateDate], [UpdateDate]) VALUES (6, N'PARTICULARES', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismType] ([OrganismTypeId], [OrganismTypeName], [OrganismTypeDescription], [CreateDate], [UpdateDate]) VALUES (7, N'ASEGURADORA EXTRANJERA', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OrganismType] ([OrganismTypeId], [OrganismTypeName], [OrganismTypeDescription], [CreateDate], [UpdateDate]) VALUES (8, N'REPRESENTANTE EXTRANJERO ASEGURADORA ESPAÑOLA', NULL, CAST(N'2021-04-05T00:00:00.000' AS DateTime), CAST(N'2021-04-05T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (1, N'Andalucía', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (2, N'Aragón', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (3, N'Asturias', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (4, N'Canarias', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (5, N'Cantabria', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (6, N'Castilla-La Mancha', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (7, N'Castilla y León', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (8, N'Cataluña', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (9, N'Comunidad Valenciana', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (10, N'Extremadura', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (11, N'Galicia', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (12, N'Islas Baleares', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (13, N'La Rioja', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (14, N'Comunidad de Madrid', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (15, N'Región de Murcia', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (16, N'País Vasco', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (17, N'Navarra', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (18, N'Ceuta', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (19, N'Melilla', 1, CAST(N'2021-04-20T00:00:00.000' AS DateTime), CAST(N'2021-04-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (20, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (21, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (22, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (23, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (24, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (25, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (26, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (27, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (28, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (29, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (30, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (31, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (32, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (33, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (34, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (35, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (36, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (37, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (38, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (39, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (40, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (41, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (42, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (43, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (44, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (45, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (46, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (47, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (48, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (49, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (50, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (51, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (52, NULL, NULL, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (53, N'Berlín', 14, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (54, N'Hamburgo', 14, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (55, N'Colonia', 14, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (56, N'Frankfurt', 14, NULL, NULL)
INSERT [dbo].[Region] ([RegionId], [RegionName], [CountryId], [CreatedDate], [UpdatedDate]) VALUES (1054, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateId], [StateName], [StateNamEnglish], [StateDescription], [CreateDate], [UpdateDate]) VALUES (1, N'Nuevo', N'New', N'Estado Nuevo', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[State] ([StateId], [StateName], [StateNamEnglish], [StateDescription], [CreateDate], [UpdateDate]) VALUES (2, N'En Proceso', N'In Process', N'Estado En Proceso', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[State] ([StateId], [StateName], [StateNamEnglish], [StateDescription], [CreateDate], [UpdateDate]) VALUES (4, N'Rechazado', N'Rejected', N'Estado Rechazado', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[State] ([StateId], [StateName], [StateNamEnglish], [StateDescription], [CreateDate], [UpdateDate]) VALUES (5, N'Cerrado ', N'Finished', N'Estado Finalizado', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[State] OFF
GO
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (0, 2, N'Carolina', N'Rojas', 3, N'123548752', N'Calle 9A Barri d Sants', 11, 8, 8, N'string', 34, N'922563410', N'arwin.parales$@gmail.com', N'T2Zlc2F1dG8yMDIxISQlLyZARD08K29oci9mbyVrZHNlLykh', N'42753', N'string', CAST(N'2021-04-04T21:38:11.650' AS DateTime), CAST(N'2021-04-04T21:38:11.650' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (1, 1, N'Syntax', N'Group', 1, N'123456789', N'Calle Marie Curie 5-7, Oficina B.2 Edificio Alfa - P.E. Rivas Futura 28521 Madrid', 11, 28, 19, NULL, 34, N'917924167', N'enfo@syntaxs.es', N'1e6395d93c8fb855c43c431ae217f30dab84ebb6268cd6b279', NULL, N'https://www.syntax.es/', CAST(N'2021-03-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (2, 1, N'Nieves', N'Calderón', 1, N'459872046', N'Madrid Barrio Cibeles', 11, 17, 19, N'string', 34, N'9203339902', N'iieves@syntaxi.es', N'Nieves456!', NULL, N'string', CAST(N'2021-03-08T20:22:58.183' AS DateTime), CAST(N'2021-03-08T20:22:58.183' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (3, 1, N'daniel', N'moreno', 1, N'123569825', N'calle falsa 123', 11, 8, 8, N'string', 34, N'564123987', N'jijiji@syntax.me', N'dc74e32d9cda070706609f9254cd7cecde315ed03e7c4dd18e', NULL, N'string', CAST(N'2021-03-18T20:59:35.033' AS DateTime), CAST(N'2021-03-18T20:59:35.033' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (4, 1, N'camilo', N'bayona', 1, N'3332587452', N'calle 45A 12 10', 11, 8, 8, N'string', 34, N'3046408977', N'lbayonadf@syntax.es', N'c75cb66ae28d8ebc6eded002c28a8ba0d06d3a78c6b5cbf9b2', NULL, N'string', CAST(N'2021-03-18T20:59:35.033' AS DateTime), CAST(N'2021-03-18T20:59:35.033' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (5, 1, N'Julia', N'Monsalve', 1, N'2345678767', N'Calle avenida 65', 11, 8, 8, N'0987656', 34, N'922456789', N'ajaja@gmail.com', N'861bca2886e260c2cee177dfbcea0b8f4552ed3fd533d106a3', NULL, N'string', CAST(N'2021-03-22T06:07:15.613' AS DateTime), CAST(N'2021-03-22T06:07:15.613' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (6, 1, N'Edwin', N'Castro', 1, N'2345678767', N'Calle avenida 65', 11, 8, 8, N'0987656', 34, N'922456789', N'loquesea@gmail.com', N'3f79bb7b435b05321651daefd374cdc681dc06faa65e374e38', NULL, N'string', CAST(N'2021-03-22T06:10:37.110' AS DateTime), CAST(N'2021-03-22T06:10:37.110' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (7, 1, N'Deivy', N'Smith', 1, N'345678765', N'Calle 34 56 78', 11, 8, 8, N'2345677', 34, N'923456789', N'herwin.paralea@gmail.com', N'c565fe03ca9b6242e01dfddefe9bba3d98b270e19cd02fd85c', NULL, N'string', CAST(N'2021-03-22T23:21:58.683' AS DateTime), CAST(N'2021-03-22T23:21:58.683' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (8, 2, N'Antonio María', N'Machado Rodríguez', 3, N'0987654321', N'Calle Madrid 97A Doctor Perales', 11, 8, 8, N'00539451', 34, N'933678123', N'nose@hotmail.com', N'6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d23925', NULL, N'string', CAST(N'2021-03-24T19:20:51.457' AS DateTime), CAST(N'2021-03-24T19:20:51.457' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (9, 1, N'Pedro', N'Aranjuez', 3, N'098765432', N'Calle 123', 11, 8, 8, N'345676543', 34, N'933456789', N'ensayo@syntax.es', N'7f91e8a4b648b0125b15dc5a3b6466f9f4906d92c72bea9bd6', NULL, N'string', CAST(N'2021-03-24T19:50:25.273' AS DateTime), CAST(N'2021-03-24T19:50:25.273' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (10, 1, N'Javier', N'Escalante', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'ricardo@syntax.es', N'dd130a849d7b29e5541b05d2f7f86a4acd4f1ec598c1c94387', NULL, N'string', CAST(N'2021-03-24T20:23:42.187' AS DateTime), CAST(N'2021-03-24T20:23:42.187' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (11, 1, N'Elkin Yesid', N'Moreno Vélez', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'emorenoSS@syntax.es', N'2fb7a22690fbdc29ea9f64992162461f618c6998c11d7939e7', NULL, N'string', CAST(N'2021-03-24T20:23:25.607' AS DateTime), CAST(N'2021-03-24T20:23:25.607' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (12, 1, N'Hermes', N'Cajiao', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'hermes@syntax.es', N'6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d23925', NULL, N'string', CAST(N'2021-03-24T23:00:02.137' AS DateTime), CAST(N'2021-03-24T23:00:02.137' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (13, 1, N'Erika', N'Zapata', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'erikaZapata@syntax.es', N'6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d23925', NULL, N'string', CAST(N'2021-03-24T23:05:47.000' AS DateTime), CAST(N'2021-03-24T23:05:47.000' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (14, 1, N'Jorge', N'Ramos', 3, N'3127678828', N'Barrio Castellana', 11, 8, 8, N'0525100', 34, N'3127678828', N'jorge@syntax.es', N'ccbc6cac5991cf6a8ac78f236e39166c80206e5ce4667012de', NULL, N'string', CAST(N'2021-03-24T23:16:58.443' AS DateTime), CAST(N'2021-03-24T23:16:58.443' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (15, 1, N'Erwin', N'Parales', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'jejeje@syntax.es', N'7f91e8a4b648b0125b15dc5a3b6466f9f4906d92c72bea9bd6', NULL, N'string', CAST(N'2021-03-25T06:05:12.493' AS DateTime), CAST(N'2021-03-25T06:05:12.493' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (16, 1, N'Cindy', N'Moncada', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'cindymoncada@syntax.es', N'61360d5c641491dbfb5a0b05e838817832fcdcc77c08f97fc5', NULL, N'string', CAST(N'2021-03-25T06:48:50.133' AS DateTime), CAST(N'2021-03-25T06:48:50.133' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (17, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'rodriMoncada1@syntax.es', N'63c73a9efcd60e9af1c1947686e3722561c0b66e89030854bf', NULL, N'string', CAST(N'2021-03-25T06:57:38.333' AS DateTime), CAST(N'2021-03-25T06:57:38.333' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (18, 1, N'Erwin', N'Parales', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'prueba1@syntax.es', N'0409170889c84ea048a67c8eba5f932eeda970c21734859c00', NULL, N'string', CAST(N'2021-03-25T14:05:36.743' AS DateTime), CAST(N'2021-03-25T14:05:36.743' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (19, 1, N'Erwin', N'Parales', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'unsayoencrypt@syntax.es', N'8d45f0187c6e5d51658c14decbef449f132b5f3452d6019575', NULL, N'string', CAST(N'2021-03-25T14:27:34.910' AS DateTime), CAST(N'2021-03-25T14:27:34.910' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (20, 1, N'Erwin', N'Parales', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'eparalesfg@syntax.es', N'19b6970dfdf84f630aec01565438f4fadeb53d48fd754881fd', NULL, N'string', CAST(N'2021-03-25T15:03:12.250' AS DateTime), CAST(N'2021-03-25T15:03:12.250' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (21, 1, N'Elkin', N'Moreno', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'emoreno1@syntax.es', N'36f583dd16f4e1e201eb1e6f6d8e35a2ccb3bbe2658de46b4f', NULL, N'string', CAST(N'2021-03-25T15:03:12.250' AS DateTime), CAST(N'2021-03-25T15:03:12.250' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (22, 1, N'Erwin', N'Parales', 3, N'3127678828', N'Rincon del recuerdo 34', 11, 8, 8, N'0525100', 34, N'3127678828', N'epara@syntax.es', N'3d6714d0bf595be55923c135fbde6e982a57701749b0233b7b', NULL, NULL, CAST(N'2021-03-25T17:54:32.353' AS DateTime), CAST(N'2021-03-25T17:54:32.353' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (23, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'epsefseles@syntax.es', N'63c73a9efcd60e9af1c1947686e3722561c0b66e89030854bf', NULL, N'string', CAST(N'2021-03-25T19:08:59.843' AS DateTime), CAST(N'2021-03-25T19:08:59.843' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (24, 1, N'Henry', N'Zabala', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'eparasegr@syntax.es', N'63c73a9efcd60e9af1c1947686e3722561c0b66e89030854bf', NULL, N'string', CAST(N'2021-03-25T19:14:27.837' AS DateTime), CAST(N'2021-03-25T19:14:27.837' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (25, 1, N'Cristóbal', N'Armenta', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'sefsef@syntax.es', N'Crt2021', NULL, N'string', CAST(N'2021-03-25T19:31:53.347' AS DateTime), CAST(N'2021-03-25T19:31:53.347' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (26, 1, N'Cristóbal', N'Armenta', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'kkdjd@syntax.es', N'49dc52e6bf2abe5ef6e2bb5b0f1ee2d765b922ae6cc8b95d39', NULL, N'string', CAST(N'2021-03-25T19:39:04.797' AS DateTime), CAST(N'2021-03-25T19:39:04.797' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (27, 1, N'Cristóbal', N'Armenta', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'uouo@syntax.es', N'23661215087743925834e591c1fe671814b8faa62fe87c7718', NULL, N'string', CAST(N'2021-03-25T19:49:02.707' AS DateTime), CAST(N'2021-03-25T19:49:02.707' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (28, 1, N'Cristóbal', N'Armenta', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'epara5trs@syntax.es', N'5c6ea0aba28016a29db0cbba496e8ed3ec4eeb8f06f24607be', NULL, N'string', CAST(N'2021-03-25T20:01:48.690' AS DateTime), CAST(N'2021-03-25T20:01:48.690' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (29, 1, N'Cristóbal', N'Armenta', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'iparales@syntax.es', N'Crt2021!', NULL, N'string', CAST(N'2021-03-25T20:23:04.480' AS DateTime), CAST(N'2021-03-25T20:23:04.480' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (30, 1, N'Manuel mauricio', N'robledo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'rg8@syntax.es', N'e9cee71ab932fde863338d08be4de9dfe39ea049bdafb342ce', NULL, N'string', CAST(N'2021-03-25T20:35:01.177' AS DateTime), CAST(N'2021-03-25T20:35:01.177' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (31, 1, N'Cristóbal', N'Armenta', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'fsif@syntax.es', N'4a9ca4596692e94f9d2912b06a0d007564a22ee750339a6021', NULL, N'string', CAST(N'2021-03-25T20:47:00.427' AS DateTime), CAST(N'2021-03-25T20:47:00.427' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (32, 1, N'Prueba1', N'Prueba1', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'oparlopales@syntax.es', N'46d2d9258fca8e4a382a8891faa5b1885753de16fd74d18f4c', NULL, N'string', CAST(N'2021-03-25T21:08:34.393' AS DateTime), CAST(N'2021-03-25T21:08:34.393' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (33, 1, N'Cristóbal', N'Armenta', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'aparales@syntax.es', N'e960b3eb33153e8aa749eb68680c2cd248e6fcc80c51a9380f', NULL, N'string', CAST(N'2021-03-25T21:22:15.840' AS DateTime), CAST(N'2021-03-25T21:22:15.840' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (34, 1, N'Argemiro', N'buendia', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'iparale3@syntax.es', N'5c591e55eb2d2c25019840edca22124058426a30e5c31bafaf', NULL, N'string', CAST(N'2021-03-25T21:53:41.113' AS DateTime), CAST(N'2021-03-25T21:53:41.113' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (35, 1, N'Argemiro', N'buendia', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'bparale4@syntax.es', N'ef9a38f4b7bbf8ca57cf23e22e0614fa69cc76b0da4f075f47', NULL, N'string', CAST(N'2021-03-25T22:06:18.770' AS DateTime), CAST(N'2021-03-25T22:06:18.770' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (36, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'cparale5@syntax.es', N'420b613e2475a2101e4693087ca309d43d54cb957d1f28daf2', NULL, N'string', CAST(N'2021-03-25T23:52:42.773' AS DateTime), CAST(N'2021-03-25T23:52:42.773' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (37, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'dparale6@syntax.es', N'36f583dd16f4e1e201eb1e6f6d8e35a2ccb3bbe2658de46b4f', NULL, N'string', CAST(N'2021-03-26T06:44:20.027' AS DateTime), CAST(N'2021-03-26T06:44:20.027' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (38, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'eparale7@syntax.es', N'63c73a9efcd60e9af1c1947686e3722561c0b66e89030854bf', NULL, N'string', CAST(N'2021-03-27T05:39:08.983' AS DateTime), CAST(N'2021-03-27T05:39:08.983' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (39, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'fparal8s@syntax.es', N'63c73a9efcd60e9af1c1947686e3722561c0b66e89030854bf', NULL, N'string', CAST(N'2021-03-27T05:46:32.960' AS DateTime), CAST(N'2021-03-27T05:46:32.960' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (40, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'gparal9@syntax.es', N'$2a$11$Rma86kRnxCNA6OGAUV2OF.DrLV6eptQ64O0a1URbOWl', NULL, N'string', CAST(N'2021-03-27T06:08:05.753' AS DateTime), CAST(N'2021-03-27T06:08:05.753' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (41, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'h10arales@syntax.es', N'$2a$11$lcecxA7Wkc/OzdRDu48Tauh7t1WtcZg2U.M3bXKOb1U', NULL, N'string', CAST(N'2021-03-27T07:49:48.223' AS DateTime), CAST(N'2021-03-27T07:49:48.223' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (42, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'J5rales@syntax.es', N'$2a$11$2/ojLFNIXX8O3875Ccza0.L..R00e7YM3N4UeaxFdwZ', NULL, NULL, CAST(N'2021-03-27T07:59:08.037' AS DateTime), CAST(N'2021-03-27T07:59:08.037' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (43, 1, N'Rodrigo', N'algo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'kpara#les@syntax.es', N'$2a$11$67WRkALiubYlZLlQk8bA1usMkp1TdYrcrXkabh0j92I', NULL, N'string', CAST(N'2021-03-27T08:05:54.487' AS DateTime), CAST(N'2021-03-27T08:05:54.487' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (44, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'epar&les@syntax.es', N'9305E64AE45D5960E72FBDC8AFFB645466D250090ECB7B982E', NULL, N'string', CAST(N'2021-03-27T16:51:05.563' AS DateTime), CAST(N'2021-03-27T16:51:05.563' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (45, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Ppar42es@syntax.es', N'7:X222:X224:X2138:X287:X2133:X25:X2101:X288:X2199:', NULL, N'string', CAST(N'2021-03-27T17:03:49.977' AS DateTime), CAST(N'2021-03-27T17:03:49.977' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (46, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'zpa90ales@syntax.es', N'Code666', NULL, N'string', CAST(N'2021-03-27T17:27:34.377' AS DateTime), CAST(N'2021-03-27T17:27:34.377' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (47, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'rrparales876@syntax.es', N'36f583dd16f4e1e201eb1e6f6d8e35a2ccb3bbe2658de46b4f', NULL, N'string', CAST(N'2021-03-27T17:33:03.620' AS DateTime), CAST(N'2021-03-27T17:33:03.620' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (48, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'yLkarales@syntax.es', N'00543976dcff898695c394421159e8db13d76125a06c53b9e2', NULL, N'string', CAST(N'2021-03-27T17:40:17.183' AS DateTime), CAST(N'2021-03-27T17:40:17.183' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (49, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Bp%erales@syntax.es', N'65e118ba340ed3f90243c61d102f1f87bb447474246d951678', NULL, N'string', CAST(N'2021-03-27T17:46:42.597' AS DateTime), CAST(N'2021-03-27T17:46:42.597' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (50, 1, N'Erwin', N'Parales', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'eipaTHales@syntax.es', N'6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d23925', NULL, N'string', CAST(N'2021-03-27T18:42:40.567' AS DateTime), CAST(N'2021-03-27T18:42:40.567' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (51, 1, N'Erwin', N'Parales', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'tparaawdles@syntax.es', N'2339de144d8a4a1198adf8142b6d3421ec0baacea13c9ade42', NULL, N'string', CAST(N'2021-03-27T18:52:18.973' AS DateTime), CAST(N'2021-03-27T18:52:18.973' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (52, 1, N'Erwin', N'Parales', 3, N'3127678828', N'Madrid Doctor Juarez', 11, 8, 8, N'0525100', 34, N'3127678828', N'ñparaghnhmles@syntax.es', N'6ca13d52ca70c883e0f0bb101e425a89e8624de51db2d23925', NULL, N'string', CAST(N'2021-03-27T18:59:58.857' AS DateTime), CAST(N'2021-03-27T18:59:58.857' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (53, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'eLparcvales@syntax.es', N'Rodri357', NULL, N'string', CAST(N'2021-03-27T20:55:34.227' AS DateTime), CAST(N'2021-03-27T20:55:34.227' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (54, 1, N'Rodrigo', N'Almada', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'vparmnles@syntax.es', N'oG9YVtydWKwb1x0FPWx6qg==', NULL, N'string', CAST(N'2021-03-27T21:09:38.930' AS DateTime), CAST(N'2021-03-27T21:09:38.930' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (55, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'xparaccvles@syntax.es', N'$%/&tiau<+ohr/fo%kdse/)!=X', NULL, N'string', CAST(N'2021-03-27T21:58:17.827' AS DateTime), CAST(N'2021-03-27T21:58:17.827' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (56, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Wparaleszx@syntax.es', N'Ensayo8!$', NULL, N'string', CAST(N'2021-03-27T22:02:59.570' AS DateTime), CAST(N'2021-03-27T22:02:59.570' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (57, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Iparalecvs@syntax.es', N'$%/&tiau<+ohr/fo%kdse/)!=X', NULL, N'string', CAST(N'2021-03-27T22:10:50.487' AS DateTime), CAST(N'2021-03-27T22:10:50.487' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (58, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Upar67les@syntax.es', N'$%/&eiofnL<+ohr/fo%kdsYe/)!=X', NULL, N'string', CAST(N'2021-03-27T22:17:10.280' AS DateTime), CAST(N'2021-03-27T22:17:10.280' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (59, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Rparal90s@syntax.es', N'$%/&eiofnL<+ohr/fo%kdsYe/)!=X', NULL, N'string', CAST(N'2021-03-27T22:17:10.280' AS DateTime), CAST(N'2021-03-27T22:17:10.280' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (60, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Qp4rales@syntax.es', N'xsf3yGU1c9U=', NULL, N'string', CAST(N'2021-03-27T22:23:41.837' AS DateTime), CAST(N'2021-03-27T22:23:41.837' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (61, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Mparales@syntax.es', N'HzOK7lW65f3bzyXbd7r1Qg==', NULL, N'string', CAST(N'2021-03-27T22:35:36.643' AS DateTime), CAST(N'2021-03-27T22:35:36.643' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (62, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Nparalesss@syntax.es', N'JWwK77Xc2dGeflkuxb+2JA==', NULL, N'string', CAST(N'2021-03-27T22:55:28.710' AS DateTime), CAST(N'2021-03-27T22:55:28.710' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (64, 1, N'Ensayo', N'Ensayo', 3, N'3127678828', N'Avenida Dolores 23 45', 11, 8, 8, N'0525100', 34, N'3127678828', N'Aparalesui@syntax.es', N'MjQ2ODEwJCUvJkBEPTwrb2hyL2ZvJWtkc2UvKSE=', NULL, N'string', CAST(N'2021-03-28T00:34:31.650' AS DateTime), CAST(N'2021-03-28T00:34:31.650' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (65, 1, N'Ensayocorreo', N'EnsayoCorreo', 3, N'324567', N'Calle 45 A refugio', 11, 8, 8, N'string', 34, N'345679876', N'Jparales56@syntax.es', N'QWJjMTIkJCUvJkBEPTwrb2hyL2ZvJWtkc2UvKSE=', N'84176', N'string', CAST(N'2021-04-04T04:38:11.103' AS DateTime), CAST(N'2021-04-04T04:38:11.103' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (66, 1, N'string', N'string', 3, N'string', N'string', 11, 8, 8, N'string', 34, N'string', N'testofesautos@gmail.com', N'098765', N'09813', N'string', CAST(N'2021-04-05T15:13:55.100' AS DateTime), CAST(N'2021-04-05T15:13:55.100' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (67, 1, N'Camilo', N'Erwin', 3, N'1234567890', N'Callesita de las calles', 1, 2, 3, N'0987565', 1, N'9876543210', N'camilo11@bayona.me', N'123456', NULL, NULL, CAST(N'2021-04-20T16:19:14.540' AS DateTime), CAST(N'2021-04-20T16:19:15.090' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (68, 1, N'Camilo', N'Erwin', 3, N'1234567890', N'Callesita de las calles', 1, 2, 3, N'0987565', 34, N'9876543210', N'textofesauto@gmail.com', N'098765', N'1234', NULL, CAST(N'2021-04-20T16:23:53.260' AS DateTime), CAST(N'2021-04-20T16:23:54.090' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (69, 1, N'Camilo', N'Erwin', 3, N'1234567890', N'Callesita de las calles', 1, 2, 3, N'0987565', 34, N'9876543210', N'erwin.paralesda%$@gmail.com', N'1234567', NULL, NULL, CAST(N'2021-04-20T17:32:43.180' AS DateTime), CAST(N'2021-04-20T17:32:43.180' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (70, 4, N'Camilo', N'Erwin', 3, N'1234567890', N'Callesita de las calles', 1, 2, 3, N'0987565', 1, N'9876543210', N'camilo@bayona.me', N'MTIzQWJjJCQlLyZARD08K29oci9mbyVrZHNlLykh', N'54679', NULL, CAST(N'2021-04-21T16:27:16.680' AS DateTime), CAST(N'2021-04-21T16:27:16.680' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (71, 4, N'Camilo', N'Erwin', 3, N'1234567890', N'Callesita de las calles', 1, 2, 3, N'0987565', 1, N'9876543210', N'eparales@syntax.es', N'TG9zX2NvbG1pbGxvc2RlRWxraW4kJS8mQEQ9PCtvaHIvZm8la2', N'0', NULL, CAST(N'2021-04-22T17:30:02.547' AS DateTime), CAST(N'2021-04-22T17:30:02.883' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (72, 4, N'Carmen Helena', N'Sánchez', 1, N'12345678-A', N'Calle 34 #45 José Veracruz, Barrio las Marías', 1, 14, 45, N'28042', 34, N'96012376', N'testofesautaa@gmail.com', N'Q2FybWVuUzgyJCUvJkBEPTwrb2hyL2ZvJWtkc2UvKSE=', NULL, NULL, CAST(N'2021-04-26T18:11:10.207' AS DateTime), CAST(N'2021-04-26T18:11:10.207' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (73, 4, N'Carles', N'Soria', 1, N'23456729-B', N'Callesita de las calles', 1, 8, 30, N'8003', 34, N'97810020', N'testofesauto@gmail.com', N'QzRybGVzb3JpYSQlLyZARD08K29oci9mbyVrZHNlLykh', NULL, NULL, CAST(N'2021-04-26T18:26:34.357' AS DateTime), CAST(N'2021-04-26T18:26:34.357' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (74, 4, N'jajaja', N'stdfdfdfring', 1, N'12345654', N'calle 45A', 1, 1, 1, N'87652', 34, N'987654321', N'user@example.com', N'SmFqYWphJCUvJkBEPTwrb2hyL2ZvJWtkc2UvKSE=', NULL, N'string', CAST(N'2021-05-20T11:42:23.250' AS DateTime), CAST(N'2021-05-20T11:42:24.147' AS DateTime))
INSERT [dbo].[User] ([UserId], [UserTypeId], [UserName], [LastName], [DocumentTypeId], [UserIdNumber], [UserAddress], [CountryId], [RegionId], [CitytId], [PostalCode], [PhoneCodeId], [PhoneNumber], [Email], [Password], [VerificationCode], [Photo], [CreatedDate], [UpdatedDate]) VALUES (75, 4, N'Pedro', N'Navaja', 1, N'123456789', N'calle falsa 123', 1, 1, 1, N'01234', 923456, N'912345678', N'pedronavaja@gmail.com', N'UDNkcm8hMTMyJCUvJkBEPTwrb2hyL2ZvJWtkc2UvKSE=', NULL, N'string', CAST(N'2021-05-27T16:01:03.123' AS DateTime), CAST(N'2021-05-27T16:01:03.123' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [CreatedDate], [UpdatedDate]) VALUES (1, N'Super Administrator', NULL, NULL)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [CreatedDate], [UpdatedDate]) VALUES (2, N'Administrator', NULL, NULL)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [CreatedDate], [UpdatedDate]) VALUES (3, N'Processor', NULL, NULL)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [CreatedDate], [UpdatedDate]) VALUES (4, N'Claimant', NULL, NULL)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [CreatedDate], [UpdatedDate]) VALUES (5, N'Insurers', NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleBrand] ON 

INSERT [dbo].[VehicleBrand] ([VehicleBrandId], [BrandName], [BrandNamEnglish], [CreateDate], [UpdateDate]) VALUES (4, N'BMW', N'BMW', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleBrand] ([VehicleBrandId], [BrandName], [BrandNamEnglish], [CreateDate], [UpdateDate]) VALUES (5, N'Audi', N'Audi', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleBrand] ([VehicleBrandId], [BrandName], [BrandNamEnglish], [CreateDate], [UpdateDate]) VALUES (7, N'Lexus', N'Lexus', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleBrand] ([VehicleBrandId], [BrandName], [BrandNamEnglish], [CreateDate], [UpdateDate]) VALUES (8, N'Renault', N'Renault', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleBrand] ([VehicleBrandId], [BrandName], [BrandNamEnglish], [CreateDate], [UpdateDate]) VALUES (10, N'Ford', N'Ford', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleBrand] ([VehicleBrandId], [BrandName], [BrandNamEnglish], [CreateDate], [UpdateDate]) VALUES (11, N'Opel', N'Opel', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleBrand] ([VehicleBrandId], [BrandName], [BrandNamEnglish], [CreateDate], [UpdateDate]) VALUES (12, N'Seat', N'Seat', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[VehicleBrand] OFF
GO
SET IDENTITY_INSERT [dbo].[VehicleCategory] ON 

INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (1, N'Turismo', N'Car
', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (2, N'Motocicleta', N'Motorbike', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (3, N'Camión', N'Truck', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (4, N'Tractor', N'Lorry', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (5, N'Ciclomotor', N'Moped', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (6, N'Autobus', N'Bus', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (7, N'Remolque', N'Trailer', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (8, N'Furgoneta', N'Van', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (9, N'Autocaravana', N'Mobile Home', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (10, N'Vehículo Industrial', N'Industrial Vehicle', NULL, NULL)
INSERT [dbo].[VehicleCategory] ([VehicleCategoryId], [CategoryName], [CategoryNamEnglish], [CreateDate], [UpdateDate]) VALUES (11, N'Grúa', N'Tow Truck', NULL, NULL)
SET IDENTITY_INSERT [dbo].[VehicleCategory] OFF
GO
INSERT [dbo].[VehicleModel] ([VehicleModelId], [VehicleBrandId], [ModelName], [ModelNamEnglish], [CreateDate], [UpdateDate]) VALUES (1, 4, N'BMW Serie 1', N'BMW Serie 1', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleModel] ([VehicleModelId], [VehicleBrandId], [ModelName], [ModelNamEnglish], [CreateDate], [UpdateDate]) VALUES (2, 4, N'BMW Serie 2 Coupé', N'BMW Serie 2 Coupé', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleModel] ([VehicleModelId], [VehicleBrandId], [ModelName], [ModelNamEnglish], [CreateDate], [UpdateDate]) VALUES (3, 4, N'BMW Serie 2 Convertible', N'BMW Serie 2 Convertible', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleModel] ([VehicleModelId], [VehicleBrandId], [ModelName], [ModelNamEnglish], [CreateDate], [UpdateDate]) VALUES (4, 8, N'Renault Captur', N'Renault Captur', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleModel] ([VehicleModelId], [VehicleBrandId], [ModelName], [ModelNamEnglish], [CreateDate], [UpdateDate]) VALUES (5, 8, N'Renault Clio', N'Renault Clio', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VehicleModel] ([VehicleModelId], [VehicleBrandId], [ModelName], [ModelNamEnglish], [CreateDate], [UpdateDate]) VALUES (6, 8, N'Renault Koleos', N'Renault Koleos', CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-04T00:00:00.000' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [email_unique]    Script Date: 9/06/2021 9:13:15 a. m. ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [email_unique] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActionsHistory]  WITH CHECK ADD  CONSTRAINT [FK_ActionsHistory_ActionType] FOREIGN KEY([ActionTypeId])
REFERENCES [dbo].[ActionType] ([ActionTypeId])
GO
ALTER TABLE [dbo].[ActionsHistory] CHECK CONSTRAINT [FK_ActionsHistory_ActionType]
GO
ALTER TABLE [dbo].[ActionsHistory]  WITH CHECK ADD  CONSTRAINT [FK_ActionsHistory_ClaimProcessor] FOREIGN KEY([ClaimProcessorId])
REFERENCES [dbo].[ClaimProcessor] ([ClaimProcessorId])
GO
ALTER TABLE [dbo].[ActionsHistory] CHECK CONSTRAINT [FK_ActionsHistory_ClaimProcessor]
GO
ALTER TABLE [dbo].[ActionsHistory]  WITH CHECK ADD  CONSTRAINT [FK_ActionsHistory_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[ActionsHistory] CHECK CONSTRAINT [FK_ActionsHistory_State]
GO
ALTER TABLE [dbo].[ActionsHistory]  WITH CHECK ADD  CONSTRAINT [FK_ActionsHistory_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ActionsHistory] CHECK CONSTRAINT [FK_ActionsHistory_User]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[ClaimProcessorCountry]  WITH CHECK ADD  CONSTRAINT [FK_ClaimProcessorCountry_ClaimProcessor] FOREIGN KEY([ClaimProcessorId])
REFERENCES [dbo].[ClaimProcessor] ([ClaimProcessorId])
GO
ALTER TABLE [dbo].[ClaimProcessorCountry] CHECK CONSTRAINT [FK_ClaimProcessorCountry_ClaimProcessor]
GO
ALTER TABLE [dbo].[ClaimProcessorCountry]  WITH CHECK ADD  CONSTRAINT [FK_ClaimProcessorCountry_Country] FOREIGN KEY([CountryClaimProcessorId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[ClaimProcessorCountry] CHECK CONSTRAINT [FK_ClaimProcessorCountry_Country]
GO
ALTER TABLE [dbo].[ClaimProcessorCountry]  WITH CHECK ADD  CONSTRAINT [FK_ClaimProcessorCountry_DeclareVehicleAccident] FOREIGN KEY([AccidentCountryId])
REFERENCES [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId])
GO
ALTER TABLE [dbo].[ClaimProcessorCountry] CHECK CONSTRAINT [FK_ClaimProcessorCountry_DeclareVehicleAccident]
GO
ALTER TABLE [dbo].[ClaimProcessorCountry]  WITH CHECK ADD  CONSTRAINT [FK_ClaimProcessorCountry_DeclareVehicleAccident1] FOREIGN KEY([CauseRegistrationCountryId])
REFERENCES [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId])
GO
ALTER TABLE [dbo].[ClaimProcessorCountry] CHECK CONSTRAINT [FK_ClaimProcessorCountry_DeclareVehicleAccident1]
GO
ALTER TABLE [dbo].[CommunicationAttachments]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccidentAttachments_DeclareVehicleAccident] FOREIGN KEY([DeclareVehicleAccidentId])
REFERENCES [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId])
GO
ALTER TABLE [dbo].[CommunicationAttachments] CHECK CONSTRAINT [FK_DeclareVehicleAccidentAttachments_DeclareVehicleAccident]
GO
ALTER TABLE [dbo].[CommunicationsHistory]  WITH CHECK ADD  CONSTRAINT [FK_CommunicationsHistory_DeclareVehicleAccident] FOREIGN KEY([DeclareVehicleAccidentId])
REFERENCES [dbo].[DeclareVehicleAccident] ([DeclareVehicleAccidentId])
GO
ALTER TABLE [dbo].[CommunicationsHistory] CHECK CONSTRAINT [FK_CommunicationsHistory_DeclareVehicleAccident]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_City] FOREIGN KEY([AffectedCityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_City]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_ClaimProcessor] FOREIGN KEY([ClaimsProcessorId])
REFERENCES [dbo].[ClaimProcessor] ([ClaimProcessorId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_ClaimProcessor]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_Country] FOREIGN KEY([AccidentCountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_Country]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_Country1] FOREIGN KEY([AccidentCountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_Country1]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_Country2] FOREIGN KEY([AffectedCountryRegistrationId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_Country2]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_DocumentType] FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentType] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_DocumentType]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_Organism] FOREIGN KEY([OrganismId])
REFERENCES [dbo].[Organism] ([OrganismId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_Organism]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_Region] FOREIGN KEY([AccidentRegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_Region]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_Region1] FOREIGN KEY([AccidentRegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_Region1]
GO
ALTER TABLE [dbo].[DeclareVehicleAccident]  WITH CHECK ADD  CONSTRAINT [FK_DeclareVehicleAccident_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[DeclareVehicleAccident] CHECK CONSTRAINT [FK_DeclareVehicleAccident_User]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_City]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_Country]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_DocumentType] FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentType] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_DocumentType]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_OfesautoProcesState] FOREIGN KEY([OfesautoStateId])
REFERENCES [dbo].[OfesautoProcesState] ([OfesautoStateId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_OfesautoProcesState]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_OrganismReasonLow] FOREIGN KEY([OrganismReasonLowId])
REFERENCES [dbo].[OrganismReasonLow] ([OrganismReasonLowId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_OrganismReasonLow]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_OrganismSubType] FOREIGN KEY([OrganismSubTypeId])
REFERENCES [dbo].[OrganismSubType] ([OrganismSubTypeId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_OrganismSubType]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_OrganismSubType1] FOREIGN KEY([OrganismSubTypeId])
REFERENCES [dbo].[OrganismSubType] ([OrganismSubTypeId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_OrganismSubType1]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_OrganismType] FOREIGN KEY([OrganismTypeId])
REFERENCES [dbo].[OrganismType] ([OrganismTypeId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_OrganismType]
GO
ALTER TABLE [dbo].[Organism]  WITH CHECK ADD  CONSTRAINT [FK_Organism_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[Organism] CHECK CONSTRAINT [FK_Organism_Region]
GO
ALTER TABLE [dbo].[OrganismBankAccount]  WITH CHECK ADD  CONSTRAINT [FK_OrganismBankAccount_BankAccountType] FOREIGN KEY([BankAccountTypeId])
REFERENCES [dbo].[BankAccountType] ([BankAccountTypeId])
GO
ALTER TABLE [dbo].[OrganismBankAccount] CHECK CONSTRAINT [FK_OrganismBankAccount_BankAccountType]
GO
ALTER TABLE [dbo].[OrganismBankAccount]  WITH CHECK ADD  CONSTRAINT [FK_OrganismBankAccount_BankAccountType1] FOREIGN KEY([BankAccountTypeId])
REFERENCES [dbo].[BankAccountType] ([BankAccountTypeId])
GO
ALTER TABLE [dbo].[OrganismBankAccount] CHECK CONSTRAINT [FK_OrganismBankAccount_BankAccountType1]
GO
ALTER TABLE [dbo].[OrganismBankAccount]  WITH CHECK ADD  CONSTRAINT [FK_OrganismBankAccount_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[OrganismBankAccount] CHECK CONSTRAINT [FK_OrganismBankAccount_Country]
GO
ALTER TABLE [dbo].[OrganismBankAccount]  WITH CHECK ADD  CONSTRAINT [FK_OrganismBankAccount_Country1] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[OrganismBankAccount] CHECK CONSTRAINT [FK_OrganismBankAccount_Country1]
GO
ALTER TABLE [dbo].[OrganismBankAccount]  WITH CHECK ADD  CONSTRAINT [FK_OrganismBankAccount_Organism] FOREIGN KEY([OrganismId])
REFERENCES [dbo].[Organism] ([OrganismId])
GO
ALTER TABLE [dbo].[OrganismBankAccount] CHECK CONSTRAINT [FK_OrganismBankAccount_Organism]
GO
ALTER TABLE [dbo].[OrganismContact]  WITH CHECK ADD  CONSTRAINT [FK_OrganismContact_ContactType] FOREIGN KEY([ContactTypeId])
REFERENCES [dbo].[ContactType] ([ContactTypeId])
GO
ALTER TABLE [dbo].[OrganismContact] CHECK CONSTRAINT [FK_OrganismContact_ContactType]
GO
ALTER TABLE [dbo].[OrganismContact]  WITH CHECK ADD  CONSTRAINT [FK_OrganismContact_Organism] FOREIGN KEY([OrganismId])
REFERENCES [dbo].[Organism] ([OrganismId])
GO
ALTER TABLE [dbo].[OrganismContact] CHECK CONSTRAINT [FK_OrganismContact_Organism]
GO
ALTER TABLE [dbo].[OrganismContact]  WITH CHECK ADD  CONSTRAINT [FK_OrganismContact_Organism1] FOREIGN KEY([OrganismReasonLowId])
REFERENCES [dbo].[Organism] ([OrganismId])
GO
ALTER TABLE [dbo].[OrganismContact] CHECK CONSTRAINT [FK_OrganismContact_Organism1]
GO
ALTER TABLE [dbo].[OrganismOffice]  WITH CHECK ADD  CONSTRAINT [FK_OrganismOffice_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[OrganismOffice] CHECK CONSTRAINT [FK_OrganismOffice_City]
GO
ALTER TABLE [dbo].[OrganismOffice]  WITH CHECK ADD  CONSTRAINT [FK_OrganismOffice_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[OrganismOffice] CHECK CONSTRAINT [FK_OrganismOffice_Country]
GO
ALTER TABLE [dbo].[OrganismOffice]  WITH CHECK ADD  CONSTRAINT [FK_OrganismOffice_Organism] FOREIGN KEY([OrganismId])
REFERENCES [dbo].[Organism] ([OrganismId])
GO
ALTER TABLE [dbo].[OrganismOffice] CHECK CONSTRAINT [FK_OrganismOffice_Organism]
GO
ALTER TABLE [dbo].[OrganismOffice]  WITH CHECK ADD  CONSTRAINT [FK_OrganismOffice_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([RegionId])
GO
ALTER TABLE [dbo].[OrganismOffice] CHECK CONSTRAINT [FK_OrganismOffice_Region]
GO
ALTER TABLE [dbo].[OrganismOfficeBankAccount]  WITH CHECK ADD  CONSTRAINT [FK_OrganismOfficeBankAccount_Organism] FOREIGN KEY([OrganismId])
REFERENCES [dbo].[Organism] ([OrganismId])
GO
ALTER TABLE [dbo].[OrganismOfficeBankAccount] CHECK CONSTRAINT [FK_OrganismOfficeBankAccount_Organism]
GO
ALTER TABLE [dbo].[OrganismOfficeProcessor]  WITH CHECK ADD  CONSTRAINT [FK_ContactType] FOREIGN KEY([ContactTypeId])
REFERENCES [dbo].[ContactType] ([ContactTypeId])
GO
ALTER TABLE [dbo].[OrganismOfficeProcessor] CHECK CONSTRAINT [FK_ContactType]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Country]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_DocumentType] FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentType] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_DocumentType]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([UserTypeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_VehicleModel_VehicleBrand] FOREIGN KEY([VehicleBrandId])
REFERENCES [dbo].[VehicleBrand] ([VehicleBrandId])
GO
ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_VehicleModel_VehicleBrand]
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrganismBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteOrganismBankAccount]
(
	@OrganismId As int
)
AS
BEGIN
	 DELETE [dbo].[OrganismBankAccount] 
	 WHERE @OrganismId = OrganismId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrganismContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteOrganismContact]
(
	@OrganismId As int
)
AS
BEGIN
	 DELETE [dbo].[OrganismContact] 
	 WHERE @OrganismId = OrganismId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrganismOffice]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteOrganismOffice]
(
	@OrganismId As int
)
AS
BEGIN
	 DELETE OrganismOffice
	 WHERE @OrganismId = OrganismId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrganismOfficeContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteOrganismOfficeContact]
(
	@OrganismId As int
)
AS
BEGIN
	 DELETE [dbo].[OrganismOfficeContact] 
	 WHERE @OrganismId = OrganismId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrganismReasonLow]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteOrganismReasonLow]
(
	@OrganismId As int,
	@OrganismReasonLowId int,
	@OrganismLowDate datetime,
	@ContactLowDate datetime,
	@BankAccountLowDate datetime,
	@OfficeLowDate datetime,
	@OfficeContactLowDate datetime,
	@OfficeBankAccountLowDate datetime,
	@OfficeProcessorLowDate datetime
)
AS
BEGIN
	UPDATE Organism
	SET	   OrganismReasonLowId = @OrganismReasonLowId,
		   OrganismLowDate = @OrganismLowDate
	WHERE  OrganismId = @OrganismId

	UPDATE OrganismContact
	SET	   OrganismReasonLowId = @OrganismReasonLowId,
	       ContactLowDate = @ContactLowDate
	WHERE  OrganismId = @OrganismId

	UPDATE OrganismBankAccount
	SET	   OrganismReasonLowId = @OrganismReasonLowId,
	       BankAccountLowDate = @BankAccountLowDate
	WHERE  OrganismId = @OrganismId

	UPDATE OrganismOffice
	SET	   OrganismReasonLowId = @OrganismReasonLowId,
	       OfficeLowDate = @OfficeLowDate
	WHERE  OrganismId = @OrganismId

	UPDATE OrganismOfficeContact
	SET	   OrganismReasonLowId = @OrganismReasonLowId,
	       OfficeContactLowDate = @OfficeContactLowDate
	WHERE  OrganismId = @OrganismId

	UPDATE OrganismOfficeBankAccount
	SET	   OrganismReasonLowId = @OrganismReasonLowId,
	       OfficeBankAccountLowDate = @OfficeBankAccountLowDate
	WHERE  OrganismId = @OrganismId

	UPDATE OrganismOfficeProcessor
	SET	   OrganismReasonLowId = @OrganismReasonLowId,
	       OfficeProcessorLowDate = @OfficeProcessorLowDate
	WHERE  OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteOrganismRepresentation]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteOrganismRepresentation]
(
	@RepresentationId As int
)
AS
BEGIN
	 DELETE OrganismRepresentation
	 WHERE @RepresentationId = RepresentationId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCity]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCity]

AS
BEGIN
    SELECT City.CityId, City.CityName
	FROM [dbo].[City]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllClaimsManager]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllClaimsManager]

AS
BEGIN
    
	SELECT DeclareVehicleAccident.AccidentDate, 
		   DeclareVehicleAccident.CreatedDate, 
	       DeclareVehicleAccident.ClaimantReference, 
	       DeclareVehicleAccident.CauseVehicleRegistration,
	       State.StateName, 
           CommunicationsHistory.CommunicationDate,
	       CommunicationsHistory.CommunicationSubject,
	       CommunicationsHistory.CommunicationFileNameHtml,
	       CommunicationsHistory.CommunicationFrom
    FROM   DeclareVehicleAccident
		   LEFT JOIN State ON DeclareVehicleAccident.StateId = State.StateId 
	       LEFT JOIN CommunicationsHistory ON DeclareVehicleAccident.DeclareVehicleAccidentId = CommunicationsHistory.DeclareVehicleAccidentId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllCountry]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCountry]

AS
BEGIN
    SELECT Country.CountryId, Country.CountryName, Country.PhoneCodeId, Country.CreatedDate, Country.UpdatedDate
	FROM [dbo].[Country]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllDocumentType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllDocumentType]

AS
BEGIN
    SELECT DocumentType.DocumentTypeName, DocumentType.DocumentTypeId, DocumentType.CreatedDate, DocumentType.UpdatedDate
	FROM [dbo].[DocumentType]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganimReasonLow]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganimReasonLow]

AS
BEGIN
    SELECT orl.OrganismReasonLowId, 
	       orl.OrganismReasonLowName,
		   orl.OrganismReasonLowDescription
	FROM   OrganismReasonLow orl
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismBankAccount]

AS
BEGIN
	SELECT oba.BankAccountId,
		   oba.OrganismId,
		   bat.BankAccountTypeName,
		   bat.BankAccountTypeDescription,
		   c.CountryName,
		   oba.BankAccountSwift,
		   oba.BankAccountNumber,
		   oba.BankAccountPrincipal
	FROM   OrganismBankAccount oba
		   INNER JOIN
		   BankAccountType bat ON oba.BankAccountTypeId = bat.BankAccountTypeId
		   INNER JOIN
		   Country c ON oba.CountryId = c.CountryId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismBankAccountById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismBankAccountById]
(
	@OrganismId As int
)
AS
BEGIN
	SELECT oba.OrganismId,
	       oba.BankAccountId,
		   bat.BankAccountTypeName,
		   bat.BankAccountTypeDescription,
		   c.CountryName,
		   oba.BankAccountSwift,
		   oba.BankAccountNumber,
		   oba.BankAccountPrincipal
	FROM   OrganismBankAccount oba
		   INNER JOIN
		   BankAccountType bat ON oba.BankAccountTypeId = bat.BankAccountTypeId
		   INNER JOIN
		   Country c ON oba.CountryId = c.CountryId
    WHERE  oba.OrganismId = @OrganismId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismBankAccountType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllOrganismBankAccountType]
AS

BEGIN
    SELECT bat.BankAccountTypeId,
		   bat.BankAccountTypeName,
		   bat.BankAccountTypeDescription
    FROM   BankAccountType bat
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismContact]

AS
BEGIN
	SELECT OrganismContact.ContactId, 
	       OrganismContact.ContactPrincipal, 
		   OrganismContact.ContactName, 
		   OrganismContact.ContactLastname,
		   ContactType.ContactTypeName, 
		   OrganismContact.ContactPhone, 
		   OrganismContact.ContactFax, 
		   OrganismContact.ContactEmail
	FROM   OrganismContact
		   INNER JOIN
		   ContactType ON OrganismContact.ContactTypeId = ContactType.ContactTypeId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismContactById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismContactById]
(
	@OrganismId As int
)
AS
BEGIN
	SELECT oc.OrganismId,
	       oc.ContactId,
		   oc.ContactName, 
		   oc.ContactLastname,
		   ct.ContactTypeName,
		   oc.ContactPhone, 
		   oc.ContactFax, 
		   oc.ContactEmail,
		   oc.ContactPrincipal
	FROM   OrganismContact oc
		   INNER JOIN
		   ContactType ct ON oc.ContactTypeId = ct.ContactTypeId
    WHERE  oc.OrganismId = @OrganismId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismContactType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllOrganismContactType]
AS

BEGIN
    SELECT ContactType.ContactTypeId,
		   ContactType.ContactTypeName
    FROM   [dbo].[ContactType]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismCountryById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismCountryById]
(
    @CountryId As int
	--@OfesautoStateId int
)
AS
BEGIN
    SELECT o.OrganismId,
		   OrganismName
	FROM   Organism o
	WHERE  CountryId = @CountryId --AND OfesautoStateId = @OfesautoStateId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismOffice]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismOffice]

AS
BEGIN
	SELECT oo.OrganismId, 
		   oo.OfficeId,
		   oo.OfficeAddress,
		   c.CountryName,
		   r.RegionName,
		   cn.CityName
	FROM   OrganismOffice oo
		   INNER JOIN Country c ON oo.CountryId = c.CountryId 
		   INNER JOIN Region r ON oo.RegionId = r.RegionId 
		   INNER JOIN City cn ON oo.CityId = cn.CityId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismOfficeBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismOfficeBankAccount]

AS
BEGIN
	SELECT ooba.OrganismId,
		   ooba.BankAccountName,
		   bat.BankAccountTypeName,
		   c.CountryName,
		   ooba.BankAccountSwift,
		   ooba.BankAccountNumber,
		   rl.OrganismReasonLowName,
		   ooba.OfficeBankAccountLowDate,
		   ooba.OfficeBankAccountPrincipal
	FROM   OrganismOfficeBankAccount ooba
		   INNER JOIN
		   BankAccountType bat ON bat.BankAccountTypeId = ooba.BankAccountId
		   INNER JOIN
		   Country c ON ooba.CountryId = c.CountryId
		   LEFT JOIN
		   OrganismReasonLow rl ON ooba.OrganismReasonLowId = rl.OrganismReasonLowId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismOfficeBankAccountById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismOfficeBankAccountById]
(
	@OfficeId As int
)
AS
BEGIN
	SELECT ooba.OfficeId,
		   ooba.BankAccountName,
		   bat.BankAccountTypeName,
		   c.CountryName,
		   ooba.BankAccountSwift,
		   ooba.BankAccountNumber,
		   rl.OrganismReasonLowName,
		   ooba.OfficeBankAccountLowDate,
		   ooba.OfficeBankAccountPrincipal
	FROM   OrganismOfficeBankAccount ooba
		   INNER JOIN
		   BankAccountType bat ON bat.BankAccountTypeId = ooba.BankAccountId
		   INNER JOIN
		   Country c ON ooba.CountryId = c.CountryId
		   LEFT JOIN
		   OrganismReasonLow rl ON ooba.OrganismReasonLowId = rl.OrganismReasonLowId
	WHERE  ooba.OfficeId = @OfficeId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismOfficeById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismOfficeById]
(
    @OfficeId AS int
)
AS
BEGIN
    SELECT oo.OrganismId,
		   oo.OfficeHightDate,
		   c.CountryName,
		   r.RegionName,
		   ci.CityName,
		   oo.OfficeAddress,
		   oo.OfficePostalCode,
		   orl.OrganismReasonLowName,
		   oo.OfficeLowDate
	FROM   OrganismOffice oo
		   INNER JOIN 
		   Country c ON oo.CountryId = c.CountryId
		   INNER JOIN 
		   Region r ON oo.RegionId = r.RegionId
		   INNER JOIN 
		   City ci ON oo.CityId = ci.CityId
		   LEFT JOIN 
		   OrganismReasonLow orl ON oo.OrganismReasonLowId = orl.OrganismReasonLowId
	WHERE  oo.OfficeId = @OfficeId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismOfficeContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismOfficeContact]

AS
BEGIN
	SELECT ooc.OfficeId,
		   ooc.ContactName,
		   ooc.ContactLastname, 
		   ooc.ContactTypeId,
		   ct.ContactTypeName,
		   ooc.ContactPhone,
		   ooc.ContactFax, 
		   ooc.ContactEmail,
		   rl.OrganismReasonLowName,
		   ooc.OfficeContactLowDate,
		   ooc.OfficeContactPrincipal
	FROM   OrganismOfficeContact ooc
		   INNER JOIN
		   ContactType ct ON ooc.ContactTypeId = ct.ContactTypeId
		   INNER JOIN
		   OrganismReasonLow rl ON ooc.OrganismReasonLowId = rl.OrganismReasonLowId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismOfficeContactById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismOfficeContactById]
(
	@ContactId As int
)
AS
BEGIN
	SELECT ooc.ContactId,
		   ooc.ContactName,
		   ooc.ContactLastname,
		   ct.ContactTypeName,
		   ooc.ContactPhone,
		   ooc.ContactFax, 
		   ooc.ContactEmail,
		   ooc.OfficeContactPrincipal
	FROM   OrganismOfficeContact ooc
		   INNER JOIN
		   ContactType ct ON ooc.ContactTypeId = ct.ContactTypeId
	WHERE  ooc.ContactId = @ContactId
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismOfficeProcessor]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismOfficeProcessor]

AS
BEGIN    
	SELECT ofp.OrganismId,
	       ofp.OfficeProcessorName,
	       ofp.OfficeProcessorLastName,
		   ct.ContactTypeName,
		   ofp.OfficeProcessorPhone,
		   ofp.OfficeProcessorFax,
		   ofp.OfficeProcessorEmail,
		   rl.OrganismReasonLowName,
		   ofp.OfficeProcessorLowDate,
		   ofp.OfficeProcessorPrincipal
	FROM   OrganismOfficeProcessor ofp
		   INNER JOIN
		   ContactType ct ON ofp.ContactTypeId = ct.ContactTypeId
		   LEFT JOIN
		   OrganismReasonLow rl ON ofp.OrganismReasonLowId = rl.OrganismReasonLowId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismOfficeProcessorById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismOfficeProcessorById]
(
	@OfficeId As int
)
AS
BEGIN    
	SELECT oop.OfficeId,
	       oop.OfficeProcessorName,
	       oop.OfficeProcessorLastName,
		   ct.ContactTypeName,
		   oop.OfficeProcessorPhone,
		   oop.OfficeProcessorFax,
		   oop.OfficeProcessorEmail,
		   rl.OrganismReasonLowName,
		   oop.OfficeProcessorLowDate,
		   oop.OfficeProcessorPrincipal
	FROM   OrganismOfficeProcessor oop
		   INNER JOIN
		   ContactType ct ON oop.ContactTypeId = ct.ContactTypeId
		   LEFT JOIN
		   OrganismReasonLow rl ON oop.OrganismReasonLowId = rl.OrganismReasonLowId
	WHERE  oop.OfficeId = @OfficeId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismRepresentative]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismRepresentative]
(
	@OrganismId As int
)
AS
BEGIN    
	SELECT OrganismRepresentation.RepresentationId, 
		   c.CountryName,
		   o.OrganismName,
		   OrganismRepresentation.RepresentationStartDate,
		   o.OrganismId,
		   'LEFT' [Table]
	FROM   OrganismRepresentation
		   INNER JOIN
		   Organism o ON OrganismRepresentation.RepresentedOrganismId = o.OrganismId
		   INNER JOIN
		   Country c ON o.CountryId = c.CountryId
    WHERE  OrganismRepresentation.RepresentativeOrganismId = @OrganismId
	UNION ALL
	SELECT OrganismRepresentation.RepresentationId, 
		   c.CountryName,
		   o.OrganismName,
		   OrganismRepresentation.RepresentationStartDate,
		   o.OrganismId,
		   'RIGHT' [Table]
	FROM   OrganismRepresentation
		   INNER JOIN
		   Organism o ON OrganismRepresentation.RepresentativeOrganismId = o.OrganismId
		   INNER JOIN
		   Country c ON o.CountryId = c.CountryId
    WHERE  OrganismRepresentation.RepresentedOrganismId = @OrganismId

END

		  


GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismRepresented]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismRepresented]
(
	@OrganismId As int
)
AS
BEGIN    
	SELECT OrganismRepresentation.RepresentationId, 
		   c.CountryName,
		   o.OrganismName,
		   OrganismRepresentation.RepresentationStartDate,
		   o.OrganismId
	FROM   OrganismRepresentation
		   INNER JOIN
		   Organism o ON OrganismRepresentation.RepresentativeOrganismId = o.OrganismId
		   INNER JOIN
		   Country c ON o.CountryId = c.CountryId
    WHERE  OrganismRepresentation.RepresentedOrganismId = @OrganismId
END

		  


GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismRepresenting]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismRepresenting]
(
	@OrganismId As int
)
AS
BEGIN    
	SELECT OrganismRepresentation.RepresentationId, 
		   c.CountryName,
		   o.OrganismName,
		   OrganismRepresentation.RepresentationStartDate,
		   o.OrganismId
	FROM   OrganismRepresentation
		   INNER JOIN
		   Organism o ON OrganismRepresentation.RepresentedOrganismId = o.OrganismId
		   INNER JOIN
		   Country c ON o.CountryId = c.CountryId
    WHERE  OrganismRepresentation.RepresentativeOrganismId = @OrganismId
END

		  


GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganisms]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganisms]

AS
BEGIN
	SELECT o.OrganismId, 
	       o.OrganismName, 
		   o.OrganismLastName, 
		   c.CountryName, 
		   ot.OrganismTypeName, 
		   o.OrganismCIF, 
		   op.OfesautoStateName
	FROM   Organism o
		   INNER JOIN
		   Country c ON o.CountryId = c.CountryId 
		   INNER JOIN 
		   OrganismType ot ON o.OrganismTypeId = ot.OrganismTypeId 
		   INNER JOIN 
		   OfesautoProcesState op ON o.OfesautoStateId = op.OfesautoStateId
END



GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismSubType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismSubType]

AS
BEGIN
    SELECT ost.OrganismSubTypeId, 
		   ost.OrganismSubTypeName,
		   ost.OrganismSubTypeDescription
	FROM   OrganismSubType ost
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganismType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganismType]

AS
BEGIN
    SELECT OrganismType.OrganismTypeId, 
	       OrganismType.OrganismTypeName, 
		   OrganismType.OrganismTypeDescription
	FROM   OrganismType
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPhoneCodeByCountry]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllPhoneCodeByCountry]

AS
BEGIN
	  SELECT  Country.CountryId, Country.CountryName, Country.PhoneCodeId
	  FROM    Country
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllRegion]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRegion]

AS
BEGIN
    SELECT Region.RegionId, Region.RegionName, Region.CountryId, Region.CreatedDate, Region.UpdatedDate
	FROM [dbo].[Region]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllState]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllState]
AS

BEGIN
    SELECT StateId, StateName, StateNamEnglish
    FROM [dbo].[State]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllVehicleBrand]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllVehicleBrand]
AS

BEGIN
    SELECT VehicleBrandId, BrandName, BrandNamEnglish
    FROM [dbo].[VehicleBrand]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllVehicleCategory]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllVehicleCategory]
AS

BEGIN
    SELECT VehicleCategoryId, CategoryName, CategoryNamEnglish
    FROM [dbo].[VehicleCategory]
END
GO
/****** Object:  StoredProcedure [dbo].[GetCityById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCityById]
(
    @CityId AS int
)
AS
BEGIN
    SELECT City.CityId, City.CityName
	FROM [dbo].[City]
	WHERE CityId = @CityId
END
GO
/****** Object:  StoredProcedure [dbo].[GetCityByRegionByCountry]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCityByRegionByCountry]
(
	@CountryId As int,
	@RegionId As int
)
AS
BEGIN
	  SELECT  City.CityId, City.CityName
	  FROM    City INNER JOIN Region 
			  ON Region.CountryId = City.CountryId
		     AND Region.RegionId = City.RegionId
			  INNER JOIN Country 
			  ON Region.CountryId = Country.CountryId
	  WHERE	  Country.CountryId = @CountryId AND Region.RegionId = @RegionId
END


GO
/****** Object:  StoredProcedure [dbo].[GetClaimsManagerById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClaimsManagerById]
(
	@DeclareVehicleAccidentId As int
)
AS
BEGIN
	 SELECT dva.DeclareVehicleAccidentId,
			dva.ClaimantFax,
			dva.ClaimantReference,
			dt.DocumentTypeName, 
			dva.ApplicationType,
			dva.AccidentDate,
			c.CountryName As AccidentCountryId, 
			r.RegionName As AccidentRegionId,
			dva.AccidentVersion,
			dva.ReasonForOpeningId,
			vc.CategoryName As CauseVehicleCategoryBrandId, 
			vb.BrandName As CauseVehicleBrandId, 
			vm.ModelName As CauseVehicleModelId, 
			dva.CauseVehicleRegistration,
			ccr.CountryName As CauseCountryRegistrationId,
			i.InsurerName As CauseInsurerCompanyId,
			dva.CauseNumberPolicy, 
			dva.CauseAddress,
			dva.Comments,
			st.StateName As StateId,
			ab.BrandName As AffectedVehicleBrandId,
			av.CategoryName As AffectedVehicleCategoryId,
			am.ModelName As AffectedVehicleModelId,
			dva.AffectedVehicleRegistration, 
			acr.CountryName As AffectedCountryRegistrationId,
			ai.InsurerName As AffectedInsuranceCompanyId,
			dva.AffectedNumberPolicy,
			dva.AffectedName, 
			dva.AffectedSurname,
			u.Email As AffectedAddress,
			ac.CityName As AffectedCityId,
			ar.RegionName As AffectedRegionId,
			dva.AffectedEmail,
			dva.AffectedPhoneNumber,
			dva.AffectedDamageMaterials,
			dva.AffectedDamagePersonals,
			ca.AttachmentId,
			ca.AttachmentFileName,
			dva.AcceptRgpd

	 FROM	[dbo].[DeclareVehicleAccident] dva
			INNER JOIN DocumentType dt ON dva.DocumentTypeId = dt.DocumentTypeId
			INNER JOIN [User] u ON dva.UserId = u.UserId
			INNER JOIN Country c ON dva.AccidentCountryId = c.CountryId
			INNER JOIN Region r ON dva.AccidentRegionId = r.RegionId
			INNER JOIN VehicleCategory vc ON dva.CauseVehicleCategoryId = vc.VehicleCategoryId
			INNER JOIN VehicleBrand vb ON dva.CauseVehicleBrandId = vb.VehicleBrandId
			INNER JOIN VehicleModel vm ON dva.CauseVehicleModelId= vm.VehicleModelId
			INNER JOIN Country ccr ON dva.CauseCountryRegistrationId = ccr.CountryId
			INNER JOIN Insurer i ON dva.CauseInsuranceCompanyId = i.InsurerId
			INNER JOIN VehicleCategory av ON dva.CauseInsuranceCompanyId = av.VehicleCategoryId
			INNER JOIN [State] st ON dva.StateId = st.StateId
			INNER JOIN VehicleBrand ab ON dva.CauseVehicleBrandId = ab.VehicleBrandId
			INNER JOIN VehicleModel am ON dva.CauseVehicleModelId = am.VehicleModelId
			INNER JOIN Country acr ON dva.AffectedCountryRegistrationId = acr.CountryId
			INNER JOIN Insurer ai ON dva.AffectedInsuranceCompanyId = ai.InsurerId
			INNER JOIN City ac ON dva.AffectedCityId = ac.CityId
			INNER JOIN Region ar ON dva.AffectedRegionId = ar.RegionId
			INNER JOIN CommunicationAttachments ca ON dva.DeclareVehicleAccidentId = ca.DeclareVehicleAccidentId
	 WHERE  dva.DeclareVehicleAccidentId = @DeclareVehicleAccidentId
END

GO
/****** Object:  StoredProcedure [dbo].[GetClaimsManagerTrazability]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClaimsManagerTrazability]

AS
BEGIN
    
	SELECT dva.AccidentDate,
		   ch.CommunicationDate,
	       dva.ClaimantReference,
	       dva.CauseVehicleRegistration,
		   ch.CommunicationDate,
		   ch.CommunicationId,
		   ch.CommunicationSubject,
		   ch.CommunicationText,
		   ch.CommunicationFileNameHtml,
		   ch.CommunicationTo,
		   s.StateName
    FROM   DeclareVehicleAccident dva
		   INNER JOIN 
		   CommunicationsHistory ch ON dva.DeclareVehicleAccidentId = ch.DeclareVehicleAccidentId
		   INNER JOIN 
		   [State] s ON dva.StateId = s.StateId
		   ORDER BY dva.DeclareVehicleAccidentId, dva.AccidentDate ASC
END

GO
/****** Object:  StoredProcedure [dbo].[GetCountryByRegion]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountryByRegion]
(
	@CountryId AS int
)
AS
BEGIN
	  SELECT  Country.CountryId, Country.CountryName, Country.PhoneCodeId, Region.RegionId, Region.RegionName
	  FROM    Country INNER JOIN
              Region ON Country.CountryId = Region.CountryId  	
	  WHERE	  Region.CountryId = @CountryId
END
GO
/****** Object:  StoredProcedure [dbo].[GetInsurerByCountry]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInsurerByCountry]
(
	@InsurerCountryId As int
)
AS
BEGIN
	  SELECT Insurer.InsurerId, Insurer.InsurerCode,Insurer.InsurerName
      FROM   Country INNER JOIN Insurer
         ON  Country.CountryId = Insurer.InsurerCountryId
      WHERE  Insurer.InsurerCountryId = @InsurerCountryId
END


GO
/****** Object:  StoredProcedure [dbo].[GetOrganismBankAccountById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganismBankAccountById]
(
	@BankAccountId As int
)
AS
BEGIN
	SELECT oba.BankAccountId,
		   bat.BankAccountTypeName,
		   bat.BankAccountTypeDescription,
		   c.CountryName,
		   oba.BankAccountSwift,
		   oba.BankAccountNumber,
		   oba.BankAccountPrincipal
	FROM   OrganismBankAccount oba
		   INNER JOIN
		   BankAccountType bat ON bat.BankAccountTypeId = oba.BankAccountId
		   INNER JOIN
		   Country c ON oba.CountryId = c.CountryId
	WHERE  oba.BankAccountId = @BankAccountId
END



GO
/****** Object:  StoredProcedure [dbo].[GetOrganismById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganismById]
(
    @OrganismId AS int
)
AS
BEGIN
    SELECT o.OrganismId,
		   o.OrganismHightDate,
	       ot.OrganismTypeName,
		   ost.OrganismSubTypeName,
		   o.OrganismCode,
		   OrganismName, 
		   OrganismLastName,
		   dt.DocumentTypeName,
		   o.OrganismCIF,
		   o.OrganismAddress,
		   o.OrganismPostalCode,
		   c.CountryName,
		   r.RegionName,
		   ci.CityName,
		   o.OrganismWebSite,
		   orl.OrganismReasonLowName,
		   o.OrganismLowDate
	FROM   Organism o
		   INNER JOIN OrganismType ot ON o.OrganismTypeId = ot.OrganismTypeId
		   INNER JOIN OrganismSubType ost ON o.OrganismSubTypeId = ost.OrganismSubTypeId
		   INNER JOIN DocumentType dt ON o.DocumentTypeId = dt.DocumentTypeId
		   INNER JOIN Country c ON o.CountryId = c.CountryId
		   INNER JOIN Region r ON o.RegionId = r.RegionId
		   INNER JOIN City ci ON o.CityId = ci.CityId
		   LEFT JOIN OrganismReasonLow orl ON o.OrganismReasonLowId = orl.OrganismReasonLowId
	WHERE  OrganismId = @OrganismId
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrganismContactById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganismContactById]
(
	@ContactId As int
)
AS
BEGIN
	SELECT oc.ContactId,
		   oc.ContactName, 
		   oc.ContactLastname, 
	       ct.ContactTypeName,
		   oc.ContactPhone, 
		   oc.ContactFax, 
		   oc.ContactEmail, oc.ContactPrincipal
	FROM   OrganismContact oc
		   INNER JOIN 
		   ContactType ct ON oc.ContactTypeId = ct.ContactTypeId
	WHERE  oc.ContactId = @ContactId
END



GO
/****** Object:  StoredProcedure [dbo].[GetOrganismGeneralsDataById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganismGeneralsDataById]
(
	@OrganismId As int
)
AS
BEGIN
	SELECT Organism.OrganismId,
		   Organism.OrganismName,
		   Organism.OrganismLastName,
	       dt.DocumentTypeName,
		   Organism.OrganismCIF,
		   co.CountryName,
		   r.RegionName,
		   ci.CityName,	
		   Organism.OrganismAddress,
		   Organism.OrganismPostalCode
	FROM   Organism
		   INNER JOIN 
		   DocumentType dt ON Organism.DocumentTypeId = dt.DocumentTypeId
		   INNER JOIN
		   Country co ON Organism.CountryId = co.CountryId
		   INNER JOIN
		   Region r ON Organism.RegionId = r.RegionId
	       INNER JOIN
		   City ci ON Organism.CityId = ci.CityId
	WHERE  Organism.OrganismId = @OrganismId
END



GO
/****** Object:  StoredProcedure [dbo].[GetOrganismOfficeBankAccountById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganismOfficeBankAccountById]
(
	@OrganismId As tinyint
)
AS
BEGIN
	SELECT ooba.OrganismId,
		   ooba.BankAccountName,
		   bat.BankAccountTypeName,
		   c.CountryName,
		   ooba.BankAccountSwift,
		   ooba.BankAccountNumber,
		   ooba.OfficeBankAccountPrincipal
	FROM   OrganismOfficeBankAccount ooba
		   INNER JOIN
		   BankAccountType bat ON bat.BankAccountTypeId = ooba.BankAccountId
		   INNER JOIN
		   Country c ON ooba.CountryId = c.CountryId
	WHERE  ooba.OrganismId = @OrganismId
END



GO
/****** Object:  StoredProcedure [dbo].[GetOrganismOfficeById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganismOfficeById]
(
    @OrganismId AS int
)
AS
BEGIN
    SELECT o.OrganismId,
		   o.OfficeHightDate,
		   c.CountryName,
		   r.RegionName,
		   ci.CityName,
		   o.OfficeAddress,
		   o.OfficePostalCode,
		   orl.OrganismReasonLowName,
		   o.OfficeLowDate
	FROM   OrganismOffice o
		   INNER JOIN Country c ON o.CountryId = c.CountryId
		   INNER JOIN Region r ON o.RegionId = r.RegionId
		   INNER JOIN City ci ON o.CityId = ci.CityId
		   LEFT JOIN OrganismReasonLow orl ON o.OrganismReasonLowId = orl.OrganismReasonLowId
	WHERE  OrganismId = @OrganismId
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrganismOfficeContatcById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganismOfficeContatcById]
(
	@OrganismId As int
)
AS
BEGIN
	SELECT OrganismOfficeContact.OrganismId,
		   OrganismOfficeContact.ContactName,
		   OrganismOfficeContact.ContactLastname,
		   ContactType.ContactTypeName,
		   OrganismOfficeContact.ContactPhone,
		   OrganismOfficeContact.ContactFax,
		   OrganismOfficeContact.ContactEmail
	FROM   OrganismOfficeContact
		   INNER JOIN 
		   ContactType ON OrganismOfficeContact.ContactTypeId = ContactType.ContactTypeId
	WHERE  OrganismOfficeContact.OrganismId = @OrganismId
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrganismOfficeProcessorById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganismOfficeProcessorById]
(
	@OrganismId As int
)
AS
BEGIN    
	SELECT oop.OrganismId,
	       oop.OfficeProcessorName,
	       oop.OfficeProcessorLastName,
		   ct.ContactTypeName,
		   oop.OfficeProcessorPhone,
		   oop.OfficeProcessorFax,
		   oop.OfficeProcessorEmail,
		   rl.OrganismReasonLowName,
		   oop.OfficeProcessorLowDate,
		   oop.OfficeProcessorPrincipal
	FROM   OrganismOfficeProcessor oop
		   INNER JOIN
		   ContactType ct ON oop.ContactTypeId = ct.ContactTypeId
		   LEFT JOIN
		   OrganismReasonLow rl ON oop.OrganismReasonLowId = rl.OrganismReasonLowId
	WHERE  oop.OrganismId = @OrganismId
END
GO
/****** Object:  StoredProcedure [dbo].[GetRegionById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRegionById]
(
    @RegionId AS int
)
AS
BEGIN
    SELECT Region.RegionId, Region.RegionName
	FROM [dbo].[Region]
	WHERE RegionId = @RegionId
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByUserAndPassword]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserByUserAndPassword]
	
	@Email nvarchar(100),
	@Password nvarchar(100)

AS
BEGIN
    SELECT Email, u.Password, UserId, UserName, LastName, u.UserTypeId, ut.UserTypeName UserTypeDescription
	FROM[dbo].[User] u
	INNER JOIN 
	UserType ut ON ut.UserTypeId = u.UserTypeId
	WHERE u.Email = @Email AND u.Password = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[GetValidateEmail]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetValidateEmail]
(
    @Email AS varchar(50)
)
AS
BEGIN
    SELECT Email
	FROM [dbo].[User]
	WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[GetVehicleModelByVehicleBrand]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVehicleModelByVehicleBrand]
(
	@VehicleBrandId AS int
)
AS
BEGIN
	  SELECT  VehicleModel.VehicleModelId, VehicleModel.ModelName, VehicleModel.ModelNamEnglish
	  FROM    VehicleModel INNER JOIN
              VehicleBrand ON VehicleModel.VehicleBrandId = VehicleBrand.VehicleBrandId  	
	  WHERE	  VehicleModel.VehicleBrandId = @VehicleBrandId
END
GO
/****** Object:  StoredProcedure [dbo].[InsertActionsHistory]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertActionsHistory]
(
	@ActionHistoryId int,
	@OfesautoProcessId int,
	@StateId tinyint,
	@Observations nvarchar(max),
	@AttachmentId int,
	@UserId int,
	@ClaimProcessorId int,
    @ActionDate datetime,
	@ActionTypeId int,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @ActionHistoryId = (SELECT COUNT(*) FROM ActionsHistory) + 1

    INSERT INTO [dbo].[ActionsHistory]
	(ActionHistoryId,
	OfesautoProcessId,
	StateId, 
	Observations, 
	AttachmentId,
	UserId, 
    ClaimProcessorId, 
	ActionDate,
	ActionTypeId,
	CreateDate, 
	UpdateDate)
    VALUES(@ActionHistoryId, @OfesautoProcessId, @StateId, @Observations, @AttachmentId, @UserId, @ClaimProcessorId, @ActionDate, @ActionTypeId, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCity]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCity]
(
	@CityId AS int,
	@CityName varchar(80),
	@CountryId AS int,
	@RegionId As int,
	@CreatedDate datetime,
	@UpdatedDate datetime
)
AS
BEGIN
    INSERT INTO
	[dbo].[City]
	VALUES(@CityName, @CountryId, @RegionId, @CreatedDate, @UpdatedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCommunicationAttachments]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCommunicationAttachments]
(
	@AttachmentId int,
	@DeclareVehicleAccidentId int,
	@AttachmentDate datetime,
	@AttachmentFileName nvarchar(50),
	@AttachmentPath nvarchar(50),
	@AttachmentDescription nvarchar(max),
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
	--SET IDENTITY_INSERT [dbo].[DeclareVehicleAccidentAttachments] ON; 
	SET @AttachmentId = (SELECT COUNT(*) FROM CommunicationAttachments) + 1

    INSERT INTO [dbo].[CommunicationAttachments](AttachmentId, DeclareVehicleAccidentId, AttachmentDate, AttachmentFileName, AttachmentPath, AttachmentDescription, CreateDate, UpdateDate)
    VALUES(@AttachmentId, @DeclareVehicleAccidentId, @AttachmentDate, @AttachmentFileName, @AttachmentPath, @AttachmentDescription, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCommunicationsHistory]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCommunicationsHistory]
(
	@CommunicationId int,
	@DeclareVehicleAccidentId int,
	@CommunicationDate datetime,
	@CommunicationTo nvarchar(50),
	@CommunicationSubject nvarchar(50),
	@CommunicationText nvarchar(max),
	@CommunicationFileNameHtml nvarchar(50),
	@CreateDate datetime,
	@UpdateDate datetime,
	@CommunicationFrom nvarchar(50)
)
AS
BEGIN

	SET @CommunicationId = (SELECT COUNT(*) FROM CommunicationsHistory) + 1

    INSERT INTO [dbo].[CommunicationsHistory](
	CommunicationId,
	DeclareVehicleAccidentId, 
	CommunicationDate, 
	CommunicationTo,
	CommunicationSubject,
	CommunicationText,
	CommunicationFileNameHtml,
	CreateDate,
	UpdateDate,
	CommunicationFrom)

    VALUES(@CommunicationId, @DeclareVehicleAccidentId, @CommunicationDate, @CommunicationTo, @CommunicationSubject, @CommunicationText, @CommunicationFileNameHtml, @CreateDate, @UpdateDate, @CommunicationFrom)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCountry]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCountry]
(
	@CountryId AS int,
	@CountryName varchar(80),
	@PhoneCode varchar (10),
	@CreatedDate datetime,
	@UpdatedDate datetime
)
AS
BEGIN
    INSERT INTO
	[dbo].[Country]	VALUES (@CountryName, @PhoneCode, @CreatedDate, @UpdatedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDeclareVehicleAccident]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDeclareVehicleAccident]
(

	@DeclareVehicleAccidentId int,
	@UserId int,
	@ClaimantFax nvarchar(15),
	@ClaimantReference nvarchar(15),
	@DocumentTypeId int,
	@ApplicationType nvarchar(10),
	@AccidentDate date,
	@AccidentCountryId int,
	@AccidentRegionId int,
	@AccidentVersion nvarchar(max),
	@ReasonForOpeningId int,
	@CauseVehicleCategoryId tinyint,
	@CauseVehicleBrandId tinyint,
	@CauseVehicleModelId tinyint,
	@CauseVehicleRegistration nvarchar(15),
	@CauseCountryRegistrationId tinyint,
	@CauseInsuranceCompanyId tinyint,
	@CauseNumberPolicy nvarchar(10),
	@CauseAddress nvarchar(50),
	@Comments nvarchar(max),
	@StateId tinyint,
	@AffectedVehicleBrandId tinyint,
	@AffectedVehicleCategoryId tinyint,
	@AffectedVehicleModelId tinyint,
	@AffectedVehicleRegistration nvarchar(15),
	@AffectedCountryRegistrationId tinyint,
	@AffectedInsuranceCompanyId tinyint,
	@AffectedNumberPolicy nvarchar(10),
	@AffectedName nvarchar(50),
	@AffectedSurname nvarchar(50),
	@AffectedAddress nvarchar(50),
	@AffectedCityId int,
	@AffectedRegionId int,
	@AffectedEmail nvarchar(50),
	@AffectedPhoneNumber nvarchar(15),
	@AffectedDamageMaterials bit,
	@AffectedDamagePersonals bit,
	@AcceptRgpd bit,
	@OrganismId int,
	@ClaimsProcessorId int,
	@CreatedDate datetime,
	@UpdateDate datetime

)
AS
BEGIN
	--SET IDENTITY_INSERT [dbo].[DeclareVehicleAccident] ON; 
	SET @DeclareVehicleAccidentId = (SELECT COUNT(*) FROM DeclareVehicleAccident) + 1

    INSERT INTO [dbo].[DeclareVehicleAccident]
	(DeclareVehicleAccidentId,
	 UserId,
	 ClaimantFax,
	 ClaimantReference,
	 DocumentTypeId,
	 ApplicationType,
	 AccidentDate,
	 AccidentCountryId,
	 AccidentRegionId,
	 AccidentVersion,
	 ReasonForOpeningId,
	 CauseVehicleCategoryId,
	 CauseVehicleBrandId,
	 CauseVehicleModelId,
	 CauseVehicleRegistration,
	 CauseCountryRegistrationId,
	 CauseInsuranceCompanyId,
	 CauseNumberPolicy,
	 CauseAddress,
	 Comments,
	 StateId,
	 AffectedVehicleBrandId,
	 AffectedVehicleCategoryId,
	 AffectedVehicleModelId,
	 AffectedVehicleRegistration,
	 AffectedCountryRegistrationId,
	 AffectedInsuranceCompanyId,
	 AffectedNumberPolicy,
	 AffectedName,
	 AffectedSurname,
	 AffectedAddress,
	 AffectedCityId,
	 AffectedRegionId,
	 AffectedEmail,
	 AffectedPhoneNumber,
	 AffectedDamageMaterials,
	 AffectedDamagePersonals,
	 AcceptRgpd,
	 OrganismId,
	 ClaimsProcessorId,
	 CreatedDate,
	 UpdateDate)
    VALUES(@DeclareVehicleAccidentId, @UserId, @ClaimantFax, @ClaimantReference, @DocumentTypeId, @ApplicationType, @AccidentDate, @AccidentCountryId, @AccidentRegionId, @AccidentVersion, @ReasonForOpeningId, @CauseVehicleCategoryId, @CauseVehicleBrandId, @CauseVehicleModelId, @CauseVehicleRegistration, @CauseCountryRegistrationId, @CauseInsuranceCompanyId, @CauseNumberPolicy, @CauseAddress, @Comments, @StateId, @AffectedVehicleBrandId, @AffectedVehicleCategoryId, @AffectedVehicleModelId, @AffectedVehicleRegistration, @AffectedCountryRegistrationId, @AffectedInsuranceCompanyId, @AffectedNumberPolicy, @AffectedName, @AffectedSurname, @AffectedAddress, @AffectedCityId, @AffectedRegionId, @AffectedEmail, @AffectedPhoneNumber, @AffectedDamageMaterials, @AffectedDamagePersonals, @AcceptRgpd, @OrganismId, @ClaimsProcessorId, @CreatedDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertInvestigationRecord]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInvestigationRecord]
(
	@InvestigationRecordId int,
	@InvestigationRecordNumber nvarchar(15),
	@InvestigationRecordDateHigh datetime,
	@DeclareVehicleAccidentId int,
	@StateId tinyint,
	@InvestigationRecordClosingDate datetime,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @InvestigationRecordId = (SELECT COUNT(*) FROM InvestigationRecord) + 1

    INSERT INTO [dbo].[InvestigationRecord]
	(InvestigationRecordId,
	InvestigationRecordNumber, 
	InvestigationRecordDateHigh, 
	DeclareVehicleAccidentId, 
	StateId, 
	InvestigationRecordClosingDate, 
	CreateDate, 
	UpdateDate)

    VALUES(@InvestigationRecordId, @InvestigationRecordNumber, @InvestigationRecordDateHigh, @DeclareVehicleAccidentId, @StateId, @InvestigationRecordClosingDate, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganism]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganism]
(
	@OrganismId int,
	@OrganismTypeId tinyint,
	@CountryId tinyint,
	@RegionId tinyint,
	@CityId tinyint,
	@OrganismName nvarchar(50),
	@OrganismLastName nvarchar(50),
	@OrganismAddress nvarchar(50),
	@DocumentTypeId int,
	@OrganismPostalCode nvarchar(15),
    @OrganismCIF nvarchar(15),
	@OrganismWebSite nvarchar(15),
	@OrganismCode nvarchar(15),
	@OrganismReasonLowId tinyint,
	@OrganismLowDate datetime,
	@OrganismIdPassTo nvarchar(15),
	@OrganismHightDate datetime,
	@OfesautoStateId tinyint,
	@OrganismSubTypeId tinyint,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @OrganismId = (SELECT COUNT(*) FROM Organism) + 1

    INSERT INTO [dbo].[Organism]
	(OrganismId,
	OrganismTypeId, 
	CountryId, 
	RegionId, 
	CityId, 
	OrganismName, 
	OrganismLastName,
	DocumentTypeId,
	OrganismAddress, 
	OrganismPostalCode, 
	OrganismCIF, 
	OrganismWebSite, 
	OrganismCode,
	OrganismReasonLowId,
	OrganismLowDate, 
	OrganismIdPassTo, 
	OrganismHightDate, 
	OrganismSubTypeId,
	OfesautoStateId,
	CreateDate, 
	UpdateDate)

    VALUES(@OrganismId, @OrganismTypeId, @CountryId, @RegionId, @CityId, @OrganismName, @OrganismLastName, @DocumentTypeId, @OrganismAddress, @OrganismPostalCode, @OrganismCIF, @OrganismWebSite, @OrganismCode, @OrganismReasonLowId, @OrganismLowDate, @OrganismIdPassTo, @OrganismHightDate, @OrganismSubTypeId, @OfesautoStateId, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismBankAccount]
(
	@OrganismId int,
	@BankAccountId tinyint,
	@BankAccountTypeId tinyint,
	@CountryId int,
	@BankAccountNumber nvarchar(15),
	@BankAccountSwift nvarchar(15),
	@CreateDate datetime,
	@UpdateDate datetime,
	@BankAccountPrincipal bit
)
AS
BEGIN
    SET @OrganismId = (SELECT COUNT(*) FROM OrganismBankAccount) + 1
    SET @BankAccountId = (SELECT COUNT(*) FROM OrganismBankAccount) + 1

    INSERT INTO [dbo].[OrganismBankAccount]
	(OrganismId,
	BankAccountId,
	BankAccountTypeId,
	CountryId,
	BankAccountNumber,
	BankAccountSwift,
	CreateDate,
	UpdateDate,
	BankAccountPrincipal
	)

    VALUES(@OrganismId, @BankAccountId, @BankAccountTypeId, @CountryId, @BankAccountNumber, @BankAccountSwift, @CreateDate, @UpdateDate, @BankAccountPrincipal)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismCode]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertOrganismCode]
(
	@OrganismId AS int,
	@Code varchar (15)	
)
AS
BEGIN
    UPDATE [dbo].[Organism]
       SET 
		  Code = @Code
	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismContact]
(
	@OrganismId int,
	@ContactId tinyint,
	@ContactTypeId tinyint,
	@ContactName nvarchar(50),
	@ContactLastname nvarchar(50),
	@ContactPhone nvarchar(15),
	@ContactFax nvarchar(15),
	@ContactEmail nvarchar(50),
	@ContactPrincipal bit,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @OrganismId = (SELECT COUNT(*) FROM OrganismContact) + 1

    INSERT INTO [dbo].[OrganismContact]
	(OrganismId,
	ContactId,
	ContactTypeId,
	ContactName,
	ContactLastName,
	ContactPhone,
	ContactFax,
	ContactEmail,
	ContactPrincipal,
	CreateDate,
	UpdateDate)

    VALUES(@OrganismId, @ContactId, @ContactTypeId, @ContactName, @ContactLastName, @ContactPhone, @ContactFax, @ContactEmail, @ContactPrincipal, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismOffice]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismOffice]
(
	@OrganismId int,
	@OfficeId tinyint,
	@CountryId tinyint,
	@RegionId tinyint,
	@CityId tinyint,
	@OfficeAddress nvarchar(50),
	@OfficePostalCode nvarchar(15),
	@OfficeHightDate datetime,
	@OfficeLowDate datetime,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @OrganismId = (SELECT COUNT(*) FROM OrganismOffice) + 1
    SET @OfficeId = (SELECT COUNT(*) FROM OrganismOffice) + 1

    INSERT INTO [dbo].[OrganismOffice]
	(OrganismId,
	OfficeId, 
	CountryId, 
	RegionId, 
	CityId,
	OfficeAddress, 
	OfficePostalCode, 
	OfficeHightDate,
	OfficeLowDate,
	CreateDate, 
	UpdateDate)

    VALUES(@OrganismId, @OfficeId, @CountryId, @RegionId, @CityId, @OfficeAddress, @OfficePostalCode, @OfficeHightDate, @OfficeLowDate, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismOfficeBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismOfficeBankAccount]
(
	@OrganismId int,
	@OfficeId tinyint,
	@BankAccountId tinyint,
    @BankAccountName nvarchar(50),
    @BankAccountTypeId tinyint,
	@CountryId int,
	@BankAccountNumber nvarchar(15),
	@BankAccountSwift nvarchar(15),
	@OrganismReasonLowId int,
	@OfficeBankAccountLowDate datetime,
	@OfficeBankAccountPrincipal bit,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @OrganismId = (SELECT COUNT(*) FROM OrganismOfficeBankAccount) + 1
    SET @OfficeId = (SELECT COUNT(*) FROM OrganismOfficeBankAccount) + 1
    SET @BankAccountId = (SELECT COUNT(*) FROM OrganismOfficeBankAccount) + 1

    INSERT INTO [dbo].[OrganismOfficeBankAccount]
	(OrganismId,	
	OfficeId,
	BankAccountId,
	BankAccountName,
	BankAccountTypeId,
	CountryId,
	BankAccountNumber,
	BankAccountSwift,
	OrganismReasonLowId,
	OfficeBankAccountLowDate,
	OfficeBankAccountPrincipal,
	CreateDate,
	UpdateDate)

    VALUES(@OrganismId, @OfficeId, @BankAccountId, @BankAccountName, @BankAccountTypeId, @CountryId, @BankAccountNumber, @BankAccountSwift, @OrganismReasonLowId, @OfficeBankAccountLowDate, @OfficeBankAccountPrincipal ,@CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismOfficeContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismOfficeContact]
(
	@OrganismId int,
	@OfficeId tinyint,
    @ContactId tinyint,
	@ContactTypeId tinyint,
	@ContactName nvarchar(50),
	@ContactLastname nvarchar(50),
	@ContactPhone nvarchar(15),
	@ContactFax nvarchar(15),
	@ContactEmail nvarchar(50),
	@OrganismReasonLowId int,
	@OfficeContactLowDate datetime,
	@OfficeContactPrincipal bit,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @OrganismId = (SELECT COUNT(*) FROM OrganismOfficeContact) + 1
    SET @OfficeId = (SELECT COUNT(*) FROM OrganismOfficeContact) + 1
    SET @ContactId= (SELECT COUNT(*) FROM OrganismOfficeContact) + 1

    INSERT INTO [dbo].[OrganismOfficeContact]
	(OrganismId,	
	OfficeId,
	ContactId,
	ContactTypeId,
	ContactName,
	ContactLastName,
	ContactPhone,
	ContactFax,
	ContactEmail,
	OrganismReasonLowId,
	OfficeContactLowDate,
	OfficeContactPrincipal,
	CreateDate,
	UpdateDate)

    VALUES(@OrganismId, @OfficeId, @ContactId, @ContactTypeId, @ContactName, @ContactLastName, @ContactPhone, @ContactFax, @ContactEmail, @OrganismReasonLowId, @OfficeContactLowDate, @OfficeContactPrincipal ,@CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismOfficeProcessor]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismOfficeProcessor]
(
	@OrganismId int,
	@OfficeId tinyint,
	@OfficeProcessorId tinyint,
    @OfficeProcessorName nvarchar(50),
	@OfficeProcessorLastName nvarchar(50),
	@ContactTypeId tinyint,
	@OfficeProcessorPhone nvarchar(15),
	@OfficeProcessorFax nvarchar(15),
	@OfficeProcessorEmail nvarchar(50),
	@OfficeProcessorPrincipal bit,
	@OrganismReasonLowId int,
	@OfficeProcessorLowDate datetime,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @OrganismId = (SELECT COUNT(*) FROM OrganismOfficeProcessor) + 1
    SET @OfficeId = (SELECT COUNT(*) FROM OrganismOfficeProcessor) + 1
    SET @OfficeProcessorId = (SELECT COUNT(*) FROM OrganismOfficeProcessor) + 1

    INSERT INTO [dbo].[OrganismOfficeProcessor]
	(OrganismId,
	OfficeId, 
	OfficeProcessorId, 
	OfficeProcessorName, 
	OfficeProcessorLastName,
	ContactTypeId,
	OfficeProcessorPhone, 
	OfficeProcessorFax,
	OfficeProcessorEmail,
	OfficeProcessorPrincipal, 
	OrganismReasonLowId, 
	OfficeProcessorLowDate, 
	CreateDate, 
	UpdateDate)

    VALUES(@OrganismId, @OfficeId, @OfficeProcessorId, @OfficeProcessorName, @OfficeProcessorLastName, @ContactTypeId ,@OfficeProcessorPhone, @OfficeProcessorFax, @OfficeProcessorEmail, @OfficeProcessorPrincipal, @OrganismReasonLowId, @OfficeProcessorLowDate, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismRepresentation]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismRepresentation]
(
	@RepresentationId int,
	@RepresentativeOrganismId int,
	@RepresentedOrganismId int,
	@RepresentationStartDate datetime,
	@RepresentationFinishDate datetime,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @RepresentationId = (SELECT COUNT(*) FROM OrganismRepresentation) + 1

    INSERT INTO [dbo].[OrganismRepresentation]
	(RepresentationId,
	RepresentativeOrganismId, 
	RepresentedOrganismId, 
	RepresentationStartDate, 
	RepresentationFinishDate,
	CreateDate, 
	UpdateDate)

    VALUES(@RepresentationId, @RepresentativeOrganismId, @RepresentedOrganismId, @RepresentationStartDate, @RepresentationFinishDate, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismRepresented]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismRepresented]
(
	@RepresentationId int,
	@RepresentedOrganismId int,
	@RepresentativeOrganismId int,
	@RepresentationStartDate datetime,
	@RepresentationFinishDate datetime,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    SET @RepresentationId = (SELECT COUNT(*) FROM OrganismRepresentation) + 1

    INSERT INTO [dbo].[OrganismRepresentation]
	(RepresentationId,
	RepresentedOrganismId, 
	RepresentativeOrganismId, 
	RepresentationStartDate, 
	RepresentationFinishDate,
	CreateDate, 
	UpdateDate)

    VALUES(@RepresentationId, @RepresentedOrganismId, @RepresentativeOrganismId, @RepresentationStartDate, @RepresentationFinishDate, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismSubTypeId]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismSubTypeId]
(
	@OrganismSubTypeId tinyint,
	@OrganismSubTypeName nvarchar(50),
	@OrganismSubTypeDescription nvarchar(max),
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
	SET IDENTITY_INSERT [dbo].[OrganismSubType] ON; 

    INSERT INTO [dbo].[OrganismSubType](OrganismSubTypeId, OrganismSubTypeName, OrganismSubTypeDescription, CreateDate, UpdateDate)
    VALUES(@OrganismSubTypeId, @OrganismSubTypeName, @OrganismSubTypeDescription, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrganismType]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOrganismType]
(
	@OrganismTypeId tinyint,
	@OrganismTypeName nvarchar(50),
	@OrganismTypeDescription nvarchar(max),
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
	SET IDENTITY_INSERT [dbo].[OrganismType] ON; 

    INSERT INTO [dbo].[OrganismType](OrganismTypeId, OrganismTypeName, OrganismTypeDescription, CreateDate, UpdateDate)
    VALUES(@OrganismTypeId, @OrganismTypeName, @OrganismTypeDescription, @CreateDate, @UpdateDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRegion]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertRegion]
(
    @RegionName varchar(80),
	@CountryId AS int,
	@CreatedDate datetime,
	@UpdatedDate datetime
)
AS
BEGIN
    INSERT INTO [dbo].[Region]
	VALUES(@RegionName, @CountryId, @CreatedDate, @UpdatedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[ReasonLowOrganism]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReasonLowOrganism]
(
	@OrganismId As int,
	@OrganismReasonLowId tinyint,
	@OrganismLowDate datetime
)
AS
BEGIN
    UPDATE [dbo].[Organism]
       SET	
		  OrganismReasonLowId = @OrganismReasonLowId,
		  OrganismLowDate = @OrganismLowDate
	WHERE OrganismId = @OrganismId
END


select * from OrganismReasonLow
GO
/****** Object:  StoredProcedure [dbo].[ReasonLowOrganismPassTo]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReasonLowOrganismPassTo]
(
	@OrganismId As int,
	@OrganismIdPassTo int,
	@OrganismLowDate datetime
)
AS
BEGIN
    UPDATE [dbo].[Organism]
       SET	
		  OrganismIdPassTo = @OrganismIdPassTo,
		  OrganismLowDate = @OrganismLowDate
	WHERE OrganismId = @OrganismId
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateChangeUserPassword]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateChangeUserPassword]
(
	@Email varchar(50),
	@Password varchar(50)
)
AS
BEGIN
    UPDATE [dbo].[User]
    SET	Password = @Password
	WHERE Email = @Email
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateClaimProcessorDeclareVehicleAccident]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateClaimProcessorDeclareVehicleAccident]
(
	@DeclareVehicleAccidentId AS int,
	@ClaimsProcessorId int
)
AS
BEGIN
    UPDATE [dbo].[DeclareVehicleAccident]
       SET 
		  ClaimsProcessorId = @ClaimsProcessorId
	WHERE DeclareVehicleAccidentId = @DeclareVehicleAccidentId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganism]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganism]
(
	@OrganismId int,
	@OrganismTypeId tinyint,
	@CountryId tinyint,
	@RegionId tinyint,
	@CityId tinyint,
	@OrganismName nvarchar(50),
	@OrganismLastName nvarchar(50),
	@OrganismAddress nvarchar(50),
	@DocumentTypeId int,
	@OrganismPostalCode nvarchar(15),
    @OrganismCIF nvarchar(15),
	@OrganismWebSite nvarchar(15),
	@OrganismCode nvarchar(15),
	--@OrganismReasonLowId tinyint,
	--@OrganismLowDate datetime,
	@OrganismIdPassTo nvarchar(15),
	@OrganismHightDate datetime,
	@OrganismSubTypeId tinyint,
	--@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    UPDATE [dbo].[Organism]
    SET	
		OrganismTypeId = @OrganismTypeId,
		CountryId = @CountryId,
		RegionId = @RegionId,
		CityId = @CityId,
		OrganismName = @OrganismName,
		OrganismLastName = @OrganismLastName,
		OrganismAddress = @OrganismAddress,
		DocumentTypeId = @DocumentTypeId,
		OrganismPostalCode = @OrganismPostalCode,
		OrganismCIF = @OrganismCIF,
		OrganismWebSite = @OrganismWebSite,
		OrganismCode = @OrganismCode,
		--OrganismReasonLowId = @OrganismReasonLowId,
		--OrganismLowDate = @OrganismLowDate,
		OrganismIdPassTo = @OrganismIdPassTo,
		OrganismHightDate = @OrganismHightDate,
		OrganismSubTypeId = @OrganismSubTypeId,
		--CreateDate = @CreateDate,
		UpdateDate = @UpdateDate

	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganismBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganismBankAccount]
(
	@OrganismId int,
	@BankAccountId tinyint,
	@BankAccountTypeId tinyint,
	@CountryId int,
	@BankAccountNumber nvarchar(15),
	@BankAccountSwift nvarchar(15),
    @CreateDate datetime,
	@UpdateDate datetime,
	@BankAccountPrincipal bit

)
AS
BEGIN
    UPDATE [dbo].[OrganismBankAccount]
    SET	
	OrganismId = @OrganismId,
	BankAccountId = @BankAccountId,
	BankAccountTypeId = BankAccountTypeId,
	CountryId = @CountryId,
	BankAccountNumber = @BankAccountNumber,
	BankAccountSwift = @BankAccountSwift,
    CreateDate = @CreateDate,
	UpdateDate = @UpdateDate,
	BankAccountPrincipal = @BankAccountPrincipal
	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganismContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganismContact]
(
	@OrganismId int,
	@ContactId tinyint,
	@ContactTypeId tinyint,
	@ContactName nvarchar(50),
	@ContactLastname nvarchar(50),
	@ContactPhone nvarchar(15),
	@ContactFax nvarchar(15),
	@ContactEmail nvarchar(50),
	@ContactPrincipal bit,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    UPDATE [dbo].[OrganismContact]
    SET	
	ContactId = @ContactId,
	ContactTypeId = @ContactTypeId,
	ContactName = @ContactName,
	ContactLastname = @ContactLastname,
	ContactPhone = @ContactPhone,
	ContactFax = @ContactFax,
	ContactEmail = @ContactEmail,
	ContactPrincipal = @ContactPrincipal,
	CreateDate = @CreateDate,
	UpdateDate = @UpdateDate

	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganismOffice]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganismOffice]
(
	@OrganismId int,
	--@OfficeId tinyint,
	@CountryId tinyint,
	@RegionId tinyint,
	@CityId tinyint,
	@OfficeAddress nvarchar(50),
	@OfficePostalCode nvarchar(15),
	@OfficeHightDate datetime,
	@OfficeLowDate datetime,
	--@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    UPDATE [dbo].[OrganismOffice]
    SET	
		OrganismId = @OrganismId,
		--OfficeId = @OfficeId, 
		CountryId = @CountryId, 
		RegionId = @RegionId, 
		CityId = @CityId,
		OfficeAddress = @OfficeAddress, 
		OfficePostalCode = @OfficePostalCode, 
		OfficeHightDate = @OfficeHightDate,
		OfficeLowDate = @OfficeLowDate,
		--CreateDate = @CreateDate, 
		UpdateDate = @UpdateDate

	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganismOfficeBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganismOfficeBankAccount]
(
	--@OrganismId int,
	@BankAccountId tinyint,
	@BankAccountName nvarchar(50),
	@BankAccountTypeId tinyint,
	@CountryId int,
	@BankAccountNumber nvarchar(15),
	@BankAccountSwift nvarchar(15),
    --@CreateDate datetime,
	@UpdateDate datetime
	--@BankAccountPrincipal bit

)
AS
BEGIN
    UPDATE [dbo].[OrganismOfficeBankAccount]
    SET	
	--OrganismId = @OrganismId,
	BankAccountId = @BankAccountId,
	BankAccountName = @BankAccountName,
	BankAccountTypeId = BankAccountTypeId,
	CountryId = @CountryId,
	BankAccountNumber = @BankAccountNumber,
	BankAccountSwift = @BankAccountSwift,
    --CreateDate = @CreateDate,
	UpdateDate = @UpdateDate
	--BankAccountPrincipal = @BankAccountPrincipal
	WHERE BankAccountId = @BankAccountId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganismOfficeContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganismOfficeContact]
(
	@OrganismId int,
	--@OfficeId tinyint,
    --@ContactId tinyint,
	@ContactTypeId tinyint,
	@ContactName nvarchar(50),
	@ContactLastname nvarchar(50),
	@ContactPhone nvarchar(15),
	@ContactFax nvarchar(15),
	@ContactEmail nvarchar(50),
	@OfficeContactPrincipal bit,
	@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    UPDATE [dbo].[OrganismOfficeContact]
    SET	
	OrganismId = @OrganismId,
	--OfficeId = @OfficeId,
	--ContactId = @ContactId,
	ContactTypeId = @ContactTypeId,
	ContactName = @ContactName,
	ContactLastname = @ContactLastname,
	ContactPhone = @ContactPhone,
	ContactFax = @ContactFax,
	ContactEmail = @ContactEmail,
	OfficeContactPrincipal = @OfficeContactPrincipal,
	CreateDate = @CreateDate,
	UpdateDate = @UpdateDate
	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganismOfficeProcessor]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganismOfficeProcessor]
(
	@OrganismId int,
	--@OfficeId tinyint,
	--@OfficeProcessorId tinyint,
    @OfficeProcessorName nvarchar(50),
	@OfficeProcessorLastName nvarchar(50),
	@ContactTypeId tinyint,
	@OfficeProcessorPhone nvarchar(15),
	@OfficeProcessorFax nvarchar(15),
	@OfficeProcessorEmail nvarchar(50),
	--@OfficeProcessorPrincipal bit,
	--@OrganismReasonLowId int,
	--@OfficeProcessorLowDate datetime,
	--@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    UPDATE [dbo].[OrganismOfficeProcessor]
    SET	
	OrganismId = @OrganismId,
	--OfficeId = @OfficeId,
	--OfficeProcessorId = @OfficeProcessorId,
	OfficeProcessorName = @OfficeProcessorName,
	OfficeProcessorLastName = @OfficeProcessorLastName,
	OfficeProcessorFax = @OfficeProcessorFax,
	OfficeProcessorEmail = @OfficeProcessorEmail,
	--OfficeProcessorPrincipal = @OfficeProcessorPrincipal,
	--OrganismReasonLowId = @OrganismReasonLowId,
	--OfficeProcessorLowDate = @OfficeProcessorLowDate,
	--CreateDate = @CreateDate,
	UpdateDate = @UpdateDate

	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganismRepresentation]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganismRepresentation]
(
	@RepresentationId int,
	@RepresentativeOrganismId int,
	@RepresentedOrganismId int,
	--@RepresentationStartDate datetime,
	--@RepresentationFinishDate datetime,
	--@CreateDate datetime,
	@UpdateDate datetime
)
AS
BEGIN
    UPDATE OrganismRepresentation
    SET	
		RepresentationId = @RepresentationId,
		RepresentativeOrganismId = @RepresentativeOrganismId, 
		RepresentedOrganismId = @RepresentedOrganismId, 
		--@RepresentationStartDate = @RepresentationStartDate, 
		--@RepresentationFinishDate = @RepresentationFinishDate, 
		--CreateDate = @CreateDate, 
		UpdateDate = @UpdateDate
	WHERE RepresentationId = @RepresentationId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateSelectPrincipalOrganismBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSelectPrincipalOrganismBankAccount]
(
	@OrganismId int,
	@BankAccountPrincipal bit
)
AS
BEGIN
    UPDATE [dbo].[OrganismBankAccount]
    SET	
	BankAccountPrincipal = @BankAccountPrincipal
	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateSelectPrincipalOrganismContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSelectPrincipalOrganismContact]
(
	@OrganismId int,
	@ContactPrincipal bit
)
AS
BEGIN
    UPDATE [dbo].[OrganismContact]
    SET	
	ContactPrincipal = @ContactPrincipal

	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateSelectPrincipalOrganismOfficeBankAccount]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSelectPrincipalOrganismOfficeBankAccount]
(
	@OrganismId int,
	@OfficeBankAccountPrincipal bit
)
AS
BEGIN
    UPDATE [dbo].[OrganismOfficeBankAccount]
    SET	
	OfficeBankAccountPrincipal = @OfficeBankAccountPrincipal

	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateSelectPrincipalOrganismOfficeContact]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSelectPrincipalOrganismOfficeContact]
(
	@OrganismId int,
	@OfficeContactPrincipal bit
)
AS
BEGIN
    UPDATE [dbo].[OrganismOfficeContact]
    SET	
	OfficeContactPrincipal = @OfficeContactPrincipal

	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateSelectPrincipalOrganismOfficeProcessor]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSelectPrincipalOrganismOfficeProcessor]
(
	@OrganismId int,
	@OfficeProcessorPrincipal bit
)
AS
BEGIN
    UPDATE [dbo].[OrganismOfficeProcessor]
    SET	
	OfficeProcessorPrincipal = @OfficeProcessorPrincipal

	WHERE OrganismId = @OrganismId
END


GO
/****** Object:  StoredProcedure [dbo].[UserDelete]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserDelete]

	@UserId int

AS
BEGIN
	 DELETE [dbo].[User] 
	 WHERE @UserId = UserId
END
GO
/****** Object:  StoredProcedure [dbo].[UserGetAll]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserGetAll]
AS

BEGIN
    SELECT UserId, UserTypeId, UserName, LastName, DocumentTypeId, UserIdNumber, UserAddress, CountryId, RegionId, CitytId, PostalCode, Email, PhoneCodeId, PhoneNumber, Email, Password, VerificationCode, Photo, CreatedDate, UpdatedDate
    FROM [dbo].[User]
END
GO
/****** Object:  StoredProcedure [dbo].[UserGetById]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserGetById]
(
    @UserId int
)
AS
BEGIN
    SELECT UserId, UserTypeId, UserName, LastName, DocumentTypeId, UserIdNumber, UserAddress, CountryId, RegionId, CitytId, PostalCode, Email, PhoneCodeId, PhoneNumber, Email, Password, VerificationCode, Photo, CreatedDate, UpdatedDate
	FROM [dbo].[User]
	WHERE UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[UserInsert]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserInsert]
(
	@UserId int,
	@UserTypeId int,
	@UserName varchar(100),
	@LastName varchar(100),
	@DocumentTypeId int NULL,
	@UserIdNumber varchar(15) NULL,
	@UserAddress varchar (100) NULL,
	@CountryId int NULL,
	@RegionId int NULL,
	@CityId int NULL,
	@PostalCode varchar(30) NULL,
	@PhoneCodeId int NULL,
	@PhoneNumber varchar (15) NULL,
	@Email varchar (50) NULL,
	@Password varchar (50) NULL,
	@Photo varchar (250) NULL,
	@CreatedDate datetime NULL,
	@UpdatedDate datetime NULL
)
AS
BEGIN
	--SET IDENTITY_INSERT [dbo].[User] ON; 
	SET @UserId = (SELECT COUNT(*) FROM [dbo].[User]) + 1

    INSERT INTO [dbo].[User] (UserId, UserTypeId, UserName, LastName, DocumentTypeId, UserIdNumber, UserAddress, CountryId, RegionId, CitytId, PostalCode, PhoneCodeId, PhoneNumber, Email, Password, Photo, CreatedDate, UpdatedDate)
    VALUES(@UserId, @UserTypeId, @UserName, @LastName, @DocumentTypeId, @UserIdNumber, @UserAddress, @CountryId, @RegionId, @CityId, @PostalCode, @PhoneCodeId, @PhoneNumber, @Email, @Password, @Photo, @CreatedDate, @UpdatedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[UserInsertVerification]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UserInsertVerification]
(
	@UserId AS int,
	@VerificationCode varchar (5)	
)
AS
BEGIN
    UPDATE [dbo].[User]
       SET 
		  VerificationCode = @VerificationCode
	WHERE UserId = @UserId
END


GO
/****** Object:  StoredProcedure [dbo].[UserUpdate]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UserUpdate]
(
	@UserId int,
	@UserTypeId int,
	@UserName varchar(100),
	@LastName varchar(100),
	@DocumentTypeId int NULL,
	@UserIdNumber varchar(15) NULL,
	@UserAddress varchar (100) NULL,
	@CountryId int NULL,
	@RegionId int NULL,
	@CityId int NULL,
	@PostalCode varchar(30) NULL,
	@PhoneCodeId int NULL,
	@PhoneNumber varchar (15) NULL,
	@Email varchar (50) NULL,
	@Password varchar (50) NULL,
	@VerificationCode varchar (5) NULL,
	@Photo varchar (250) NULL,
	@CreatedDate datetime NULL,
	@UpdatedDate datetime NULL
)
AS
BEGIN
    UPDATE [dbo].[User]
    SET   
		UserTypeId = @UserTypeId,
		UserName = @UserName, 
		LastName = @LastName,
		DocumentTypeId = @DocumentTypeId,
		UserIdNumber = @UserIdNumber,
		UserAddress = @UserAddress,
		CountryId = @CountryId, 
		RegionId = @RegionId, 
		CitytId = @CityId, 
		PostalCode = @PostalCode, 
		PhoneCodeId = @PhoneCodeId,
		PhoneNumber = @PhoneNumber,
		Email = @Email,
	    Password = @Password,
		VerificationCode = @VerificationCode,
		Photo = @Photo,
		CreatedDate =  @CreatedDate, 
		UpdatedDate = @UpdatedDate
  WHERE UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[ValidateUserEmail]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateUserEmail]
(
    @Email AS varchar(50),
	@VerificationCode varchar(5)
)
AS
BEGIN
    SELECT Email
	FROM [dbo].[User]
	WHERE Email = @Email 
	
	UPDATE [dbo].[User]
	SET VerificationCode = @VerificationCode
	WHERE Email = @Email

END
GO
/****** Object:  StoredProcedure [dbo].[ValidateUserVerificationCode]    Script Date: 9/06/2021 9:13:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateUserVerificationCode]
(
    
	@Email AS varchar(50),
	@VerificationCode varchar(5)
)
AS
BEGIN
    SELECT Email, VerificationCode
	FROM [dbo].[User]
	WHERE Email = @Email AND VerificationCode = @VerificationCode
END
GO
