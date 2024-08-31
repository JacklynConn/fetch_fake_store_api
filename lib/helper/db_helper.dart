import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> initDatabase() async {
    final dataBasePath =
        await getDatabasesPath(); // get path that store the database on the local machine
    final path = join(dataBasePath,
        'testDb.db'); // join two paths that store the database on the local machine
    return openDatabase(path, version: 1, onCreate: createDatabase);
  }

  static Future<void> createDatabase(Database database, int version) async {
    await database.execute('''
        CREATE TABLE IF NOT EXISTS tasks (
          id INTEGER PRIMARY KEY,
          task TEXT,
          description TEXT
        )
      ''');
    await database.execute('''
        CREATE TABLE IF NOT EXISTS note (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT,
          createDate TEXT,
        )
      ''');
  }

  Future<int> insertNote(Map<String, dynamic> values) async {
    var db = await initDatabase();
    int result = await db.insert('notes', values);
    print(result);
    return result;
  }

  Future<int> insertTask() async {
    var data = await initDatabase();
    Map<String, dynamic> dataMap = {
      'id': 2,
      'task': "hello",
      'description': "hello Task"
    };
    int result = await data.insert("tasks", dataMap);
    print(result);
    return result;
  }

  Future<void> showTask() async {
    var data = await initDatabase();
    var result = await data.query("tasks");
    print(result);
  }

  Future<void> updateTask() async {
    var data = await initDatabase();
    Map<String, dynamic> dataMap = {
      'id': 2,
      'task': "Updated ",
      'description': "Task Updated"
    };
    var result = await data.update("tasks", dataMap, where: "id = 2");
    print(result);
  }

  Future<void> deleteTask() async {
    var data = await initDatabase();
    var result = await data.delete("tasks", where: "id = 2");
    print(result);
  }
}
