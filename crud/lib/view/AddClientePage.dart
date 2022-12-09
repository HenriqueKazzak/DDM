import 'package:crud_app/dao/ClienteDao.dart';
import 'package:crud_app/view/HomeClientes.dart';
import 'package:flutter/material.dart';

class AddClientePage extends StatefulWidget {
  const AddClientePage({Key? key,}) : super(key: key);

  @override
  State<AddClientePage> createState() => _AddClientePageState();
}

class _AddClientePageState extends State<AddClientePage> {
  var clienteBloc = ClienteBloc();
  var clienteDao = ClienteDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Adicionar Cliente")
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
                controller: clienteBloc.cliente,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email"
                ),
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
                    clienteDao.creatCliente(clienteBloc.cliente.text, clienteBloc.email.text, clienteBloc.obs.text);
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeClientes())
                    );
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
  var cliente = TextEditingController();
  var email = TextEditingController();
  var obs = TextEditingController();
}
