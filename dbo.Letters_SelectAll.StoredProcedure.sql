USE [C138_jarealjeter_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Letters_SelectAll]    Script Date: 5/9/2024 12:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Letters_SelectAll]
				

as
/*----Test Code-----

Execute dbo.Letters_SelectAll


*/

BEGIN

SELECT [Id]
      ,[Letter]
      ,[Image]
      ,[Sound]
  FROM [dbo].[Letters]

END


GO
