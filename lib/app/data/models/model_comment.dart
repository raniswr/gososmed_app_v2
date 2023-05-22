class ModelComment {
  Comments? comments;

  ModelComment({this.comments});

  ModelComment.fromJson(Map<String, dynamic> json) {
    comments = json['comments'] != null ? new Comments.fromJson(json['comments']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comments != null) {
      data['comments'] = this.comments!.toJson();
    }
    return data;
  }
}

class Comments {
  List<DataComment>? data;

  Comments({this.data});

  Comments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataComment>[];
      json['data'].forEach((v) {
        data!.add(new DataComment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataComment {
  int? id;
  Attributes? attributes;

  DataComment({this.id, this.attributes});

  DataComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null ? new Attributes.fromJson(json['attributes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? content;
  UserPost? userPost;
  String? createdAt;
  String? updatedAt;

  Attributes({this.content, this.userPost, this.createdAt, this.updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    userPost = json['user_post'] != null ? new UserPost.fromJson(json['user_post']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    if (this.userPost != null) {
      data['user_post'] = this.userPost!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class UserPost {
  DataComment? data;

  UserPost({this.data});

  UserPost.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataComment.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;

  Data({this.id});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
