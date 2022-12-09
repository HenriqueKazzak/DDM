import 'package:crud_app/dao/ClienteDao.dart';
import 'package:flutter/material.dart';

import 'AddClientePage.dart';
import 'UpdateCliente.dart';

class HomeClientes extends StatefulWidget {
  const HomeClientes({Key? key}) : super(key: key);

  @override
  State<HomeClientes> createState() => _HomeClientesState();
}

class _HomeClientesState extends State<HomeClientes> {
  List<Map<String, dynamic>> allItems = [];
  var clienteDao = ClienteDao();
  bool _isLoading = true;

  void _refreshData() async {
    final data = await clienteDao.getAllItems();
    setState(() {
      allItems = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Clientes"),
      ),
      body: ListView.builder(
        itemCount: allItems.length,
        itemBuilder: (context, index) => ListTile(
            title: Text(allItems[index]['cliente']),
            subtitle: Text(allItems[index]['obs']),
            trailing: SizedBox(
                width: 100,
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      clienteDao.deleteItem(allItems[index]['id']);
                      _refreshData();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UpdateCliente(
                                id: allItems[index]['id'],
                                cliente: allItems[index]['cliente'],
                                email: allItems[index]['email'],
                                obs: allItems[index]['obs'],
                              ))
                      );
                    },
                  ),
                ]))),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddClientePage()));
        },
      ),
    );
  }
}
