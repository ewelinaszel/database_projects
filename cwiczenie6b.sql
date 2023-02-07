CREATE SCHEMA ksiegowosc2;

CREATE TABLE pracownicy (
    id_pracownika numeric primary key,
    imie varchar(20) NOT NULL,
    nazwisko varchar(30) NOT NULL,
    adres varchar(100),
    telefon integer unique
);
COMMENT ON TABLE pracownicy IS 'Tabela sklada się z pracowników firmy i ich danych personalnych';

CREATE TABLE godziny(
    id_godziny numeric primary key,
    data date,
    liczba_godzin float NOT NULL,
    id_pracownika numeric
);
COMMENT ON TABLE godziny IS 'Tabela godziny sklada sie z liczy godzin przpracowanych przez danego pracownika w danym dniu';

CREATE TABLE premie(
    id_premii numeric primary key,
    rodzaj varchar(20) NOT NULL,
    kwota float NOT NULL
);
COMMENT ON TABLE premie IS 'Tabela premie zawiera informacje o rodzaju premii i kwocie tej premii';

CREATE TABLE pensje(
    id_pensji numeric primary key,
    stanowisko varchar(50),
    kwota float NOT NULL
);
COMMENT ON TABLE pensje IS 'Tabela pensje przechowuje informacje o kwocie pensji na danym stanowisku';

CREATE TABLE wynagrodzenie(
    id_wynagrodzenia numeric primary key,
    data date NOT NULL,
    id_pracownika numeric,
    id_godziny numeric,
    id_pensji numeric,
    id_premii numeric
);
COMMENT ON TABLE wynagrodzenie IS 'Tabela posiada informacje o dacie wynagrodzenia dla poszczegolnego pracownika biorac pod uwage premie, pensje oraz godziny pracy';

ALTER TABLE godziny ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_godziny) REFERENCES godziny(id_godziny);
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_pensji) REFERENCES pensje(id_pensji);
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);

INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (0,'Paweł', 'Kot', 'Liściasta 12 Poznań', 675645646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (1,'Maria', 'Słowik', 'Kolorowa 2 Kraków', 612459646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (2,'Janusz', 'Palik', 'Promienna 9/1 Zielona Góra', 615445646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (3,'Grażyna', 'Cebula', 'Sekretna 36 Poznań', 965645646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (4,'Mieszko', 'Pierwszy', 'Słoneczna 84 Gdańsk', 201645646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (5,'Anita', 'Kowalska', 'Krótka 5 Warszawa', 615645646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (6,'Aleksander', 'Dzięcioł', 'Liściasta 12 Tarnowskie Góry', 696445646);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (7,'Miłosz', 'Warchoł', 'Długa 8 Zabrze', 615645146);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (8,'Max', 'Idzior', 'Leśna 1 Warszawa', 615646389);
INSERT INTO pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES (9,'Olena', 'Barszcz', 'Spadzista 45 Warszawa', 885645646);

UPDATE pracownicy SET nazwisko = 'Ryndak' WHERE id_pracownika = 5;
UPDATE pracownicy SET telefon = '(+48) 612459646' WHERE id_pracownika = 1;

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

INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (0, 'Data Analyst', 4000);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (1, 'Frontend Developer', 5000);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (3, 'Data Engineer', 8000);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (2, 'Junior Python Developer', 4400);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (4, 'Backend Developer', 3800);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (5, 'Data Analyst', 4000);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (6, 'Senior Java Developer', 4000);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (7, 'Mid C++ Developer', 4000);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (8, 'Junior Full Stack Developer', 4000);
INSERT INTO pensje(id_pensji, stanowisko, kwota) VALUES (9, 'Analyst', 4000);

UPDATE pensje SET kwota = 2000 WHERE id_pensji = 8;
UPDATE pensje SET kwota = 1000 WHERE id_pensji = 9;
UPDATE pensje SET kwota = 3000 WHERE id_pensji = 0;
UPDATE pensje SET stanowisko = 'Senior Java Developer' WHERE id_pensji = 4;

INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (0,'2021-01-18',1,6,9,0);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (1,'2021-03-10',1,2,1,1);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (2,'2021-05-10',2,4,5,2);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (3,'2021-02-01',3,7,7,3);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (4,'2021-04-01',6,3,6,4);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (5,'2021-02-10',5,8,3,5);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (6,'2021-07-18',6,9,8,6);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (7,'2021-08-05',7,5,0,7);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (8,'2021-01-02',8,0,2,8);
INSERT INTO wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES (9,'2021-10-10',9,1,4,9);

select * from pracownicy;

ALTER TABLE pracownicy ALTER COLUMN telefon TYPE VARCHAR(30);
--ZAD1
UPDATE pracownicy SET telefon = CONCAT('(+48) ', telefon);
-------

UPDATE pracownicy
SET telefon = RIGHT(telefon, LENGTH(telefon)-1)
WHERE telefon LIKE '(+48)+48%';


--ZAD2
UPDATE pracownicy
SET telefon = concat(substring(telefon,1,9),'-',substring(telefon,10,3),'-',substring(telefon, 13, length(telefon)));
-------

--ZAD3
SELECT id_pracownika,UPPER(imie) AS imie,UPPER(nazwisko) AS nazwisko, telefon FROM pracownicy
WHERE LENGTH(nazwisko) = (SELECT MAX(LENGTH(nazwisko)) FROM pracownicy);
-----

--ZAD4
SELECT md5(p1.imie) as imie, md5(p1.nazwisko) as nazwisko, md5(CAST(p2.kwota AS varchar)) AS kwota FROM pracownicy p1
JOIN wynagrodzenie w on p1.id_pracownika = w.id_pracownika
JOIN pensje p2 on w.id_pensji = p2.id_pensji;
-----------

--ZAD5
SELECT * FROM pracownicy p1
LEFT JOIN wynagrodzenie w on p1.id_pracownika = w.id_pracownika
LEFT JOIN premie p2 on p2.id_premii =w.id_premii
LEFT JOIN pensje p3 on p3.id_pensji = w.id_pensji;
-----

--ZAD6

SELECT CONCAT('Pracownik ', imie, ' ', nazwisko,  ', w dniu ', data, ' otrzymał pensję całkowitą na kwotę ', kwota_calkowita, ' zł, gdzie
wynagrodzenie zasadnicze wynosiło: ', wynagrodzenie_zasadnicze ,' zł, premia: ', kwota_premii ,' zł, nadgodziny: ', kwota_nadgodzin ,' zł') as raport
FROM (
SELECT imie,
       nazwisko,
       w.data,
       p2.kwota as kwota_premii,
       p.kwota as wynagrodzenie_zasadnicze,
       GREATEST(g.liczba_godzin - 160,0)*(p.kwota/160) as kwota_nadgodzin,
       (p2.kwota + p.kwota + GREATEST(g.liczba_godzin - 160,0)*(p.kwota/160)) as kwota_calkowita
FROM wynagrodzenie AS w
LEFT JOIN godziny g on w.id_godziny = g.id_godziny
LEFT JOIN pensje p on w.id_pensji = p.id_pensji
LEFT JOIN premie p2 on w.id_premii = p2.id_premii
LEFT JOIN pracownicy p3 on g.id_pracownika = p3.id_pracownika
    where imie = ?) as tmp;
