import 'package:flutter/material.dart';
import 'package:tarea/consult.dart';
import 'package:tarea/database_helper.dart';
import 'package:tarea/delete.dart';
import 'update.dart';
import 'insert.dart';
import 'show.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new MaterialApp(  //esquema para manejar material app
    title: 'Ejemlo con SQFLite',
    home: Clientes(), // es un crud
  
 );
 }
}

class Clientes extends StatelessWidget{

  final DBHelper = DataBaseHelper.instancia;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo SQFLite'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Insertar'),
              onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Insert()));},
            ),
            RaisedButton(
              child: Text('Actualizar'),
              onPressed: (){_actualizar();},
            ),
            RaisedButton(
              child: Text('Eliminar'),
              onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Delete()));},
            ),
            RaisedButton(
              child: Text('Consultar'),
              onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Consultar()));},
            ),
          ],
        ),
      ),
    );
  }

  /* METODOS*/
  

  void _actualizar() async{
    Map<String, dynamic> row = { //envio id que quiero actualizar 
      'idCliente' : 1,
      'nomCliente' : 'Rubensin Zaid',
      'edadCliente' : 1
    };
    
    final rowsAffected = await DBHelper.actualizar(row);
    print('Se actualizaron $rowsAffected registros');
  }

  List<Map> lista = new List();  

  
}


