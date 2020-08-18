create
or replace function find_subjects () returns table (id int, name text) as $$ begin return query
select
    "subjects".id,
    "subjects".subject_name
from
    subjects;

end;

$$ Language plpgsql;