import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/repository/theme_model.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;
import 'package:path_provider/path_provider.dart';

List<Question> parseQuestions(String htmlContent) {
  List<Question> questions = [];
  htmlContent = htmlContent.replaceAll('&nbsp', '');
  var elements = htmlContent.split(
      RegExp(r'(?<=\d+\.)\s*')); // Savollarni raqam va nuqta bilan ajratadi
  String questionText = '';
  Map<String, String> answers = {};

  for (var element in elements) {
    if (element.trim().isEmpty) continue;

    var lines = element.trim().split(RegExp(r'\n|(?=[A-D]\))'));
    if (lines.isEmpty) continue;

    int optionStartIndex =
        lines.indexWhere((line) => RegExp(r'^[A-D]\)\s').hasMatch(line.trim()));
    if (optionStartIndex == -1) {
      questionText += lines.join(' ');
      continue;
    }

    questionText += lines.sublist(0, optionStartIndex).join(' ').trim();

    for (var line in lines.sublist(optionStartIndex)) {
      final List matches = RegExp(r'([A-D])\)\s*([^A-D]*)(?=[A-D]\)|$)')
          .allMatches(line.trim())
          .toList();

      for (var match in matches) {
        String key = match.group(1)!;
        String value = match.group(2)!.trim();
        answers[key] = value;
      }
    }

    if (answers.isNotEmpty) {
      questions.add(Question(questionText, answers));
      questionText = '';
      answers = {};
    }
  }

  return questions;
}

Future<List<ThemeModel>> parseFromFile(Uint8List bytes) async {
  try {
    String fileContents = await readFileAsText(bytes);

    dom.Document document = html_parser.parse(fileContents);
    final List<String> selectedElements = document
        .querySelectorAll('span[style="font-weight:bold;"]')
        .map((e) => e.text)
        .toList();

    List<ThemeModel> themes = [];
    final lines = document.body!.text.trim().split('\n');

    for (var element in selectedElements) {
      List<String> results = [];
      int index = lines.indexOf(element);
      for (var i = index + 1; i < lines.length; i++) {
        results.add(lines[i]);
        if (selectedElements.contains(lines[i])) {
          break;
        }
      }
      int lastIndex = lines
          .map((e) => e.toLowerCase())
          .toList()
          .lastIndexOf(element.toLowerCase());
      List<String> answers = [];

      for (var i = lastIndex + 1; i < lines.length; i++) {
        if (isLetter(lines[i])) {
          answers.add(lines[i]);
        }
        if (selectedElements.contains(lines[i])) {
          break;
        }
      }

      final List<Question> list = parseQuestions(results.join('\n'));
      if (list.isNotEmpty && answers.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          String? option1 = list[i].answers['A'];
          list[i].answers['A'] = list[i].answers[answers[i]] ?? '';
          list[i].answers[answers[i]] = option1 ?? '';
        }
        themes.add(
          ThemeModel(
            name: element,
            quiz: list
                .map(
                  (e) => Quiz(
                    options: e.answers.values.toList(),
                    question: e.questionText,
                  ),
                )
                .toList(),
            createdTime: DateTime.now().millisecondsSinceEpoch.toString(),
            quizCount: list.length,
            duration: 40,
          ),
        );
      }
    }
    return themes;
  } catch (e) {
    print('Failed to read file: $e');
    return [];
  }
}

bool isLetter(String input) {
  return RegExp(r'^[a-zA-Z]$').hasMatch(input);
}

Future<String> readFileAsText(Uint8List bytes) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/temp_file.txt');
  await file.writeAsBytes(bytes);
  String contents = await file.readAsString();
  await file.delete(); // Удаляем временный файл после чтения
  return contents;
}
