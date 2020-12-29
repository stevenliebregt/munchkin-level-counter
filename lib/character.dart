import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:munchkinlevel/counter.dart';
import 'package:munchkinlevel/stat.dart';

class Character extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  int _level = 1;
  int _bonus = 0;

  void _levelChanged(int value) => setState(() => _level = value);

  void _bonusChanged(int value) => setState(() => _bonus = value);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Counter(_levelChanged, AppLocalizations.of(context).level, 1, 1, 10),
      Counter(_bonusChanged, AppLocalizations.of(context).bonus, 0, 0, 999),
      Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
              child: Container(
                  width: double.infinity,
                  height: 140,
                  child: Stat(
                      title: AppLocalizations.of(context).total,
                      value: _level + _bonus))))
    ]);
  }
}
