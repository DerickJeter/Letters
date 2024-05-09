USE [C138_jarealjeter_gmail]
GO
/****** Object:  Table [dbo].[Letters]    Script Date: 5/9/2024 12:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Letters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Letter] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Sound] [nvarchar](max) NULL,
 CONSTRAINT [PK_Letters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
