
CREATE PROCEDURE update_eam_unit_leader as 

update tb_employee set level_id = 3
where emp_id  in (
select unit_lead_id from tb_unit )


update tb_employee set level_id = 2
where emp_id  in (
select team_lead_id from tb_team )


