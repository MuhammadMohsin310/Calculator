import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "Calculator App",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: CalculatorApp(),
      ),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var List = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  var ListOfOp = ["AC", "=", "+", "-", "*", "/", "<", "."];
  var input = "";
  var output = "";
  var operation = "";


  onButtonclicked(value){
    if (value == "AC") {
      input = "";
      output = "";
    } else if(value == "<"){
      input = input.substring(0,input.length -1);
    }else if (value == "=") {
      var userInput = input;
      userInput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
    }else{
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 65,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 51, 50, 50),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(input,
              style: TextStyle(color: Colors.white,fontSize: 48,),),
              SizedBox(height: 10,),
                Text(output,
                style: TextStyle(color: Colors.grey,fontSize: 35,),),
                SizedBox(height: 20,),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => onButtonclicked(ListOfOp[0]),
              child: Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 204, 201, 201),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "AC",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(ListOfOp[6]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 204, 201, 201),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "<",
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 204, 201, 201),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                "%",
                style: TextStyle(color: Colors.black, fontSize: 40),
              )),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(ListOfOp[5]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "/",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => onButtonclicked(List[6]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "7",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(List[7]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "8",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(List[8]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "9",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(ListOfOp[4]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "x",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => onButtonclicked(List[3]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(List[4]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "5",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(List[5]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "6",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(ListOfOp[3]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "-",
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => onButtonclicked(List[0]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(List[1]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(List[2]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(ListOfOp[2]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () => onButtonclicked(List[9]),
              child: Container(
                height: 70,
                width: 160,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 77, 77, 77),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    )
                    // shape: BoxShape.circle,
                    ),
                child: Center(
                  child: Text(
                    "0",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(ListOfOp[7]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 77, 77, 77),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    ".",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => onButtonclicked(ListOfOp[1]),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "=",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
