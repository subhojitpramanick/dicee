import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[600],
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dice',
              style: TextStyle(
                fontFamily: 'Honk',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.red[900],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: <Widget>[
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png')),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      rightDiceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png')),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: Colors.yellow[200],
              margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
              child: Center(
                child: ListTile(
                  leading: Icon(Icons.score, color: Colors.red[900]),
                  title: Text(
                    'TOTAL: ${leftDiceNumber + rightDiceNumber}',
                    style: TextStyle(
                      // color: Colors.red[900],
                      fontSize: 40.0,
                      fontFamily: 'Honk',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.yellow[200],
            margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
            child: Center(
              child: ListTile(
                leading: Icon(Icons.touch_app_outlined, color: Colors.red[900]),
                title: Text(
                  'ROLL THE DICE',
                  style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 40.0,
                    fontFamily: 'Kablammo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  setState(() {
                    leftDiceNumber = Random().nextInt(6) + 1;
                    rightDiceNumber = Random().nextInt(6) + 1;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
