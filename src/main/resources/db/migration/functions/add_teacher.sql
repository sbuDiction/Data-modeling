create or replace function
    create_teacher (name TEXT, surname text, id_num bigint, email_ text, subject int, school int)
    returns boolean as

$$
declare
rowsCount int;

begin

    select into rowsCount count(*) from teachers
        where LOWER(email) = LOWER(email_) and LOWER(subjects_id) = LOWER(subject);

        if (rowsCount = 0) then
            insert into TEACHERS (FIRST_NAME, LAST_NAME, ID_NUMBER, EMAIL, SUBJECTS_ID, SCHOOLS_ID) values (name, surname, id_num, email_, subject, school);
            return true;
        else
            return false;
        end if;

end;
$$
Language plpgsql;