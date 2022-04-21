CREATE SCHEMA ksiegowosc;

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
    kwota float NOT NULL ,
    id_premii numeric
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
ALTER TABLE pensje ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_godziny) REFERENCES godziny(id_godziny);
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_pensji) REFERENCES pensje(id_pensji);
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);


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

UPDATE pracownicy SET nazwisko = 'Ryndak' WHERE id_pracownika = 5;

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

UPDATE pensje SET kwota = 2000 WHERE id_pensji = 8;
UPDATE pensje SET kwota = 1000 WHERE id_pensji = 9;
UPDATE pensje SET kwota = 3000 WHERE id_pensji = 0;
UPDATE pensje SET id_premii = NULL WHERE id_pensji = 4;
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

/*a*/
SELECT id_pracownika, nazwisko FROM pracownicy;

/*b*/
SELECT id_pracownika, kwota FROM pracownicy,pensje
WHERE kwota > 1000;

/*c*/
SELECT * FROM wynagrodzenie JOIN pracownicy p on wynagrodzenie.id_pracownika = p.id_pracownika
JOIN pensje p2 on wynagrodzenie.id_pensji = p2.id_pensji
WHERE p2.kwota > 1000 AND p2.id_premii IS NULL;

/*d*/
SELECT * FROM pracownicy
WHERE imie LIKE 'J%';

/*e*/
SELECT * FROM pracownicy
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

/*f*/
SELECT imie, nazwisko, liczba_nadgodzin FROM (
                  SELECT p.id_pracownika,
                         p.imie,
                         p.nazwisko,
                         sum(g.liczba_godzin) - 160 as liczba_nadgodzin,
                         EXTRACT(MONTH FROM g.data) as month,
                         EXTRACT(YEAR FROM g.data)  as year
                  FROM pracownicy p
                           JOIN godziny g ON p.id_pracownika = g.id_pracownika
                  GROUP BY year, month, p.id_pracownika
              ) as t
WHERE t.liczba_nadgodzin > 0;


/*g*/
SELECT p.imie, p.nazwisko, p2.kwota FROM wynagrodzenie w JOIN pracownicy p on w.id_pracownika = p.id_pracownika
JOIN pensje p2 on w.id_pensji = p2.id_pensji
WHERE kwota BETWEEN 1500 AND 3000;

/*h*/
SELECT t.id_pracownika, t.month, t.year FROM (
                  SELECT p.id_pracownika,
                         p.imie,
                         p.nazwisko,
                         sum(g.liczba_godzin) - 160 as liczba_nadgodzin,
                         EXTRACT(MONTH FROM g.data) as month,
                         EXTRACT(YEAR FROM g.data)  as year
                  FROM pracownicy p
                           JOIN godziny g ON p.id_pracownika = g.id_pracownika
                  GROUP BY year, month, p.id_pracownika
              ) as t
JOIN wynagrodzenie w ON w.id_pracownika = t.id_pracownika AND EXTRACT(MONTH FROM w.data) = t.month AND EXTRACT(YEAR FROM w.data) = t.year
WHERE t.liczba_nadgodzin > 0 AND w.id_premii IS NULL;


/*i*/
SELECT p.imie, p.nazwisko, p2.kwota FROM wynagrodzenie JOIN pracownicy p on wynagrodzenie.id_pracownika = p.id_pracownika
JOIN pensje p2 on wynagrodzenie.id_pensji = p2.id_pensji
ORDER BY p2.kwota;

/*j*/
SELECT p.imie, p.nazwisko, p2.kwota, p3.kwota FROM wynagrodzenie JOIN pracownicy p on wynagrodzenie.id_pracownika = p.id_pracownika
JOIN pensje p2 on wynagrodzenie.id_pensji = p2.id_pensji
JOIN premie p3 on p2.id_premii = p3.id_premii
ORDER BY p3.kwota DESC , p2.kwota DESC;

/*k*/
SELECT t.stanowiska, count(*) FROM
       (
           SELECT string_agg(p.stanowisko, ', ') AS stanowiska, p2.id_pracownika
           FROM pensje p
                    JOIN wynagrodzenie w ON p.id_pensji = w.id_pensji
                    JOIN pracownicy p2 ON w.id_pracownika = p2.id_pracownika
           GROUP BY p2.id_pracownika
) AS t
GROUP BY t.stanowiska;

/*l*/
SELECT AVG(kwota), MIN(kwota), MAX(kwota)FROM pensje
WHERE stanowisko LIKE '%Developer%';

/*m*/
SELECT sum(t.sum) FROM
    (
    SELECT SUM(p.kwota + p2.kwota) FROM wynagrodzenie w JOIN pensje p on w.id_pensji = p.id_pensji
JOIN premie p2 ON w.id_premii = p2.id_premii
GROUP BY id_wynagrodzenia
    ) AS t;

/*f2*/
 SELECT SUM(p.kwota + p2.kwota), p.stanowisko FROM wynagrodzenie w JOIN pensje p on w.id_pensji = p.id_pensji
    JOIN premie p2 ON w.id_premii = p2.id_premii
    GROUP BY p.stanowisko ;

/*g2*/

SELECT count(*), p2.stanowisko FROM premie p JOIN pensje p2 ON p.id_premii = p2.id_premii
GROUP BY p2.stanowisko;

/*h2*/

-- DELETE FROM pracownicy p
--         JOIN wynagrodzenie w on w.id_pracownika = p.id_pracownika
--         JOIN pensje p1 ON p1.id_pensji = w.id_pensji
--
-- WHERE p1.kwota < 1200);
--
-- DELETE FROM pracownicy WHERE id_pracownika IN (SELECT p.id_pracownika FROM pracownicy p
--         JOIN wynagrodzenie w on w.id_pracownika = p.id_pracownika
--         JOIN pensje p1 ON p1.id_pensji = w.id_pensji
--         JOIN godziny g on w.id_godziny = g.id_godziny
-- WHERE p1.kwota < 1200);
--
-- DELETE FROM pracownicy AS pra
-- USING wynagrodzenie AS wyn, pensje AS pen, godziny as god
-- WHERE pra.id_pracownika = wyn.id_pracownika
--     AND wyn.id_pensji = pen.id_pensji
--     AND god.id_pracownika = pra.id_pracownika
--     AND pen.kwota < 1500;
--
--
-- DELETE FROM godziny where id_pracownika in ( select * from (
-- DELETE FROM wynagrodzenie where id_pracownika in (
--     SELECT p.id_pracownika FROM pracownicy p
--         JOIN wynagrodzenie w on w.id_pracownika = p.id_pracownika
--         JOIN pensje p1 ON p1.id_pensji = w.id_pensji
--         JOIN godziny g on w.id_godziny = g.id_godziny
--     WHERE p1.kwota < 1200
--     )
-- returning id_pracownika
-- ));

/*h2 final solution */
ALTER TABLE godziny DROP CONSTRAINT godziny_id_pracownika_fkey;
ALTER TABLE godziny ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika) ON DELETE CASCADE;

ALTER TABLE wynagrodzenie DROP CONSTRAINT wynagrodzenie_id_pracownika_fkey;
ALTER TABLE wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika) ON DELETE CASCADE;

DELETE FROM pracownicy WHERE id_pracownika IN (
    SELECT p.id_pracownika FROM pracownicy p
        JOIN wynagrodzenie w on w.id_pracownika = p.id_pracownika
        JOIN pensje p1 ON p1.id_pensji = w.id_pensji
    WHERE p1.kwota < 1200
);

select * from pracownicy;