import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  final TextEditingController _timeController = TextEditingController();

  DateTime now = DateTime.now();
  late final String _formatted = DateFormat('hh:mm').format(now);
  List<String> dropdownItems = ['Normale Buchung', 'Dienstgang', 'Homeoffice'];
  String selectedDropdownItem = 'Normale Buchung';
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 180.0),
              // Display current time
              Text(
                _formatted,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 50.0),
              ),
              const SizedBox(height: 20.0), // Add some spacing
              // Checkbox and text
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
                  const SizedBox(width: 8.0),
                  const Text(
                    'Buchungsende',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              // Dropdown menu
              if (isChecked==false)
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
              const Spacer(),
              // "Buchen" Button
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('Buchen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
