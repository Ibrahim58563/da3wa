import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FinancialTransactionsScreen extends StatefulWidget {
  const FinancialTransactionsScreen({super.key});

  @override
  State<FinancialTransactionsScreen> createState() =>
      _FinancialTransactionsScreenState();
}

class _FinancialTransactionsScreenState
    extends State<FinancialTransactionsScreen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/faith.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data[1]['lessons'];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // readJson();
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
