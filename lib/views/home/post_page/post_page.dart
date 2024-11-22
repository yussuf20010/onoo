import 'package:flutter/material.dart';

import '../../../core/models/article.dart';
import '../../../core/repositories/posts/post_repository.dart';
import 'components/normal_post.dart';
import 'components/video_post.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    Key? key,
    required this.article,
  }) : super(key: key);
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final isVideoPost = ArticleModel.isVideoArticle(article);
    PostRepository.addViewsToPost(postID: article.id);
    if (isVideoPost) {
      return VideoPost(article: article);
    } else {
      return NormalPost(article: article);
    }
  }
}
