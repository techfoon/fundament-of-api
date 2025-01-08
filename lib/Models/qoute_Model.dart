import 'dart:developer';

class ReactionModel {
  int? likes;
  int? dislikes;

  ReactionModel({this.dislikes, this.likes});

  factory ReactionModel.fromJson(Map<String, dynamic> Json) {
    return ReactionModel(dislikes: Json['dislikes'], likes: Json['likes']);
  }
}

class PostModel {
  int? id;
  String? body;
  String? title;
  ReactionModel? reactions;
  List<dynamic>? tags;
  int? userId;
  int? views;

  PostModel(
      {this.id,
      this.title,
      this.body,
      this.tags,
      this.userId,
      this.views,
      this.reactions});

  factory PostModel.fromJson(Map<String, dynamic> Json) {
    log("${Json['reactions'].runtimeType}");

    ReactionModel eachSinglereactions =
        ReactionModel.fromJson(Json['reactions']);  // loop Not required here why? doubt

    return PostModel(
        id: Json['id'],
        title: Json['title'],
        body: Json['body'],
        tags: Json['tags'],
        userId: Json['userId'],
        views: Json['views'],
        reactions: eachSinglereactions);
  }
}

class DataModel {
  int? limit, skip, total;

  List<PostModel>? posts = [];

  DataModel({this.limit, this.skip, this.total, this.posts});

  factory DataModel.fromJson(Map<String, dynamic> Json) {
    List<PostModel> mposts = [];

    for (Map<String, dynamic> Singledata in Json['posts']) {
      var eachSingledata = PostModel.fromJson(Singledata);

      mposts.add(eachSingledata);
    }
    return DataModel(
        limit: Json['limit'],
        skip: Json['skip'],
        total: Json['total'],
        posts: mposts);
  }
}
