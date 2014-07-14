USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[addressTypeLookup]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addressTypeLookup](
	[addressTypeCode] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_addressTypeLookup] PRIMARY KEY CLUSTERED 
(
	[addressTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[addressTypeLookup] ON 

INSERT [dbo].[addressTypeLookup] ([addressTypeCode], [Description]) VALUES (1, N'Mailing')
INSERT [dbo].[addressTypeLookup] ([addressTypeCode], [Description]) VALUES (2, N'Billing')
SET IDENTITY_INSERT [dbo].[addressTypeLookup] OFF
