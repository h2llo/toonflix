import 'package:flutter/material.dart';
import 'package:toonflix/Screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
              displayLarge: TextStyle(color: Color.fromARGB(255, 14, 23, 72))),
          cardColor: const Color(0xfff4eddb),
          colorScheme:
              ColorScheme.fromSwatch(backgroundColor: const Color(0xffe7626c)),
        ),
        home: const HomeScreen());
  }
}

class myLargeTitle extends StatefulWidget {
  const myLargeTitle({
    super.key,
  });

  @override
  State<myLargeTitle> createState() => _myLargeTitleState();
}

class _myLargeTitleState extends State<myLargeTitle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'my large title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
