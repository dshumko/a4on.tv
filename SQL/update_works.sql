ALTER TABLE REQUEST_TEMPLATES ADD WORKS D_VARCHAR1000;
COMMENT ON COLUMN REQUEST_TEMPLATES.WORKS IS 'JSON cписка работ [{"i":work_id,"q":1},../]';
COMMENT ON COLUMN REQUEST_TEMPLATES.ADD_WORK IS 'Устарело, будет удалено (При выборе причины добавлять работу)';
update request_templates rt set rt.Works = '[{"i":'||rt.Add_Work||',"q":1}]' where not rt.Add_Work is null;
commit;
