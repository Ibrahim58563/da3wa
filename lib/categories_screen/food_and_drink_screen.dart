import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodAndDrinkScreen extends StatefulWidget {
  const FoodAndDrinkScreen({super.key});

  @override
  State<FoodAndDrinkScreen> createState() => _FoodAndDrinkScreenState();
}

class _FoodAndDrinkScreenState extends State<FoodAndDrinkScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/faith.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data[2]['lessons'];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_items[index]['title']),
                subtitle: Text(_items[index]['body']),
              );
            },
          ))
        ],
      ),
    );
  }
}
