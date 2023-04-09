create table EVENTCALEDAR
(
    EVENTCALENDAR_UUID VARCHAR2(255) not null
        constraint EVENTCALEDAR_PK
        primary key,
    "start"            DATE,
    END                DATE,
    TITLE              VARCHAR2(255),
    URL                VARCHAR2(255),
    BACKGROUNDCOLOR    VARCHAR2(30),
    DESCRIPTION        VARCHAR2(300),
    CONTENT            NCLOB
)
    /
