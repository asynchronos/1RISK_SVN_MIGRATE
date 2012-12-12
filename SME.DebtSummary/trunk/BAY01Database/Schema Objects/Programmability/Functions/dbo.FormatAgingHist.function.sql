
CREATE FUNCTION [dbo].[FormatAgingHist]
(
	-- Add the parameters for the function here
	@str nvarchar(70)
)
RETURNS  nvarchar(70)
AS
BEGIN

	declare @st nvarchar(70)
	set @st=@str
	set @st= replace(@st,substring(@st,1,10),substring(@st,1,10)+'-')
	--set @st= replace(@st,substring(@st,1,21),substring(@st,1,21)+'-')

	return @st

END