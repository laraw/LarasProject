USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[accountTypeLookup]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountTypeLookup](
	[accountTypeCode] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[accountTypeLookup] ON 

INSERT [dbo].[accountTypeLookup] ([accountTypeCode], [Description]) VALUES (1, N'Cheque')
INSERT [dbo].[accountTypeLookup] ([accountTypeCode], [Description]) VALUES (2, N'Savings')
SET IDENTITY_INSERT [dbo].[accountTypeLookup] OFF
