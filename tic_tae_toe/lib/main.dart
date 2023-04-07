import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTrue = true; //the first player is 0
  List<String> displayExoh = ['', '', '', '', '', '', '', '', ''];
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(
        children: [
          Expanded(
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player O',
                        style: myTextStyle,
                      ),
                      Text(
                        ohScore.toString(),
                        style: myTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player X',
                        style: myTextStyle,
                      ),
                      Text(
                        exScore.toString(),
                        style: myTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Center(
                      child: Text(
                        displayExoh[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
        
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (onTrue && displayExoh[index] == '') {
        displayExoh[index] = 'O';
      } else if (!onTrue && displayExoh[index] == '') {
        displayExoh[index] = 'X';
      }

      onTrue = !onTrue;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //checks for 1st row
    if (displayExoh[0] == displayExoh[1] &&
        displayExoh[0] == displayExoh[2] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    }

    //checks for 2nd row
    if (displayExoh[3] == displayExoh[4] &&
        displayExoh[3] == displayExoh[5] &&
        displayExoh[3] != '') {
      _showWinDialog(displayExoh[3]);
    }

    //checks for 3rd row
    if (displayExoh[6] == displayExoh[7] &&
        displayExoh[6] == displayExoh[8] &&
        displayExoh[6] != '') {
      _showWinDialog(displayExoh[6]);
    }

    //checks for 1st column
    if (displayExoh[0] == displayExoh[3] &&
        displayExoh[0] == displayExoh[6] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    }

    //checks for 2nd column
    if (displayExoh[1] == displayExoh[4] &&
        displayExoh[1] == displayExoh[7] &&
        displayExoh[1] != '') {
      _showWinDialog(displayExoh[1]);
    }

    //checks for 3rd column
    if (displayExoh[2] == displayExoh[5] &&
        displayExoh[2] == displayExoh[8] &&
        displayExoh[2] != '') {
      _showWinDialog(displayExoh[2]);
    }

    //checks diagonal
    if (displayExoh[6] == displayExoh[4] &&
        displayExoh[6] == displayExoh[2] &&
        displayExoh[6] != '') {
      _showWinDialog(displayExoh[6]);
    }

    //checks diagonal
    if (displayExoh[0] == displayExoh[4] &&
        displayExoh[0] == displayExoh[8] &&
        displayExoh[0] != '') {
      _showWinDialog(displayExoh[0]);
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: ' + winner),
          );
        });

    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
  }
}
