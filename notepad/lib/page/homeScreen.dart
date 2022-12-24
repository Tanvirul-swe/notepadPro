import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notepad/Controller/add_note_controller.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';
import 'package:notepad/CustomFile/CustomTextStyle/textStyle.dart';
import 'package:notepad/CustomFile/common_widget.dart/common_widget.dart';
import 'package:notepad/CustomFile/common_widget.dart/custom_search_bar.dart';
import 'package:notepad/LocalDatabase/local_database_helper.dart';
import 'package:notepad/Service/date_time.dart';
import 'package:notepad/helper/app_helper.dart';
import 'package:notepad/helper/size_config.dart';
import 'package:notepad/model/add_note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _listItems = List.generate(200, (i) => "Item $i");
  // ignore: prefer_final_fields
  // Used to generate random integers
  final _random = Random();
  final AddNoteController controller = AddNoteController();

  Future<List<AddNoteModel>>? noteList;

  TextEditingController searchTextFieldController = TextEditingController();
  void filterSearch(String query) async {
    searchTextFieldController.text = query;
    if (query.length > 2) {
      Future<List<AddNoteModel>> data = controller.searchNote(query);
      setState(() {
        noteList = data;
      });
    } else if (query.isEmpty) {
      Future<List<AddNoteModel>>? data = controller.getnoteList();
      setState(() {
        noteList = data;
      });
    }
  }

  @override
  void initState() {
    noteList = controller.getnoteList().then((value) {
      setState(() {});
      return value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        title: const Text(
          'Note',
          style: headingStyle,
        ),
        actions: [
          Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 8),
                    child: AnimSearchBar(
                      color: AppColor.bottomColor,
                      searchIconColor: AppColor.whiteColor,
                      width: SizeConfig.screenWidth / 1.35,
                      textController: searchTextFieldController,
                      onSuffixTap: () {
                        setState(() {
                          searchTextFieldController.clear();
                        });
                      },
                      onChange: (p0) {
                        filterSearch(p0);
                      },
                      onSubmitted: (String value) {},
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 10, top: 8),
                      child: actionBottom(
                        icon: Icons.help_outline_outlined,
                        onPress: () {},
                      )),
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        backgroundColor: AppColor.bottomColor,
        onPressed: () {
          Navigator.pushNamed(context, '/AddNotePage');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                const Duration(seconds: 1),
                () {
                  setState(() {});
                },
              );
            },
            child: futureData()),
      ),
    );
  }

  Widget futureData() {
    return FutureBuilder<List<AddNoteModel>>(
      future: noteList,
      builder: (context, AsyncSnapshot<List<AddNoteModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return builderLoader(SizeConfig.screenHeight, SizeConfig.screenWidth);
        } else if (snapshot.hasError) {
          return AppHelper.of(context).errorView();
        }
        if (snapshot.data!.isEmpty) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppHelper.of(context).emptyView(),
                const Text(
                  "Create your first note",
                  style: bodyStyle,
                )
              ],
            ),
          );
        }

        List<AddNoteModel> noteList = snapshot.data!;
        return itemValue(noteList);
      },
    );
  }

  Widget itemValue(List<AddNoteModel> model) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: model.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, '/NoteViewScreen',
                    arguments: model[index].id)
                .then((value) {
              setState(() {});
            });
          }),
          child: Container(
            height: 110,
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(int.parse(model[index].colorCode)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateTimeConvertion()
                      .millesToRealDateOnly(model[index].dateTime),
                  style: smallTextStyle,
                ),
                Text(
                  model[index].title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: bodyStyle,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
