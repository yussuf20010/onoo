import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_pro/views/home/post_page/components/comment_button_floating.dart';

import '../../../../config/ad_config.dart';
import '../../../../core/components/app_video.dart';
import '../../../../core/components/banner_ad.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/models/article.dart';
import '../components/more_related_post.dart';
import '../components/post_image_renderer.dart';
import '../components/post_page_body.dart';

class VideoPost extends StatelessWidget {
  const VideoPost({
    Key? key,
    required this.article,
  }) : super(key: key);
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CommentButtonFloating(
        article: article,
        isVideoPage: true,
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ArticleModel.isVideoArticle(article)
                        ? CustomVideoRenderer(article: article)
                        : PostImageRenderer(article: article),
                    Positioned.directional(
                      start: 0,
                      textDirection: Directionality.of(context),
                      child: const BackButton(color: Colors.white),
                    ),
                  ],
                ),
                AppSizedBox.h10,
                PostPageBody(article: article),
                Container(
                  color: Theme.of(context).cardColor,
                  child: MoreRelatedPost(
                    categoryID: article.categories.isNotEmpty
                        ? article.categories.first
                        : 0,
                    currentArticleID: article.id,
                  ),
                ),
                AdConfig.isAdOn ? const BannerAdWidget() : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.all(AppDefaults.padding),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('go_back'.tr()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Used for rendering vidoe on top
class CustomVideoRenderer extends StatelessWidget {
  const CustomVideoRenderer({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    bool isNormalVideo = article.featuredVideo != null;
    bool isYoutubeVideo = article.featuredYoutubeVideoUrl != null;

    if (isYoutubeVideo) {
      return AppVideo(
          url: article.featuredYoutubeVideoUrl ?? '', type: 'youtube');
    } else if (isNormalVideo) {
      return AppVideo(
        url: article.featuredVideo ?? '',
        type: 'network',
      );
    } else {
      return const Text('No video found');
    }
  }
}
