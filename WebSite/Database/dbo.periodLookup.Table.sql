USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[periodLookup]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periodLookup](
	[periodCode] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[periodCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[periodLookup] ON 

INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (1, N'Quarterly')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (2, N'Monthly')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (3, N'Yearly')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (4, N'Bi-Monthly')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (5, N'Daily')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (6, N'Weekly')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (7, N'Fortnightly')
SET IDENTITY_INSERT [dbo].[periodLookup] OFF
