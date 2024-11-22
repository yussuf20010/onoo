import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_pro/core/ads/ad_state_provider.dart';

import '../../../../core/models/article.dart';
import '../../../../core/routes/app_routes.dart';

class CommentButtonFloating extends ConsumerWidget {
  const CommentButtonFloating({
    Key? key,
    required this.article,
    this.isVideoPage = false,
  }) : super(key: key);

  final ArticleModel article;
  final bool isVideoPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isVideoPage) {
      return FloatingActionButton.extended(
        onPressed: () {
          ref.read(loadInterstitalAd);
          Navigator.pushNamed(context, AppRoutes.comment, arguments: article);
        },
        label: Text(
          '${article.totalComments}',
        ),
        icon: const Icon(Icons.comment),
        foregroundColor: Colors.white,
      );
    } else {
      return Positioned.directional(
        end: 16,
        bottom: 16,
        textDirection: Directionality.of(context),
        child: FloatingActionButton.extended(
          onPressed: () {
            // ref.read(loadInterstitalAd)?.call();
            // Navigator.pushNamed(context, AppRoutes.comment, arguments: article);
          },
          label: Text(
            '${article.totalComments}',
          ),
          icon: const Icon(Icons.comment),
          foregroundColor: Colors.white,
        ),
      );
    }
  }
}
