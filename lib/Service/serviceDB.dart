// ignore_for_file: unused_import, depend_on_referenced_packages, camel_case_types
import 'package:http/http.dart';

import '../Helpers/exportsClass.dart';

class serviceDB {
  static Database? _database;
  static final serviceDB db = serviceDB.constDB();
  serviceDB.constDB();

  Future<Database?> get dataBase async {
    if (_database != null) return _database;
    _database = await inicarDB();
    return _database;
  }

  Future<Database> inicarDB() async {
    //Ejecutaremos operaciones SQL

    //Definir donde se guardará la Base de datos
    Directory rutaDB = await getApplicationDocumentsDirectory();
    final path = join(rutaDB.path, 'personajeDB.db');

    //Creación de DB
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
            CREATE TABLE personajeDB(
              id INTEGER PRIMARY KEY,
              idHero INTEGER,
              name TEXT,
              occupation TEXT,
              imgLG TEXT
            )
          ''');
      },
    );
  }

  Future<int> nuevoHeroDB(heroDB heroDB) async {
    final db = await dataBase; //Obteniendo a la DB
    final response = await db!.insert('personajeDB', heroDB.toJson());
    return response;
  }

  Future<heroDB> obtenerHeroDBbyId(int id) async {
    final db = await dataBase; //Obteniendo a la DB
    final response =
        await db!.query('personajeDB', where: 'id=?', whereArgs: [id]);

    return heroDB.fromJson(response.first);
  }

  Future<List<heroDB>> obtenerHeroDBAll() async {
    final db = await dataBase; //Obteniendo a la DB
    final response = await db!.query('personajeDB');
    return response.map((e) => heroDB.fromJson(response.first)).toList();
  }
}
