import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_pro/core/controllers/html/html_extensions.dart';
import 'package:news_pro/views/home/post_page/components/translate/main.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../config/ad_config.dart';
import '../../../../core/components/app_native_ad.dart';
import '../../../../core/components/banner_ad.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/models/article.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_utils.dart';
import '../components/more_related_post.dart';
import '../components/post_image_renderer.dart';
import '../components/post_page_body.dart';
import 'comment_button_floating.dart';
import 'save_post_button.dart';

class NormalPost extends StatelessWidget {
  const NormalPost({
    Key? key,
    required this.article,
  }) : super(key: key);
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ArticleModel.isVideoArticle(article)
                      ? CustomVideoRenderer(article: article)
                      : PostImageRenderer(article: article),
                  PostPageBody(article: article),
                  // const NativeAppAd(),
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
          _NormalPostAppBar(article: article),
          CommentButtonFloating(article: article),
        ],
      ),
    );
  }
}

class _NormalPostAppBar extends StatelessWidget {
  const _NormalPostAppBar({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 0.5, // Adjust the border width as needed
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: AppColors.cardColorDark.withOpacity(0.9),
              elevation: 0,
            ),
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.adaptive.arrow_back_rounded,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 0.5, // Adjust the border width as needed
              ),
            ),
            child: ElevatedButton(
              onPressed: () async {
                await Share.share(article.link);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: AppColors.cardColorDark.withOpacity(0.9),
                elevation: 0,
              ),
              child: const Icon(
                IconlyLight.send,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 0.5, // Adjust the border width as needed
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, AppRoutes.translate,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: AppColors.cardColorDark.withOpacity(0.9),
                elevation: 0,
              ),
              child: const Icon(
                Icons.translate_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 0.5, // Adjust the border width as needed
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, AppRoutes.notes,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: AppColors.cardColorDark.withOpacity(0.9),
                elevation: 0,
              ),
              child: const Icon(
                Icons.note_add_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          SavePostButton(article: article),
        ],
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
    return Html(
      data: article.content,
      onlyRenderTheseTags: const {'html', 'body', 'figure', 'video'},
      shrinkWrap: false,
      style: {
        'body': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
        ),
        'figure': Style(
          margin: Margins.zero,
          padding: HtmlPaddings.zero,
        ),
      },
      onLinkTap: (String? url, Map<String, String> attributes, element) {
        if (url != null) {
          AppUtil.openLink(url);
        } else {
          Fluttertoast.showToast(msg: 'Cannot launch this url');
        }
      },
      extensions: [
        AppHtmlVideoExtension(),
      ],
    );
  }
}
