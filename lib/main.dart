import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: bmicalc(),
    theme: ThemeData(primarySwatch: Colors.lime),
  ));
}

class bmicalc extends StatefulWidget {
  const bmicalc({Key? key}) : super(key: key);

  @override
  State<bmicalc> createState() => _bmicalcState();
}

class _bmicalcState extends State<bmicalc> {
  TextEditingController wtcontroller = TextEditingController();
  TextEditingController ftcontroller = TextEditingController();
  TextEditingController incontroller = TextEditingController();

  var result = "";

  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("BMI CALCULATER"))),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              CupertinoScrollbar.defaultRadiusWhileDragging)),
                      labelText: "Enter your Weight(Kg)",
                      prefixIcon: Icon(Icons.line_weight_rounded)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              CupertinoScrollbar.defaultRadiusWhileDragging)),
                      labelText: "Enter your Height(Feet)",
                      prefixIcon: Icon(Icons.height_outlined)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: incontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              CupertinoScrollbar.defaultRadiusWhileDragging)),
                      labelText: "Enter your Height(Inch)",
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtcontroller.text.toString();
                      var ft = ftcontroller.text.toString();
                      var inch = incontroller.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var iwt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;

                        var bmi = iwt / (tM * tM);

                        var msg = "";

                        if (bmi > 25) {
                          msg = "You're OverWeight!!";
                          bgColor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You're UnderWeight!!";
                          bgColor = Colors.red.shade200;
                        } else {
                          msg = "You're Healthy!!";
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result =
                              "$msg \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill in the blanks!!";
                        });
                      }
                    },
                    child: Text("Calculate")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
