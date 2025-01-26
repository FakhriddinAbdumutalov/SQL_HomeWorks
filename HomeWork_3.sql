Create Database Policy
go

use Policy
go

create table iam_roles (
    db_id int primary key,
    id int not null,
    name varchar(50) not null,
    actions varchar(255),
    type varchar(50)
);

create table iam_policies (
    db_id int primary key,
    id int not null,
    name varchar(50) not null,
    type varchar(50)
);

create table iam_statements (
    db_id int primary key,
    effect varchar(50) not null,
    actions varchar(255),
    resources varchar(255),
    policy_id int,
    role_id int,
    foreign key (policy_id) references iam_policies(db_id),
    foreign key (role_id) references iam_roles(db_id)
);

create table iam_members (
    db_id int primary key,
    name varchar(50) not null
);

create table iam_policy_members (
    member_id int,
    policy_id int,
    primary key (member_id, policy_id),
    foreign key (member_id) references iam_members(db_id),
    foreign key (policy_id) references iam_policies(db_id)
);

create table iam_projects (
    db_id int primary key,
    id int not null,
    name varchar(50) not null,
    type varchar(50)
);

create table iam_policy_projects (
    policy_id int,
    project_id int,
    primary key (policy_id, project_id),
    foreign key (policy_id) references iam_policies(db_id),
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_statement_projects (
    project_id int,
    statement_id int,
    primary key (project_id, statement_id),
    foreign key (project_id) references iam_projects(db_id),
    foreign key (statement_id) references iam_statements(db_id)
);

create table iam_role_projects (
    role_id int,
    project_id int,
    primary key (role_id, project_id),
    foreign key (role_id) references iam_roles(db_id),
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_staged_project_rules (
    db_id int primary key,
    name varchar(50) not null,
    type varchar(50),
    deleted bit not null,
    project_id int,
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_project_rules (
    db_id int primary key,
    name varchar(50) not null,
    type varchar(50),
    project_id int,
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_projects_graveyard (
    db_id int primary key,
    id int not null,
    name varchar(50) not null,
    type varchar(50),
    project_id int,
    foreign key (project_id) references iam_projects(db_id)
);

create table iam_staged_rule_conditions (
    db_id int primary key,
    rule_db_id int not null,
    value varchar(255),
    attribute varchar(50),
    operator varchar(50),
    foreign key (rule_db_id) references iam_staged_project_rules(db_id)
);

create table iam_rule_conditions (
    db_id int primary key,
    rule_db_id int not null,
    value varchar(255),
    attribute varchar(50),
    operator varchar(50),
    foreign key (rule_db_id) references iam_project_rules(db_id)
);


--Hometask
--Whenever a user enters blank ('', '  ') or null to F(address) it should automatically change it to Tashkent

create table G(name varchar(50), address varchar(50), check(address is not null and trim(address) <> ''))

insert into G values ('Romano', 'Italy')
insert into G values ('Federico', 'Bilbao')
insert into G values ('Sergio', null)

create trigger trg_AddressDefault
on G
instead of insert, update
as
begin
    -- Insert valid data, replacing NULL or blank addresses with 'Tashkent'
    insert into G (name, address)
    select 
        name,
        case 
            when address IS NULL OR ltrim(rtrim(address)) = '' then 'Tashkent'
            else address
        end
    from inserted;
end;
go


