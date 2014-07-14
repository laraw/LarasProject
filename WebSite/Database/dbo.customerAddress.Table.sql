USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[customerAddress]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerAddress](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[custID] [int] NOT NULL,
	[addressline1] [nvarchar](50) NOT NULL,
	[addressline2] [nvarchar](50) NOT NULL,
	[city] [nvarchar](40) NOT NULL,
	[state] [nvarchar](3) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[postcode] [nvarchar](15) NOT NULL,
	[addressTypeCode] [int] NOT NULL,
 CONSTRAINT [PK_customerAddress] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [FK_customerAddress_addressTypeLookup] FOREIGN KEY([addressTypeCode])
REFERENCES [dbo].[addressTypeLookup] ([addressTypeCode])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [FK_customerAddress_addressTypeLookup]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [FK_customerAddress_customer] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [FK_customerAddress_customer]
GO
