import 'package:flutter/material.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/viewmodels/base_model.dart';

class PostsModel extends BaseModel {
  Api _api;

  PostsModel({
    @required Api api,
  }) : _api = api;

  List<Post> _posts;

  List<Post> get posts => _posts;

  Future getPosts(int userId) async {
    setBusy(true);
    _posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
