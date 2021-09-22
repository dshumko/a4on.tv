ALTER TRIGGER DISCOUNT_FACTOR_AI INACTIVE;


insert into Discount_Factor (Customer_Id, Date_From, Date_To, Factor_Value, Serv_Id, Srv_Type, Notice)
select Customer_Id, '2018-09-01', Date_To, Factor_Value, Serv_Id, Srv_Type, Notice from Discount_Factor df
where df.Factor_Value = 0.4667 and '2018-09-01' between df.Date_From and df.Date_To and df.Serv_Id = 2914990
and df.Date_from <> '2018-09-01' ;

update Discount_Factor df
set df.Date_To = '2018-08-31'
where df.Factor_Value = 0.4667 and '2018-09-01' between df.Date_From and df.Date_To and df.Serv_Id = 2914990
and df.Date_from <> '2018-09-01' ;

commit;

ALTER TRIGGER DISCOUNT_FACTOR_AI ACTIVE;
