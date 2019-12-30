import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final TextEditingController _controller = new TextEditingController();

  int radioValue = 0;
  double finalResult = 0.0;
  String formattedResult = "";
  void handleRadioValueChanged(int value)
  {
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          finalResult = calculation(_controller.text, 0.06);
          formattedResult = "Your weight on planet Pluto is $finalResult lbs";
          break;
        case 1:
          finalResult = calculation(_controller.text, 0.38);
          formattedResult = "Your weight on planet Mars is $finalResult lbs";
          break;
        case 2:
          finalResult = calculation(_controller.text, 0.91);
          formattedResult = "Your weight on planet Venus is $finalResult lbs";
          break;
      }


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset("images/planet.png", height: 133, width: 200,),
            Container(margin: const EdgeInsets.all(3.0),alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                TextField(
                  cursorColor: Colors.orange,

                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Your weight",
                    hintText: "Enter here",
                    icon: Icon(Icons.person_outline)
                  ),
                ),
                Padding(padding: const EdgeInsets.all(4.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio<int>(activeColor: Colors.orange, value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                    Text("Pluto", style: TextStyle(color: Colors.white),),
                    Radio<int>(activeColor: Colors.redAccent,value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                    Text("Mars", style: TextStyle(color: Colors.white),),
                    Radio<int>(activeColor: Colors.brown,value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                    Text("Venus", style: TextStyle(color: Colors.white),),
                  ],
                ),
                // Result
                Padding(padding: const EdgeInsets.all(25.6)),
                Text( _controller.text.isEmpty ? "Please enter weight" : "$formattedResult", style: TextStyle(color: Colors.blueAccent, fontSize: 19.5, fontWeight: FontWeight.w800),)
              ],
            ),)
          ],
        ),
      ),
    );
  }

  double calculation(String text, double d) {
    if(int.parse(text).toString().isNotEmpty && int.parse(text) > 0)
      {
        return int.parse(text) * d;
      }
  }
}
