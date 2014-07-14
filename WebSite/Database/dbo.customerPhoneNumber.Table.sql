USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[customerPhoneNumber]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerPhoneNumber](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[custID] [int] NOT NULL,
	[phoneNumber] [nvarchar](15) NOT NULL,
	[phoneTypeCode] [int] NOT NULL,
	[silent] [bit] NOT NULL,
 CONSTRAINT [PK_customerPhoneNumber] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[customerPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_customerPhoneNumber_customerID] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[customerPhoneNumber] CHECK CONSTRAINT [FK_customerPhoneNumber_customerID]
GO
ALTER TABLE [dbo].[customerPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_customerPhoneNumber_phoneTypeLookup] FOREIGN KEY([phoneTypeCode])
REFERENCES [dbo].[phoneTypeLookup] ([phoneTypeCode])
GO
ALTER TABLE [dbo].[customerPhoneNumber] CHECK CONSTRAINT [FK_customerPhoneNumber_phoneTypeLookup]
GO
