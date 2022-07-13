import 'package:flutter/material.dart';
import 'package:notepad/modle/modle_data.dart';
import 'package:notepad/page/homeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

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

      // home: Scaffold(

      //   appBar: AppBar(
      //     title: TextField(
      //       controller: _controller,
      //     ),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () async {
      //       await DatabaseHelper.instance.add(Grocery(name: _controller.text));
      //       setState(() {
      //         _controller.clear();
      //       });
      //     },
      //     child: const Text('Save'),
      //   ),
      //   body: Center(
      //     child: FutureBuilder<List<Grocery>>(
      //       future: DatabaseHelper.instance.getGroceries(),
      //       builder:
      //           (BuildContext context, AsyncSnapshot<List<Grocery>> snapshot) {
      //         if (snapshot.hasError) {
      //           return const CircularProgressIndicator();
      //         }
      //         if (snapshot.data != null) {
      //           return ListView(
      //             children: snapshot.data!.map(
      //               (Grocery) {
      //                 return Center(
      //                   child: ListTile(
      //                     title: Text(Grocery.name),
      //                   ),
      //                 );
      //               },
      //             ).toList(),
      //           );
      //         }
      //         return Text('ffff');
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
