import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munchkinlevel/stat.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:munchkinlevel/string_extensions.dart';

class Counter extends StatefulWidget {
  final CounterValueChangeCallback _changeCallback;
  final String _name;
  final int _initialValue;
  final int _minValue;
  final int _maxValue;

  Counter(this._changeCallback, this._name, this._initialValue, this._minValue,
      this._maxValue);

  @override
  State<StatefulWidget> createState() => _CounterState(
      _changeCallback, _name, _initialValue, _minValue, _maxValue);
}

class _CounterState extends State<Counter> {
  final CounterValueChangeCallback _changeCallback;
  final String _name;
  final int _minValue;
  final int _maxValue;

  int _value = 0;

  Color _color = Colors.transparent;

  _CounterState(this._changeCallback, this._name, int initialValue,
      this._minValue, this._maxValue) {
    _value = initialValue;
  }

//  void _showPicker() {
//    showDialog<int>(
//        context: context,
//        builder: (BuildContext context) {
//          return new NumberPickerDialog.integer(
//            minValue: _minValue,
//            maxValue: _maxValue,
//            title: new Text(AppLocalizations.of(context).counter_title(_name)),
//            initialIntegerValue: _value,
//          );
//        }).then(_handlePickerSelected);
//  }

  void _handlePickerSelected(num value) {
    if (value != null) {
      setState(() => _value = value);

      if (_value == _maxValue) {
        setState(() => _color = Colors.red);
      } else if (_color == Colors.red) {
        setState(() => _color = Colors.transparent);
      }

      _changeCallback(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
            clipBehavior: Clip.antiAlias,
            child: Container(
                color: _color,
                width: double.infinity,
                height: 140,
                child: Stack(children: [
                  Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(_name.capitalize(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400)),
                      )),
                  Center(
                      child: NumberPicker.horizontal(
                          initialValue: _value,
                          minValue: _minValue,
                          maxValue: _maxValue,
                          textStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                          selectedTextStyle: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.tealAccent),
                          onChanged: _handlePickerSelected))
                ]))));
  }
}

typedef void CounterValueChangeCallback(int value);
