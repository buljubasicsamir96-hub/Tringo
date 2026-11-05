Tringo Android — Build 34
=========================

Osnova: Build 33 Safe Area Only, uz zadržavanje odobrenog mobilnog v9 izgleda.

Implementirane izmjene:
- Prikazuje se postojeća automatska pozdravna poruka u chat feedu i na mobilnom prikazu.
- Dodan je rezervni JS mehanizam koji prikazuje početni pozdrav ako chat feed bude prazan.
- Originalna maskota dobija jednokratnu animaciju dolaska i kratkog pozdravnog pokreta.
- U mobilnoj pozdravnoj kartici prikazuje se potpis: Kreirao: Samir Buljubašić.
- Postojeći viewport meta tag je već ispravno podešen; zadržan je bez nepotrebnog dupliranja.
- Zadržan je postojeći Android WindowInsets tretman u MainActivity.java za statusnu traku,
  navigacijsku traku, izrez ekrana i tastaturu.
- Android versionCode povećan je na 28 radi instalacije Build 34 preko prethodne verzije;
  javni prikaz verzije ostaje V 1.0.1.

Napomene o provjeri:
- Izvršene su statičke provjere HTML/JS/CSS i Android konfiguracije.
- Fizički test na Samsung Galaxy A16 nije izvršen.
- APK nije potvrđen kao izgrađen u ovom okruženju; GitHub Actions workflow je pripremljen
  za izradu i objavu artefakta Build 34 nakon što se promjene postave u repozitorij.
