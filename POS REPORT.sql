select 
to_char(MFSCORE.T_WM_TRANSACTION_LOGS.insert_date , 'DD-MM-YYYY') AS Insertdate,
MFSCORE.t_um_user_detail.first_name,
MFSCORE.t_um_user_detail.last_name,
MFSCORE.t_um_user_detail.MSISDN,
MFSCORE.T_MA_WORK_PROFESSION_MASTER.ZONE as ZONE,
MFSCORE.T_MA_WORK_PROFESSION_MASTER.NAME as Business_executive,
MFSCORE.T_MA_WORK_PROFESSION_MASTER.MANAGERSNAME as MANAGERSNAME,
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_ID) in(601,510,810)  then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "Wallet Funding",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_ID) in(601,510,810)    then 1 else 0 end) as "Wallet Funding Count",
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.service_name) LIKE '%POS%'  then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "POS",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) LIKE '%POS%'   then 1 else 0 end) as "POS Count",
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_ID) in(501)  then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "Wallet to Wallet",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_ID) in (501) then 1 else 0 end) as "Wallet to Wallet Count",
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_ID) in(509)  then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "Wallet to Bank",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_ID) in(509)    then 1 else 0 end) as "Wallet to Bank Count",
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_ID) in(700)  then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "Cash Deposit",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_ID) in(700)    then 1 else 0 end) as "Cash Deposit Count",
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) = 'Airtime Topup' then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "Airtime Top",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) = 'Airtime Topup' then 1 else 0 end) as "Airtime Topup Count",
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) = 'Data Bundle' then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "Data Bundle",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) = 'Data Bundle' then 1 else 0 end) as "Data Bundle Count",
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) = 'Bill Pay' then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as BillPay,
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) in('Bill Pay') then 1 else 0 end) as "BillPay Count",
SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) = 'Airtime Voucher' then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "Airtime Voucher",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) = 'Airtime Voucher' then 1 else 0 end) as "Airtime Voucher Count",

SUM(CASE WHEN (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) in ('Airtime Voucher','Airtime Topup' ) then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT  else 0 end) as "Airtime Total",
sum(case when (MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME) in ('Airtime Voucher','Airtime Topup' ) then 1 else 0 end) as "Airtime Total Count",

sum (case when MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME  in('Airtime Topup','Data Bundle','Bill Pay','Airtime Voucher','Cashin - POS','Wallet to Bank','Cash Deposit','DataPlan','Bet9ja','Betking','NairaBet','SportyBet','School Payment') then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT else 0 end )  as Transaction_Amount,
sum (case when MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME  in('Airtime Topup','Data Bundle','Bill Pay','Airtime Voucher','Cashin - POS','Wallet to Bank','Cash Deposit','DataPlan','Bet9ja','Betking','NairaBet','SportyBet','School Payment') then 1 else 0 end ) as Transaction_count,
sum (case when MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME  in('Wallet to Bank','Cash Deposit') then MFSCORE.T_WM_TRANSACTION_LOGS.AMOUNT else 0 end )  as Tranfer_Amount,
sum (case when MFSCORE.T_WM_TRANSACTION_LOGS.SERVICE_NAME  in('Wallet to Bank','Cash Deposit') then 1 else 0 end ) as Transfer_count,
sum (AMOUNT) as TotalTXN,
COUNT(TXN_ID) as ToTal_Transaction_count



from   MFSCORE.T_WM_TRANSACTION_LOGS

left join  MFSCORE.t_um_user_detail  on MFSCORE.T_WM_TRANSACTION_LOGS.remarks  = MFSCORE.t_um_user_detail.remarks
left join  MFSCORE.T_MA_WORK_PROFESSION_MASTER  on MFSCORE.T_MA_WORK_PROFESSION_MASTER.ID  = MFSCORE.t_um_user_detail.WORK_ID

group by T_WM_TRANSACTION_LOGS.insert_date, t_um_user_detail.first_name, MFSCORE.t_um_user_detail.first_name,
t_um_user_detail.last_name, t_um_user_detail.MSISDN, T_MA_WORK_PROFESSION_MASTER.ZONE, T_MA_WORK_PROFESSION_MASTER.NAME, T_MA_WORK_PROFESSION_MASTER.MANAGERSNAME