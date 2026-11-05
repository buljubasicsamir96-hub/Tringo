TRINGO ANDROID BUILD 28 – RESTORE + BUILD PATCH

Ovaj paket vraća app/src/main/assets/Tringo.html iz provjerenog Build 27 APK-a (2,371,876 bajtova), jer je istoimeni fajl u GitHub repozitoriju trenutno prazan.

Upute:
1. Raspakujte sadržaj u korijenski folder repozitorija Tringo (spojiti foldere, ne brisati postojeće fajlove).
2. Ostavite postojeći scripts/apply-mobile-design-build27.py netaknutim.
3. Commit i Push na main.
4. GitHub Actions pokreće android-apk.yml, primjenjuje Build 27 osnovni dizajn, zatim Build 28 safe-area/landscape dorade i postavlja versionCode 28.
5. APK artifact naziv: Tringo-Android-APK-V1.0.1-Build28.

Napomena: workflow zahtijeva da u repozitoriju postoje Android Gradle fajlovi i Build27 skripta.
