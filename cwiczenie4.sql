CREATE TABLE pracownicy (
    id_pracownika numeric primary key,
    imie varchar(20) NOT NULL,
    nazwisko varchar(30) NOT NULL,
    adres varchar(100),
    telefon integer unique
);

CREATE TABLE godziny(
    id_godziny numeric primary key,
    data date,
    liczba_godzin float NOT NULL,
    id_pracownika numeric
);


CREATE TABLE premie(
    id_premii numeric primary key,
    rodzaj varchar(20) NOT NULL,
    kwota float NOT NULL
);

CREATE TABLE pensje(
    id_pensji numeric primary key,
    stanowisko varchar(50),
    kwota float NOT NULL ,
    id_premii numeric
);

ALTER TABLE pensje ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);
ALTER TABLE godziny ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);

INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (0,'Paweł', 'Kot', 'Liściasta 12 Poznań', 675645646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (1,'Maria', 'Słowik', 'Kolorowa 2 Kraków', 61459646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (2,'Janusz', 'Palik', 'Promienna 9/1 Zielona Góra', 615445646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (3,'Grażyna', 'Cebula', 'Sekretna 36 Poznań', 965645646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (4,'Mieszko', 'Pierwszy', 'Słoneczna 84 Gdańsk', 201645646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (5,'Anita', 'Kowalska', 'Krótka 5 Warszawa', 615645646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (6,'Aleksander', 'Dzięcioł', 'Liściasta 12 Tarnowskie Góry', 696445646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (7,'Miłosz', 'Warchoł', 'Długa 8 Zabrze', 615645146);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (8,'Max', 'Idzior', 'Leśna 1 Warszawa', 615646389);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (9,'Olena', 'Barszcz', 'Spadzista 45 Warszawa', 885645646);

SELECT * FROM pracownicy;

UPDATE pracownicy SET telefon = 614596461 WHERE id_pracownika = 1;

INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (0, '2021-01-02', 6.5, 8);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (1, '2021-02-03', 8, 9);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (2, '2021-01-12', 4, 1);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (3, '2021-11-24', 8, 6);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (4, '2021-06-07', 7.5, 2);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (5, '2021-07-02', 9, 7);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (6, '2021-02-14', 4.5, 1);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (7, '2021-01-02', 8, 3);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (8, '2021-01-16', 8, 5);
INSERT INTO godziny(id_godziny, data, liczba_godzin, id_pracownika)  VALUES (9, '2021-01-17', 9, 6);

SELECT * FROM godziny;

INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (0, 'uznaniowa', 900);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (1, 'regulaminowa', 300);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (2, 'regulaminowa', 500);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (3, 'uznaniowa', 1200);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (4, 'premium', 2800);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (5, 'regulaminowa', 400);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (6, 'premium', 3000);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (7, 'uznaniowa', 1500);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (8, 'uznaniowa', 1000);
INSERT INTO premie(id_premii, rodzaj, kwota) VALUES (9, 'regulaminowa', 600);

INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (0, 'Data Analyst', 4000, 7);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (1, 'Frontend Developer', 5000, 1);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (2, 'Junior Python Developer', 4400, 8);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (3, 'Data Engineer', 8000, 5);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (4, 'Backend Developer', 3800, 9);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (5, 'Data Analyst', 4000, 2);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (6, 'Senior Java Developer', 4000, 4);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (7, 'Mid C++ Developer', 4000, 3);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (8, 'Junior Full Stack Developer', 4000, 6);
INSERT INTO pensje(id_pensji, stanowisko, kwota, id_premii) VALUES (9, 'Analyst', 4000, 0);

SELECT * FROM pensje;
SELECT * FROM premie;
SELECT * FROM pracownicy;
SELECT * FROM godziny;


SELECT nazwisko, adres FROM pracownicy;

SELECT date_part('dow', data), date_part('month', data)  FROM godziny;

ALTER TABLE pensje
RENAME kwota TO kwota_brutto;

ALTER TABLE pensje
ADD kwota_netto float;

UPDATE pensje
SET kwota_netto =  kwota_brutto/1.23