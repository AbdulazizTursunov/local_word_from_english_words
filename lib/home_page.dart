import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(100).toList();
    final data = Hive.box('favorite');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite word'),
      ),
      body: ListView.builder(
          itemCount: words.length,
          itemBuilder: (context, int index) {
            final isFavorite = data.get(index) != null;
            final word = words[index];
            return ListTile(
              title: Text(word),
              trailing: IconButton(
                icon: Icon(
                  isFavorite? Icons.favorite:Icons.favorite_border
                ),
                color: Colors.red,
                onPressed: () async {
                  if (isFavorite) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    await data.delete(index);
                    const snakeBar = SnackBar(
                      content: Text('word clear favorite'),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snakeBar);
                  } else {
                    data.put(index, word);
                    const snakeBar = SnackBar(
                      content: Text('word added favorite'),
                      backgroundColor: Colors.blue,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snakeBar);
                  }

                },
              ),
            );
          }),
    );
  }
}
