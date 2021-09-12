import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      // ライト用テーマ
      darkTheme: ThemeData.dark(),
      // ダーク用テーマ
      themeMode: ThemeMode.system,
      // モードをシステム設定にする

      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int test = 0;

  //final todolist = List<String>.generate(10, (i) => "Item $i");

  void _test() {
    setState(() {
      test++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: SingleChildScrollView(
          // SingleChildScrollViewで子ウィジェットをラップ
          scrollDirection: Axis.horizontal,
          // スクロールの向きを水平方向に指定
          child: Row(
            children: [
              myContainer(
                color: Colors.blue,
                text: 'RUN',
              ),
              myContainer(color: Colors.orange, text: 'SHOPPING'),
              myContainer(color: Colors.red, text: 'WORK'),
              myContainer(color: Colors.blue, text: 'LUNCH'),
              myContainer(color: Colors.orange, text: 'DINNER'),
              myContainer(color: Colors.red, text: 'SLEEP'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget myContainer({double size = 300, Color? color, String text = ''}) {
    return Container(
      color: color,
      width: size,
      height: size,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
