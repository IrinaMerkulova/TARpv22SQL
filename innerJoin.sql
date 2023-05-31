--inner join

create table tootaja(
tootajaID int primary key identity (1,1),
eesnimi varchar(25),
perenimi varchar(30),
ametId int);
create table amet(
ametId int primary key identity (1,1),
ametNimetus varchar(30) Unique);

--kasutame zfgasfsf
Alter table tootaja
add foreign key (ametId) 
REFERENCES amet(ametId)

--afdfgdgdfgsgffdfg

Select * From tootaja inner join amet
ON tootaja.ametId=amet.ametId
--kasutame tabeli alias-nimed
Select * From tootaja  t
inner join amet a
ON tootaja.ametId=amet.ametId;

--tingimuse lisamine

Select t.eesnimi, t.perenimi,ametNimetus From tootaja  t
inner join amet a
ON tootaja.ametId=amet.ametId
where t.eesnimi LIKE 'L%';

--1 left outer join -sisaldab tulemus kõiki põhitabeli kirjed

--2 koostan tabeli
Create table Kursus(
kursusId int primary key identity (1,1),
kursuseNimetus varchar(25),
tootajaId int,
foreign key (tootajaId) references tootaja (tootajaId),
kestvus date);

-- 3 tabeli select
select t.eesnimi ,a.ametNimetus,K.kursuseNimetus from tootaja t join amet a
on t.ametId = a.ametId
join Kursus k on t.tootajaId = k.tootajaId;
