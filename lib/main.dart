import 'package:flutter/material.dart';
import 'package:trills/cache_magement.dart';
import 'package:trills/util/constant.dart';
import 'routes.dart';

void main() async {
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
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thrills',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 75, 22, 76),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          ),
        ),

        useMaterial3: true,
      ),
      initialRoute: Routes.splashScreen,
      routes: Routes.allRoutes,
    );
  }
}
