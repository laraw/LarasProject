USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountNumber] [int] IDENTITY(1000,1) NOT NULL,
	[accountTypeCode] [int] NOT NULL,
	[custID] [int] NOT NULL,
	[modifyDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_custID] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_custID]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_typelookup] FOREIGN KEY([accountTypeCode])
REFERENCES [dbo].[accountTypeLookup] ([accountTypeCode])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_typelookup]
GO
/****** Object:  Trigger [dbo].[TR_account_modifyDate]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lara Wilkinson
-- Create date: 14/7/2014
-- Description: Updates last modified date to the current date when the row is changed.
-- =============================================
CREATE TRIGGER [dbo].[TR_account_modifyDate]
   ON  [dbo].[account]
   AFTER INSERT,UPDATE
AS 
BEGIN
	UPDATE account
	SET modifydate = getdate()
	FROM account t
	INNER JOIN inserted i 
		ON t.accountNumber = i.accountNumber

END

GO
