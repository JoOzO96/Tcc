class Post{
  int id;
  String title;

  Post(this.id,this.title);
  Post.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    title = json['title'];
}