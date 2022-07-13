import 'package:notepad/LocalDatabase/local_database_helper.dart';

class AddNoteModel {
  final int dateTime;
  final String title;
  final String content;
  final String colorCode;
  AddNoteModel(
      {required this.dateTime,
      required this.title,
      required this.content,
      required this.colorCode});
  factory AddNoteModel.fromLocalDB(Map<String, dynamic> json) => AddNoteModel(
        dateTime: json[DatabaseHelper.dateTimeColumn],
        title: json[DatabaseHelper.titleColumn],
        content: json[DatabaseHelper.contentColumn],
        colorCode: json[DatabaseHelper.colorCodeColumn],
      );

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.colorCodeColumn: colorCode,
      DatabaseHelper.titleColumn: title,
      DatabaseHelper.contentColumn: content,
      DatabaseHelper.dateTimeColumn: dateTime,
    };
  }
}
