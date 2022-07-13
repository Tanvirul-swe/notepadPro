import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  final _databaseName = "Myfarmer.db";
  final _databaseVersion = 4;

  // Note table
  static const noteInfoTable = 'note_info';
  static const dateTimeColumn = 'date_time';
  static const titleColumn = 'title';
  static const contentColumn = 'content';
  static const columnId = '_id';
  // Blog Table
  static const blogTableInfo = 'blog_info';
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database

  Future<Database?> database() async {
    Database? _database;
    var databasesPath = await getDatabasesPath();
    deleteDatabase(databasesPath);
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
    }

    return _database;
  }

// SQL code to initialize database
  _initDatabase() async {
    await getApplicationDocumentsDirectory();
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    try {
      await db.execute('''
             CREATE TABLE $noteInfoTable(
              $columnId INTEGER PRIMARY KEY,
              $titleColumn TEXT,
              $contentColumn TEXT,
              $dateTimeColumn INT
             )
            )
            ''');
    } catch (e) {
      print(e);
    }
  }
}
