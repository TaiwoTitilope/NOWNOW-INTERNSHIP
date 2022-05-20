SELECT substring(insert_date, 1, 10) as reg_day, email, msisdn, first_name, last_name, middle_name, gender, user_type, dob, address, lga_name, ward_name, id_photo as ID_Card, id_photo_2 as Proof_of_Residence, id_photo_selfie as KYC_Form
FROM MFSCORE.t_um_user_detail
where insert_date <2018 and user_type=83 and status=1
order by insert_date desc