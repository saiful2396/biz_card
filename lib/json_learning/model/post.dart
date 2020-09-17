class PostList {

  final List<Post> posts;
  PostList({this.posts});

  factory PostList.fromJson(List<dynamic>parsedJson){
    List<Post> postsItem = List<Post>();
    postsItem = parsedJson.map((e) => Post.fromJson(e)).toList();

    return PostList(posts: postsItem);
  }
}

class Post {

  int id;
  int userId;
  String title;
  String body;
  Post({this.id, this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}