class Verse {
  final String book;
  final int chapter;
  final int verse;
  final String text;
  final List<String> notes;

  Verse({
    required this.book,
    required this.chapter,
    required this.verse,
    required this.text,
    required this.notes,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      book: json['book'],
      chapter: json['chapter'],
      verse: json['verse'],
      text: json['text'],
      notes: List<String>.from(json['notes'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        'book': book,
        'chapter': chapter,
        'verse': verse,
        'text': text,
        'notes': notes,
      };
}
