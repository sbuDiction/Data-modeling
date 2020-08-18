CREATE TABLE REGIONS (
    ID SERIAL PRIMARY KEY NOT NULL,
    NAME TEXT NOT NULL,
    REGION_INITIALS TEXT NOT NULL
);

CREATE TABLE SUBJECTS (
    ID SERIAL PRIMARY KEY NOT NULL,
    SUBJECT_NAME TEXT NOT NULL,
    REGIONS_ID INTEGER REFERENCES REGIONS (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SCHOOLS (
    ID SERIAL PRIMARY KEY NOT NULL,
    SCHOOL_NAME TEXT NOT NULL,
    SCHOOL_REG_STATUS TEXT NOT NULL,
    SUBJECT_ID INTEGER REFERENCES SUBJECTS (ID) ON DELETE CASCADE ON UPDATE CASCADE,
    REGIONS_ID INTEGER REFERENCES REGIONS (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Each student has their subjects they studying or like
CREATE TABLE LEARNERS (
    ID SERIAL PRIMARY KEY NOT NULL,
    FIRST_NAME TEXT NOT NULL,
    LAST_NAME TEXT NOT NULL,
    ID_NUMBER BIGINT NOT NULL,
    EMAIL TEXT NOT NULL,
    SUBJECTS_ID INTEGER REFERENCES SUBJECTS (ID) ON DELETE CASCADE ON UPDATE CASCADE,
    SCHOOLS_ID INTEGER REFERENCES SCHOOLS (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TEACHERS (
    ID SERIAL PRIMARY KEY NOT NULL,
    FIRST_NAME TEXT NOT NULL,
    LAST_NAME TEXT NOT NULL,
    ID_NUMBER BIGINT,
    EMAIL TEXT NOT NULL,
    SUBJECTS_ID INTEGER REFERENCES SUBJECTS (ID) ON DELETE CASCADE ON UPDATE CASCADE,
    SCHOOLS_ID INTEGER REFERENCES SCHOOLS (ID) ON DELETE CASCADE ON UPDATE CASCADE
);