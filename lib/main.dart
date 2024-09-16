import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:two_zero_four_eight/view/pages/mode_view.dart';
import '../data/helper/dependencies.dart' as dependencies;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Two Zero Four Eight',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      home: const ModeView(),
      theme: ThemeData(
        textTheme: GoogleFonts.nerkoOneTextTheme(),
        primaryTextTheme: GoogleFonts.nerkoOneTextTheme(),
      ),
    );
  }
}
