import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:notepad/LocalDatabase/local_database_helper.dart';
import 'package:notepad/helper/app_helper.dart';
import 'package:notepad/model/add_note_model.dart';

class AddNoteController extends ControllerMVC {
  late OverlayEntry loader;

  late GlobalKey<FormState> entryFormKey;
  late GlobalKey<ScaffoldState> scaffoldKey;

  AddNoteController() {
    loader = AppHelper.overlayLoader(state?.context);

    entryFormKey = GlobalKey<FormState>();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  Future<int> addNote(AddNoteModel model) async {
    return await DatabaseHelper.instance.insertNote(model);
  }
}
