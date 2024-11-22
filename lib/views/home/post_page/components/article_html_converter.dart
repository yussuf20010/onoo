import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_audio/flutter_html_audio.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_pro/config/wp_config.dart';
import 'package:news_pro/core/controllers/html/html_extensions.dart';
import '../../../../core/models/article.dart';
import '../../../../core/utils/app_utils.dart';

class ArticleHtmlConverter extends StatelessWidget {
  const ArticleHtmlConverter({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    TextDirection textDirection = TextDirection.ltr;
    if (isArabic(article.content)) {
      textDirection = TextDirection.rtl;
    }

    return SelectionArea(
      child: Html(
        data: article.content,
        shrinkWrap: false,
        style: {
          'body': Style(
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
            fontSize: FontSize(16.0),
            lineHeight: const LineHeight(1.4),
            direction: textDirection,
            textAlign: TextAlign.justify,
          ),
          'figure': Style(
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
          ),
          'table': Style(
            backgroundColor: Theme.of(context).cardColor,
          ),
          'tr': Style(
            border: const Border(bottom: BorderSide(color: Colors.grey)),
          ),
          'th': Style(
            padding: HtmlPaddings.all(6),
            backgroundColor: Colors.grey,
          ),
          'td': Style(
            padding: HtmlPaddings.all(6),
            alignment: Alignment.topLeft,
          ),
          'h1': Style(
            backgroundColor: Colors.transparent,
            color: WPConfig.primaryColor,
            margin: Margins.zero,
            padding: HtmlPaddings.all(3),
          ),
        },
        extensions: [
          const TableHtmlExtension(),
          const SvgHtmlExtension(),
          const AudioHtmlExtension(),
          AppHtmlVideoExtension(),
          AppHtmlGalleryRender(),
          AppHtmlIframeExtension(),
          AppHtmlImageExtension(),
          AppTweetRenderer(),
        ],
        onLinkTap: (url, renderCtx, _) {
          if (url == null) {
            Fluttertoast.showToast(msg: 'No URL found');
          } else {
            AppUtil.handleUrl(url);
          }
        },
      ),
    );
  }

  bool isArabic(String str) {
    RegExp arabicRegex = RegExp(r'[\u0600-\u06FF]');
    return arabicRegex.hasMatch(str);
  }
}
