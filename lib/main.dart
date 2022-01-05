import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/pasabay.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/repositories/post_repository.dart';
import 'package:pahiream_frontend/features/main_page/features/post/presentation/widgets/post_widget.dart';
import 'package:pahiream_frontend/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void displayData() async {
      final PostRepository _postRepository;
      final pasabayData = await _postRepository.fetchPasabayPost(1);
    print('\n\nHELLO FROM MAIN\n\n');
    print(pasabayData);
    print(pasabayData.runtimeType);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'PahireAm v1.0',
      theme: ThemeData(
        //Nunito
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      //   initialRoute: '/',
      //   onGenerateRoute: RouteGenerator.generateRoute,
      home: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: displayData),
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Doing POST in general'),
              PostWidget(),
            ],
          ))),
    );
  }
}
