DROP TABLE IF EXISTS PERSONAL_INFO;
DROP TABLE IF EXISTS ADDRESS;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS CLASS_BOOK;
DROP TABLE IF EXISTS TEACHER;
DROP TABLE IF EXISTS TOPIC;
DROP TABLE IF EXISTS TOPIC_CLASS;
DROP TABLE IF EXISTS TOPIC_CLASS_BOOK;
DROP TABLE IF EXISTS TEACHER_TOPIC;
DROP TABLE IF EXISTS CLASS;
DROP TABLE IF EXISTS SPECIALIZATION;
DROP TABLE IF EXISTS FACULTY;
DROP TABLE IF EXISTS FEE;
DROP TABLE IF EXISTS ADMINISTRATOR;

CREATE TABLE PERSONAL_INFO (
 PERSONAL_INFO_ID VARCHAR PRIMARY KEY,
 NAME VARCHAR,
 PASSWORD VARCHAR,
 EMAIL VARCHAR,
 NPC VARCHAR,
 ADDRESS_ID VARCHAR
);

CREATE TABLE ADDRESS (
 ADDRESS_ID VARCHAR PRIMARY KEY,
 STREET VARCHAR,
 CITY VARCHAR,
 COUNTRY VARCHAR,
 POSTAL_CODE VARCHAR
);

CREATE TABLE STUDENT (
 STUDENT_ID VARCHAR PRIMARY KEY,
 PERSONAL_INFO_ID VARCHAR,
 CLASS_ID VARCHAR,
 CLASS_BOOK_ID VARCHAR
);

CREATE TABLE CLASS_BOOK (
 CLASS_BOOK_ID VARCHAR PRIMARY KEY,
 CLASS_BOOK_YEAR INT,
 CLASS_BOOK_SEMESTER INT
);

CREATE TABLE TEACHER (
 TEACHER_ID VARCHAR PRIMARY KEY,
 PERSONAL_INFO_ID VARCHAR,
 ENTITLING VARCHAR
);

CREATE TABLE TEACHER_TOPIC (
 TEACHER_ID VARCHAR,
 TOPIC_ID VARCHAR,
 PRIMARY KEY(TEACHER_ID,TOPIC_ID)
);

CREATE TABLE TOPIC (
 TOPIC_ID VARCHAR PRIMARY KEY,
 TOPIC_NAME VARCHAR,
 CREDITS INT,
 EXAMINATION_TYPE VARCHAR
);

CREATE TABLE TOPIC_CLASS (
 TOPIC_ID VARCHAR,
 CLASS_ID VARCHAR,
 PRIMARY KEY (TOPIC_ID,CLASS_ID)
);

CREATE TABLE TOPIC_CLASS_BOOK (
 CLASS_BOOK_ID VARCHAR,
 TOPIC_ID VARCHAR,
 GRADE INT,
 PRIMARY KEY (CLASS_BOOK_ID, TOPIC_ID)
);

CREATE TABLE CLASS (
 CLASS_ID VARCHAR PRIMARY KEY,
 CLASS_NAME VARCHAR,
 SERIES_NAME VARCHAR,
 CLASS_YEAR VARCHAR,
 SPECIALIZATION_ID VARCHAR
 );

CREATE TABLE SPECIALIZATION (
 SPECIALIZATION_ID VARCHAR PRIMARY KEY,
 SPECIALIZATION_NAME VARCHAR,
 FACULTY_ID VARCHAR
);

CREATE TABLE FACULTY (
 FACULTY_ID VARCHAR PRIMARY KEY,
 FACULTY_NAME VARCHAR
);

CREATE TABLE FEE (
 FEE_ID VARCHAR PRIMARY KEY,
 FEE_NAME VARCHAR,
 AMOUNT DOUBLE PRECISION,
 STATUS VARCHAR,
 STUDENT_ID VARCHAR
);

CREATE TABLE ADMINISTRATOR (
 ADMINISTRATOR_ID VARCHAR PRIMARY KEY,
 PERSONAL_INFO_ID VARCHAR
);


ALTER TABLE PERSONAL_INFO ADD CONSTRAINT PERSONAL_INFO_ADDRESS_FK FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS (ADDRESS_ID) ON DELETE CASCADE;
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_CLASS_BOOK_FK FOREIGN KEY (CLASS_BOOK_ID) REFERENCES CLASS_BOOK (CLASS_BOOK_ID) ON DELETE CASCADE;
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_CLASS_FK FOREIGN KEY (CLASS_ID) REFERENCES CLASS (CLASS_ID) ON DELETE CASCADE;
ALTER TABLE STUDENT ADD CONSTRAINT STUDENT_PERSONAL_INFO_FK FOREIGN KEY (PERSONAL_INFO_ID) REFERENCES PERSONAL_INFO (PERSONAL_INFO_ID) ON DELETE CASCADE;
ALTER TABLE ADMINISTRATOR ADD CONSTRAINT ADMINISTRATOR_PERSONAL_INFO_FK FOREIGN KEY (PERSONAL_INFO_ID) REFERENCES PERSONAL_INFO (PERSONAL_INFO_ID) ON DELETE CASCADE;
ALTER TABLE TOPIC_CLASS_BOOK ADD CONSTRAINT TOPIC_CLASS_BOOK_FK FOREIGN KEY (CLASS_BOOK_ID) REFERENCES CLASS_BOOK (CLASS_BOOK_ID) ON DELETE CASCADE;
ALTER TABLE TOPIC_CLASS_BOOK ADD CONSTRAINT TOPIC_CLASS_BOOK_TOPIC_FK FOREIGN KEY (TOPIC_ID) REFERENCES TOPIC (TOPIC_ID) ON DELETE CASCADE;
ALTER TABLE TEACHER_TOPIC ADD CONSTRAINT TEACHER_TOPIC_TOPIC_FK FOREIGN KEY (TOPIC_ID) REFERENCES TOPIC (TOPIC_ID) ON DELETE CASCADE;
ALTER TABLE TEACHER_TOPIC ADD CONSTRAINT TEACHER_TOPIC_TEACHER_FK FOREIGN KEY (TEACHER_ID) REFERENCES TEACHER (TEACHER_ID) ON DELETE CASCADE;
ALTER TABLE TEACHER ADD CONSTRAINT TEACHER_PERSONAL_INFO_FK FOREIGN KEY (PERSONAL_INFO_ID) REFERENCES PERSONAL_INFO (PERSONAL_INFO_ID) ON DELETE CASCADE;
ALTER TABLE TOPIC_CLASS ADD CONSTRAINT TOPIC_CLASS_TOPIC_FK FOREIGN KEY (TOPIC_ID) REFERENCES TOPIC (TOPIC_ID) ON DELETE CASCADE;
ALTER TABLE TOPIC_CLASS ADD CONSTRAINT TOPIC_CLASS_CLASS_FK FOREIGN KEY (CLASS_ID) REFERENCES CLASS (CLASS_ID) ON DELETE CASCADE;
ALTER TABLE CLASS ADD CONSTRAINT CLASS_SPECIALIZATION_FK FOREIGN KEY (SPECIALIZATION_ID) REFERENCES SPECIALIZATION (SPECIALIZATION_ID) ON DELETE CASCADE;
ALTER TABLE SPECIALIZATION ADD CONSTRAINT SPECIALIZATION_FACULTY_FK FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY (FACULTY_ID) ON DELETE CASCADE;
ALTER TABLE FEE ADD CONSTRAINT FEE_STUDENT_FK FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID) ON DELETE CASCADE;