import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../config/app_images_config.dart';
import '../../../views/home/post_page/components/post_gallery_handler.dart';
import '../../../views/home/post_page/components/post_tweet_view.dart';
import '../../components/app_video.dart';
import '../../components/network_image.dart';
import '../../components/skeleton.dart';

class AppHtmlVideoExtension extends HtmlExtension {
  @override
  Set<String> get supportedTags => {'video'};

  @override
  InlineSpan build(ExtensionContext context) {
    return WidgetSpan(child: returnView(context));
  }

  Widget returnView(ExtensionContext context) {
    try {
      final src = context.element!.attributes['src'].toString();

      if (src.contains('youtube')) {
        return AppVideo(url: src, type: 'youtube');
      } else if (src.contains('vimeo')) {
        return AppVideo(url: src, type: 'vimeo');
      } else {
        return AppVideo(
          url: context.element!.attributes['src'].toString(),
          type: 'network',
        );
      }
    } on Exception {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: NetworkImageWithLoader(AppImagesConfig.noImageUrl),
      );
    }
  }
}

class AppHtmlIframeExtension extends HtmlExtension {
  @override
  Set<String> get supportedTags => {'iframe'};

  @override
  InlineSpan build(ExtensionContext context) {
    return WidgetSpan(child: returnView(context));
  }

  Widget returnView(ExtensionContext context) {
    final String videoSource = context.element!.attributes['src'].toString();
    if (videoSource.contains('youtube')) {
      return AppVideo(url: videoSource, type: 'youtube');
    } else if (videoSource.contains('vimeo')) {
      return AppVideo(url: videoSource, type: 'vimeo');
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: NetworkImageWithLoader(AppImagesConfig.noImageUrl),
      );
    }
  }
}

class AppHtmlImageExtension extends HtmlExtension {
  @override
  Set<String> get supportedTags => {'img'};

  @override
  InlineSpan build(ExtensionContext context) {
    return WidgetSpan(child: returnView(context));
  }

  Widget returnView(ExtensionContext context) {
    final src = context.element?.attributes['src'].toString();
    return CachedNetworkImage(
      imageUrl: src ?? AppImagesConfig.noImageUrl,
      placeholder: (context, url) => const AspectRatio(
        aspectRatio: 16 / 9,
        child: Skeleton(),
      ),
    );
  }
}

class AppHtmlGalleryRender extends HtmlExtension {
  @override
  Set<String> get supportedTags => {'wp-block-gallery'};

  @override
  InlineSpan build(ExtensionContext context) {
    return WidgetSpan(child: returnView(context));
  }

  @override
  bool matches(ExtensionContext context) {
    return context.element?.classes.contains('wp-block-gallery') ?? false;
  }

  Widget returnView(ExtensionContext context) {
    List<String> imagesUrl = [];
    final src = context.element?.children ?? [];
    imagesUrl =
        src.map((e) => e.children.first.attributes['src'] ?? '').toList();

    return PostGalleryRenderer(imagesUrl: imagesUrl);
  }
}

class AppTweetRenderer extends HtmlExtension {
  @override
  Set<String> get supportedTags => {'twitter-tweet'};

  @override
  InlineSpan build(ExtensionContext context) {
    return WidgetSpan(child: returnView(context));
  }

  @override
  bool matches(ExtensionContext context) {
    return context.element?.classes.contains('twitter-tweet') ?? false;
  }

  Widget returnView(ExtensionContext context) {
    final src = context.element?.innerHtml;
    return PostTweetView(tweet: src ?? '');
  }
}
