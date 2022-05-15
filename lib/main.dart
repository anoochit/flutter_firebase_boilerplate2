import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_boilerplate/const.dart';
import 'package:flutter_firebase_boilerplate/controller/app_controller.dart';
import 'package:flutter_firebase_boilerplate/firebase_options.dart';
import 'package:flutter_firebase_boilerplate/page/home.dart';
import 'package:flutter_firebase_boilerplate/page/settings.dart';
import 'package:flutter_firebase_boilerplate/page/signin.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: (auth.currentUser?.uid == null) ? '/signin' : '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
