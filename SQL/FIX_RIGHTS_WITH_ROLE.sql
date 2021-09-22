SET NAMES UTF8;

SET SQL DIALECT 3;

SET AUTODDL ON;

update Sys$Group_Rights set Rights_Type = 0 where Rights_Type is null;

insert into Sys$Group_Rights (Group_Id, Rights_Type, Right_Id)
      select g.Id,1, Id_Report from (select id_report from reports where Report_Body is not null) r, Sys$Group g;

commit;


