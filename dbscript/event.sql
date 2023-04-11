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

create table VISTIOR_LOGS
(
    PAGE      VARCHAR2(100),
    IPADDRESS VARCHAR2(50),
    TIME      DATE
)
    /


create table ATTENDANCE
(
    USER_EMAIL VARCHAR2(255),
    TODAY      DATE
)
    /


