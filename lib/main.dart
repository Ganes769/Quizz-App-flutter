// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/qiuzzbrain.dart';
import 'package:quizz/question.dart';

void main() {
  runApp(qiuzz());
}

class qiuzz extends StatefulWidget {
  const qiuzz({Key? key}) : super(key: key);

  @override
  State<qiuzz> createState() => _qiuzzState();
}

QuizzBrain quizzBrain = QuizzBrain();

class _qiuzzState extends State<qiuzz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: quizzbody(),
        )),
      ),
    );
  }
}

class quizzbody extends StatefulWidget {
  const quizzbody({Key? key}) : super(key: key);

  @override
  State<quizzbody> createState() => _quizzbodyState();
}

class _quizzbodyState extends State<quizzbody> {
  List<Widget> scorekeeper = [];

  int questionum = 0;

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Text(
                quizzBrain.getquestiontext(questionum),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: TextButton(
            onPressed: () {
              bool correct = quizzBrain.correctans(questionum);

              setState(() {
                if (correct == true) {
                  scorekeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else
                  scorekeeper.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                questionum++;
              });
            },
            child: Container(
              width: 300,
              height: 50,
              color: Colors.green,
              child: Center(
                child: Text(
                  "True",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: TextButton(
            onPressed: () {
              bool correct = quizzBrain.correctans(questionum);

              setState(() {
                questionum++;
                if (correct == false) {
                  scorekeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                } else
                  scorekeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
              });
            },
            child: Container(
              width: 300,
              height: 50,
              color: Colors.green,
              child: Center(
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
