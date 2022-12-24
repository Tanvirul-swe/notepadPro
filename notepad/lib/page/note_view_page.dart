import 'package:flutter/material.dart';
import 'package:notepad/Controller/add_note_controller.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';
import 'package:notepad/CustomFile/CustomTextStyle/textStyle.dart';
import 'package:notepad/CustomFile/common_widget.dart/common_widget.dart';
import 'package:notepad/helper/app_helper.dart';
import 'package:notepad/helper/size_config.dart';
import 'package:notepad/model/add_note_model.dart';

class NoteViewScreen extends StatefulWidget {
  final int id;
  const NoteViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<NoteViewScreen> createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  final AddNoteController controller = AddNoteController();
  int localId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8),
          child: actionBottom(
            icon: Icons.arrow_back_ios_new,
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10, top: 8),
              child: actionBottom(
                icon: Icons.edit,
                onPress: () {
                  Navigator.pushNamed(context, '/UpdateNoteValue',
                          arguments: localId)
                      .then((value) {
                    setState(() {});
                  });
                },
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: futureData(),
        ),
      ),
    );
  }

  Widget futureData() {
    return FutureBuilder<AddNoteModel?>(
      future: controller.getNoteById(widget.id),
      builder: (context, AsyncSnapshot<AddNoteModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return builderLoader(SizeConfig.screenHeight, SizeConfig.screenWidth);
        } else if (snapshot.hasError) {
          return AppHelper.of(context).errorView();
        }
        if (snapshot.data == null) {
          return AppHelper.of(context).emptyView();
        }

        AddNoteModel noteList = snapshot.data!;
        return itemValue(noteList);
      },
    );
  }

  Widget itemValue(AddNoteModel model) {
    localId = model.id!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          model.title,
          style: headingStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.content,
          style: contentStyle,
        ),
      ],
    );
  }
}
