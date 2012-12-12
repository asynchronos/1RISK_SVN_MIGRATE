


-- =============================================
-- Author:		Prakit Sirisaksathaporn
-- Create date: 24 OCT 2008
-- Description:	REP_OD_CREDIT_SUMMARY
-- =============================================
CREATE PROCEDURE [dbo].[REP_OD_CREDIT_SUMMARY]
	-- Add the parameters for the stored procedure here
	@CIF int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	select 'O/D' as GL_TYPE ,SUM(OD_LIM)/1000 as LIMIT
		,SUM(OD_PRIN)/1000 as PRIN,MAX(OD_AGING) as AGING
	FROM REP_OD
	WHERE CIF=@CIF
	--group by OD_LIM,OD_PRIN,OD_AGING
	UNION ALL
	select distinct 'PNS' as GL_TYPE,PNS_LIM/1000 as PNS_LIM
			,PNS_PRIN/1000 as PNS_PRIN,PNS_AGING as PNS_AGING
	FROM REP_OD
	where CIF=@CIF
	UNION ALL
	select distinct 'FL(CL)' as GL_TYPE,ALS_LIM/1000 as ALS_LIM
			,ALS_PRIN/1000 as ALS_PRIN,ALS_AGING as ALS_AGING
	FROM REP_OD
	where CIF=@CIF
	UNION ALL
	select distinct 'FL(HL)' as GL_TYPE,ALSH_LIM/1000 as ALSH_LIM
			,ALSH_PRIN/1000 as ALSH_PRIN,ALSH_AGING as ALSH_AGING
	FROM REP_OD
	where CIF=@CIF
	UNION ALL
	select distinct 'FL(PL)' as GL_TYPE,ALSP_LIM/1000 as ALSP_LIM
			,ALSP_PRIN/1000 as ALSP_PRIN,ALSP_AGING as ALSP_AGING
	FROM REP_OD
	where CIF=@CIF
	UNION ALL
	select distinct 'B/D' as GL_TYPE,PR_LIM/1000 as PR_LIM
			,PR_PRIN/1000 as PR_PRIN,PR_AGING as PR_AGING
	FROM REP_OD
	where CIF=@CIF
	UNION ALL
	select distinct 'Trading' as GL_TYPE,IMX_LIM/1000 as IMX_LIM
			,IMX_PRIN/1000 as IMX_PRIN,IMX_AGING as IMX_AGING
	FROM REP_OD
	where CIF=@CIF
	UNION ALL
	select distinct 'CTS' as GL_TYPE,CTS_LIM/1000 as CTS_LIM
			,CTS_PRIN/1000 as CTS_PRIN,0
	FROM REP_OD
	where CIF=@CIF
	UNION ALL
	select distinct 'CCTS' as GL_TYPE,0
			,CCTS_PRIN/1000 as CCTS_PRIN,CCTS_AGING as CCTS_AGING
	FROM REP_OD
	where CIF=@CIF

END



