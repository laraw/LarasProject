USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[billPay]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billPay](
	[billPayID] [int] IDENTITY(1000,1) NOT NULL,
	[accountNum] [int] NOT NULL,
	[payeeID] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[scheduleDate] [datetime] NOT NULL,
	[periodCode] [int] NOT NULL,
	[modifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_billPay] PRIMARY KEY CLUSTERED 
(
	[billPayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[billPay]  WITH CHECK ADD  CONSTRAINT [fk_Payee_BPAY] FOREIGN KEY([payeeID])
REFERENCES [dbo].[Payee] ([payeeID])
GO
ALTER TABLE [dbo].[billPay] CHECK CONSTRAINT [fk_Payee_BPAY]
GO
ALTER TABLE [dbo].[billPay]  WITH CHECK ADD  CONSTRAINT [fk_PeriodCode_BPAy] FOREIGN KEY([periodCode])
REFERENCES [dbo].[periodLookup] ([periodCode])
GO
ALTER TABLE [dbo].[billPay] CHECK CONSTRAINT [fk_PeriodCode_BPAy]
GO
/****** Object:  Trigger [dbo].[TR_BPAY_Update_Modified]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lara Wilkinson
-- Create date: 14/7/2014
-- Description: Updates last modified date to the current date when the row is changed.
-- =============================================
CREATE TRIGGER [dbo].[TR_BPAY_Update_Modified]
   ON  [dbo].[billPay]
   AFTER INSERT,UPDATE
AS 
BEGIN
	UPDATE [billPay]
	SET modifydate = getdate()
	FROM [billPay] t
	INNER JOIN inserted i 
		ON t.billPayID = i.billPayID

END

GO
