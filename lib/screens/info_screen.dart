import 'dart:convert';

import 'package:daawa/screens/sora_content_screen.dart';
import 'package:daawa/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Idea del programa',
        // style: whiteSubTitle,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                "Su objetivo es enseñar al nuevo musulmán de manera, organizada en un plan de estudios que contenga la mayor parte de la información que el nuevo musulmán necesita. También  Contiene el Corán. Además de una sección para no musulmanes que buscan la verdad para presentar el Islam",
                // style: text28White,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Center(
              child: Text(
                "Para comunicar:",
                // style: text28White,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    const email = 'alresalaalkhaleda@gmail.com';
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: email,
                    );

                    if (await canLaunch(emailLaunchUri.toString())) {
                      await launch(emailLaunchUri.toString());
                    } else {
                      // Handle the case where Gmail cannot be launched
                    }
                  },
                  child: Image.asset(
                    "assets/images/mail.png",
                    // color: Colors.white,
                    height: 70,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () async {
                    final uri = Uri.parse("https://wa.me/+201090578754");
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalNonBrowserApplication);
                    } else {
                      // can't launch url
                    }
                  },
                  child: Image.asset(
                    "assets/images/whats_app.png",
                    // color: Colors.white,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () async {
                    final uri = Uri.parse("https://t.me/Abam2442");
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalNonBrowserApplication);
                    } else {
                      // can't launch url
                    }
                  },
                  child: Image.asset(
                    "assets/images/telegram.png",
                    // color: Colors.white,
                    height: 60,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
