create or replace function find_teachers_for_subject (
        sub text
    )

	returns table (
        the_teacher teacher_type
	)
	Language plpgsql
as $$
begin

	return query
		select
            teachers.id, teachers.first_name, teachers.last_name, teachers.id_number, teachers.email, subjects.subject_name
        from subjects
            inner join teachers on subjects.id = teachers.subjects_id
        where
             LOWER(subject_name) = LOWER(sub);
end;$$