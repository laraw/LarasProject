USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[login]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[custID] [int] NOT NULL,
	[userid] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](15) NOT NULL,
	[modifydate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_customerID] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_customerID]
GO
/****** Object:  Trigger [dbo].[TR_Login_Update_Modified]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lara Wilkinson
-- Create date: 14/7/2014
-- Description: Updates last modified date to the current date when the row is changed.
-- =============================================
CREATE TRIGGER [dbo].[TR_Login_Update_Modified]
   ON  [dbo].[login]
   AFTER INSERT,UPDATE
AS 
BEGIN
	UPDATE [login]
	SET modifydate = getdate()
	FROM [login] t
	INNER JOIN inserted i 
		ON t.custID = i.custID

END

GO
