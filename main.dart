import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whatssapp/networking/api.dart';

void main() => runApp(MyApp());




  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'enter value ',
      home: MyCustomForm(),
    );
  }
}


// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.

class Photo {
  final String value;

  Photo({
    required this.value,
  });

  factory Photo.fromJson(Map<String, dynamic> json)
  {
    return Photo(
      value: json['value'] as String
    );
  }


}

class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('WARNING'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () async
        {
          String value = myController.text;
          //print(value);
          var res = await Network().authData(value, 'test');
          //print(res.body);
          var body = json.decode(res.body);
          //print(body);



          Map<String, dynamic> map = jsonDecode(res.body);
          String success = map['success'];
          /* String err = map['err']
              if (err)
              {
                // i don't know what code you use but [ i++ || skip it ]
              }

          */


          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text("value changed to : "+success),
              );

            },
          );

        },


        child: Icon(Icons.ac_unit_sharp),
        backgroundColor: Colors.red,
      ),
    );
  }
}
