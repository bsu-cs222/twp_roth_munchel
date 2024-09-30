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
    return MaterialApp(
      title: 'Wikipedia Change Search Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 30),
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
  WikipediaChange changeRecord =
      WikipediaChange(user: 'User', timestamp: DateTime.now());

  final _finalWikipediaUrl = UriBuilder();
  String output = '';
  Future<String>? _future;
  String theString = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: TextField(controller: _textController),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _onButtonPressed,
                  child: const Text('Go'),
                ),
              ),
              const SizedBox(
                width: 40,
                height: 50,
              ),
              Column(
                children: [
                  Center(child: WikipediaChangeWidget(changeRecord)),
                ],
              ),
              Text(output)
            ],
          ),
        ),
      ],
    );
  }

  void _onButtonPressed() async {
    setState(() {
      _future = http.read(
          Uri.parse(_finalWikipediaUrl.finalUrlBuilder(_textController.text)),
          headers: {
            'user-agent':
                'Revision Reporter/0.1 (https://www.cs.bsu.edu/~pvgestwicki/courses/cs222Fa24; brody.roth@bsu.edu/cole.munchel@bsu.edu)'
          });
    });
    theString = (await _future)!;
    Map<String, String> jsonDecoder = jsonDecode(theString);
    final parser = WikipediaParser();
    output = (parser.parse(jsonDecoder));
  }
}

//Do we need this part if output is what were really after

class WikipediaChangeWidget extends StatelessWidget {
  final WikipediaChange changeRecord;

  const WikipediaChangeWidget(this.changeRecord, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('User: ${changeRecord.user}'),
        Text('Timestamp: ${changeRecord.timestamp.toString()}'),
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
