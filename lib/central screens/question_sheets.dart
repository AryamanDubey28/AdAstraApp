import 'dart:convert';
import 'package:gsheets/gsheets.dart';

class QuestionSheets {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "setup-11fc6",
  "private_key_id": "d12f3fd81e04d609eecf360addd49b668fe11904",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCbyK6myLlS1+oC\n/hSc2nDDIIDpFiN8mUlBi1ZJBCguD6pJkcV356+baJ3SpcX5Zdyi0O5DR+Aze8WB\n7e5DGNp8Ckk+B5Z3c8hgJPSLTKSjrfaQYTg3WEeG5YKaKgXZoUJ4t8LGRkLYVX+X\nyJXMRN2H/GhqROJe5TneWmQMMhOOZ+WX4oqKLqa6JY/Fg1ekaxAwubiVaVJW0GUI\nOgriEcrNi+OWSqTbhMMbeMEBhLRfzSTU4Y8kDM74alEFMzPQBLEAN/1z4/J1aa5g\n4bknuc+qLECv1938zIWuiff9cmxvifgCR4DySb/jAWkIauhp470kD/NpdXBratoL\nfVAiqWu9AgMBAAECggEAPIRaLJpfO+p6ks0HTuOg2Hxg96tM/9NAXQD29QhzX2lg\nepHxRyIu2s1qOfGCFd9XNby6QlLCqt1THaVDYLdf8L3CNCGYdzD4Tzkr8o1Ei/1B\nglbyErXtm16/PIpEmYWGoASq2oFi6E1Wcq1OW/sIoBISse2ujrS3pUQyB3bQmAnz\nPocx/C5eEiH/09CO7TceLdpI7vVvQbGk2I47y06cv3gQjXEVcrmu8ymcTHbexzL1\nfdRXxnzwsykeAgJqGXKYQseTXBaOUiUqLzlPQtESmwEF8pCYWIsVyNQyoN1CdUUz\nHI2Pp3LedN0exGLGlN13SKHLClI5YHTrtijrtoDdlQKBgQDK7AtV0vwbbL4okEtc\naJUGsbGUQotEY9a+DoAphO9MAlGxg9QjEt5OQZk16T5bQaTpLGuQH5glJv9dpKpy\nAYDBgEPtx2aGD7YVBjt0+4XcPU//7XFyY/zpZm3Ir3UUjVLgLa1b6TEn84L6lHf1\nE9y4Bqpox4ThxnlOCzYFLdnUZwKBgQDEiDMv+cprCicelvu42bHxwXkdw+BLb75P\nXGYV1mDjbWRytozhnQ8OSac9FZvBj/d1HdvzoFjg4Vt+boRaCVo9Ijf+dlzXAeg0\nmvVwALhYipkNpunLdqsqndKGReVrFYgBQjWHRspnXubXGB4oqdGGGrN2yDfFwELS\npj8MdTPIOwKBgFPcMOMLCn0a94sz9rD913iovsaSqZNd30U0IOsHsQ0seC5wWJ8W\nESEuIu8QsWBtRIXIgbtSE0JnV2mPv5DV5iwRogEGQuxsWcdeh/vUZoGaJRGTQysO\n/1pFpmElgbE4pmNW/SnauSHVlO+Ro/F4f+LdfldG/TeBGmiSYYTKahdJAoGAQlej\nx98viGCeAgJ/qM+79NsVsomLrotjF9EeGOMMQ9mKnfqnpgVprq4ISWOA959MrnlM\n5XnMZuVMCGrwPKCJmLdzZW+5OU9IfnGMxqlHkYP/1I7yvx8o+rLZ/T+dCT/0cFBU\nV3z7GFf93sAidiGVPArJaCCASz3ykL9T6zWpLD8CgYAC/J6itX1Jr6gaR+LrC0sZ\nNCluVluaNpV82icgFKysIe/WiqVHtg6KtZ34RDQrr8QS6W18oilbOL1p0lcTRmbG\n/eXKQx8kB14F5J7PQqKpR6Ay4Hbwi6zngQXU+JFbckP723OQX6VaJ1IJ/evCwnAc\nD8iRc5lwPo8BcEdLqRg1hw==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@setup-11fc6.iam.gserviceaccount.com",
  "client_id": "113567451603895706408",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40setup-11fc6.iam.gserviceaccount.com"
}
''';
  static const _spreadsheetId = '1Sajl_F7HEsRHrpUb8_ME8VaCzMKUFXQAMSncwTQNQrU';

  static final GSheets _gsheets = GSheets(_credentials);

  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await getWorkSheet(spreadsheet, "WordToDef");

      final firstRow = WordFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Word?> getById(int id) async {
    if (_userSheet == null) return null;
    final json = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
    return Word.fromJson(json!);
  }

  static Future<Worksheet> getWorkSheet(
    spreadsheet,
    String title,
  ) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}

class WordFields {
  static const String id = 'id';
  static const String word = 'word';
  static const String definition = 'definition';
  static const String difficulty = 'difficulty';

  static List<String> getFields() => [id, word, definition, difficulty];
}

class Word {
  late int? id;
  late String word;
  late String definition;
  late int difficulty;

  Word({
    this.id,
    required this.word,
    required this.definition,
    required this.difficulty,
  });

  Word copy(
    int? id,
    String? word,
    String? definition,
    int? difficulty,
  ) =>
      Word(
        id: id ?? this.id,
        word: word ?? this.word,
        definition: definition ?? this.definition,
        difficulty: difficulty ?? this.difficulty,
      );

  static Word fromJson(Map<String, dynamic> json) => Word(
      id: jsonDecode(json[WordFields.id]),
      word: json[WordFields.word],
      definition: json[WordFields.definition],
      difficulty: jsonDecode(json[WordFields.difficulty]));

  Map<String, dynamic> toJson() => {
        WordFields.id: id,
        WordFields.word: word,
        WordFields.definition: definition,
        WordFields.difficulty: difficulty,
      };
}
