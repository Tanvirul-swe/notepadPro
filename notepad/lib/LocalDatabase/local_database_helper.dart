import 'package:notepad/model/add_note_model.dart';
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
  static const colorCodeColumn = 'color_code';
  static const columnFontSize = 'font_size';
  static const columnIsBold = 'isBold';
  static const columnIsItalic = 'isItalic';
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
              $colorCodeColumn TEXT,
              $dateTimeColumn INT,
              $columnFontSize REAL,
              $columnIsBold INT,
              $columnIsItalic INT
             )
            ''');
      print('***** Create succesfully NoteInfo Table****');
    } catch (e) {
      print(e);
    }
  }

  Future<int> insertNote(AddNoteModel model) async {
    Database? db = await instance.database();
    int id = await db!.insert(noteInfoTable, model.toMap());
    return id;
  }

  Future<int> updateNote(AddNoteModel model, int id) async {
    Database? db = await instance.database();
    int count = await db!.update(noteInfoTable, model.toMap(),
        where: "$columnId= ?", whereArgs: [id]);
    return count;
  }

  Future<List<AddNoteModel>> getallNote() async {
    Database? db = await instance.database();
    final note = await db!.rawQuery('SELECT * FROM $noteInfoTable');
    if (note.isNotEmpty) {
      return note.map((c) => AddNoteModel.fromLocalDB(c)).toList();
    } else {
      return [];
    }
  }

  Future<int> deleteItem(int? id) async {
    Database? db = await instance.database();
    int count = await db!
        .rawDelete('DELETE FROM $noteInfoTable WHERE $columnId = ?', [id]);
    return count;
  }

  Future<AddNoteModel?> getNoteById(int id) async {
    Database? db = await instance.database();
    AddNoteModel model;
    final note = await db!
        .rawQuery('SELECT * FROM $noteInfoTable WHERE $columnId = ?', [id]);
    if (note.isNotEmpty) {
      return model = AddNoteModel.fromLocalDB(note[0]);
    } else {
      return null;
    }
  }

  Future<List<AddNoteModel>> searchnote(String query) async {
    List<AddNoteModel> noteList = [];
    Database? db = await instance.database();
    var note = await db!.rawQuery(
        'select * from $noteInfoTable where $titleColumn LIKE ? order by $titleColumn',
        ['%$query%']);

    if (note.isNotEmpty) {
      noteList = note.map((c) => AddNoteModel.fromLocalDB(c)).toList();
    }
    return Future.value(noteList);
  }
}
