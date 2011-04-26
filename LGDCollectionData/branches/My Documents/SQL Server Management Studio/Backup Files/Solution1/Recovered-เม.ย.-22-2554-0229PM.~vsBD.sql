/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [CATEGORY_KEY]
      ,[CATEGORY_DESC]
      ,[CATEGORY_DESC_TH]
      ,[CATEGORY_VALUE]
      ,[CATEGORY_TYPE_KEY]
      ,[PRIORITY]
      ,[DEL_FLAG]
  FROM [BAY01].[CLASSIFY].[CATEGORY]
  where category_key=1245