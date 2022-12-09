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
      title: 'Launcher',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomeLauncher(title: 'Launcher para o Romulo'),
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
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder:(context, index) {
                AppInfo app = snapshot.data![index];
                return Card(
                    child: ListTile(
                  leading: CircleAvatar(
                    child: Image.memory(app.icon!),
                  ),
                    title: Text(app.name!),
                    subtitle: Text(app.packageName!), 
                    onTap: () =>
                          InstalledApps.startApp(app.packageName!),
                  ),
                );
              }
          );
        },
      )
    );
  }
}



