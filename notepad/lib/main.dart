import 'package:flutter/material.dart';
import 'package:notepad/LocalDatabase/local_database_helper.dart';
import 'package:notepad/page/homeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await DatabaseHelper.instance.database();

  runApp(MyApp());
}
// update ui page
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),

    
    );
  }
}
