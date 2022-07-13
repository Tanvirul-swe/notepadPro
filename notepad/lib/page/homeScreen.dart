import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';
import 'package:notepad/CustomFile/CustomTextStyle/textStyle.dart';

import 'package:notepad/page/addNotePage.dart';

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
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => AddNotePage())));

      _selectableindex = index;
    }
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
                    child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 8.0,
                        children: List.generate(10, (index) {
                          return InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.primaries[_random
                                          .nextInt(Colors.primaries.length)]
                                      [_random.nextInt(9) * 100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Flutter',
                                        style: headingStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Date : 25 March 2000',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Text(
                                        'Hey I am flutter i here for help you.Do not wrroy',
                                        style: TextStyle(
                                            fontSize: 16, height: 1.75),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        })),
                  ),
                  Text('Person'),
                  Text('Person')
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
