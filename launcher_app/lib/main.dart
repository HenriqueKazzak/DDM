import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomeLauncher(title: 'Flutter Demo Home Page'),
    );
  }
}
class HomeLauncher extends StatefulWidget {
  const HomeLauncher({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeLauncher> createState() => _HomeLauncherState();
}

class _HomeLauncherState extends State<HomeLauncher> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: InstalledApps.getInstalledApps(),
        builder: (context, snapshot) {
          var apps = snapshot.data;
          return ListView.builder(
              itemCount: apps?.length,
              itemBuilder:(context, index) => ListTile(
                title: Text(apps[index].),
              ),
          );
        },
      )
    );
  }
}



