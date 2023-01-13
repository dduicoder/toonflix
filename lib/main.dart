import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class ScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: ScrollBehavior(),
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      home: HomeScreen(),
    );
  }
}
