INSERT INTO [LGD].[EMPLOYEE].[USER_DATA]
           ([EMP_ID]
           ,[EMP_ID_DISPLAY]
           ,[EMP_TITLE]
           ,[EMP_NAME]
           ,[EMP_SURNAME]
           ,[EMP_TITLE_E]
           ,[EMP_NAME_E]
           ,[EMP_SURNAME_E]
           ,[PASSWD]
           ,[EMAIL]
           ,[PHONE_OFFICE]
           ,[PHONE_HOME]
           ,[PHONE_MOBILE]
           ,[CREATE_DATE]
           ,[EXPIRE_DATE]
           ,[UPDATE_DATE]
           ,[LAST_SIGN_ON_DATE]
           ,[LAST_CHANGE_PASS_DATE]
           ,[DEL_FLAG])
           
SELECT [EMP_ID]
	  ,[EMP_ID] EMP_ID_DISPLAY
	  ,[NTTITLE] EMP_TITLE
      ,[NTNAME] EMP_NAME
      ,[NTSURN] EMP_SURNAME
      ,[NETITLE] EMP_TITLE_E
      ,[NENAME] EMP_NAME_E
      ,[NESURN] EMP_SURNAME_E
      ,[EMP_ID] PASSWD
      ,[EMAIL]
      ,[tel ภายใน] PHONE_OFFICE
      ,NULL PHONE_HOME
      ,NULL PHONE_MOBILE
      ,getdate() [CREATE_DATE]
      ,dateadd(month,6,getdate()) [EXPIRE_DATE]
      ,getdate() [UPDATE_DATE]
      ,NULL [LAST_SIGN_ON_DATE]
      ,NULL [LAST_CHANGE_PASS_DATE]
      ,0 [DEL_FLAG]
  FROM [BAY01].[EMPLOYEE].[EMP040316]
  WHERE EXISTS (
		SELECT EMP_ID
		FROM DBO.EMP
		WHERE EMP.EMP_ID = [EMP040316].EMP_ID
  ) AND NOT EXISTS (
		SELECT EMP_ID
		FROM [LGD].[EMPLOYEE].[USER_DATA]
		WHERE [USER_DATA].EMP_ID = [EMP040316].EMP_ID
  )