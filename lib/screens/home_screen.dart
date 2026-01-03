import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/bible_service.dart';
import 'bible_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bibleService = Provider.of<BibleService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Holy Bible Offline')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Bible...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => bibleService.search(value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bibleService.searchResults.length,
              itemBuilder: (context, index) {
                final verse = bibleService.searchResults[index];
                return ListTile(
                  title: Text('${verse.book} ${verse.chapter}:${verse.verse}'),
                  subtitle: Text(verse.text),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BibleScreen(verse: verse),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
