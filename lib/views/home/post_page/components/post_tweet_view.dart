import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_pro/core/themes/theme_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/utils/app_utils.dart';

class PostTweetView extends ConsumerStatefulWidget {
  const PostTweetView({
    Key? key,
    required this.tweet,
  }) : super(key: key);

  final String tweet;

  @override
  PostTweetViewState createState() => PostTweetViewState();
}

class PostTweetViewState extends ConsumerState<PostTweetView> {
  late WebViewController controller;

  bool isLoading = true;

  initateController() {
    final isDark = ref.read(isDarkMode(context));

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(
        Uri.dataFromString(
          getHtmlString(widget.tweet, isDark),
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8'),
        ),
      );
    isLoading = false;
    if (mounted) setState(() {});
  }

  String? getLinksFromString(String text) {
    RegExp regex = RegExp(r'<a href="([^"]+)">[^<]+<\/a>');
    Iterable<Match> matches = regex.allMatches(text);

    if (matches.isNotEmpty) {
      Match lastMatch = matches.last;
      String? lastLink = lastMatch.group(1);
      return lastLink;
    } else {
      debugPrint('no links found');
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    initateController();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : InkWell(
            onTap: () {
              final tweetLink = getLinksFromString(widget.tweet);
              if (tweetLink != null) {
                AppUtil.launchUrl(
                  tweetLink,
                  isExternal: true,
                );
              }
            },
            child: IgnorePointer(
              child: SizedBox(
                height: 500,
                child: WebViewWidget(controller: controller),
              ),
            ),
          );
  }
}

String getHtmlString(String tweet, bool isDark) {
  String colorCode = isDark ? 'dark' : 'light';
  return '''
<html>
      
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1">
        </head>
        <style>
        </style>
        
        <body>
          <blockquote class="twitter-tweet" data-theme="$colorCode">$tweet</blockquote>   
        </body>

        <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>''';
}
