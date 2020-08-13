PRAGMA FOREIGN_KEYS=ON;

drop table person;--это можно потом убрать, нужно, чтоб не прописывать руками
drop table weapons;--при каждом чтении дампа
drop table armor;
drop table locations;

CREATE TABLE person(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    HP INTEGER NOT NULL ,
    LVL INTEGER NOT NULL ,
    curent_loc INTEGER NOT NULL ,
    inventory INTEGER NOT NULL ,--У нас разные таблицы с оружием
    in_hand INTEGER NOT NULL ,--текущее оружие в руках
    on_body INTEGER NOT NULL ,--текущая броня
    FOREIGN KEY (curent_loc) REFERENCES locations(id),
    FOREIGN KEY (inventory) REFERENCES weapons(id) armor,
    FOREIGN KEY (in_hand) REFERENCES weapons(id),
    FOREIGN KEY (on_body) REFERENCES armor(id)
);

CREATE TABLE weapons(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    LVL INTEGER NOT NULL,
    damage INTEGER NOT NULL,
    price INTEGER NOT NULL
);

CREATE TABLE armor(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    LVL INTEGER NOT NULL,
    DT INTEGER NOT NULL,--Порог урона
    protection INTEGER NOT NULL,--поглощение урона в процентах
    price INTEGER NOT NULL
);

CREATE TABLE locations(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    max_lvl INTEGER NOT NULL
);

