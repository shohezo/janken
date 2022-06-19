import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String computerHand = '✊';
  String myHand = '✊';
  String result = '引き分け';

  // 関数の定義も、State の {} の中で行います。
  void selectHand(String selectedHand) {
    myHand = selectedHand; // myHand に 引数として受けとった selectedHand を代入します。
    print(myHand);
    generateComputerHand(); // コンピューターの手を決める。
    judge(); // 勝敗を判定する。
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  //ランダムに生成された数字を文字列に変換
  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '✋';
      default:
        return '✊';
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '✋' ||
        myHand == '✋️' && computerHand == '✊️') {
      result = '勝ち';
    } else{
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            computerHand,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            myHand,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectHand('✊');
                },
                child: Text('✊'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand('✌️');
                },
                child: Text('✌️'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand('✋️');
                },
                child: Text('✋'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
