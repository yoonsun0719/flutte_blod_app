import 'package:flutter_blog/domain/user/user.dart';
import 'package:intl/intl.dart';

class Post {
  final int? id;
  final String? title;
  final String? content;
  final User? user;
  final DateTime? created;
  final DateTime? updated;

  Post(
      {this.id,
        this.title,
        this.user,
        this.content,
        this.created,
        this.updated});

  //통신을위해서 Json 처럼 생긴문자열 {"id" : 1} => Dart 오브젝트
  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        user = User.fromJson(json['user']),
        created = DateFormat('yyyy-mm-dd').parse(json['created']),
        updated = DateFormat('yyyy-mm-dd').parse(json['updated']);
}
