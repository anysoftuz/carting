// import 'package:gettest/data/models/home/quiz_data.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart' as path;

// class DatabaseHelper {
//   static const dbName = 'quiz_data.db';
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;
//   static Database? _database;

//   DatabaseHelper._internal();

//   // Future<Database> get database async {
//   //   if (_database != null) return _database!;
//   //   _database = await _initDatabase();
//   //   return _database!;
//   // }

//   static Future<Database> _getDatabase(String table) async {
//     final dbPath = await getDatabasesPath();
//     final dbFile = path.join(dbPath, dbName);

//     return openDatabase(
//       dbFile,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute(
//             'CREATE TABLE $table (id INTEGER PRIMARY KEY, startedAt TEXT, answeredAt TEXT, answerId INTEGER)');
//       },
//     );
//   }

//   static Future<void> insertQuizData(
//       QuizDataModel quizData, String table) async {
//     final db = await _getDatabase(table);
//     await db.insert(table, quizData.toJson());
//   }

//   static Future<List<QuizDataModel>> getAllQuizData(String table) async {
//     final db = await _getDatabase(table);
//     final result = await db.query(table);
//     return result.map((row) => QuizDataModel.fromJson(row)).toList();
//   }

//   static Future<bool> tableExists(String tableName) async {
//     final db = await _getDatabase(tableName);
//     final result = await db.rawQuery(
//         'SELECT 1 FROM sqlite_master WHERE type="table" AND name=?',
//         [tableName]);
//     return result.isNotEmpty;
//   }
// }
