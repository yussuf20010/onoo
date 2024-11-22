import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/components/article_category_row.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/models/article.dart';
import '../../../../core/utils/app_utils.dart';
import 'article_html_converter.dart';
import 'post_meta_data.dart';
import 'post_report_button.dart';
import 'post_tags.dart';
import 'save_post_button_alt.dart';
import 'share_post_button.dart';
import 'total_comments_button.dart';
import 'view_on_webiste_button.dart';

class PostPageBody extends StatelessWidget {
  const PostPageBody({Key? key, required this.article}) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!ArticleModel.isVideoArticle(article)) AppSizedBox.h16,

        /// Post Info
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                childAnimationBuilder: (child) => SlideAnimation(
                  duration: AppDefaults.duration,
                  verticalOffset: 50.0,
                  horizontalOffset: 0,
                  child: child,
                ),
                children: [

                  PostMetaData(article: article),
                  // ArticleCategoryRow(
                  //   article: article,
                  //   isPostDetailPage: true,
                  // ),
                  AppSizedBox.h5,
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Text(
                    AppUtil.trimHtml(article.title),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  AppSizedBox.h5,
                  if (ArticleModel.isVideoArticle(article))
                    Row(
                      children: [
                        SavePostButtonAlternative(article: article),
                        AppSizedBox.w5,
                        ShareButtonAlternative(article: article),
                      ],
                    ),
                  ArticleHtmlConverter(article: article),
                  ArticleTags(article: article),
                  AppSizedBox.h15,
                  TotalCommentsButton(article: article),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ViewOnWebsite(article: article),
                      AppSizedBox.w16,
                      PostReportButton(article: article),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        AppSizedBox.h10,
        const Divider(height: 0),
      ],
    );
  }
}
