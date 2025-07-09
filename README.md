# Bela Blok - Flutter App

Aplikacija za praćenje rezultata igre "Bele" (Belot) razvijena u Flutteru s Drift ORM bazom podataka.

## 📋 Preduvjeti

Prije pokretanja projekta uvjerite se da imate instalirane sljedeće komponente:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (verzija 3.5.4 ili novija)
- [Dart SDK](https://dart.dev/get-dart) (uključen s Flutterom)
- [Android Studio](https://developer.android.com/studio) ili [VS Code](https://code.visualstudio.com/) s Flutter ekstenzijama
- [Git](https://git-scm.com/)

### Provjera instalacije

```bash
flutter doctor
```

## 🚀 Pokretanje projekta

### 1. Kloniranje repozitorija

```bash
git clone [URL_REPOZITORIJA]
cd BelaBlok/src
```

### 2. Instaliranje dependencies

```bash
flutter pub get
```

### 3. Generiranje ORM koda (baza podataka)

Projekt koristi Drift ORM za upravljanje bazom podataka. Potrebno je generirati kod za rad s bazom:

```bash
flutter pub run build_runner build
```

Za kontinuirano gledanje promjena tijekom razvoja:

```bash
flutter pub run build_runner watch
```

Ako dođe do konflikta s već generiranim fajlovima:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Pokretanje aplikacije

#### Android
```bash
flutter run
```

#### iOS
```bash
flutter run
```

#### Web
```bash
flutter run -d chrome
```

#### Windows
```bash
flutter run -d windows
```

## 🗃️ Struktura baze podataka

Aplikacija koristi **Drift ORM** za upravljanje SQLite bazom podataka.

### Tablica: `games`
Pohranjuje osnovne informacije o igrama:
- `id` (Primary Key, AutoIncrement)
- `gameDateTime` - datum i vrijeme stvaranja igre
- `teamOneScore` - ukupni rezultat tima 1
- `teamTwoScore` - ukupni rezultat tima 2
- `gameType` - tip igre (1001, 501, itd.)
- `gameDirection` - smjer igre (enum)
- `currentlyShuffling` - koji igrač trenutno dijeli
- `winner` - pobjednik (enum, nullable)
- `finished` - je li igra završena
- `createdAt`, `updatedAt` - timestamps

### Tablica: `rounds`
Pohranjuje informacije o rundama unutar igre:
- `id` (Primary Key, AutoIncrement)
- `gameId` (Foreign Key → games.id)
- `teamCalled` - koji tim je zvao (enum)
- `teamOneScore` - bodovi tima 1 u ovoj rundi
- `teamTwoScore` - bodovi tima 2 u ovoj rundi
- `teamOneCallAmount` - koliko je tim 1 zvao
- `teamTwoCallAmount` - koliko je tim 2 zvao
- `isTeamOneCallSuccessful` - je li tim 1 uspio poziv
- `isTeamTwoCallSuccessful` - je li tim 2 uspio poziv
- `createdAt` - timestamp

## 🏗️ Arhitektura koda

```
lib/
├── db/                     # Baza podataka
│   ├── entities/          # Definicije tablica (Drift)
│   │   ├── game_table.dart
│   │   └── round_table.dart
│   ├── dao/               # Data Access Objects - metode za pristup podacima
│   │   ├── game_dao.dart
│   │   └── round_dao.dart
│   └── database.dart      # Glavna konfiguracija baze
├── enums/                 # Enumeratori
│   ├── play_direction_enum.dart
│   └── team_enum.dart
├── models/                # Modeli za UI (će biti refaktoriran)
├── services/              # Servisni sloj
│   └── database_service.dart
├── screens/               # UI zasloni
├── routes/                # Navigacija
└── themes/                # Teme aplikacije
```

### Glavne komponente:

- **Entities** - definicije tablica u bazi (koriste Drift anotacije)
- **DAO** (Data Access Objects) - klase s metodama za pristup podacima (CRUD operacije)
- **DatabaseService** - singleton servis koji enkapsulira rad s bazom
- **Models** - UI modeli (bit će refaktorirani da koriste entitete)

## � Rad s Drift ORM-om

### Korištenje DAO klasa

DAO (Data Access Object) klase sadrže metode za rad s bazom. Primjeri korištenja:

```dart
// Dohvat aktivne igre
final activeGame = await DatabaseService().getActiveGame();

// Dohvati sve runde za igru
final rounds = await DatabaseService().getRoundsForGame(gameId);

// Stvaranje nove igre
final newGameId = await DatabaseService().createNewGame(
  gameType: 1001,
  gameDirection: PlayDirection.clockwise,
  currentlyShuffling: 0,
);

// Ažuriranje rezultata
await DatabaseService().updateGameScore(
  gameId: 1,
  teamOneScore: 250,
  teamTwoScore: 320,
);
```

### Drift tipovi podataka

Drift generira nekoliko tipova za svaku tablicu:

- `Game` - predstavlja jedan red iz tablice `games` (klasa s nepromjenjivim poljima)
- `GamesCompanion` - koristi se za INSERT i UPDATE operacije (koristi `Value<T>` za opcionalnost)
- `$GamesTable` - koristi se interno za definicije tablice

### Value klasa

`Value<T>` se koristi u Companion klasama za definiranje koja polja će se ažurirati:

```dart
// Postavljanje vrijednosti:
Value(10) // obavezna vrijednost
Value.absent() // neće biti uključena u upit
const Value.absent() // statički pristup

// Primjer korištenja:
GamesCompanion(
  teamOneScore: Value(150), // ovo će se ažurirati
  teamTwoScore: Value(120), // ovo će se ažurirati
  // ostala polja se neće dirati
)
```

### Generiranje Drift koda

Prilikom promjena u definicijama tablica, potrebno je ponovno generirati Drift kod:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Generirani kod se nalazi u datoteci `database.g.dart` i sadrži sve potrebne klase i metode za rad s bazom.

## � Migracije baze podataka

### Stvaranje nove migracije

Kada trebate promijeniti shemu baze:

1. Ažurirajte definiciju tablice u `lib/db/entities/`
2. Povećajte `schemaVersion` u `database.dart`
3. Dodajte migraciju u `migration.onUpgrade`:

```dart
onUpgrade: (Migrator m, int from, int to) async {
  if (from < 2) {
    await m.addColumn(games, games.newColumn);
  }
}
```

4. Regenerirajte kod:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Resetiranje baze podataka

Za potpuno resetiranje baze (PAŽNJA - briše sve podatke):

```bash
flutter clean
flutter pub get
flutter pub run build_runner build
```

## � Razvoj

### Dodavanje novih metoda u DAO

1. Otvorite odgovarajući DAO file (`game_dao.dart` ili `round_dao.dart`)
2. Dodajte novu metodu
3. Ažurirajte `DatabaseService` ako je potrebno

Primjer dodavanja nove metode:

```dart
// U game_dao.dart
Future<List<Game>> getGamesByType(int gameType) =>
    (_db.select(_db.games)..where((g) => g.gameType.equals(gameType))).get();

// U database_service.dart
Future<List<Game>> getGamesByType(int gameType) async {
  return await database.gameDao.getGamesByType(gameType);
}
```

### Debugging baze podataka

Za provjeru sadržaja baze možete koristiti:

```dart
// Test konekcije
final testResult = await DatabaseService().testConnection();
print('Database connection: $testResult');

// Pregled svih igara
final games = await DatabaseService().getAllGames();
print('Total games: ${games.length}');
```

## � Korisne naredbe

```bash
# Instaliranje dependencies
flutter pub get

# Čišćenje build-a
flutter clean

# Generiranje koda za bazu
flutter pub run build_runner build

# Regeneriranje s brisanjem postojećih datoteka
flutter pub run build_runner build --delete-conflicting-outputs

# Pokretanje aplikacije u debug modu
flutter run

# Pokretanje testova
flutter test

# Analiza koda
flutter analyze

# Formatiranje koda
dart format .
```

## � Platforme

Aplikacija je konfigurirana za rad na:
- ✅ Android
- ✅ iOS  
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## � Problemi i rješenja

### Problem: "Target of URI hasn't been generated"
**Rješenje:** Pokrenite `flutter pub run build_runner build`

### Problem: Database se ne stvara
**Rješenje:** 
1. Provjerite imaju li sve tablice ispravne definicije
2. Regenerirajte kod: `flutter pub run build_runner build --delete-conflicting-outputs`

### Problem: Aplikacija se ruši pri pristupanju bazi
**Rješenje:**
1. Provjerite je li `DatabaseService().initialize()` pozvan u `main.dart`
2. Provjerite konzolu za SQL greške

## �📝 Sljedeći koraci

1. Refaktorirati postojeće `models/` da koriste nove entitete
2. Ažurirati `repositories/` da koriste nove DAO-e
3. Dodati više metoda u DAO-e prema potrebama UI-a
4. Implementirati export/import funkcionalnost
5. Dodati više statistika i analitiku igara

## 🤝 Doprinos

1. Fork repozitorija
2. Stvorite feature branch (`git checkout -b feature/AmazingFeature`)
3. Commite promjene (`git commit -m 'Add some AmazingFeature'`)
4. Push branch (`git push origin feature/AmazingFeature`)
5. Otvorite Pull Request
4. Push branch (`git push origin feature/AmazingFeature`)
5. Otvorite Pull Request

---

**Napomena:** Ovaj README će biti ažuriran kako se projekt razvija. Za najnovije informacije provjerite dokumentaciju u kodu.