CREATE DATABASE nxtgenmondialdb
   ENCODING = 'UTF8'
   LC_COLLATE = 'en_US.utf8'
   LC_CTYPE = 'en_US.utf8'
   TABLESPACE = pg_default
   OWNER = MONDIALUSER;
GRANT ALL PRIVILEGES ON DATABASE nxtgenmondialdb TO mondial;
\c nxtgenmondialdb

CREATE SEQUENCE hibernate_sequence START 1;
CREATE TABLE Account
(
    id         int8         NOT NULL,
    email      varchar(254) NOT NULL,
    points     int8         NOT NULL,
    enabled    boolean      NOT NULL,
    first_name varchar(70)  NOT NULL,
    last_name  varchar(70)  NOT NULL,
    password   varchar(256) NOT NULL,
    settings   text,
    username   varchar(64),
    CONSTRAINT "Account_pk" PRIMARY KEY (id)
);

CREATE TABLE account_activation_token
(
    id          int8         NOT NULL,
    expiry_date timestamp,
    token_value varchar(255) NOT NULL,
    account_id  int8         NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE account_role
(
    account_id int8 NOT NULL,
    role_id    int8 NOT NULL,
    PRIMARY KEY (account_id, role_id)
);

CREATE TABLE choice
(
    id                          int8         NOT NULL,
    correct                     boolean      NOT NULL,
    description                 varchar(255) NOT NULL,
    multiple_choice_exercise_id int8         NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE exercise_query
(
    id                 int8         NOT NULL,
    created_date       timestamp,
    last_modified_date timestamp,
    error_message      varchar(255),
    execution_time     float8       NOT NULL,
    query_status       varchar(255) NOT NULL,
    sql_statement      varchar(255) NOT NULL,
    created_by         int8,
    last_modified_by   int8,
    PRIMARY KEY (id)
);

CREATE TABLE multiple_choice_exercise
(
    id                 int8         NOT NULL,
    created_date       timestamp,
    last_modified_date timestamp,
    difficulty         varchar(255) NOT NULL,
    taskDescription    varchar(255) NOT NULL,
    taskName           varchar(255) NOT NULL,
    created_by         int8,
    last_modified_by   int8,
    PRIMARY KEY (id)
);

CREATE TABLE multiple_choice_exercise_answer
(
    id                            int8 NOT NULL,
    created_date                  timestamp,
    last_modified_date            timestamp,
    awarded_points                int4,
    created_by                    int8,
    last_modified_by              int8,
    quiz_answer_id                int8,
    multiple_choice_answer_result varchar(255),
    multiple_choice_exercise_id   int8 NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE multiple_choice_exercise_answer_choice
(
    multiple_choice_exercise_answer_id int8 NOT NULL,
    choice_id                          int8 NOT NULL,
    PRIMARY KEY (multiple_choice_exercise_answer_id, choice_id)
);

CREATE TABLE password_reset_token
(
    id          int8         NOT NULL,
    expiry_date timestamp,
    token_value varchar(255) NOT NULL,
    account_id  int8         NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE privilege
(
    id          int8         NOT NULL,
    description varchar(255),
    name        varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE query_result
(
    id           int8 NOT NULL,
    query_result json,
    PRIMARY KEY (id)
);

CREATE TABLE quiz
(
    id                 int8         NOT NULL,
    created_date       timestamp,
    last_modified_date timestamp,
    description        varchar(255),
    difficulty         varchar(255),
    title              varchar(255) NOT NULL,
    created_by         int8,
    last_modified_by   int8,
    PRIMARY KEY (id)
);

CREATE TABLE quiz_answer
(
    id                 int8 NOT NULL,
    created_date       timestamp,
    last_modified_date timestamp,
    created_by         int8,
    last_modified_by   int8,
    answeredQuiz_id    int8 NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE quiz_exercise
(
    quiz_id     int8 NOT NULL,
    exercise_id int8 NOT NULL,
    index       int4 NOT NULL,
    PRIMARY KEY (quiz_id, index)
);

CREATE TABLE role
(
    id                 int8         NOT NULL,
    created_date       timestamp,
    last_modified_date timestamp,
    name               varchar(255) NOT NULL,
    created_by         int8,
    last_modified_by   int8,
    PRIMARY KEY (id)
);

CREATE TABLE role_privilege
(
    role_id      int8 NOT NULL,
    privilege_id int8 NOT NULL
);

CREATE TABLE sample_query
(
    id                 int8         NOT NULL,
    created_date       timestamp,
    last_modified_date timestamp,
    error_message      varchar(255),
    execution_time     float8       NOT NULL,
    query_status       varchar(255) NOT NULL,
    sql_statement      varchar(255) NOT NULL,
    created_by         int8,
    last_modified_by   int8,
    query_result_id    int8,
    PRIMARY KEY (id)
);

CREATE TABLE sandbox_query
(
    id                 int8         NOT NULL,
    created_date       timestamp,
    last_modified_date timestamp,
    error_message      varchar(255),
    execution_time     float8       NOT NULL,
    query_status       varchar(255) NOT NULL,
    sql_statement      varchar(255) NOT NULL,
    created_by         int8,
    last_modified_by   int8,
    PRIMARY KEY (id)
);

CREATE TABLE sql_comparison_result
(
    id                           int8 NOT NULL,
    processing_time              int8,
    sql_comparison_result_status varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE statement_exercise
(
    id                       int8         NOT NULL,
    created_date             timestamp,
    last_modified_date       timestamp,
    difficulty               varchar(255) NOT NULL,
    taskDescription          varchar(255) NOT NULL,
    taskName                 varchar(255) NOT NULL,
    created_by               int8,
    last_modified_by         int8,
    hint                     varchar(255),
    max_rows                 int4,
    query_timeout            int4,
    sample_query_solution_id int8,
    PRIMARY KEY (id)
);

CREATE TABLE statement_exercise_answer
(
    id                       int8 NOT NULL,
    created_date             timestamp,
    last_modified_date       timestamp,
    awarded_points           int4,
    created_by               int8,
    last_modified_by         int8,
    quiz_answer_id           int8,
    exercise_query_id        int8 NOT NULL,
    sql_comparison_result_id int8,
    statement_exercise_id    int8 NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE if EXISTS account ADD CONSTRAINT UK_q0uja26qgu1atulenwup9rxyr UNIQUE (email);
ALTER TABLE if EXISTS privilege ADD CONSTRAINT UK_h7iwbdg4ev8mgvmij76881tx8 UNIQUE (name);
ALTER TABLE if EXISTS ROLE ADD CONSTRAINT UK_8sewwnpamngi6b1dwaa88askk UNIQUE (name);
ALTER TABLE if EXISTS statement_exercise_answer ADD CONSTRAINT UK_4sg6vuse2v5un10w672jw99ec UNIQUE (exercise_query_id);
ALTER TABLE if EXISTS account_activation_token ADD CONSTRAINT FK_3k9dh6a0n15s88o9clwr3rcvh FOREIGN KEY (account_id) REFERENCES account;
ALTER TABLE if EXISTS account_role ADD CONSTRAINT FKrs2s3m3039h0xt8d5yhwbuyam FOREIGN KEY (role_id) REFERENCES ROLE;
ALTER TABLE if EXISTS account_role ADD CONSTRAINT FK1f8y4iy71kb1arff79s71j0dh FOREIGN KEY (account_id) REFERENCES account;
ALTER TABLE if EXISTS exercise_query ADD CONSTRAINT FK_b0cic57uogadgg2q18i1w5uc2 FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS exercise_query ADD CONSTRAINT FK_b7cvgbodpf4sja3n4uk524384 FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS multiple_choice_exercise ADD CONSTRAINT FK_nwhdmwylby6rx1l3uav9k39wt FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS multiple_choice_exercise ADD CONSTRAINT FK_b23om69aqum7x8bxpl2r42ja6 FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS multiple_choice_exercise_answer ADD CONSTRAINT FK6re3i82gp6pvvfnme5yy1d9pr FOREIGN KEY (multiple_choice_exercise_id) REFERENCES multiple_choice_exercise ON DELETE CASCADE;
ALTER TABLE if EXISTS multiple_choice_exercise_answer ADD CONSTRAINT FK_astb5vccd5g05ix33q4q378uf FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS multiple_choice_exercise_answer ADD CONSTRAINT FK_cvg6kjfqbkhw8le2obf8tk4hk FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS multiple_choice_exercise_answer ADD CONSTRAINT FK_kfe3bi3dfv85m0a7i7d5up5i4 FOREIGN KEY (quiz_answer_id) REFERENCES quiz_answer;
ALTER TABLE if EXISTS multiple_choice_exercise_answer_choice ADD CONSTRAINT FKatfh4k5pr9neq7hbkob4j2f66 FOREIGN KEY (choice_id) REFERENCES choice;
ALTER TABLE if EXISTS multiple_choice_exercise_answer_choice ADD CONSTRAINT FKa6jhn8s2pvdlsymu60f9n3m1 FOREIGN KEY (multiple_choice_exercise_answer_id) REFERENCES multiple_choice_exercise_answer;
ALTER TABLE if EXISTS password_reset_token ADD CONSTRAINT FK_qm42b3i63ge5g0a4fb20vdrnw FOREIGN KEY (account_id) REFERENCES account;
ALTER TABLE if EXISTS quiz ADD CONSTRAINT FKmj10t5764u0r45n6lkwwdym96 FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS quiz ADD CONSTRAINT FK2na2kxhxxwggvfp5apxkw68o5 FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS quiz_answer ADD CONSTRAINT FKohoscp33ljymyxcjy8numw9tu FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS quiz_answer ADD CONSTRAINT FK6mduogt3ycxr2jljnu14t5ymh FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS quiz_answer ADD CONSTRAINT FKo7tpwlcf656abn09bfywx72jm FOREIGN KEY (answeredQuiz_id) REFERENCES quiz;
ALTER TABLE if EXISTS quiz_exercise ADD CONSTRAINT FKg3pxcalqhk47sjegmi6fhiax4 FOREIGN KEY (quiz_id) REFERENCES quiz;
ALTER TABLE if EXISTS ROLE ADD CONSTRAINT FKv0ruhrra489cqn3may1psymd FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS ROLE ADD CONSTRAINT FK98n2d2m0q4mx3s1ele7ktr05f FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS role_privilege ADD CONSTRAINT FKdkwbrwb5r8h74m1v7dqmhp99c FOREIGN KEY (privilege_id) REFERENCES privilege;
ALTER TABLE if EXISTS role_privilege ADD CONSTRAINT FKsykrtrdngu5iexmbti7lu9xa FOREIGN KEY (role_id) REFERENCES ROLE;
ALTER TABLE if EXISTS sample_query ADD CONSTRAINT FKa5cc3n7jytoyssluefh1cdigg FOREIGN KEY (query_result_id) REFERENCES query_result;
ALTER TABLE if EXISTS sample_query ADD CONSTRAINT FK_eisqsfrbpcnj0wu1n2rs8llm2 FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS sample_query ADD CONSTRAINT FK_ii760wwv65m3wyt6dcv94iplu FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS sandbox_query ADD CONSTRAINT FK_j1vaqoryaub0oa5iv0fwft4qf FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS sandbox_query ADD CONSTRAINT FK_2i2t887b9powesi1vol46482x FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS statement_exercise ADD CONSTRAINT FKlpfum3oxnp54g1txseguxcre8 FOREIGN KEY (sample_query_solution_id) REFERENCES sample_query;
ALTER TABLE if EXISTS statement_exercise ADD CONSTRAINT FK_ba66cj2b2orp1qxo59cvvr8fy FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS statement_exercise ADD CONSTRAINT FK_lb9hfi6svvyod2osdx12sa8p0 FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS statement_exercise_answer ADD CONSTRAINT FKfnffy0u9pea1qix9q3ssm68wu FOREIGN KEY (exercise_query_id) REFERENCES exercise_query;
ALTER TABLE if EXISTS statement_exercise_answer ADD CONSTRAINT FK935c15j6afutg9g7jruvgnhh7 FOREIGN KEY (sql_comparison_result_id) REFERENCES sql_comparison_result;
ALTER TABLE if EXISTS statement_exercise_answer ADD CONSTRAINT FKmmlyx4xc749ehh76sppn7ebta FOREIGN KEY (statement_exercise_id) REFERENCES statement_exercise ON DELETE CASCADE;
ALTER TABLE if EXISTS statement_exercise_answer ADD CONSTRAINT FK_btkbjki0vwtnm1h4mrkuboc8d FOREIGN KEY (created_by) REFERENCES account;
ALTER TABLE if EXISTS statement_exercise_answer ADD CONSTRAINT FK_ntp9bvt70wemt4dnfjaa0pegi FOREIGN KEY (last_modified_by) REFERENCES account;
ALTER TABLE if EXISTS statement_exercise_answer ADD CONSTRAINT FK_afnuo23qwmy747kleeu3fq8y1 FOREIGN KEY (quiz_answer_id) REFERENCES quiz_answer;
