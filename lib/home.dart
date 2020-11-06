import 'package:flutter/material.dart';
import 'reusable_textfield.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myFocus = FocusNode();
  bool selected = false;
  bool empty = true;
  String textValue;
  bool validation = true;

  @override
  void initState() {
    super.initState();
    myFocus.addListener(() {
      print("Has focus: ${myFocus.hasFocus}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    myFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('Done'),
        onPressed: () {
          print('floating action button is pressed');
          setState(() {
            if (textValue.contains('@') &&
                textValue.contains('.') &&
                textValue.length > 12) {
              validation = true;
            } else {
              validation = false;
            }
          });
        },
      ),
      appBar: AppBar(
        title: Text('TextField Task'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableTextField(
              validation: validation,
              selected: selected,
              myFocus: myFocus,
              empty: empty,
              onPress: () {
                setState(() {
                  if (myFocus.hasFocus) {
                    selected = true;
                  } else {
                    selected = false;
                  }
                });
              },
              onInsert: (value) {
                setState(() {
                  if(myFocus.hasFocus){
                    selected = true;
                  } else {
                    selected = false;
                  }
                  textValue = value;
                  empty = false;
                });
              },
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
            )
          ],
        ),
      ),
    );
  }
}