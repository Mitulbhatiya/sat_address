import 'package:path/path.dart';
import 'package:sat_address/database/sat.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  String? a;
  DatabaseHelper._();
  DatabaseHelper({this.a});
  static const databaseName = 'sat_adress.db';
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      return await initializeDatabase();
    }
    return _database!;
  }

  initializeDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE sataddress(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, country TEXT, state TEXT, city TEXT, pincode INTEGER)");
        });
  }

  insertTodo(Sat sat) async {
    final db = await database;
    var res = await db.insert(Sat.TABLENAME, sat.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }


  Future<List<Sat>> retrieveTodos() async {
    // Logic we will add later
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(Sat.TABLENAME);
    return List.generate(maps.length, (i) {
      return Sat(
        id: maps[i]['id'],
        country: maps[i]['country'],
        state: maps[i]['state'],
        pincode: maps[i]['pincode'],
      );
    });
  }

  updateTodo(Sat sat) async {
    final db = await database;

    await db.update(Sat.TABLENAME, sat.toMap(),
        where: 'id = ?',
        whereArgs: [sat.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteTodo(int id) async {
    var db = await database;
    db.delete(Sat.TABLENAME, where: 'id = ?', whereArgs: [id]);
  }
}