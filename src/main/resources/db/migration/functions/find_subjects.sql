create or replace function find_subjects ()

  returns table (
        subject_row subject_type
      )

as $$
begin return query
       select
            "subjects".id,
            "subjects".subject_name
        from
            subjects;
end;

$$ Language plpgsql;