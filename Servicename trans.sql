select 
count(case when service_name = 'Wallet to Bank' then 1  else 0 end) as WALLET2BANK, 
count(case when service_name = 'Cashin - NIBSS' then 1  else 0 end) as CASHIN_NIBSS,
count(case when service_name= 'mtn' then 1 else 0 end) as MTN,
count(case when service_name= 'Smile' then 1 else 0 end) as SMILE


from mfscore.t_wm_transaction_logs
where status = 'SUCCESS' and dateadd(t_wm_transaction_logs.insert_date)

