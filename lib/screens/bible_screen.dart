import 'package:flutter/material.dart';
import '../models/verse.dart';

class BibleScreen extends StatelessWidget {
  final Verse verse;
  BibleScreen({required this.verse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${verse.book} ${verse.chapter}:${verse.verse}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(verse.text, style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              if (verse.notes.isNotEmpty)
                ...verse.notes.map((n) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text("📖 Note: $n",
                          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey[700])),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
