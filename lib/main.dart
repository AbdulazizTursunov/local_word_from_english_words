import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_word_from_english_words/home_page.dart';
import 'package:path_provider/path_provider.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
   await Hive.openBox('favorite');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const HomePage(),
    );
  }
}

