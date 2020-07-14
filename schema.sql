DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS identificador;
DROP TABLE IF EXISTS notas;

CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ci INTEGER UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE identificador (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ci INTEGER UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    birth_date TEXT NOT NULL,
    residencia TEXT NOT NULL
);

CREATE TABLE notas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    userID INTEGER NOT NULL, 
    materia TEXT NOT NULL,
    nota INTEGER NOT NULL,
    FOREIGN KEY(userID) REFERENCES user(id)
);

INSERT INTO user(id, ci, password)
VALUES (1, 8347320, "alexcruz"),
        (2, 6783452, "candido"),
        (3, 5672945, "yafjausen"),
        (4, 8976453, "pokemon"),
        (5, 9351238, "coronavirus");

INSERT INTO notas(id, userID, materia, nota)
VALUES (1, 8347320, "INF321", 49),
        (2, 6783452, "INF321", 52),
        (3, 5672945, "INF321", 39),
        (4, 8976453, "INF321", 52),
        (5, 9351238, "INF321", 83),
        (6, 8347320, "INF191", 72),
        (7, 6783452, "INF191", 47),
        (8, 5672945, "INF191", 82),
        (9, 8976453, "INF191", 90),
        (10, 9351238, "INF191", 92),
        (11, 8347320, "INF272", 70),
        (12, 6783452, "INF272", 79),
        (13, 5672945, "INF272", 98),
        (14, 8976453, "INF272", 33),
        (15, 9351238, "INF272", 47),
        (16, 8347320, "INF314", 68),
        (17, 6783452, "INF314", 28),
        (18, 5672945, "INF314", 77),
        (19, 8976453, "INF314", 33),
        (20, 9351238, "INF314", 47),
        (21, 8347320, "INF324", 75),
        (22, 6783452, "INF324", 30),
        (23, 5672945, "INF324", 94),
        (24, 8976453, "INF324", 60),
        (25, 9351238, "INF324", 93),
        (26, 8347320, "INF329", 95),
        (27, 6783452, "INF329", 78),
        (28, 5672945, "INF329", 28),
        (29, 8976453, "INF329", 11),
        (30, 9351238, "INF329", 62);


