import 'package:flutter/material.dart';
import 'package:tic_tac_toe/multiplayer.dart';
import 'player_choosing.dart';
import 'single_player.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black87,
          primaryColor: Colors.black87,
          appBarTheme: AppBarTheme(
            color: Colors.black87,
          )),
      initialRoute: "/",
      routes: {
        "/": (context) => playerchoosing(),
        "/multiplayer": (context) => multiplayer(),
        "/singleplayer": (context) => singleplayer(),
      },
    );
  }
}
