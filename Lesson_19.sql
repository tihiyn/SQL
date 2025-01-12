-- 1
select *
from Squads
where leader_id not in (select dwarf_id from Dwarves);

-- 2
select *
from Dwarves
where age > 150 and profession = 'Warrior';

-- 3
select dwarf_id, name, age, profession
from Dwarves
where dwarf_id in (select owner_id from Items where type = 'weapon');

-- 4
select d.dwarf_id, d.name, t.status, count(t.status) as tasks_count
from Tasks t join Dwarves d on d.dwarf_id = t.assigned_to
group by d.dwarf_id, d.name, t.status
order by d.dwarf_id;

-- 5
select t.task_id, t.description, d.dwarf_id, d.name, s.squad_id, s.name
from Tasks t join Dwarves d on d.dwarf_id = t.assigned_to
    join Squads s on d.squad_id = s.squad_id
where s.name = 'Guardians';

-- 6
select d1.name, d2.name, r.relationship
from Relationships r join Dwarves d1 on r.dwarf_id = d1.dwarf_id
    join Dwarves d2 on r.related_to = d2.dwarf_id
where relationship = 'Родитель';
