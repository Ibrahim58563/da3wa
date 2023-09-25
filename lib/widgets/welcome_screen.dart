// import 'package:daawa/constants/assets.dart';
// import 'package:daawa/screens/categories_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const CategoriesScreen()));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Lottie.asset(
//         Assets.animationsLoading,
//         height: 250,
//       )),
//     );
//   }
// }
