import 'package:crud_app/dao/ClienteDao.dart';
import 'package:crud_app/view/HomeClientes.dart';
import 'package:flutter/material.dart';

class UpdateCliente extends StatefulWidget {
  const UpdateCliente({Key? key, required this.id,required this.cliente,required this.email, required this.obs}) : super(key: key);

  final int id;
  final String cliente;
  final String email;
  final String obs;
  @override
  State<UpdateCliente> createState() => _UpdateClienteState();
}

class _UpdateClienteState extends State<UpdateCliente> {

    late TextEditingController clienteController = TextEditingController(text: widget.cliente);
    late TextEditingController emailController = TextEditingController(text: widget.email);
    late TextEditingController obsController = TextEditingController(text: widget.obs);
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
                controller: clienteController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Email"
                ),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    labelText: "Observação"
                ),
                controller: obsController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                ),
                onPressed: () {
                    clienteDao.updateItem(widget.id,widget.cliente,widget.email,widget.obs);
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> const HomeClientes()));
                },
                child: const Text(style: TextStyle(color: Colors.white),
                    "Salvar"
                ),
              ),
            )
          ],
        )
    );
  }
}
