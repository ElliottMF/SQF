import 'package:flutter/material.dart';
import 'package:tarea/database_helper.dart';
import 'update.dart';

class Consultar extends StatefulWidget {
  @override
  _ConsultarState createState() => new _ConsultarState();
 }
class _ConsultarState extends State<Consultar> {

  List<Map> listaClientes = new List();
  final DBHelper = DataBaseHelper.instancia;

  @override
  void initState() {
    // TODO: implement initState0
    super.initState();
    setState(() {
      _consultar(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
      title: Text(
          "Consultar"
        ),
      ),
      body: ListView.builder(
        itemCount: listaClientes.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('${listaClientes[index]['nomCliente']}'),
            subtitle: Text('${listaClientes[index]['edadCliente']}'),
            onTap: ()  { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Update(
              edadCliente: listaClientes[index]['edadCliente'],
              idCliente: listaClientes[index]['idCliente'],
              nomCliente: listaClientes[index]['nomCliente'],
            )));},
          );
        },
      )
    );
  }

  _consultar() async {
    final allRows = await DBHelper.listarTodos();
    print('Reguistros:');
    setState(() {
      allRows.forEach((row) => listaClientes.add(row)); //recorre con for each etiquetalo como row y imprime row
    print('${listaClientes[0]['idCliente']}');
    });
    
  }

}