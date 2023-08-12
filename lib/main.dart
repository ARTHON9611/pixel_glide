import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel_glide/screens/category.dart';
import 'package:pixel_glide/screens/home.dart';
import 'package:pixel_glide/screens/search.dart';
import 'package:pixel_glide/widgets/search_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixel Glide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  homeScreen(),
    );
  }
}


