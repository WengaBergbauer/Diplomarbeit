import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var dienstnehmerBox = Hive.box('dienstnehmer');



  void writeBox(){
    //box.put(1, user);
  }

  void readBox(){
   /* UserModel userModel = box.get(1);
    print(userModel.firstname);
    print(userModel.lastname);*/
  }


// final _myBox = Hive.box('myBox');

  void writeData(){
    // _myBox.put(1, ['Amir', 'Ikanovic', true]);
    // _myBox.put(2, ['Janis', 'Papai', true]);
  }

  void readData(){
    // print(_myBox.get(2));
  }

  void deleteData() {
    // _myBox.delete(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: writeData,
              color: Colors.blue[200],
              child: const Text('Write'),
              ),
              MaterialButton(
              onPressed: readData,
              color: Colors.red[200],
              child: const Text('Read'),
              ),
              MaterialButton(
              onPressed: deleteData,
              color: Colors.green[200],
              child: const Text('Delete'),
              ),
              MaterialButton(
              onPressed: writeBox,
              color: Colors.green[200],
              child: const Text('writeBox'),
              ),
              MaterialButton(
              onPressed: readBox,
              color: Colors.green[200],
              child: const Text('readBox'),
              ),
          ]
        ))
    );
  }
}
