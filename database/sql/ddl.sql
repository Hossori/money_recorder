create database money_recorder;
use money_recorder;

create table user(
    user_id int
        primary key
        auto_increment
        not null,
    email varchar(256)
        not null,
    name varchar(100)
        not null,
    password char(60)
        not null,
    created_epoch_second int(11)
        not null,
    deleted boolean
        not null
);

/* constant table */
create table money_record_type(
    money_record_type_name varchar(100)
        primary key
        not null,
    available boolean
        not null
);

create table span_type(
    span_type_name varchar(100)
        primary key
        not null,
    available boolean
        not null
);
/* -------------- */

create table money_record_category(
    money_record_category_id int
        primary key
        auto_increment
        not null,
    user_id int
        not null
        references user(user_id),
    money_record_type_name varchar(100)
        not null
        references money_record_type(money_record_type_name),
    available boolean
        not null,
    name varchar(100)
        not null
);

create table money_record(
    money_record_id int
        primary key
        auto_increment
        not null,
    user_id int
        not null
        references user(user_id),
    money_record_category_id int
        not null
        references money_record_category(money_record_category_id),
    money_record_type_name varchar(100)
        not null
        references money_record_type(money_record_type_name),
    amount int
        not null,
    date date
        not null
);

create table fixed_money_record(
    fixed_money_record_id int
        primary key
        auto_increment
        not null,
    user_id int
        not null
        references user(user_id),
    money_record_category_id int
        not null
        references money_record_category(money_record_category_id),
    money_record_type_name varchar(100)
        not null
        references money_record_type(money_record_type_name),
    span_type_name varchar(100)
        not null
        references span_type(span_type_name),
    amount int
        not null,
    start_date date
        not null,
    end_date date
        not null
);

create table period_money_record(
    period_money_record_id int
        primary key
        auto_increment
        not null,
    user_id int
        not null
        references user(user_id),
    money_record_category_id int
        not null
        references money_record_category(money_record_category_id),
    money_record_type_name varchar(100)
        not null
        references money_record_type(money_record_type_name),
    span_type_name varchar(100)
        not null
        references span_type(span_type_name),
    default_amount int
        not null,
    start_date date
        not null,
    end_date date
        not null
);

/* link table */
create table fixed_money_record_link(
    money_record_id int
        not null
        references money_record(money_record_id),
    fixed_money_record_id int
        not null
        references fixed_money_record(fixed_money_record_id),
    primary key(money_record_id, fixed_money_record_id)
);

create table period_money_record_link(
    money_record_id int
        not null
        references money_record(money_record_id),
    period_money_record_id int
        not null
        references period_money_record(period_money_record_id),
    primary key(money_record_id, period_money_record_id)
);
/* ---------- */