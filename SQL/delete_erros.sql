delete from subscr_hist sh where not exists(select * from customer c where c.customer_id = sh.customer_id);
delete from subscr_serv sh where not exists(select * from customer c where c.customer_id = sh.customer_id);
delete from single_serv sh where not exists(select * from customer c where c.customer_id = sh.customer_id);
delete from monthly_fee sh where not exists(select * from customer c where c.customer_id = sh.customer_id);
delete from TV_LAN sh where not exists(select * from customer c where c.customer_id = sh.customer_id);
delete from payment sh where not exists(select * from customer c where c.customer_id = sh.customer_id);
delete from CUSTOMER_CONTACTS sh where not exists(select * from customer c where c.customer_id = sh.customer_id);
delete from CUSTOMER_ATTRIBUTES sh where not exists(select * from customer c where c.customer_id = sh.customer_id);
delete from Request sh where not exists(select * from house c where c.House_Id = sh.House_Id);
delete from Connect_Log;

commit;