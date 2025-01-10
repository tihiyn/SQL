-- 1
select d.name, d.age, d.profession, s.name, s.mission
from Dwarves as d join Squads as s on d.squad_id = s.squad_id;

-- 2
select *
from Dwarves
where profession = 'miner' and squad_id is null;

-- 3
select *
from Tasks
where status = 'pending' and priority = (select max(priority) from Tasks);

-- 4
select d.name, count(*) as items_count
from Dwarves as d join Items as i on d.dwarf_id = i.owner_id
group by d.name;

-- 5
select s.name, count(d.squad_id) as dwarfs_count
from Squads as s left join Dwarves as d on s.squad_id = d.squad_id
group by s.name;

-- 6
with ptc as (
    select d.profession, count(*) as tasks_count
    from Dwarves as d join Tasks as t on d.dwarf_id = t.assigned_to
    where t.status != 'completed'
    group by d.profession
)
select profession
from ptc
where tasks_count = (select max(tasks_count) from ptc);

-- 7
select i.type, avg(d.age)
from Items as i join Dwarves as d on i.owner_id = d.dwarf_id
group by i.type;

-- 8
select d.name
from Items as i right join Dwarves as d on i.owner_id = d.dwarf_id
where i.owner_id is null and d.age > (select avg(age) from Dwarves);