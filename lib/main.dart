import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scook_app_detailproduct/pages/detailproduct_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF9F9F9),
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: const DetailProductPage(),
    );
  }
}