import 'package:flutter/material.dart';
import 'package:notepad/page/addNotePage.dart';
import 'package:notepad/page/note_view_page.dart';
import 'package:notepad/page/update_note_value.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/AddNotePage':
        return MaterialPageRoute(builder: (_) => const AddNotePage());
      case '/UpdateNoteValue':
        return MaterialPageRoute(
            builder: (_) => UpdateNoteValue(
                  id: args as int,
                ));
      case '/NoteViewScreen':
        return MaterialPageRoute(
            builder: (_) => NoteViewScreen(
                  id: args as int,
                ));

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
