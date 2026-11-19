-- IKEA RFM Customer Segmentation Project
-- Author: Raman
-- Purpose: Data Cleaning and Customer Segmentation



--combining both the csv files into a single files and types safely
select 
	Invoice,StockCode,Description,Quantity,
	coalesce(


	TRY_CONVERT(Datetime2,InvoiceDate,120),
	TRY_CONVERT(Datetime2,InvoiceDate,105)
	) as InvoiceDate,

	TRY_CONVERT(decimal(10,2),price) as price,
	customer_id,country.'2009-2010' as SourceSheet
into EcommerceCustomer.dbo.RetailCombined
from EcommerceCustomer.dbo.[year 2009-2010]

union all 

select 
	Invoice,StockCode,Description,Quantity,

	coalesce(
	TRY_CONVERT(datetime2,InvoiceDate,120),
	TRY_CONVERT(datetime2,invoiceDate,105)
	
	
	)as InvoiceDate,
	TRY_CONVERT(decimal(10,2),price)as price,
	customer_ID,country,'2010-2011'as SourceSheet
from EcommerceCustomerAnalysis.dbo.[year 2010-2011]