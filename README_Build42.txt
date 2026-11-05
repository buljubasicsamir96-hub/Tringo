TRINGO BUILD42 — GITHUB ACTIONS PATCH

Sadržaj:
- app/src/main/assets/Tringo.html — potvrđeni Build42 HTML
- app/build.gradle — versionName 1.0.1, versionCode 28
- .github/workflows/android-apk.yml — Build42 provjere i izrada APK-a

Primjena:
1. Raspakujte ovaj ZIP u korijenski folder repozitorija buljubasicsamir96-hub/Tringo.
2. Dozvolite prepisivanje navedenih putanja.
3. Provjerite da postoji app/src/main/java/ba/tring/tringo/MainActivity.java.
   Postojeća MainActivity.java u repozitoriju već obrađuje status bar,
   navigation bar, display cutout i IME WindowInsets.
4. Commit/push na main ili ručno pokrenite GitHub Actions workflow
   "Build Tringo Android APK".
5. Preuzmite artifact "Tringo-Android-APK-V1.0.1-Build42".

Napomena:
Ovaj paket nije APK. APK nastaje tek nakon uspješnog GitHub Actions builda.
Fizičko testiranje na Samsung Galaxy A16 i dalje je potrebno.
