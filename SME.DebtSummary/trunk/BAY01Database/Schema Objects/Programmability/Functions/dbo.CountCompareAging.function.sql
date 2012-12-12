CREATE FUNCTION [dbo].[CountCompareAging]
(
	-- Add the parameters for the function here
	@str nvarchar(12),
	@valueCompare int,
    @length int
)
RETURNS  INT
AS
BEGIN

declare @i int
declare @count int

set @count =0 
set @i=0

while @i <=@length
  begin
       if convert(int,substring(@str,@i,1))>=@valueCompare
         begin
		   set @count=@count+1
         end 
       --print  (convert(int,substring(@str,@i,1)) )
       set @i=@i+1
  end 
  return @count
End 

