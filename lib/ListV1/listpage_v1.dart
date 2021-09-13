import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/ListV1/horizontal_list_view.dart';
import 'package:todo/ListV1/image_url.dart';

class ListV1 extends StatefulWidget {
  const ListV1({Key? key}) : super(key: key);

  @override
  _ListV2State createState() => _ListV2State();
}

class _ListV2State extends State<ListV1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('TODO　LIST'),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  HorizontalListView(
                    title: '追加順',
                    children: _topGourmet,
                  ),
                  HorizontalListView(
                    title: '新着順',
                    children: _topGourmet.reversed.toList(),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: ImageUrls.top.length,
                    itemBuilder: (_, int index) {
                      return Card(
                        child: Image.network(
                          ImageUrls.top[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ],
              ))
        ],
      ),
    );
}
  List<Widget> get _topGourmet => List.generate(
      ImageUrls.top.length,
          (index) => Image.network(
        ImageUrls.top[index],
        fit: BoxFit.cover,
      ));
}
