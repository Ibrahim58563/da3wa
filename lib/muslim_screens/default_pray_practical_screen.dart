import 'package:daawa/widgets/wuduu_widget.dart';
import 'package:flutter/material.dart';

class DefaultPrayPracticalScreen extends StatefulWidget {
  final String title;
  final List items;
  const DefaultPrayPracticalScreen(
      {super.key, required this.title, required this.items});

  @override
  State<DefaultPrayPracticalScreen> createState() => DefaultPrayScreenState();
}

class DefaultPrayScreenState extends State<DefaultPrayPracticalScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WuduuWidget(
          items: widget.items,
          description: "",
          // title: "Tu familia",
        ),
      ),
    );
  }
}
