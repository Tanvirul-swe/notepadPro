import 'package:flutter/material.dart';
import 'package:notepad/CustomColors/customColors.dart';
import 'package:notepad/CustomTextStyle/textStyle.dart';

class AddNotePage extends StatefulWidget {
  AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: iconColor,
          ),
        ),
        title: const Text(
          'Add Notes',
          style: TappbarTitleStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.alarm,
                color: iconColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title'),
            const SizedBox(
              height: 10,
            ),
            TextField(
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
              hintText: 'Write title',
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400),
            )),
          ],
        ),
      ),
    );
  }
}
