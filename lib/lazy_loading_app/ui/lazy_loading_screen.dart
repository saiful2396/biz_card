import 'package:biz_card/lazy_loading_app/model/lazy_loading_class.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';


class LazyLoading extends StatefulWidget {
  static const id = "lazy_loading_screen";
  @override
  _LazyLoadingState createState() => new _LazyLoadingState();
}

class _LazyLoadingState extends State<LazyLoading> {
  List<ImageItem> data = [];
  int currentLength = 0;
  final int increment = 10;
  bool isLoading = false;

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  Future _loadMore() async {
    setState(() {
      isLoading = true;
    });

    // Add in an artificial delay
    await new Future.delayed(const Duration(seconds: 2));

    for (var i = currentLength; i <= currentLength + increment; i++)
      if (i % 2 == 0)
        data.add(ImageItem(
            content: 'Image $i',
            imgUrl:
                'https://png.pngtree.com/thumb_back/fh260/back_pic/03/73/95/4957bbd4dfab8f2.jpg'));
      else
        data.add(ImageItem(
            content: 'Image $i',
            imgUrl:
                'https://png.pngtree.com/thumb_back/fh260/background/20190221/ourmid/pngtree-city-data-attendance-wall-business-image_21613.jpg'));

    setState(() {
      isLoading = false;
      currentLength = data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lazy Loading'),
        centerTitle: true,
      ),
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: () => _loadMore(),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, position) {
            if (isLoading && position == data.length - 1) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return displayCardItem(data[position]);
            }
          },
        ),
      ),
    );
  }

  Widget displayCardItem(ImageItem data) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Text(
                data.content,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Image.network(data.imgUrl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
