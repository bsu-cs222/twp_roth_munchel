import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twp_roth_munchel/uri_builder.dart';
import 'wikipedia_parser.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 32),
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  final _finalWikipediaUrl = UriBuilder();
  String output = '';
  Future<String>? _future;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _onButtonPressed,
            child: const Text('Go'),
          ),
          TextField(controller: _textController),
          Text(output),
        ],
      ),
    );
  }

  void _onButtonPressed() {
    setState(() {
      _future = http.read(
          Uri.parse(_finalWikipediaUrl.finalUrlBuilder(_textController.text)));
      final jsonDecodedResponse = jsonDecode(_future as String);
      final parser = WikipediaParser();
      output = (parser.parse(jsonDecodedResponse));
    });
  }
}
