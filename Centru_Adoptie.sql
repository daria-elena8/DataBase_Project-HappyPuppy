CREATE SEQUENCE seq_fisa_ac START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_centru START WITH 100 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_animal_companie START WITH 1400 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_client START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_programare_vizita START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_tur START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_donatie START WITH 400 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_contract_adoptie START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_angajat START WITH 250 INCREMENT BY 1 NOCACHE NOCYCLE;


CREATE TABLE FISA_AC( 
    id_fisa INT PRIMARY KEY, 
    specie VARCHAR2(50), 
    rasa VARCHAR2(100), 
    sex CHAR(1)
);

CREATE TABLE CARNET_MEDICAL( 
    id_fisa INT PRIMARY KEY, 
    varsta INT, 
    vaccin VARCHAR2(500), 
    sterilizat CHAR(2) CHECK (sterilizat IN ('DA', 'NU')), 
    deparazitat CHAR(2) CHECK (deparazitat IN ('DA', 'NU')), 
    mentiuni VARCHAR2(500),
    FOREIGN KEY(id_fisa) REFERENCES FISA_AC(id_fisa) ON DELETE CASCADE 
);


CREATE TABLE CENTRU(
    id_centru INT PRIMARY KEY,
    adresa VARCHAR2(200),
    nr_tel VARCHAR2(20),
    program VARCHAR2(200),
    nr_animale_companie INT
);

CREATE TABLE ANIMAL_COMPANIE(
    id_pet INT PRIMARY KEY,
    id_centru INT,
    id_fisa INT,
    data_preluare DATE,
    FOREIGN KEY (id_centru) REFERENCES CENTRU(id_centru),
    FOREIGN KEY (id_fisa) REFERENCES FISA_AC(id_fisa) ON DELETE CASCADE
);

CREATE TABLE CLIENT(
    id_client INT PRIMARY KEY,
    nume VARCHAR2(20),
    prenume VARCHAR2(50),
    telefon VARCHAR2(20),
    adresa VARCHAR2(200),
    email VARCHAR2(50)
);

CREATE TABLE TUR(
    id_tur INT PRIMARY KEY,
    id_centru INT,
    detalii VARCHAR2(50),
    FOREIGN KEY (id_centru) REFERENCES CENTRU(id_centru)
);

CREATE TABLE PROGRAMARE_VIZITA(
    id_prog INT PRIMARY KEY,
    id_client INT,
    id_tur INT,
    nr_pers INT,
    data_prog DATE,
    interval_orar CHAR(1) CHECK (interval_orar IN ('1', '2')),
    FOREIGN KEY (id_client) REFERENCES CLIENT(id_client),
    FOREIGN KEY (id_tur) REFERENCES TUR(id_tur)

);


CREATE TABLE DONATIE(
    id_donatie INT PRIMARY KEY,
    id_centru INT,
    id_client INT,
    data_donatie DATE,
    suma INT,
    FOREIGN KEY(id_centru) REFERENCES CENTRU(id_centru),
    FOREIGN KEY(id_client) REFERENCES CLIENT(id_client)
);

CREATE TABLE CONTRACT_ADOPTIE(
    id_contract INT PRIMARY KEY,
    id_pet INT,
    id_client INT,
    data_adoptie DATE,
    FOREIGN KEY (id_pet) REFERENCES ANIMAL_COMPANIE(id_pet),
    FOREIGN KEY (id_client) REFERENCES CLIENT(id_client)
);

CREATE TABLE ANGAJAT(
    id_angajat INT PRIMARY KEY,
    id_centru INT,
    nume VARCHAR2(20),
    prenume VARCHAR2(50),
    telefon VARCHAR2(20),
    data_angajare DATE,
    ore_saptamana INT,
    salariu INT,
    FOREIGN KEY (id_centru) REFERENCES CENTRU(id_centru)
);

INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Caine', 'Labrador', 'M');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Pisica', 'Siameza', 'F');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Caine', 'Beagle', 'M');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Pisica', 'Persana', 'F');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Caine', 'Bulldog', 'M');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Pisica', 'Maine Coon', 'F');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Caine', 'Golden Retriever', 'M');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Pisica', 'Bengaleza', 'F');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Caine', 'Micut', 'F');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Pisica', 'Siameza', 'M');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Caine', 'Labrador', 'F');
INSERT INTO FISA_AC (id_fisa, specie, rasa, sex) VALUES (seq_fisa_ac.NEXTVAL, 'Pisica', 'Persana', 'M');

INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (1 , 2, 'Rabie', 'DA', 'NU', 'None');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (2 , 3, 'Parvo', 'NU', 'DA', 'Checkup needed');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (3 , 1, 'Distemper', 'DA', 'DA', 'Healthy');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (4 , 4, 'Leptospirosis', 'NU', 'NU', 'Needs vaccination');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (5 , 2, 'Bordetella', 'DA', 'DA', 'None');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (6 , 3, 'Rabie', 'NU', 'NU', 'Slightly underweight');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (7 , 1, 'Parvo', 'DA', 'DA', 'Recovered from illness');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (8 , 4, 'Distemper', 'DA', 'NU', 'None');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (9 , 1, 'Distemper', 'DA', 'NU', 'Healthy');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (10 , 2, 'Leptospirosis', 'NU', 'NU', 'Needs vaccination');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (11 , 2, 'Bordetella', 'NU', 'DA', 'None');
INSERT INTO CARNET_MEDICAL (id_fisa, varsta, vaccin, sterilizat, deparazitat, mentiuni) VALUES (12 , 5, 'Rabie', 'NU', 'NU', 'None');

INSERT INTO CENTRU (id_centru, adresa, nr_tel, program, nr_animale_companie) VALUES (seq_centru.NEXTVAL, 'Strada Florilor, Nr. 5', '0712345678', 'Luni-Vineri 9-17', 0);
INSERT INTO CENTRU (id_centru, adresa, nr_tel, program, nr_animale_companie) VALUES (seq_centru.NEXTVAL, 'Strada Marilor, Nr. 8', '0722345678', 'Luni-Vineri 9-18', 0);
INSERT INTO CENTRU (id_centru, adresa, nr_tel, program, nr_animale_companie) VALUES (seq_centru.NEXTVAL, 'Strada Trandafirilor, Nr. 10', '0732345678', 'Luni-Vineri 8-16', 0);
INSERT INTO CENTRU (id_centru, adresa, nr_tel, program, nr_animale_companie) VALUES (seq_centru.NEXTVAL, 'Strada Lalelelor, Nr. 12', '0742345678', 'Luni-Vineri 10-18', 0);
INSERT INTO CENTRU (id_centru, adresa, nr_tel, program, nr_animale_companie) VALUES (seq_centru.NEXTVAL, 'Strada Violetei, Nr. 15', '0752345678', 'Luni-Vineri 9-17', 0);
INSERT INTO CENTRU (id_centru, adresa, nr_tel, program, nr_animale_companie) VALUES (seq_centru.NEXTVAL, 'Strada Zambilei, Nr. 20', '0762345678', 'Luni-Vineri 8-15', 0);

INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 100, 1, DATE '2023-01-01');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 101, 2, DATE '2023-02-15');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 100, 3, DATE '2023-03-10');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 103, 4, DATE '2023-04-20');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 104, 5, DATE '2023-05-05');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 100, 6, DATE '2023-06-18');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 105, 7, DATE '2023-07-22');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 100, 8, DATE '2023-08-30');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 102, 9, DATE '2023-05-05');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 103, 10, DATE '2023-06-18');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 104, 11, DATE '2023-07-22');
INSERT INTO ANIMAL_COMPANIE (id_pet, id_centru, id_fisa, data_preluare) VALUES (seq_animal_companie.NEXTVAL, 101, 12, DATE '2023-08-30');

UPDATE CENTRU c
SET c.nr_animale_companie = (
    SELECT COUNT(*)
    FROM ANIMAL_COMPANIE ac
    WHERE ac.id_centru = c.id_centru
);

INSERT INTO CLIENT (id_client, nume, prenume, telefon, adresa, email) VALUES (seq_client.NEXTVAL, 'Popescu', 'Ion', '0799123456', 'Strada Verde, Nr. 10', 'ion.popescu@example.com');
INSERT INTO CLIENT (id_client, nume, prenume, telefon, adresa, email) VALUES (seq_client.NEXTVAL, 'Ionescu', 'Maria', '0799234567', 'Strada Alba, Nr. 12', 'maria.ionescu@example.com');
INSERT INTO CLIENT (id_client, nume, prenume, telefon, adresa, email) VALUES (seq_client.NEXTVAL, 'Georgescu', 'Ana', '0799345678', 'Strada Rosu, Nr. 15', 'ana.georgescu@example.com');
INSERT INTO CLIENT (id_client, nume, prenume, telefon, adresa, email) VALUES (seq_client.NEXTVAL, 'Vasilescu', 'Andrei', '0799456789', 'Strada Galbena, Nr. 18', 'andrei.vasilescu@example.com');
INSERT INTO CLIENT (id_client, nume, prenume, telefon, adresa, email) VALUES (seq_client.NEXTVAL, 'Dumitrescu', 'Elena', '0799567890', 'Strada Alba, Nr. 4' ,'elena.dumitrescu@example.com');
INSERT INTO CLIENT (id_client, nume, prenume, telefon, adresa, email) VALUES (seq_client.NEXTVAL, 'Marinescu', 'Cristina', '0799678901', 'Strada Albastra, Nr. 25', 'cristina.marinescu@example.com');
INSERT INTO CLIENT (id_client, nume, prenume, telefon, adresa, email) VALUES (seq_client.NEXTVAL, 'Stoicescu', 'Dan', '0799789012', 'Strada Mov, Nr. 30', 'dan.stoicescu@example.com');
INSERT INTO CLIENT (id_client, nume, prenume, telefon, adresa, email) VALUES (seq_client.NEXTVAL, 'Nica', 'Gabriela', '0799890123', 'Strada Roz, Nr. 35', 'gabriela.nica@example.com');

INSERT INTO TUR (id_tur, id_centru) VALUES (seq_tur.NEXTVAL, 100);
INSERT INTO TUR (id_tur, id_centru, detalii) VALUES (seq_tur.NEXTVAL, 101, 'Detalii');
INSERT INTO TUR (id_tur, id_centru) VALUES (seq_tur.NEXTVAL, 102);
INSERT INTO TUR (id_tur, id_centru, detalii) VALUES (seq_tur.NEXTVAL, 103, 'Joaca');
INSERT INTO TUR (id_tur, id_centru) VALUES (seq_tur.NEXTVAL, 104);
INSERT INTO TUR (id_tur, id_centru) VALUES (seq_tur.NEXTVAL, 105);
INSERT INTO TUR (id_tur, id_centru, detalii) VALUES (seq_tur.NEXTVAL, 102, 'Vizualizare');
INSERT INTO TUR (id_tur, id_centru) VALUES (seq_tur.NEXTVAL, 100);

INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 1, 1, 2, DATE '2023-01-05', '1');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 2, 1, 3, DATE '2023-02-20', '2');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 3, 4, 1, DATE '2023-03-15', '1');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 4, 5, 4, DATE '2023-04-25', '2');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 5, 6, 2, DATE '2023-05-10', '1');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 6, 7, 1, DATE '2023-06-20', '2');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 7, 2, 3, DATE '2023-07-25', '1');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 8, 1, 2, DATE '2022-02-15', '1');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 4, 1, 3, DATE '2023-08-05', '2');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 3, 8, 2, DATE '2023-02-21', '2');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 2, 3, 5, DATE '2023-03-11', '1');
INSERT INTO PROGRAMARE_VIZITA (id_prog, id_client, id_tur, nr_pers, data_prog, interval_orar) VALUES (seq_programare_vizita.NEXTVAL, 6, 2, 1, DATE '2023-11-05', '2');

INSERT INTO DONATIE (id_donatie, id_centru, id_client, data_donatie, suma) VALUES (seq_donatie.NEXTVAL, 100, 1, DATE '2023-01-10', 500);
INSERT INTO DONATIE (id_donatie, id_centru, id_client, data_donatie, suma) VALUES (seq_donatie.NEXTVAL, 101, 2, DATE '2023-02-25', 300);
INSERT INTO DONATIE (id_donatie, id_centru, id_client, data_donatie, suma) VALUES (seq_donatie.NEXTVAL, 102, 3, DATE '2023-03-20', 200);
INSERT INTO DONATIE (id_donatie, id_centru, id_client, data_donatie, suma) VALUES (seq_donatie.NEXTVAL, 100, 4, DATE '2023-04-30', 400);
INSERT INTO DONATIE (id_donatie, id_centru, id_client, data_donatie, suma) VALUES (seq_donatie.NEXTVAL, 104, 5, DATE '2023-05-15', 150);
INSERT INTO DONATIE (id_donatie, id_centru, id_client, data_donatie, suma) VALUES (seq_donatie.NEXTVAL, 100, 6, DATE '2023-06-25', 350);
INSERT INTO DONATIE (id_donatie, id_centru, id_client, data_donatie, suma) VALUES (seq_donatie.NEXTVAL, 104, 5, DATE '2022-03-08', 100);

INSERT INTO CONTRACT_ADOPTIE (id_contract, id_pet, id_client, data_adoptie) VALUES (seq_contract_adoptie.NEXTVAL, 1400, 1, DATE '2023-01-15');
INSERT INTO CONTRACT_ADOPTIE (id_contract, id_pet, id_client, data_adoptie) VALUES (seq_contract_adoptie.NEXTVAL, 1402, 2, DATE '2023-02-28');
INSERT INTO CONTRACT_ADOPTIE (id_contract, id_pet, id_client, data_adoptie) VALUES (seq_contract_adoptie.NEXTVAL, 1403, 3, DATE '2023-03-25');
INSERT INTO CONTRACT_ADOPTIE (id_contract, id_pet, id_client, data_adoptie) VALUES (seq_contract_adoptie.NEXTVAL, 1404, 4, DATE '2023-04-30');
INSERT INTO CONTRACT_ADOPTIE (id_contract, id_pet, id_client, data_adoptie) VALUES (seq_contract_adoptie.NEXTVAL, 1405, 5, DATE '2023-05-20');

INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 100, 'Popa', 'Cristian', '0711111111', DATE '2022-01-01', 40, 3000);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 101, 'Ionescu', 'Simona', '0722222222', DATE '2022-02-01', 35, 2800);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 102, 'Vasilescu', 'Alexandru', '0733333333', DATE '2022-03-01', 40, 3100);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 103, 'Marin', 'Adriana', '0744444444', DATE '2022-04-01', 30, 2700);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 104, 'Dumitru', 'Stefan', '0755555555', DATE '2022-05-01', 40, 3200);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 105, 'Nistor', 'Larisa', '0766666666', DATE '2022-06-01', 35, 2900);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 100, 'Toma', 'Bogdan', '0777777777', DATE '2022-07-01', 40, 3300);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 102, 'Radu', 'Elena', '0788888888', DATE '2022-08-01', 30, 2600);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 104, 'Petrescu', 'Andreea', '0799999999', DATE '2022-09-01', 38, 2950);
INSERT INTO ANGAJAT (id_angajat, id_centru, nume, prenume, telefon, data_angajare, ore_saptamana, salariu) VALUES (seq_angajat.NEXTVAL, 103, 'Luca', 'George', '0700000000', DATE '2022-10-01', 37, 2850);


-- Selecteaza numele si prenumele clientilor care au facut donatii
-- mai mari de 300 si care au adoptat animale din centrul cu adresa 'Strada Florilor, Nr. 5'
-- (subcereri sincronizate cu cel putin 3 tabele)

SELECT c.id_client, c.nume, c.prenume
FROM CLIENT c
JOIN DONATIE d ON c.id_client = d.id_client
WHERE d.suma >= 300 AND EXISTS (
    SELECT 1
    FROM CONTRACT_ADOPTIE ca 
    JOIN ANIMAL_COMPANIE ac on ca.id_pet = ac.id_pet
    JOIN CENTRU ce on ac.id_centru = ce.id_centru
    WHERE ce.adresa = 'Strada Florilor, Nr. 5'
    AND ca.id_client = c.id_client
);


-- Selecteaza numele, prenumele, numarul de telefon si numarul 
-- de ore/saptamana impreuna cu numarul total de donatii pentru fiecare 
-- angajat care lucreaza in centrele care au cel putin 2 donatii
-- (subcereri nesincronizate in clauza FROM)

SELECT a.nume, a.prenume, a.telefon, a.ore_saptamana, COUNT(d.id_donatie) AS numar_donatii
FROM (
    SELECT c.id_centru
    FROM CENTRU c
    JOIN DONATIE d ON d.id_centru = c.id_centru
    GROUP BY c.id_centru
    HAVING COUNT(d.id_donatie) >= 2
) ce
JOIN ANGAJAT a ON a.id_centru = ce.id_centru
LEFT JOIN DONATIE d ON a.id_centru = d.id_centru
GROUP BY a.nume, a.prenume, a.telefon, a.ore_saptamana;


-- Selectează numele, prenumele, adresa și numărul de telefon al clienților 
-- împreună cu suma persoanelor din toate programările făcute de aceștia,
-- grupati in functie de datele clientilor si verificati
-- pentru fiecare client care daca făcut cel puțin o programare în intervalul 
-- orar '2' și cel puțin o programare pentru centrul cu id_centru = 100.
-- (Grupari de date cu subcereri nesincronizate in clauza 
-- HAVING cu cel putin 3 tabele)

SELECT c.nume, c.prenume, c.adresa, c.telefon, SUM(pv.nr_pers) AS suma_persoanelor
FROM CLIENT c
JOIN PROGRAMARE_VIZITA pv ON c.id_client = pv.id_client
JOIN TUR t ON pv.id_tur = t.id_tur
JOIN CENTRU ce ON t.id_centru = ce.id_centru
WHERE c.id_client IN (
    SELECT DISTINCT pv1.id_client
    FROM PROGRAMARE_VIZITA pv1
    JOIN TUR t1 ON pv1.id_tur = t1.id_tur
    WHERE pv1.interval_orar = '2'
)
AND c.id_client IN (
    SELECT DISTINCT pv2.id_client
    FROM PROGRAMARE_VIZITA pv2
    JOIN TUR t2 ON pv2.id_tur = t2.id_tur
    WHERE t2.id_centru = 100
)
GROUP BY c.nume, c.prenume, c.adresa, c.telefon
HAVING SUM(pv.nr_pers) >= (
    SELECT AVG(pv3.nr_pers)
    FROM PROGRAMARE_VIZITA pv3);


-- Selectează numele clienților, suma totală donată și un status al donației 
-- ('High' dacă suma totală este mai mare de 500, altfel 'Low'), ordonat descrescător 
-- după suma totală donată.
-- ( ordonare, folosirea NVL si DECODE )

SELECT c.nume, c.prenume, NVL(SUM(d.suma), 0) AS suma_totala,
DECODE(SIGN(SUM(d.suma) - 500), 1, 'High', 'Low') AS status_donatie
FROM CLIENT c
LEFT JOIN DONATIE d ON c.id_client = d.id_client
GROUP BY c.nume, c.prenume
ORDER BY suma_totala DESC;

-- Selectează numele centrelor, data ultimei donații, numărul total de animale și 
-- primele 10 caractere ale adresei centrului. Utilizează clauza WITH 
-- pentru a obține datele despre donații și animalele din centru.
-- (functii pe siruri de caractere, date calendaristice, CASE si WITH)

WITH CentruInfo AS (
    SELECT c.id_centru, COUNT(ac.id_pet) AS nr_animale, MAX(d.data_donatie) AS ultima_donatie
    FROM CENTRU c
    LEFT JOIN ANIMAL_COMPANIE ac ON c.id_centru = ac.id_centru
    LEFT JOIN DONATIE d ON c.id_centru = d.id_centru
    GROUP BY c.id_centru
)
SELECT c.adresa, SUBSTR(c.adresa, 1, 10) AS adresa_truncata, ci.nr_animale, 
TO_CHAR(ci.ultima_donatie, 'DD-MON-YYYY') AS data_ultima_donatie,
CASE 
    WHEN ci.nr_animale > 5 THEN 'Multe'
    WHEN ci.nr_animale > 2 THEN 'Mediu'
    ELSE 'Putine'
END AS status_nr_animale
FROM CENTRU c
JOIN CentruInfo ci ON c.id_centru = ci.id_centru;


----------------------------------------------------------------------------
-- Exercitiul 13:

--      1.Setam pentru fiecare centru numarul de animale de companie
-- care au fost inserate in tabelul ANIMAL_COMPANIE
-- Secventa este pusa mai sus pentru functionalitatea proiectului
-- insa il enumar si aici pentru ca se incadreaza in criteriile exercitiului

--UPDATE CENTRU c
--SET c.nr_animale_companie = (
--    SELECT COUNT(*)
--    FROM ANIMAL_COMPANIE ac
--    WHERE ac.id_centru = c.id_centru
--);

--      2. Adaug o noua coloana in tabelul CLIENT care va tine evidenta
-- numarului total de programari pe care le-a facut fiecare client

ALTER TABLE CLIENT ADD total_programari INT;

UPDATE CLIENT c
SET c.total_programari = (
    SELECT COUNT(*)
    FROM PROGRAMARE_VIZITA pv
    WHERE pv.id_client = c.id_client
);


--      3. Sterg toate programarile care au fost facute 
-- Pentru un tur care se tine la centrul cu id 100

DELETE FROM PROGRAMARE_VIZITA
WHERE id_tur IN (
    SELECT id_tur
    FROM TUR
    WHERE id_centru = 100
);

