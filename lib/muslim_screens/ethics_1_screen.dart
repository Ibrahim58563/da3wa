import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/default_lesson_widget.dart';

class Ethics1Screen extends StatefulWidget {
  const Ethics1Screen({super.key});

  @override
  State<Ethics1Screen> createState() => _Ethics1ScreenState();
}

class _Ethics1ScreenState extends State<Ethics1Screen> {
  List _items = [];

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/lessonsJson/muslim_final.json');
    final data = await json.decode(response);
    print(data);

    setState(() {
      _items = data['Muslim'][8]['lessons'];
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultLessonBodyWidget(
          items: _items,
          description:
              "Los buenos modales y la buena ética en el Islam no son algo complementario o tan sólo un adorno, sino una parte fundamental y esencial que guarda relación con todos los ámbitos de la religión. El Islam otorga a la ética una gran importancia y una posición elevada, y esto se observa en sus enseñanzas y leyes. El profeta Muhámmad (que la paz y las bendiciones de Allah sean con él) fue enviado para enseñar la ética y los mejores modales.",
          title: "Tus buenos modales en el Islam",
        ),
      ),
    );
  }
}
