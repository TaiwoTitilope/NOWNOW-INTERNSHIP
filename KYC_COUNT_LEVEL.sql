SELECT COUNT(T_UM_USER_IDENTITY.STATUS),
    
 CASE T_UM_USER_IDENTITY.USER_SUB_TYPE
    WHEN 8 THEN 'kyc 1'
    WHEN 9 THEN 'kyc 2'
    ELSE '-'
    END AS level,
 
 CASE mfscore.T_UM_USER_IDENTITY.STATUS
   -- when 0 then 'Inactive'
    when 1 then 'Active'
    --when 2 then 'New'
    else '-'
    end as statuss
    
    --T_UM_USER_IDENTITY.EMAIL
    
FROM MFSCORE.T_UM_USER_IDENTITY 
FULL JOIN MFSCORE.T_UM_BANK_INFO 
ON T_UM_BANK_INFO.ENTITY_ID = T_UM_USER_IDENTITY.ENTITY_ID
WHERE USER_TYPE= '85' AND T_UM_USER_IDENTITY.STATUS = 1
GROUP BY T_UM_USER_IDENTITY.USER_SUB_TYPE, T_UM_USER_IDENTITY.STATUS

--T_UM_BANK_INFO.BIN, T_UM_USER_IDENTITY.FIRST_NAME, T_UM_USER_IDENTITY.LAST_NAME

--AND SETTLEMENT_FOR= 'Y' 