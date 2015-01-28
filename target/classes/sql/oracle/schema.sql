
    drop table es_authority cascade constraints;

    drop table es_role cascade constraints;

    drop table es_role_authority cascade constraints;

    drop table es_user cascade constraints;

    drop table es_user_role cascade constraints;

    drop sequence hibernate_sequence;

    create table es_authority (
        id number(19,0) not null,
        name varchar2(255 char) not null unique,
        primary key (id)
    );

    create table es_role (
        id number(19,0) not null,
        name varchar2(255 char) not null unique,
        primary key (id)
    );

    create table es_role_authority (
        role_id number(19,0) not null,
        authority_id number(19,0) not null
    );

    create table es_user (
        id number(19,0) not null,
        email varchar2(255 char),
        login_name varchar2(255 char) not null unique,
        name varchar2(255 char),
        password varchar2(255 char),
        primary key (id)
    );

    create table es_user_role (
        user_id number(19,0) not null,
        role_id number(19,0) not null
    );

    alter table es_role_authority 
        add constraint FKAE243466DE3FB930 
        foreign key (role_id) 
        references es_role;

    alter table es_role_authority 
        add constraint FKAE2434663FE97564 
        foreign key (authority_id) 
        references es_authority;

    alter table es_user_role 
        add constraint FKFE85CB3EDE3FB930 
        foreign key (role_id) 
        references es_role;

    alter table es_user_role 
        add constraint FKFE85CB3E836A7D10 
        foreign key (user_id) 
        references es_user;

    create sequence hibernate_sequence;
