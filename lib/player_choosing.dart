import 'package:flutter/material.dart';
import 'constants.dart';

class playerchoosing extends StatelessWidget {
  const playerchoosing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Player_displayer("SINGLEPLAYER", (() {
                Navigator.pushReplacementNamed(context, "/singleplayer");
              })),
              SizedBox(
                height: 100,
              ),
              Player_displayer("MULTIPLAYER", (() {
                Navigator.pushReplacementNamed(context, "/multiplayer");
              }))
            ],
          ),
        ),
      ),
    );
  }
}

class Player_displayer extends StatelessWidget {
  final String playertobedisplayed;
  final VoidCallback function;

  Player_displayer(this.playertobedisplayed, this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: neon_color),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          playertobedisplayed,
          style: playerinfo,
        ),
      ),
    );
  }
}
