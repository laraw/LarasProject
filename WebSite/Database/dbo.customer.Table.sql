USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[custID] [int] IDENTITY(1001,1) NOT NULL,
	[custName] [nvarchar](50) NOT NULL,
	[TFN] [nvarchar](11) NULL,
	[dateCreated] [date] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Trigger [dbo].[TR_Customer_insert_Modified]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lara Wilkinson
-- Create date: 14/7/2014
-- Description: Updates last modified date to the current date when the row is changed.
-- =============================================
CREATE TRIGGER [dbo].[TR_Customer_insert_Modified]
   ON  [dbo].[customer]
   AFTER INSERT
AS 
BEGIN
	UPDATE [customer]
	SET datecreated = getdate()
	FROM [customer] c
	INNER JOIN inserted i 
		ON c.custID = i.custID

END

GO
