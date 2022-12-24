import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notepad/Controller/add_note_controller.dart';
import 'package:notepad/CustomFile/CustomColors/customColors.dart';
import 'package:notepad/CustomFile/CustomTextStyle/textStyle.dart';
import 'package:notepad/CustomFile/common_widget.dart/common_widget.dart';
import 'package:notepad/CustomFile/custom_toest.dart';

import 'package:notepad/Service/date_time.dart';
import 'package:notepad/model/add_note_model.dart';
import 'package:notepad/textField/custom_text_field.dart';

class UpdateNoteValue extends StatefulWidget {
  final int id;
  const UpdateNoteValue({required this.id, Key? key}) : super(key: key);

  @override
  State<UpdateNoteValue> createState() => _UpdateNoteValueState();
}

class _UpdateNoteValueState extends State<UpdateNoteValue> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  AddNoteController addNoteController = AddNoteController();
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
  double fontSize = 17;
  bool isBold = false;
  bool isItalic = false;
  AddNoteModel? noteModel;
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
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    noteModel = await addNoteController.getNoteById(widget.id);
    titleController = TextEditingController(text: noteModel!.title);
    contentController = TextEditingController(text: noteModel!.content);
    pickerColor = Color(int.parse(noteModel!.colorCode));
    if (noteModel!.isBold == 1) {
      isBold = true;
    }
    if (noteModel!.isItalic == 1) {
      isItalic = true;
    }
    fontSize = noteModel!.fontSize;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addNoteController.scaffoldKey,
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8),
          child: actionBottom(
            icon: Icons.arrow_back_ios_new,
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                alartdialog();
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.whiteColor,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3)),
                    ],
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Container(
                  width: 50,
                  decoration: BoxDecoration(
                      color: pickerColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20, top: 8),
              child: actionBottom(
                icon: Icons.save_outlined,
                onPress: () async {
                  if (_validateForm()) {
                    int id = await addNoteController.updateNote(
                        AddNoteModel(
                          dateTime: DateTimeConvertion().datetimeToMilles(),
                          title: titleController.text,
                          content: contentController.text,
                          colorCode: pickerColor.value.toString(),
                          fontSize: fontSize,
                          isBold: isBold ? 1 : 0,
                          isItalic: isItalic ? 1 : 0,
                        ),
                        widget.id);
                    if (id > 0) {
                      showCustomSnackBar(context, 'Update Succesfull');

                      Navigator.pop(context);
                    } else {
                      showCustomSnackBar(context, 'Data Update fail');

                      CustomTost().customToast('Data Update fail');
                    }
                  } else {
                    showCustomSnackBar(context, 'Please fill up empty field');
                  }
                },
              )),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: AppColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      fontSize++;
                    });
                  },
                  icon: const Icon(
                    Icons.text_increase,
                    color: AppColor.whiteColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      fontSize--;
                    });
                  },
                  icon: const Icon(
                    Icons.text_decrease,
                    color: AppColor.whiteColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (isBold) {
                        isBold = false;
                      } else {
                        isBold = true;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.format_bold,
                    color: isBold ? Colors.amber : AppColor.whiteColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (isItalic) {
                        isItalic = false;
                      } else {
                        isItalic = true;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.format_italic,
                    color: isItalic ? Colors.amber : AppColor.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Form(
        key: addNoteController.entryFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextIField(controller: titleController, lable: 'Title'),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                color: AppColor.backgroundColor,
                child: ContentTextField(
                  isItalic: isItalic,
                  isBold: isBold,
                  controller: contentController,
                  lable: 'Write something.....',
                  color: pickerColor,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
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
