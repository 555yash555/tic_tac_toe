import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:tic_tac_toe/constants.dart';

// Create a player

// AudioPlayer player = AudioPlayer();

enum Player { cross, zero, first }

void clear() {
  li = ["", "", "", "", "", "", "", "", ""];
}

bool checker(List list) {
  if (((list[0] == list[1]) && (list[0] == list[2]) && list[0] != "" ||
      (list[3] == list[4]) && (list[3] == list[5]) && list[4] != "" ||
      (list[6] == list[7]) && (list[6] == list[8]) && list[7] != "" ||
      (list[0] == list[3]) && (list[0] == list[6]) && list[3] != "" ||
      (list[1] == list[4]) && (list[1] == list[7]) && list[4] != "" ||
      (list[2] == list[5]) && (list[2] == list[8]) && list[5] != "" ||
      (list[0] == list[4]) && (list[0] == list[8]) && list[4] != "" ||
      (list[6] == list[4]) && (list[6] == list[2] && list[4] != ""))) {
    return true;
  } else {
    return false;
  }
}

int scorex = 0;
int score0 = 0;
bool draw(List list) {
  if (list.contains("")) {
    return false;
  }
  score0++;
  scorex++;
  return true;
}

void score_increment() {
  if (active_player == Player.cross) {
    scorex = scorex + 1;
  } else {
    score0 = score0 + 1;
  }
}

Player active_player = Player.first;
Player next_player() {
  Player nextPlayer =
      active_player == Player.cross ? Player.zero : Player.cross;
  return nextPlayer;
}

void player_switcher() {
  if (active_player != Player.first) {
    active_player = active_player == Player.cross ? Player.zero : Player.cross;
  } else {
    active_player = Player.cross;
  }
}

Map dic = {Player.cross: "X", Player.zero: "O", Player.first: ""};

var li = ["", "", "", "", "", "", "", "", ""];

class multiplayer extends StatefulWidget {
  const multiplayer({Key? key}) : super(key: key);

  @override
  State<multiplayer> createState() => _gamescreenState();
}

class _gamescreenState extends State<multiplayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  clear();
                  score0 = 0;
                  scorex = 0;
                });
              },
              child: Expanded(
                child: Icon(
                  FontAwesomeIcons.repeat,
                  color: neon_color,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Player 0",
                        style: TextStyle(
                            fontSize: 23,
                            color: neon_color,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        score0.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: neon_color,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Player X",
                        style: TextStyle(
                            fontSize: 23,
                            color: neon_color,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        scorex.toString(),
                        style: TextStyle(
                            fontSize: 23,
                            color: neon_color,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, int index) => tablebox(
                      idx: index,
                      player: Text(
                        li[index],
                        style: TextStyle(
                            fontSize: 40,
                            color: neon_color,
                            fontWeight: FontWeight.w700),
                      ),
                      function: () {
                        setState(() {
                          String activeCharacter = dic[active_player];

                          // play();

                          if (li[index] == "") {
                            player_switcher();
                            print(active_player);
                            li[index] = dic[active_player];

                            if (checker(li)) {
                              score_increment();
                              print("won");
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  backgroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  title: const Text(
                                    "THE GAME HAS ENDED",
                                    style: TextStyle(color: neon_color),
                                  ),
                                  content: Text(
                                      ("PLAYER " + dic[active_player] + " WON"),
                                      style: TextStyle(color: neon_color)),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          clear();
                                        });
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        color: Colors.black87,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text(
                                          "NEW MATCH",
                                          style: TextStyle(
                                            color: neon_color,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (draw(li)) {
                              // score_increment();
                              print("won");
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  backgroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  title: const Text(
                                    "THE GAME HAS ENDED",
                                    style: TextStyle(color: neon_color),
                                  ),
                                  content: Text(("IT'S A DRAW"),
                                      style: TextStyle(color: neon_color)),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          clear();
                                        });
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        color: Colors.black87,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text(
                                          "NEW MATCH",
                                          style: TextStyle(
                                            color: neon_color,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        });
                      }),
                ),
              ),
            ),
            Text(
              "CHANCE OF PLAYER: " + dic[next_player()],
              style: TextStyle(
                  fontSize: 20, color: neon_color, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class tablebox extends StatelessWidget {
  final Widget player;
  final VoidCallback function;
  final int idx;
  Border determineBorder(int idx) {
    BorderSide _borderSide = BorderSide(
      color: Color.fromRGBO(27, 3, 163, 100),
      width: 3,
    );
    Border determinedBorder = Border.all();

    switch (idx) {
      case 0:
        determinedBorder = Border(bottom: _borderSide, right: _borderSide);
        break;
      case 1:
        determinedBorder =
            Border(left: _borderSide, bottom: _borderSide, right: _borderSide);
        break;
      case 2:
        determinedBorder = Border(left: _borderSide, bottom: _borderSide);
        break;
      case 3:
        determinedBorder =
            Border(bottom: _borderSide, right: _borderSide, top: _borderSide);
        break;
      case 4:
        determinedBorder = Border(
            left: _borderSide,
            bottom: _borderSide,
            right: _borderSide,
            top: _borderSide);
        break;
      case 5:
        determinedBorder =
            Border(left: _borderSide, bottom: _borderSide, top: _borderSide);
        break;
      case 6:
        determinedBorder = Border(right: _borderSide, top: _borderSide);
        break;
      case 7:
        determinedBorder =
            Border(left: _borderSide, top: _borderSide, right: _borderSide);
        break;
      case 8:
        determinedBorder = Border(left: _borderSide, top: _borderSide);
        break;
    }

    return determinedBorder;
  }

  tablebox(
      {this.player = const SizedBox.expand(),
      required this.function,
      required this.idx});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          child: Center(child: player),
          width: 50,
          height: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 2, 74, 96).withAlpha(60),
                blurRadius: 5.0,
                spreadRadius: 9.0,
                offset: Offset(
                  0.0,
                  -0.0,
                ),
              ),
            ],
            border: determineBorder(idx),
          ),
        ),
      ),
    );
  }
}
