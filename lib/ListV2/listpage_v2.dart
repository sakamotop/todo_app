import 'dart:math';
import 'package:flutter/material.dart';

class ListV2 extends StatefulWidget {
  const ListV2({Key? key}) : super(key: key);

  @override
  _ListV2State createState() => _ListV2State();
}

class _ListV2State extends State<ListV2> {
  final List<String> test = [
    'RUN',
    'PARTY',
    'LUNCH',
    'SLEEP',
    'SCHOOL',
    'DINNER'
  ];
  final double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: size,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _children,
            ),
          ),
          Divider(),
          SizedBox(
            height: size,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _children,
            ),
          ),
          Divider(),
          SizedBox(
            height: size,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _children,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get _children => List<Widget>.generate(
      test.length,
      (index) => Padding(
            padding: EdgeInsets.all(8),
            child: Stack(
              children: [
                Container(
                  height: size,
                  width: size,
                  color: Colors.primaries[
                      Random.secure().nextInt(Colors.primaries.length)],
                ),
                Text(
                  test[index],
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ],
            ),
          ));
}
