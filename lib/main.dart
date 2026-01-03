import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/bible_service.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bibleService = BibleService();
  await bibleService.loadBible();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => bibleService),
      ],
      child: HolyBibleApp(),
    ),
  );
}

class HolyBibleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holy Bible Offline',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}
