Tringo Android — Build 33 Safe Area Fix

Ovaj patch mijenja isključivo Android omotač (MainActivity.java) kako bi
statusna traka telefona (vrijeme, Wi-Fi, baterija) ostala iznad zaglavlja
aplikacije, a donja sistemska navigacija ispod Tringo donjeg menija.

- Primjenjuju se stvarni Android WindowInsets za statusnu i navigacijsku traku.
- WebView dobija samo raspoloživi prostor između sistemskih traka.
- Pri otvaranju tastature rezerviše se odgovarajući IME prostor.
- HTML/CSS, logotip, maskota, sadržaj, pretraga, baza i raspored Tringa
  nisu mijenjani.

Izmjena nije potvrđena fizičkim testom na Samsung Galaxy A16. Nakon builda
potrebno je instalirati APK i provjeriti gornju i donju sistemsku zonu.
