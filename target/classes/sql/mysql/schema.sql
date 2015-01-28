
    alter table es_role_authority 
        drop foreign key FKAE243466DE3FB930;

    alter table es_role_authority 
        drop foreign key FKAE2434663FE97564;

    alter table es_user_role 
        drop foreign key FKFE85CB3EDE3FB930;

    alter table es_user_role 
        drop foreign key FKFE85CB3E836A7D10;

    drop table if exists es_authority;

    drop table if exists es_role;

    drop table if exists es_role_authority;

    drop table if exists es_user;

    drop table if exists es_user_role;

    create table es_authority (
        id bigint not null auto_increment,
        name varchar(255) not null unique,
        primary key (id)
    ) ENGINE=InnoDB;

    create table es_role (
        id bigint not null auto_increment,
        name varchar(255) not null unique,
        primary key (id)
    ) ENGINE=InnoDB;

    create table es_role_authority (
        role_id bigint not null,
        authority_id bigint not null
    ) ENGINE=InnoDB;

    create table es_user (
        id bigint not null auto_increment,
        email varchar(255),
        login_name varchar(255) not null unique,
        name varchar(255),
        password varchar(255),
        primary key (id)
    ) ENGINE=InnoDB;

    create table es_user_role (
        user_id bigint not null,
        role_id bigint not null
    ) ENGINE=InnoDB;

    alter table es_role_authority 
        add constraint FKAE243466DE3FB930 
        foreign key (role_id) 
        references es_role (id);

    alter table es_role_authority 
        add constraint FKAE2434663FE97564 
        foreign key (authority_id) 
        references es_authority (id);

    alter table es_user_role 
        add constraint FKFE85CB3EDE3FB930 
        foreign key (role_id) 
        references es_role (id);

    alter table es_user_role 
        add constraint FKFE85CB3E836A7D10 
        foreign key (user_id) 
        references es_user (id);
