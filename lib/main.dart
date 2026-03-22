import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ring_hear/home/home_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(1332, 600),
    center: true,
    title: "圈圈练耳"
  );

  //debugPaintSizeEnabled = true;

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "圈圈练耳",
      theme: ThemeData(
        colorSchemeSeed: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "HarmonyOS Sans SC",
        useMaterial3: true,
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))
          )
        ),
      ),
      home: const HomePage(),
    );
  }
}
