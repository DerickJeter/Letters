USE [C138_jarealjeter_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Letters_Insert]    Script Date: 5/9/2024 12:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Letters_Insert]
			@Letter nvarchar(50)
			,@Image nvarchar(max)
			,@Sound nvarchar (max)
			,@Id int OUTPUT


as
/*-------Test Code------

	Declare @Id int = 1

	Declare @Letter nvarchar(50) = "A"
			,@Image nvarchar(max) = 
			,@Sound nvarchar (max) =
			
	Execute dbo.Letters_Insert
			@Letter
			,@Image
			,@Sound
			,@Id OUTPUT


	Select *



*/

Begin 


INSERT INTO [dbo].[Letters]
           ([Letter]
           ,[Image]
           ,[Sound])

     VALUES
           (@Letter
           ,@Image
           ,@Sound)

	Set @Id = SCOPE_IDENTITY()

End


GO
