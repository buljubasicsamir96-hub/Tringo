TRINGO ZA ANDROID — PROJEKT ZA ANDROID STUDIO
Javna verzija: V 1.0.1 | Interna oznaka: Build 24

Ovaj projekat omotava postojeći Tringo.html u Android aplikaciju preko Android WebView-a. Zadržava postojeći HTML interfejs i ugrađenu bazu/logiku pretrage; ne radi se o ponovnom pisanju pretrage.

ZA IZRADU APK-a:
1. Instalirati Android Studio i Android SDK Platform 35.
2. Otvoriti ovu mapu kao postojeći Android Studio projekat.
3. Sačekati Gradle Sync.
4. Izabrati Build > Build Bundle(s) / APK(s) > Build APK(s).
5. Debug APK će biti u app/build/outputs/apk/debug/app-debug.apk.

TEHNIČKI:
- applicationId: ba.tring.tringo
- minSdk 23 (Android 6.0+)
- targetSdk 35
- versionCode 24 / versionName 1.0.1
- Originalna Tringo ikona iz dostavljenog Windows paketa.
- JavaScript i localStorage omogućeni radi postojeće aplikacije i historije.
- Internet dozvola za postojeće online funkcije.
- Lokacija se traži od Androida samo ako je zatraži sama web aplikacija.
- Vanjski HTTP/HTTPS linkovi otvaraju se u pregledniku.

NAPOMENA O APK-u:
U ovom radnom okruženju nije instaliran Android SDK, Android build-tools ni Gradle, pa nije moguće odgovorno napraviti i provjeriti APK ovdje. Ovo je kompletan Android Studio izvorni projekat, a ne lažno preimenovan Windows EXE ili HTML fajl.
