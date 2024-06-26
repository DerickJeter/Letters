USE [C138_jarealjeter_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Letters_Pagination]    Script Date: 5/9/2024 12:20:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Letters_Pagination]
				@PageIndex int
				,@PageSize int

as
/*----TEST CODE----


	Declare @PageIndex int = 0
			,@PageSize int = 1

	Execute dbo.Letters_Pagination
			@PageIndex
			,@PageSize

*/


Begin

	Declare @offset int = @PageIndex * @PageSize

		SELECT [Id]
			,[Letter]
			,[Image]
			,[Sound]
			,[TotalCount] = Count(1) Over()
		 FROM [dbo].[Letters]
		 Order By Id


		 OFFSET @offset Rows
		 Fetch Next @PageSize Rows Only

End


GO
