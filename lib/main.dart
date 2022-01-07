import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pahiream_frontend/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  bool isPasabay = true;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print(widget.isPasabay);
    return Provider<bool>(
        create: (context) => widget.isPasabay,
        child: MaterialApp(
          debugShowCheckedModeBanner: widget.isPasabay,
          title: 'PahireAm v1.0',
          theme: ThemeData(
            textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
