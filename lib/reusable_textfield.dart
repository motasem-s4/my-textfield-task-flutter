import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField(
      {@required this.validation,
        @required this.selected,
        @required this.myFocus,
        @required this.empty,
        @required this.onPress,
        @required this.onInsert,
      });

  final bool validation;
  final bool selected;
  final FocusNode myFocus;
  final bool empty;
  final Function onPress;
  final Function onInsert;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: validation ? Colors.black : Colors.red,
              width: selected ? 2 : 1)),
      child: TextFormField(
        focusNode: myFocus,
        autofocus: false,
        onTap: onPress,
        onChanged: onInsert,
        decoration: InputDecoration(
          labelText: empty && !selected ? null : 'Email',
          labelStyle: TextStyle(
              color: selected && !empty && validation
                  ? Colors.yellow[900]
                  : Colors.grey),
          hintText: 'Enter Email',
          suffixIcon: empty && !selected
              ? Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              '*',
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
          )
              : null,
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0),
          ),
        ),
      ),
    );
  }
}
