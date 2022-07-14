import 'package:notepad/LocalDatabase/local_database_helper.dart';

class AddNoteModel {
  final int dateTime;
  final String title;
  final String content;
  final String colorCode;
  final int? id;
  final int isBold;
  final int isItalic;
  final double fontSize;
  AddNoteModel(
      {required this.dateTime,
      required this.title,
      required this.content,
      required this.colorCode,
      required this.fontSize,
      required this.isBold,
      required this.isItalic,
      this.id});
  factory AddNoteModel.fromLocalDB(Map<String, dynamic> json) => AddNoteModel(
        dateTime: json[DatabaseHelper.dateTimeColumn],
        title: json[DatabaseHelper.titleColumn],
        content: json[DatabaseHelper.contentColumn],
        colorCode: json[DatabaseHelper.colorCodeColumn],
        isBold: json[DatabaseHelper.columnIsBold],
        isItalic: json[DatabaseHelper.columnIsItalic],
        fontSize: json[DatabaseHelper.columnFontSize],
        id: json[DatabaseHelper.columnId],
      );

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.colorCodeColumn: colorCode,
      DatabaseHelper.titleColumn: title,
      DatabaseHelper.contentColumn: content,
      DatabaseHelper.dateTimeColumn: dateTime,
      DatabaseHelper.columnIsBold:isBold,
      DatabaseHelper.columnIsItalic:isItalic,
      DatabaseHelper.columnFontSize:fontSize,
    };
  }
}
