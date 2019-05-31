import 'package:flutter/material.dart';
import 'database_helper.dart';

class Delete extends StatelessWidget {

    final DBHelper = DataBaseHelper.instancia;
    final TextEditingController eliminarControlador = new TextEditingController();

 @override
 Widget build(BuildContext context) {
  return new Scaffold(
    appBar: AppBar(
    title: Text(
         "Eliminiar"
      ),
    ),
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: eliminarControlador,
            decoration: InputDecoration(
              labelText: "Id Usuario"
            ),
          )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(
        Icons.delete_forever, //es el mas
        color: Colors.white,
      ),
      onPressed: ()=>_eliminar(),
    ),


  
 );
 }
 void _eliminar() async{
    // Asumimos que solo hay un registro
   // final id = await DBHelper.noRegistros();
   final id = eliminarControlador.text;
    final rowsDeleted = await DBHelper.eliminar(id);
    print('Se borró el registro $id');
  }
}