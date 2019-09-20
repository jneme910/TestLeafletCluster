/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
CASE WHEN [corr_name] IS NULL THEN [samp_name] ELSE [corr_name] END AS [Series],
[upedonid] AS [User Pedon ID], 
 [pedon_key] AS [Pedon Key],
CASE WHEN [corr_classification_name] IS NULL THEN [samp_classification_name] ELSE [corr_classification_name] END AS [Soil Classification],
CONCAT ('https://ncsslabdatamart.sc.egov.usda.gov/rptExecute.aspx?p=', [pedon_key] , '&r=1&submit1=Get+Report') AS [Primary Lab Report],
CONCAT ('https://ncsslabdatamart.sc.egov.usda.gov/rptExecute.aspx?p=', [pedon_key] , '&r=3&submit1=Get+Report') AS [Taxonomy Report],
CONCAT ('https://ncsslabdatamart.sc.egov.usda.gov/rptExecute.aspx?p=', [pedon_key] , '&r=2&submit1=Get+Report') AS [Supplementary Lab Report],
CONCAT ('https://ncsslabdatamart.sc.egov.usda.gov/rptExecute.aspx?p=', [pedon_key] , '&r=6&submit1=Get+Report') AS [Water Retention Report],
CONCAT ('https://ncsslabdatamart.sc.egov.usda.gov/rptExecute.aspx?p=', [pedon_key] , '&r=7&submit1=Get+Report') AS [Correlation Report],
CONCAT ('https://nasis.sc.egov.usda.gov/NasisReportsWebSite/limsreport.aspx?report_name=Pedon_Site_Description_usepedonid&pedon_id=', [upedonid] ) AS [Pedon Description Report],
CONCAT ('https://nasis.sc.egov.usda.gov/NasisReportsWebSite/limsreport.aspx?report_name=WEB-profiles-by-PEIID&pedon_peiid=', [pedoniid] ) AS [Soil Profile],
 [latitude_decimal_degrees] AS lat,
[longitude_decimal_degrees] AS long
  FROM [ncsslabdata].[dbo].[combine_nasis_ncss] WHERE CASE WHEN  [latitude_decimal_degrees] IS NULL THEN 2 WHEN [longitude_decimal_degrees] IS NULL THEN 2 ELSE 1 END = 1