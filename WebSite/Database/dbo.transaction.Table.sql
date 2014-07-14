USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[transaction]    Script Date: 7/14/2014 10:22:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[transactionID] [int] IDENTITY(1000,1) NOT NULL,
	[transactionType] [int] NOT NULL,
	[accountNum] [int] NOT NULL,
	[destAccount] [int] NOT NULL,
	[amount] [money] NOT NULL,
	[comment] [nvarchar](255) NULL,
	[modifyDate] [datetime] NULL,
 CONSTRAINT [PK_transactions] PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_destAccount_Account] FOREIGN KEY([destAccount])
REFERENCES [dbo].[account] ([accountNumber])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_destAccount_Account]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_transaction_account] FOREIGN KEY([accountNum])
REFERENCES [dbo].[account] ([accountNumber])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_transaction_account]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_transactionType_account] FOREIGN KEY([transactionType])
REFERENCES [dbo].[transactionTypeLookup] ([transactionTypeID])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_transactionType_account]
GO
