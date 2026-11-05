# Tringo Android

Android projekat koristi odobreni **Tringo Mobile Redesign v9** kao stvarni HTML interfejs u `app/src/main/assets/Tringo.html`.

## Šta je pripremljeno

- v9 interfejs je postavljen kao aktivni Android asset; vizuelni raspored nije redizajniran.
- Ručna pretraga koristi jedinstveni `tringoRunManualSearch` put za dugme Pošalji, Enter i Android tastaturu.
- `MainActivity` primjenjuje Android system-bar i display-cutout insets na WebView, tako da sadržaj ne bude ispod statusne i navigacijske trake.
- Podešen je `adjustResize` za prikaz tastature.
- Android verzija ostaje `V 1.0.1`, a interni `versionCode` je podignut na `30`.
- GitHub Actions workflow više ne pokreće zastarjeli `apply-mobile-design-build28.py`; gradi APK iz aktivnih projektnih fajlova.

## Izrada APK-a

U GitHub repozitoriju otvoriti **Actions → Build Tringo Android APK → Run workflow**. Workflow instalira JDK 17, Android SDK i Gradle 8.9, zatim pokreće `assembleDebug` i objavljuje APK kao artefakt `Tringo-Android-APK-V1.0.1-Build30`.

Projekat trenutno nema Gradle Wrapper (`gradlew`, `gradlew.bat`, `gradle/wrapper/gradle-wrapper.jar`). CI zato koristi instalirani Gradle 8.9. Wrapper nije ručno izmišljen niti je lažni JAR dodat.

## Važna napomena o testiranju

HTML JavaScript je provjeren Node.js sintaksnom provjerom, a CI workflow sadrži provjere v9 ručne pretrage i Android safe-area integracije. APK nije lokalno izgrađen niti testiran na Samsung Galaxy A16 u ovom okruženju; to treba uraditi nakon uspješnog GitHub Actions builda i instalacije na uređaj.
