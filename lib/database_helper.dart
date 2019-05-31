import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';  //flujos de tentradas y salidas lo del yami que importe


//defino como constantes nombre de bd, version pero solamente si cambioamos algo grande,
//variable de configuracion de la tabla 
class DataBaseHelper{

  static final nombreBD  = "CUSTOMERSDB";
  static final versionBD = 1;
  static final nombreTBL = "tbl_clientes";


  /*INSTANCIA SINGLETON DEL LA BD*/
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instancia = DataBaseHelper._privateConstructor();

  static Database _database; //objeto de tipo db para accesar a la bd y mandar insert delete ..
  Future<Database> get database async{ //recuperar valores en segundo plano del database (obj)
    if( _database != null ) return _database; //valida que este abierta si si se conecta si no la abre
    _database = await _initDataBase();
    return _database;
  }

  Future<Database> _initDataBase() async{   
    Directory carpeta = await getApplicationDocumentsDirectory();  //defomo donde guardare mi archivo 
    String ruta = join(carpeta.path, nombreBD); //ruta con bd
    return await openDatabase(   //abre bd y crea tabla 
        ruta,
        version: versionBD,
        onCreate: _crearTabla
        
    );
  }

  Future _crearTabla(Database db, int version) async {  //resibo bd y version
    await db.execute("CREATE TABLE $nombreTBL (idCliente INTEGER PRIMARY KEY, nomCliente VARCHAR(50), edadCliente INTEGER)");
  //creo la table 
  }

  Future<int> insertar(Map<String, dynamic> row) async{ //int es id del registro que se inserto en la bd, mapeo string
    Database db = await instancia.database; //database es un metodo para insertar 
    return await db.insert(nombreTBL, row); //nobre u registro mandamos
  }

  Future<int> actualizar(Map<String, dynamic> row) async{
    Database db = await instancia.database;
    int id = row['idCliente'];  //nombre de la columna 
    return await db.update(nombreTBL, row, where: 'idCliente = ?', whereArgs: [id]);
  }

  Future<int> eliminar(String id) async{
    Database db = await instancia.database;
    return await db.delete(nombreTBL, where: 'idCliente = ?', whereArgs: [id] );
  }

  Future<List<Map<String, dynamic>>> listarTodos() async{ 
    Database db = await instancia.database;
    return await db.query(nombreTBL); //regrea una query lista
  }

  Future<int> noRegistros() async{
    Database db = await instancia.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $nombreTBL'));
  }
}