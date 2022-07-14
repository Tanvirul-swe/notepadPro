import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:notepad/Controller/add_note_controller.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';
import 'package:notepad/CustomFile/CustomTextStyle/textStyle.dart';
import 'package:notepad/LocalDatabase/local_database_helper.dart';
import 'package:notepad/Service/date_time.dart';
import 'package:notepad/helper/app_helper.dart';
import 'package:notepad/model/add_note_model.dart';

import 'package:notepad/page/addNotePage.dart';
import 'package:notepad/page/update_note_value.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final _listItems = List.generate(200, (i) => "Item $i");
  // ignore: prefer_final_fields
  int _selectableindex = 0;
  // Used to generate random integers
  final _random = Random();
  final AddNoteController controller = AddNoteController();
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => AddNotePage()),
        ),
      ).then((value) {
        setState(() {});
      });

      _selectableindex = index;
    }
  }

  alartdialog(int? id) {
    return showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Do you want to delete this item?'),
            titleTextStyle: TextStyle(fontSize: 16, color: Colors.black),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                onPressed: () async {
                  await DatabaseHelper.instance.deleteItem(id);
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hi Michal\nGood Morning',
          style: TappbarTitleStyle,
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: CircleAvatar(
                  backgroundImage: AssetImage('Assets/images/addimage.png'),
                ),
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle:
              const TextStyle(color: Colors.green, fontSize: 13),
          unselectedItemColor: iconColor,
          selectedItemColor: iconColor,
          currentIndex: _selectableindex,
          onTap: _onItemTapped,
          items: [
            const BottomNavigationBarItem(
                label: 'Add Note', icon: Icon(Icons.add_circle_outline)),
            BottomNavigationBarItem(
                label: 'Profile',
                icon: SvgPicture.asset(
                  'Assets/images/profile.svg',
                  width: 20,
                  height: 20,
                  color: iconColor,
                )),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: textFieldColor,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.yellow, width: 0.0),
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    prefixIconColor: iconColor,
                    prefixIcon: const Icon(Icons.search_outlined)),
              ),
            ),
            TabBar(
              indicatorColor: Colors.blueAccent,
              unselectedLabelColor: const Color(0xFF808080),
              labelColor: Colors.black,
              labelStyle: selectedLableStyle,
              unselectedLabelStyle: tabBarTextStyle,
              tabs: const [
                Tab(
                  text: 'Note',
                ),
                Tab(
                  child: Text('To Do'),
                ),
                Tab(
                  text: 'Blogs',
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: futureData(),
                  ),
                  Text('Person1'),
                  Text('Person2')
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget futureData() {
    return FutureBuilder<List<AddNoteModel>>(
      future: controller.getnoteList(),
      builder: (context, AsyncSnapshot<List<AddNoteModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Center(
              child: SpinKitFoldingCube(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Something is wrrong'),
          );
        }

        List<AddNoteModel> noteList = snapshot.data!;
        return itemValue(noteList);
      },
    );
  }

  Widget itemValue(List<AddNoteModel> model) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 8.0,
      children: List.generate(
        model.length,
        (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateNoteValue(id: model[index].id!),
                ),
              ).then((value) {
                setState(() {});
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(int.parse(model[index].colorCode)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            model[index].title,
                            maxLines: 1,
                            style: headingStyle.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              alartdialog(model[index].id);
                            },
                            icon: const Icon(
                              Icons.remove_circle,
                              size: 18,
                              color: Colors.red,
                            ))
                      ],
                    ),
                    Text(
                        DateTimeConvertion()
                            .millesToRealDateOnly(model[index].dateTime),
                        style: const TextStyle(fontSize: 12)),
                    Text(
                      model[index].content,
                      maxLines: 4,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          height: 1.25),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
