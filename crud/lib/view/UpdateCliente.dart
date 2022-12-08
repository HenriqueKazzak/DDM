import 'package:crud_app/dao/ClienteDao.dart';
import 'package:crud_app/view/HomeClientes.dart';
import 'package:flutter/material.dart';

class UpdateCliente extends StatefulWidget {
  const UpdateCliente({Key? key, required this.data}) : super(key: key);

  final List<Map<String,dynamic>> data;
  @override
  State<UpdateCliente> createState() => _UpdateClienteState();
}

class _UpdateClienteState extends State<UpdateCliente> {
  var clienteBloc = ClienteBloc();
  var clienteDao = ClienteDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Atualizar Cliente")
        ),
        body:
        ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Cliente"
                ),
                initialValue: widget.data[0]['cliente'].toString(),
                controller: clienteBloc.nome,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email"
                ),
                initialValue: widget.data[0]['email'].toString(),
                controller: clienteBloc.email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    labelText: "Observação"
                ),
                initialValue: widget.data[0]['obs'].toString(),
                controller: clienteBloc.obs,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                ),
                onPressed: () {
                    clienteDao.updateItem(widget.data[0]['id'],clienteBloc.nome.text, clienteBloc.email.text, clienteBloc.obs.text);
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> const HomeClientes()));
                },
                child: const Text(style: TextStyle(color: Colors.white),
                    "Salvar"
                ),
              ),
            )
          ],
        )
    );;
  }
}
class ClienteBloc{
  var nome = TextEditingController();
  var email = TextEditingController();
  var obs = TextEditingController();
}
