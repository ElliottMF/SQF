import 'package:flutter/material.dart';
import 'package:tarea/database_helper.dart';

class Insert extends StatelessWidget {

  final DBHelper = DataBaseHelper.instancia;

  final TextEditingController nombreControlador = new TextEditingController();
  final TextEditingController edadControlador = new TextEditingController();

 @override
 Widget build(BuildContext context) {
  return new Scaffold(

    appBar: AppBar(
      title: Text(
        "Insertar"
      ),
    ),
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
         children: <Widget>[
           TextFormField(
             controller: nombreControlador,
             decoration: InputDecoration(
               labelText: "Nombre"
             ),
           ),
           TextFormField(
             controller: edadControlador,
             decoration: InputDecoration(
               labelText: "Edad"
             ),
           ),
         ],
      ), 
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(
        Icons.add, //es el mas
        color: Colors.white,
      ),
      onPressed: ()=>_insertar(),
    ),
 );
 }

 void _insertar() async { 
    Map<String,dynamic> row = {  //genero el row y mando nom cliente y edad 
      'nomCliente' : nombreControlador.text,
      'edadCliente' : edadControlador.text,
    };

    final id = await DBHelper.insertar(row); //dbhelper es la  instancia que se comunica con la bd por eso puede llamar al metodo insertar
    print('Registro Insertado id: $id');
  }
}

