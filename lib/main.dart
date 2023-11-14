import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tomato/view/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  // try {
  //   WidgetsFlutterBinding.ensureInitialized();
  // } catch (e, st) {
  //   print(e);
  //   print(st);
  // }

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAIY5iiaWO08YrhxFoxkQHYUOUKrl7kZRs",
      authDomain: "tomatify-b02d2.firebaseapp.com",
      projectId: "tomatify-b02d2",
      messagingSenderId: '263537612753',
      appId: '1:263537612753:android:ff16ddcf74fc8dd34f72f0',
      databaseURL:
          'https://tomatify-b02d2-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ),
  );

  //await FirebaseAuth.instance.signInAnonymously();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Tomatify',
      // theme: ThemeData(
      //   primaryColor: Colors.green.shade400,
      //   scaffoldBackgroundColor: Colors.white,
      // ),
      home: SplassScreen(),
    );
  }
}
