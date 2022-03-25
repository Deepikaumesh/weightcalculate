import 'package:flutter/material.dart';
import 'package:weightcalculate/clear.dart';
import 'package:weightcalculate/widgets/leftbar.dart';
import 'package:weightcalculate/widgets/rightbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _weightcontroller = TextEditingController();
  TextEditingController bmicontroller=TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Weight Calculator",
          style: TextStyle(
              color: Colors.yellowAccent,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                child: TextField(
                  controller: _heightcontroller,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.pink,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(.3))),
                ),
              ),
              Container(
                width: 130,
                child: TextField(
                  controller: _weightcontroller,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.blue,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.3))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              double _h = double.parse(_heightcontroller.text);
              double _w = double.parse(_weightcontroller.text);
              setState(() {
                _bmiResult = _w / (_h * _h);
                if (_bmiResult > 25) {
                  _textResult = "you are over weight";
                  Icon(Icons.verified_user, color: Colors.white,size: 5,);
                } else if (_bmiResult >= 18 && _bmiResult <= 24.9) {
                  _textResult = "Normal weight";
                } else {
                  _textResult = "you are under weight";
                }
              });
            },
            child: Container(
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow.shade200),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              _bmiResult.toString(),
               style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.teal),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow.shade200),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: GestureDetector(
              child: FlatButton(
                child: Text('Clear all',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                    textAlign: TextAlign.center),
                onPressed: () {
                  if(_bmiResult.toString().isEmpty) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ClearMe()));
                  }
                  else
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    }
                  // _weightcontroller.clear();
                  // _heightcontroller.clear();
                },
              ),

            ),
          ),

          SizedBox(height: 30,),
          Container(
            height: 60,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,),
    child: FlatButton(
      padding: EdgeInsets.all(4),
    child: Text('Clear Height&Weight',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.teal),
    textAlign: TextAlign.center),
    onPressed: () {
      _weightcontroller.clear();
      _heightcontroller.clear();

    },
          ),),






          SizedBox(
            height: 50,
          ),
          LeftBar(
            barwidth: 20,
          ),
          SizedBox(
            height: 15,
          ),
          LeftBar(
            barwidth: 30,
          ),
          SizedBox(
            height: 20,
          ),
          LeftBar(
            barwidth: 30,
          ),
          SizedBox(
            height: 10,
          ),
          RightBar(barwidth: 50),
          SizedBox(
            height: 10,
          ),
          RightBar(barwidth: 30),
          SizedBox(
            height: 20,
          ),
          RightBar(barwidth: 20),
        ],
      )),
    );
  }
}
