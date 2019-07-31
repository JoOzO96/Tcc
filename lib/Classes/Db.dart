import 'package:unidb/Classes/Post.dart';

class Db{
  Post posts;
  Comments comments;
  Profile profile;
  Db.fromJson(Map<dynamic, dynamic> json)
  : posts = Post.fromJson(json['posts']),
    comments = Comments.fromJson(json['comments']),
    profile = Profile.fromJson(json['profile']);
}

class Comments{
  int id;
  String body;
  int postId;
  Comments.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    body = json['body'],
    postId = json['postId'];
}

class Profile{
  String name;
Profile.fromJson(Map<String, dynamic> json)
  : name = json['name'];

}