import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuel Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final currencyTypes = ['LKR', 'USD', 'POUNDS'];
  String currency = 'USD';
  String resultText = "";
  TextEditingController distanceController = TextEditingController();
  TextEditingController travelController = TextEditingController();
  TextEditingController fuelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: GradientAppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.indigo,
          leading: Icon(
            Icons.directions_car,
            size: 30.0,
          ),
          title: Text(
            "Fuel Calculator",
            style: TextStyle(fontFamily: 'Righteous', fontSize: 28.0),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: distanceController,
                  decoration: InputDecoration(
                    labelText: 'Distance Per Fuel Unit : ',
                    icon: Icon(
                      Icons.directions_run,
                      color: Colors.lightBlueAccent,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  style: TextStyle(fontSize: 20.0, fontFamily: "OpenSans"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  width: 100.0,
                  height: 20.0,
                ),
                TextFormField(
                  controller: travelController,
                  decoration: InputDecoration(
                    labelText: 'Distance Travelled : ',
                    icon: Icon(
                      Icons.directions_bus,
                      color: Colors.lightBlueAccent,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  style: TextStyle(fontSize: 20.0, fontFamily: "OpenSans"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  width: 100.0,
                  height: 20.0,
                ),
                TextFormField(
                  controller: fuelController,
                  decoration: InputDecoration(
                    labelText: 'Price Per Fuel Unit : ',
                    icon: Icon(
                      Icons.attach_money,
                      color: Colors.lightBlueAccent,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  style: TextStyle(fontSize: 20.0, fontFamily: "OpenSans"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  width: 100.0,
                  height: 20.0,
                ),
                DropdownButton<String>(
                  items: currencyTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: currency,
                  onChanged: (String value) {
                    onDropDownChanged(value);
                  },
                ),
                SizedBox(
                  width: 100.0,
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text('Calculate'),
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      resultText = calculateFuelPrice();
                    });
                  },
                ),
                SizedBox(
                  width: 100.0,
                  height: 25.0,
                ),
                Text(
                  resultText,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'OpenSans',
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  onDropDownChanged(String value) {
    setState(() {
      this.currency = value;
    });
  }

  String calculateFuelPrice() {
    double distanceFuelUnit = double.parse(distanceController.text);
    double distanceTravelled = double.parse(travelController.text);
    double priceFuelUnit = double.parse(fuelController.text);

    double totalCost = (distanceTravelled / distanceFuelUnit) * priceFuelUnit;
    String resultText = "Total Cost : " + totalCost.toString() + " " + currency;

    return resultText;
  }
}
