// ignore_for_file: unused_import
import '../Helpers/exportsClass.dart';

class serviceDB {
  static Database? _database;
  static final serviceDB DB = serviceDB.constDB();
  serviceDB.constDB();

  get dataBase async {
    if (_database != null) return _database;

    _database = await inicarDB();

    return _database;
  }

  inicarDB() async {
    //Ejecutaremos operaciones SQL

    //Definir donde se guardará la Base de datos
    Directory rutaDB = await getApplicationDocumentsDirectory();
  }
}
