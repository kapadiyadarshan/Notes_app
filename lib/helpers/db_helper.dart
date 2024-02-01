import 'package:final_exam/models/note_model.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper dbHelper = DbHelper._();

  late Database database;
  Logger logger = Logger();

  String tableName = "LikeNotes";

  String colId = "id";
  String colTitle = "title";
  String colNote = "note";
  String colDateTime = "dateTime";

  String query = "";

  initDB() async {
    String dbPath = await getDatabasesPath();
    String dbName = "final_exam";
    String path = join(dbPath, dbName);

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        query =
            "CREATE TABLE IF NOT EXISTS $tableName ($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT, $colNote TEXT,$colDateTime TEXT)";

        db
            .execute(query)
            .then((value) => logger.i("Database Create Successfully"))
            .onError((error, stackTrace) => "ERROR : $error");
      },
    );
  }

  Future<int> insertData({required NoteModal noteModal}) {
    Map<String, dynamic> data = noteModal.toMap;
    data.remove("id");
    return database.insert(tableName, data);
  }

  Future<List<NoteModal>> getAllData() async {
    query = "SELECT * FROM $tableName";

    List allData = await database.rawQuery(query);

    return allData
        .map(
          (e) => NoteModal.fromMap(data: e),
        )
        .toList();
  }

  Future<int> deleteData({required int id}) async {
    initDB();

    query = "DELETE FROM $tableName WHERE $colId=$id";

    return await database.rawDelete(query);
  }
}
