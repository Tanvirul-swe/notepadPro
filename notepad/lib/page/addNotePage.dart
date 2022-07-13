import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notepad/Controller/add_note_controller.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';
import 'package:notepad/CustomFile/CustomTextStyle/textStyle.dart';
import 'package:notepad/CustomFile/custom_toest.dart';

import 'package:notepad/Service/date_time.dart';
import 'package:notepad/model/add_note_model.dart';
import 'package:notepad/textField/custom_text_field.dart';

class AddNotePage extends StatefulWidget {
  AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final AddNoteController addNoteController = AddNoteController();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    print("Selected color ** $pickerColor");
    setState(() => pickerColor = color);
  }

  alartdialog() {
    return showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: currentColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
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
      key: addNoteController.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          Container(
            width: 50,
            color: currentColor,
          ),
          IconButton(
            onPressed: () async {
              alartdialog();
            },
            icon: const Icon(
              Icons.alarm,
              color: iconColor,
            ),
          ),
          IconButton(
            onPressed: () async {
              if (_validateForm()) {
                int id = await addNoteController.addNote(
                  AddNoteModel(
                    dateTime: DateTimeConvertion().datetimeToMilles(),
                    title: titleController.text,
                    content: contentController.text,
                    colorCode: 'null',
                  ),
                );
                if (id > 0) {
                  CustomTost().customToast('Succesfull');

                  Navigator.pop(context);
                } else {
                  print('Data insert fail');
                }
              } else {
                CustomTost().customToast('Please fill up empty field');
              }
            },
            icon: const Icon(
              Icons.check,
              color: iconColor,
            ),
          )
        ],
      ),
      body: Form(
        key: addNoteController.entryFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTextIField(controller: titleController, lable: 'Title'),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ContentTextField(
                    controller: contentController,
                    lable: 'Write something.....'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    bool _isValid = addNoteController.entryFormKey.currentState!.validate();

    if (titleController.text.isEmpty) {
      _isValid = false;
    } else if (contentController.text.isEmpty) {
      _isValid = false;
    }

    return _isValid;
  }
}
