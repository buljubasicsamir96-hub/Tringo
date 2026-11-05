TRINGO ANDROID — BUILD 31
Ispravka Android system-bar safe area.

- MainActivity koristi edge-to-edge + WindowInsetsCompat.
- WebView je unutar sigurnog prostora: statusna traka, navigacijska traka i display cutout.
- Donji inset prati veću vrijednost između sistemske navigacije i IME tastature.
- Usklađeno je ponašanje resize tastature.
- HTML zadržava postojeći dizajn; dodana su samo pravila za visinu i donji meni da se inset ne računa dvaput.
- Uklonjen je zastarjeli Build28 korak iz GitHub Actions workflowa.
- Android versionCode: 26; versionName: 1.0.1.

Ovo je izvorni projekat, ne APK. APK se mora izgraditi kroz GitHub Actions ili Android Studio i zatim testirati na fizičkom uređaju.
