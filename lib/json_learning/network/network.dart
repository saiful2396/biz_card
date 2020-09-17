import 'dart:convert';
import 'package:biz_card/json_learning/model/post.dart';
import 'package:http/http.dart';

class Network {
  final String url;
  Network(this.url);

  Future<PostList> loadPost() async {
    final response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      return PostList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get post');
    }
  }
}
