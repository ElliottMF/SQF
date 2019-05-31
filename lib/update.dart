import 'package:flutter/material.dart';
import 'package:tarea/database_helper.dart';

class Update extends StatefulWidget {
  int idCliente;
  String nomCliente;
  int edadCliente;

  Update({
    this.idCliente,
    this.edadCliente,
    this.nomCliente
  });

  @override
  _UpdateState createState() => new _UpdateState(idCliente: idCliente, edadCliente: edadCliente, nomCliente: nomCliente);
 }
class _UpdateState extends State<Update> {

  int idCliente;
  String nomCliente;
  int edadCliente;

  _UpdateState({
    this.idCliente,
    this.edadCliente,
    this.nomCliente
  });

final TextEditingController nombreControlador = new TextEditingController();
final TextEditingController edadControlador = new TextEditingController();

final DBHelper = DataBaseHelper.instancia;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    nombreControlador.text = nomCliente;
    edadControlador.text = edadCliente.toString();
  }

 @override
 Widget build(BuildContext context) {
  return new Scaffold(
    appBar: AppBar(
    title: Text(
         "Editar"
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
             keyboardType: TextInputType.number,
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
      onPressed: ()=>_actualizar(),
    ),
 );
 }
    
void _actualizar() async{
    Map<String, dynamic> row = { //envio id que quiero actualizar 
      'idCliente' : idCliente,
      'nomCliente' : nombreControlador.text,
      'edadCliente' : int.parse(edadControlador.text)
    };
    
    final rowsAffected = await DBHelper.actualizar(row);
    print('Se actualizaron $rowsAffected registros');
  }
}