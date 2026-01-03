import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../models/verse.dart';

class BibleService extends ChangeNotifier {
  Map<String, Map<int, List<Verse>>> _bible = {};

  List<Verse> searchResults = [];

  Future<void> loadBible() async {
    final List<String> books = [
      "Genesis","Exodus","Leviticus","Numbers","Deuteronomy",
      // ... add all canonical + Apocrypha book names here
    ];

    for (String book in books) {
      final String data = await rootBundle.loadString('assets/bible/$book.json');
      final Map<String, dynamic> jsonResult = json.decode(data);
      Map<int, List<Verse>> chapters = {};
      for (var chap in jsonResult['chapters']) {
        int chapNum = chap['chapter'];
        chapters[chapNum] = (chap['verses'] as List)
            .map((v) => Verse.fromJson(v))
            .toList();
      }
      _bible[book] = chapters;
    }
    notifyListeners();
  }

  Verse getVerse(String book, int chapter, int verseNum) {
    return _bible[book]![chapter]!.firstWhere((v) => v.verse == verseNum);
  }

  void search(String query) {
    searchResults = [];
    _bible.forEach((book, chapters) {
      chapters.forEach((chapNum, verses) {
        for (var v in verses) {
          if (v.text.toLowerCase().contains(query.toLowerCase())) {
            searchResults.add(v);
          }
        }
      });
    });
    notifyListeners();
  }
}
