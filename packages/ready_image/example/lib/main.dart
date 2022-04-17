import 'package:flutter/material.dart';
import 'package:ready_image/config.dart';
import 'package:ready_image/ready_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadyImageConfig(
      resolveUrl: (context, path) {
        return Uri.parse('http://site.com/$path');
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ReadyImage(path: 'image_1/.png');
  }
}
