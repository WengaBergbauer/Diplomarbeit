import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  final TextEditingController _timeController = TextEditingController();
  late String _formatted = DateFormat('hh:mm').format(DateTime.now());
  List<String> dropdownItems = ['Normale Buchung', 'Dienstgang', 'Homeoffice'];
  String selectedDropdownItem = 'Normale Buchung';
  bool isChecked = false;

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _formatted = DateFormat('hh:mm').format(DateTime.now());
      });
    });  }

  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 180.0),
              Text(
                _formatted,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Buchungsende',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              if (isChecked == false)
                Center(
                  child: DropdownButton<String>(
                    value: selectedDropdownItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDropdownItem = newValue!;
                      });
                    },
                    items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Implement booking logic here
                },
                child: Text('Buchen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}