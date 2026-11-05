# Tringo Android — Build 32 (Chat layout correction)

Ovaj build ispravlja prikaz koji se vidi na dostavljenoj slici.

## Dijagnoza
- APK/snimak je prikazivao stariji HTML (zaglavlje `TringServisBOT`, sedam stavki donje navigacije).
- Odobreni Tringo Mobile Redesign v9 ima zaglavlje `Tringo` i pet stavki: Chat, Historija, O aplikaciji, Ažuriranje i Izgled.
- U ZIP-u dostavljenom uz prijavu `MainActivity.java` nije imao `WindowInsets` obradu, pa prethodni safe-area patch nije bio u aktivnom projektu.

## Build 32
- Aktivni `app/src/main/assets/Tringo.html` zamijenjen je odobrenim `Tringo_Mobile_Redesign_v9.html`.
- Vraćena je tačno odobrena navigacija sa pet stavki i mobilni raspored v9.
- Ugrađena je Android `WindowInsetsCompat` obrada za statusnu traku, navigacijsku traku, display cutout i tastaturu.
- CSS `env(safe-area-inset-*)` vrijednosti su postavljene na nulu jer native sloj već rezerviše siguran prostor; time se sprečava dvostruko pomjeranje.
- Dodana su ograničenja širine i prelamanja teksta kako chat/hero sadržaj ne bi izlazio iz viewporta.
- Sačuvana je javna verzija `V 1.0.1`; interni `versionCode` je 27.

## Izgradnja i test
Pokrenuti GitHub Actions workflow `Build Tringo Android APK`. Ovaj izvorni paket nije APK i nije fizički testiran na Samsung Galaxy A16.
