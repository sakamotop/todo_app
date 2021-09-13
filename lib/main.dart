import 'package:flutter/material.dart';
import 'package:todo/ListV1/listpage_v1.dart';
import 'package:todo/ListV2/listpage_v2.dart';

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

      home: MyHomePage(title: 'MyApp'),
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

  //final todolist = List<String>.generate(10, (i) => "Item $i");

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
              myContainer(color: Colors.orange, text: 'PARTY'),
              myContainer(color: Colors.red, text: 'WORK'),
              myContainer(color: Colors.blue, text: 'LUNCH'),
              myContainer(color: Colors.orange, text: 'DINNER'),
              myContainer(color: Colors.red, text: 'SLEEP'),
              //firebaseの配列に入ってる分だけ出すように実装する
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Sample List'),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text("MyApp"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            ListTile(
              title: Text("listV1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => ListV1()));
              },
            ),
            ListTile(
              title: Text("listV2"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => ListV2()));
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget myContainer({double size = 300, Color? color, String text = ''}) {
    return Container(
      color: color,
      width: size,
      height: size,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ]),
    );
  }
}
