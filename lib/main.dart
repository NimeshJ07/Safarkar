import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safarkar/firebase_options.dart';
import 'package:safarkar/src/features/authentication/screens/splashscreen/splashscreen.dart';
import 'package:safarkar/src/repo/auth_repo/auth_repos.dart';
import 'package:safarkar/src/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: SafarTheme.lightTheme,
      darkTheme: SafarTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("SafarKar", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Center(
        child:
            Text("HomePage", style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
