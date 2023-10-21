import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {


@override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var wtController = TextEditingController();
  var htFeetController = TextEditingController();
  var htInchController = TextEditingController();

  var bmiscore = 0.0;
  var bmitype = "";
  var bgColor = Colors.white;
  var imgPath = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("BMI CALCULCATION"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Measure your BMI",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),

            ),
            SizedBox(
              height: 21,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: wtController,
              decoration: InputDecoration(
                  label: Text("Weight"),
                  prefixIcon: Icon(Icons.line_weight),
                  hintText: 'Enter Your Weight( in Kgs)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  )
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: htFeetController,
              decoration: InputDecoration(
                  label: Text("Height"),
                  prefixIcon: Icon(Icons.height),
                  hintText: 'Enter Your Height ( in Feet)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  )
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: htInchController,
              decoration: InputDecoration(
                  label: Text("Inches"),
                  prefixIcon: Icon(Icons.height),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),

                  )
              ),
            ),
            SizedBox(
              height: 21,
            ),
            ElevatedButton(onPressed: () {
              // calculate BMI here...
              calculateBMI();
            }, child: Text("Calculate BMI")),
            SizedBox(
              height: 11,
            ),
            imgPath == "" ? Container() : Image.asset(imgPath,height: 40),
            SizedBox(
              height: 11,
            ),
            // ? means condition is true then container or Text
            // bmiscore==0.0 means its 0 then container or else will print Text
            // tostringasfixed return upto 2 digit decimal
            bmiscore == 0.0 ? Container() : Text(
              'Your BMI is ${bmiscore.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
            bmitype == "" ? Container() : Text('You\'re $bmitype'),
          ],
        ),
      ),
    );
  }
  void calculateBMI(){
    var wt = int.parse(wtController.text.toString());
    var ft = int.parse(htInchController.text.toString());
    var inch = int.parse(htInchController.text.toString());

    // ft and inch to meter

    var totalInches = (ft * 12) + inch;

    var totalCM = totalInches * 2.54;

    var totalMtr = totalCM/100;

    // var bmi = wt/(totalMtr*totalMtr);

    var bmi = wt/(pow(totalMtr,2.0));

    //to get the type from BMI (Healthy / Overwt / UnderWt

    if (bmi > 25){
      bmitype = "Over Weight";
      bgColor = Colors.red.shade100;
      imgPath = "assets/images/fatty.png";
    }else if (bmi < 18){
      bmitype = "Under Weight";
      bgColor = Colors.yellow.shade100;
      imgPath = "assets/images/poorhealth.png";
    } else {
      bmitype = "Healthly";
      bgColor = Colors.green.shade100;
      imgPath = "assets/images/healthly1.png";
    }

    /* if (bmi >= 18 && bmi <= 25) {
    bmitype = "Over Weight";
  } else if (bmi < 18){
    bmitype = "Under Weight";
  } else {
    bmitype = "Healthly";
  } */

    bmiscore = bmi;
    wtController.text = "";
    htInchController.text = "";
    htFeetController.text = "";
    setState(() {

    });
   // print(bmi);

  }

}
