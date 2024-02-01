import 'package:final_exam/utils/route_utils.dart';
import 'package:final_exam/views/screens/addNote_page.dart';
import 'package:final_exam/views/screens/home_page.dart';
import 'package:final_exam/views/screens/like_page.dart';
import 'package:final_exam/views/screens/note_page.dart';
import 'package:final_exam/views/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller/likeNotes_controller.dart';
import 'firebase_options.dart';
import 'helpers/db_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await DbHelper.dbHelper.initDB();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LikeNoteController likeNoteController = Get.put(LikeNoteController());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homePage,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.addNotePage: (context) => AddNotePage(),
        MyRoutes.notePage: (context) => const NotePage(),
        MyRoutes.likePage: (context) => const LikePage(),
      },
    );
  }
}
