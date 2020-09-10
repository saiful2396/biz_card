import 'package:biz_card/models/network.dart';
import 'package:biz_card/models/post.dart';
import 'package:flutter/material.dart';

class JsonPractice extends StatefulWidget {
  static const id = 'json_learning';
  @override
  _JsonPracticeState createState() => _JsonPracticeState();
}

class _JsonPracticeState extends State<JsonPractice> {
  Future<PostList> data;

  Future getData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Network network = Network(url);
    data = network.loadPost();
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Learning'),
      ),
      body: Center(
        child: FutureBuilder(
          future: data,
          builder: (context, AsyncSnapshot<PostList> snapshot) {
            List<Post> allPost;
            if (snapshot.hasData) {
              allPost = snapshot.data.posts;
              return _createListView(context, allPost);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context, List<Post> data) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(height: 5.0,),
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: Text(
                      '${data[index].id}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    '${data[index].title}',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${data[index].body}'),
                ),
              ],
            );
          }),
    );
  }
}
