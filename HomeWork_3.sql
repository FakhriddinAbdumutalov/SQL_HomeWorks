Create Database Policy

use Policy

Create table iam_policies(
PolicyID int primary key,
PolicyName varchar(50), PolicyType varchar(50))
go

create table iam_roles(
RoleID int primary key,
RoleName varchar(50),
RoleType varchar(50),
RoleActions varchar(50))
go

create table iam_projects_graveyard(
ProjectGraveyardID int primary key)
go

create table iam_projects(
ProjectID int primary key,
ProjectName varchar(50),
ProjectType varchar(50))
go

create table iam_members(
MemberID int primary key,
MembersName varchar(50))
go

create table iam_policy_members(
MemberID int foreign key references iam_members(MemberID))
go

create table iam_policy_projects(
PolicyID int foreign key references iam_policies(PolicyID),
ProjectID int foreign key references iam_projects(ProjectID))
go

create table iam_statements(
StatementID int primary key,
Effect text,
actions varchar(30), 
resources varchar(50),
PolicyID int foreign key references iam_policies(PolicyID)
go


create table iam_statement_projects(
ProjectID int foreign key references iam_projects(ProjectID),
StatementID int foreign key references iam_statements(StatementID))
go

create table iam_role_projects(
RoleID int foreign key references iam_roles(RoleID), 
ProjectID int foreign key references iam_projects(ProjectID))
go

create table iam_staged_project_rules(
ProjectStagedRuleID int primary key, 
ProjectStagedRuleName varchar(50), 
ProjectStagedRuleType varchar(50), 
check (ProjectStagedRuleType is not null),
ProjectID int foreign key references iam_projects(ProjectID))
go

create table iam_staged_rule_conditions(
StagedRuleConditionID int primary key,
ProjectStagedRulesID int foreign key references iam_staged_project_rules(ProjectStagedRuleID),
value int, 
StagedRuleConditionAttribute varchar(50), 
StagedRuleConditionOperator varchar(50),
ProjectStagedRuleID int foreign key references iam_staged_project_rules(ProjectStagedRuleID))
go

create table iam_project_rules(
ProjectRuleID int primary key, 
ProjectRuleName varchar(50), 
ProjectRuleType varchar(50),
ProjectID int foreign key references iam_projects(ProjectID))
go

create table iam_rule_conditions(
RuleConditionID int primary key, 
value int, 
RuleConditionAttribute varchar(50),
RuleConditionOperator varchar (50),
ProjectRuleID int foreign key references iam_project_rules(ProjectRuleID))
go


