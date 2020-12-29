import 'package:flutter/material.dart';
import 'package:munchkinlevel/string_extensions.dart';

class Stat extends StatelessWidget {
  final String _title;
  final int _value;

  Stat({String title, int value})
      : _title = title,
        _value = value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(_title.capitalize(),
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
            )),
        Center(
            child: Text(_value.toString(),
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)))
      ],
    );
  }
}
