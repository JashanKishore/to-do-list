import 'package:flutter/material.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/util/task.dart';
import 'package:to_do_app/util/setup_locator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/time_of_day_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Database _dbService = locator<Database>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      useMaterial3: true,
      iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: FutureBuilder(
        future: _dbService.getAllTasks(), 
        builder: (context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage(snapshot.data ?? []);
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        ),
    );
  }
}