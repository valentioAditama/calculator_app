import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Calculator"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customOutlineButton("9"),
                customOutlineButton("8"),
                customOutlineButton("7"),
                customOutlineButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("6"),
                customOutlineButton("5"),
                customOutlineButton("4"),
                customOutlineButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("3"),
                customOutlineButton("2"),
                customOutlineButton("1"),
                customOutlineButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("C"),
                customOutlineButton("0"),
                customOutlineButton("="),
                customOutlineButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 35.0, color: Colors.black54),
        ),
      ),
    );
  }

  late int first, second;
  late String res, text = "";
  late String opp;

  void btnClicked(String btnText) {
    if(btnText == "C"){
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+"){
      btnText == "-" || btnText == "/" || btnText == "x";
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "="){
      second = int.parse(text);
      if (opp == "+"){
        res = (first + second).toString();
      }
      if (opp == "-"){
        res = (first - second).toString();
      }
      if (opp == "x"){
        res = (first * second).toString();
      }
      if (opp == "/"){
        res = (first / second).toString();
      }
    }else {
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }
  
  
}
