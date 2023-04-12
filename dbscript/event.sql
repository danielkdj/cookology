create table ATTENDANCE
(
    USER_EMAIL VARCHAR2(255),
    TODAY      DATE
)
    /

create table C##STUDENT.EVENTCALENDAR
(
    EVENTCALENDAR_UUID VARCHAR2(255) not null
        constraint EVENTCALEDAR_PK
        primary key,
    "start"            DATE,
    END                DATE,
    TITLE              VARCHAR2(1000),
    URL                VARCHAR2(1000),
    BACKGROUNDCOLOR    VARCHAR2(30),
    DESCRIPTION        VARCHAR2(1000),
    CONTENT            NCLOB,
    LATITUDE           VARCHAR2(100),
    LONGITUDE          VARCHAR2(100)
)
    /

create table VISITOR_LOGS
(
    PAGE      VARCHAR2(100),
    IPADDRESS VARCHAR2(50),
    TIME      DATE
)
    /


