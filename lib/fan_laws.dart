import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

enum Props { airflow, pressureDrop, rpm, pShaft }

class FanLaws extends StatefulWidget {
  const FanLaws({Key? key}) : super(key: key);

  @override
  State<FanLaws> createState() => _FanLawsState();
}

class _FanLawsState extends State<FanLaws> {
  Props? selectedProp = Props.airflow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fan Laws"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildCard(Icons.air, 'AirFlow', Props.airflow),
          buildCard(Icons.speed, 'RPM', Props.rpm),
          buildCard(Icons.arrow_forward, 'PressDrop', Props.pressureDrop),
          buildCard(Icons.power_input, 'PowerInp', Props.pShaft),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    print("Calculate Pressed");
                  },
                  child: const Text('Calculate'),
                ),
                FlatButton(
                  color: Colors.black,
                  onPressed: () {
                    print("reset Pressed");
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myText() {
    return const Flexible(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(color: Colors.red),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          isCollapsed: true,
          contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
        ),
        keyboardType: TextInputType.number,
      ),
    ));
  }

  Card buildCard(IconData iconType, String title, Props propType) {
    return Card(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconType,
            color: Colors.red,
          ),
          SizedBox(width: 5),
          Text(
            "$title",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          SizedBox(width: 40),
          myText(),
          myText(),
          Radio<Props>(
              activeColor: Colors.red,
              hoverColor: Colors.blue,
              focusColor: Colors.blue,
              value: propType,
              groupValue: selectedProp,
              onChanged: (Props? value) {
                setState(() {
                  selectedProp = value;
                });
              })
        ],
      ),
    );
  }
}
