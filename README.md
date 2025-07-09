# Bela Blok - Flutter App

Card game "Bela" (Belot) score tracking application developed in Flutter with Drift ORM database.

## 📋 Prerequisites

Before running the project, make sure you have the following components installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.5.4 or newer)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with Flutter extensions
- [Git](https://git-scm.com/)

### Installation check

```bash
flutter doctor
```

## 🚀 Running the project

### 1. Clone repository

```bash
git clone [REPOSITORY_URL]
cd BelaBlok/src
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Generate ORM code (database)

The project uses Drift ORM for database management. You need to generate code for database operations:

```bash
flutter pub run build_runner build
```

For continuous watching during development:

```bash
flutter pub run build_runner watch
```

If there are conflicts with already generated files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run application

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

## 🗃️ Database structure

The application uses **Drift ORM** for SQLite database management.

### Table: `games`
Stores basic game information:
- `id` (Primary Key, AutoIncrement)
- `gameDateTime` - game creation date and time
- `teamOneScore` - total score of team 1
- `teamTwoScore` - total score of team 2
- `gameType` - game type (1001, 501, etc.)
- `gameDirection` - game direction (enum)
- `currentlyShuffling` - which player is currently shuffling
- `winner` - winner (enum, nullable)
- `finished` - whether the game is finished
- `createdAt`, `updatedAt` - timestamps

### Table: `rounds`
Stores information about rounds within a game:
- `id` (Primary Key, AutoIncrement)
- `gameId` (Foreign Key → games.id)
- `teamCalled` - which team called (enum)
- `teamOneScore` - team 1 points in this round
- `teamTwoScore` - team 2 points in this round
- `teamOneCallAmount` - how much team 1 called
- `teamTwoCallAmount` - how much team 2 called
- `isTeamOneCallSuccessful` - whether team 1 succeeded their call
- `isTeamTwoCallSuccessful` - whether team 2 succeeded their call
- `createdAt` - timestamp

## 🏗️ Code architecture

```
lib/
├── db/                     # Database
│   ├── entities/          # Table definitions (Drift)
│   │   ├── game_table.dart
│   │   └── round_table.dart
│   ├── dao/               # Data Access Objects - data access methods
│   │   ├── game_dao.dart
│   │   └── round_dao.dart
│   └── database.dart      # Main database configuration
├── enums/                 # Enumerators
│   ├── play_direction_enum.dart
│   └── team_enum.dart
├── models/                # UI models (will be refactored)
├── services/              # Service layer
│   └── database_service.dart
├── screens/               # UI screens
├── routes/                # Navigation
└── themes/                # Application themes
```

### Main components:

- **Entities** - database table definitions (using Drift annotations)
- **DAO** (Data Access Objects) - classes with data access methods (CRUD operations)
- **DatabaseService** - singleton service that encapsulates database operations
- **Models** - UI models (will be refactored to use entities)

## 🔍 Working with Drift ORM

### Using DAO classes

DAO (Data Access Object) classes contain methods for working with the database. Usage examples:

```dart
// Get active game
final activeGame = await DatabaseService().getActiveGame();

// Get all rounds for a game
final rounds = await DatabaseService().getRoundsForGame(gameId);

// Create new game
final newGameId = await DatabaseService().createNewGame(
  gameType: 1001,
  gameDirection: PlayDirection.clockwise,
  currentlyShuffling: 0,
);

// Update scores
await DatabaseService().updateGameScore(
  gameId: 1,
  teamOneScore: 250,
  teamTwoScore: 320,
);
```

### Drift data types

Drift generates several types for each table:

- `Game` - represents one row from the `games` table (class with immutable fields)
- `GamesCompanion` - used for INSERT and UPDATE operations (uses `Value<T>` for optionality)
- `$GamesTable` - used internally for table definitions

### Value class

`Value<T>` is used in Companion classes to define which fields will be updated:

```dart
// Setting values:
Value(10) // required value
Value.absent() // will not be included in query
const Value.absent() // static access

// Usage example:
GamesCompanion(
  teamOneScore: Value(150), // this will be updated
  teamTwoScore: Value(120), // this will be updated
  // other fields will not be touched
)
```

### Generating Drift code

When making changes to table definitions, you need to regenerate Drift code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Generated code is located in `database.g.dart` file and contains all necessary classes and methods for database operations.

## 📊 Database migrations

### Creating new migration

When you need to change the database schema:

1. Update table definition in `lib/db/entities/`
2. Increase `schemaVersion` in `database.dart`
3. Add migration in `migration.onUpgrade`:

```dart
onUpgrade: (Migrator m, int from, int to) async {
  if (from < 2) {
    await m.addColumn(games, games.newColumn);
  }
}
```

4. Regenerate code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Database reset

For complete database reset (WARNING - deletes all data):

```bash
flutter clean
flutter pub get
flutter pub run build_runner build
```

## 🔧 Development

### Adding new methods to DAO

1. Open the appropriate DAO file (`game_dao.dart` or `round_dao.dart`)
2. Add new method
3. Update `DatabaseService` if needed

Example of adding new method:

```dart
// In game_dao.dart
Future<List<Game>> getGamesByType(int gameType) =>
    (_db.select(_db.games)..where((g) => g.gameType.equals(gameType))).get();

// In database_service.dart
Future<List<Game>> getGamesByType(int gameType) async {
  return await database.gameDao.getGamesByType(gameType);
}
```

### Database debugging

To check database content you can use:

```dart
// Test connection
final testResult = await DatabaseService().testConnection();
print('Database connection: $testResult');

// Review all games
final games = await DatabaseService().getAllGames();
print('Total games: ${games.length}');
```

## 🔍 Useful commands

```bash
# Install dependencies
flutter pub get

# Clean build
flutter clean

# Generate database code
flutter pub run build_runner build

# Regenerate with deleting existing files
flutter pub run build_runner build --delete-conflicting-outputs

# Run application in debug mode
flutter run

# Run tests
flutter test

# Code analysis
flutter analyze

# Code formatting
dart format .
```

## 📱 Platforms

The application is configured to work on:
- ✅ Android
- ✅ iOS  
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🐛 Problems and solutions

### Problem: "Target of URI hasn't been generated"
**Solution:** Run `flutter pub run build_runner build`

### Problem: Database is not created
**Solution:** 
1. Check if all tables have correct definitions
2. Regenerate code: `flutter pub run build_runner build --delete-conflicting-outputs`

### Problem: Application crashes when accessing database
**Solution:**
1. Check if `DatabaseService().initialize()` is called in `main.dart`
2. Check console for SQL errors

## 📝 Next steps

1. Refactor existing `models/` to use new entities
2. Update `repositories/` to use new DAOs
3. Add more methods to DAOs according to UI needs
4. Implement export/import functionality
5. Add more statistics and game analytics

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

---

**Note:** This README will be updated as the project develops. For the latest information, check the documentation in the code.
