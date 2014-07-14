USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[phoneTypeLookup]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phoneTypeLookup](
	[phoneTypeCode] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_phoneTypeLookup] PRIMARY KEY CLUSTERED 
(
	[phoneTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[phoneTypeLookup] ON 

INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (1, N'Home')
INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (2, N'Work')
INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (3, N'Mobile')
INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (4, N'Fax')
INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (5, N'Email')
SET IDENTITY_INSERT [dbo].[phoneTypeLookup] OFF
