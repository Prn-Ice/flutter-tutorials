import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/viewmodels/views/posts_model.dart';
import 'package:provider_arc/ui/views/base_widget.dart';
import 'package:provider_arc/ui/widgets/postlist_item.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsModel>(
      onModelReady: (model) => model.getPosts(context.read<User>().id),
      builder: (BuildContext context, PostsModel model, Widget child) =>
          model.busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: model.posts.length,
                  itemBuilder: (context, index) => PostListItem(
                    post: model.posts[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.Post,
                        arguments: model.posts[index],
                      );
                    },
                  ),
                ),
      model: PostsModel(
        api: context.watch<Api>(),
      ),
    );
  }
}
