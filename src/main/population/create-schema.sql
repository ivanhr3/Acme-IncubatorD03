
    create table `administrator` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `anonymous` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `authenticated` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `challenge` (
       `id` integer not null,
        `version` integer not null,
        `average_goal` varchar(255),
        `average_reward_amount` double precision,
        `average_reward_currency` varchar(255),
        `deadline` datetime(6),
        `description` varchar(255),
        `expert_goal` varchar(255),
        `expert_reward_amount` double precision,
        `expert_reward_currency` varchar(255),
        `rookie_goal` varchar(255),
        `rookie_reward_amount` double precision,
        `rookie_reward_currency` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `consumer` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        `company` varchar(255),
        `sector` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `hernandez_bulletin` (
       `id` integer not null,
        `version` integer not null,
        `country` varchar(255),
        `favourite_singer` varchar(255),
        `name` varchar(255),
        `surname` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `inquire` (
       `id` integer not null,
        `version` integer not null,
        `creation_date` datetime(6),
        `deadline` datetime(6),
        `email` varchar(255),
        `maximum_money_amount` double precision,
        `maximum_money_currency` varchar(255),
        `minimum_money_amount` double precision,
        `minimum_money_currency` varchar(255),
        `paragraph` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `notice` (
       `id` integer not null,
        `version` integer not null,
        `body` varchar(255),
        `creation_date` datetime(6),
        `deadline` datetime(6),
        `header_picture` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `notice_related_notices` (
       `notice_id` integer not null,
        `related_notices` varchar(255)
    ) engine=InnoDB;

    create table `overture` (
       `id` integer not null,
        `version` integer not null,
        `creation_date` datetime(6),
        `deadline` datetime(6),
        `email` varchar(255),
        `maximum_money_amount` double precision,
        `maximum_money_currency` varchar(255),
        `minimum_money_amount` double precision,
        `minimum_money_currency` varchar(255),
        `paragraph` varchar(255),
        `title` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `provider` (
       `id` integer not null,
        `version` integer not null,
        `user_account_id` integer,
        `company` varchar(255),
        `sector` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `sector` (
       `id` integer not null,
        `version` integer not null,
        `name` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `sector_technology_record` (
       `sector_id` integer not null,
        `technology_record_id` integer not null
    ) engine=InnoDB;

    create table `sector_tool_record` (
       `sector_id` integer not null,
        `tool_record_id` integer not null
    ) engine=InnoDB;

    create table `spamlist` (
       `id` integer not null,
        `version` integer not null,
        `threshold` double precision,
        primary key (`id`)
    ) engine=InnoDB;

    create table `spamword` (
       `id` integer not null,
        `version` integer not null,
        `english_spamword` varchar(255),
        `spanish_spamword` varchar(255),
        `spamlist_id` integer not null,
        primary key (`id`)
    ) engine=InnoDB;

    create table `technology_record` (
       `id` integer not null,
        `version` integer not null,
        `description` varchar(255),
        `email` varchar(255),
        `inventor` varchar(255),
        `open_source` bit,
        `stars` integer,
        `title` varchar(255),
        `web` varchar(255),
        `sector_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `tool_record` (
       `id` integer not null,
        `version` integer not null,
        `description` varchar(255),
        `email` varchar(255),
        `inventor` varchar(255),
        `open_source` bit,
        `stars` integer,
        `title` varchar(255),
        `web` varchar(255),
        `sector_id` integer,
        primary key (`id`)
    ) engine=InnoDB;

    create table `user_account` (
       `id` integer not null,
        `version` integer not null,
        `enabled` bit not null,
        `identity_email` varchar(255),
        `identity_name` varchar(255),
        `identity_surname` varchar(255),
        `password` varchar(255),
        `username` varchar(255),
        primary key (`id`)
    ) engine=InnoDB;

    create table `hibernate_sequence` (
       `next_val` bigint
    ) engine=InnoDB;

    insert into `hibernate_sequence` values ( 1 );

    alter table `sector_technology_record` 
       add constraint UK_b4d0knuwfu0wysqy5l25plu80 unique (`technology_record_id`);

    alter table `sector_tool_record` 
       add constraint UK_bsr4inr13m8upk2y9iwbirk0x unique (`tool_record_id`);
create index IDX3eg8909lys96o3fgmgagnw6yj on `spamword` (`english_spamword`);

    alter table `user_account` 
       add constraint UK_castjbvpeeus0r8lbpehiu0e4 unique (`username`);

    alter table `administrator` 
       add constraint FK_2a5vcjo3stlfcwadosjfq49l1 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `anonymous` 
       add constraint FK_6lnbc6fo3om54vugoh8icg78m 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `authenticated` 
       add constraint FK_h52w0f3wjoi68b63wv9vwon57 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `consumer` 
       add constraint FK_6cyha9f1wpj0dpbxrrjddrqed 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `notice_related_notices` 
       add constraint `FKqc9an4dp5k6wuis8dyx289lg2` 
       foreign key (`notice_id`) 
       references `notice` (`id`);

    alter table `provider` 
       add constraint FK_b1gwnjqm6ggy9yuiqm0o4rlmd 
       foreign key (`user_account_id`) 
       references `user_account` (`id`);

    alter table `sector_technology_record` 
       add constraint `FKmc1s58626x379uwf2nvd01qbu` 
       foreign key (`technology_record_id`) 
       references `technology_record` (`id`);

    alter table `sector_technology_record` 
       add constraint `FK65jl851krvtu9recs0sisyfbx` 
       foreign key (`sector_id`) 
       references `sector` (`id`);

    alter table `sector_tool_record` 
       add constraint `FKrssx9lx0mad1idskn0wmoomjo` 
       foreign key (`tool_record_id`) 
       references `tool_record` (`id`);

    alter table `sector_tool_record` 
       add constraint `FKor8yierdg2qsqdrqbtayumgmj` 
       foreign key (`sector_id`) 
       references `sector` (`id`);

    alter table `spamword` 
       add constraint `FKrk7poykhk0ukf2dm6oqv3rejm` 
       foreign key (`spamlist_id`) 
       references `spamlist` (`id`);

    alter table `technology_record` 
       add constraint `FKkcv3w0hfp0xxie8vw14tq4q4c` 
       foreign key (`sector_id`) 
       references `sector` (`id`);

    alter table `tool_record` 
       add constraint `FKl4fchw6w2xn4bxp2iqukjukte` 
       foreign key (`sector_id`) 
       references `sector` (`id`);
