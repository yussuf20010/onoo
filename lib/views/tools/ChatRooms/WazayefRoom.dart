import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lottie/lottie.dart';

class WazayefRoom extends StatefulWidget {
  const WazayefRoom({Key? key}) : super(key: key);

  @override
  State<WazayefRoom> createState() => _WazayefRoomState();
}

class _WazayefRoomState extends State<WazayefRoom>
    with AutomaticKeepAliveClientMixin<WazayefRoom> {

  void _changeTitleText(String text) async {
    if (webViewController != null) {
      await webViewController!.evaluateJavascript(source: '''
          document.querySelector('.header-channel').innerText = '$text';
      ''');
    }
  }


  void _injectCustomCSS(InAppWebViewController controller) async {
    String customCSS = '''
    .post {
      position: relative;
      margin: 0 0 0 39px;
      border: 1px solid #e6e6e6;
      border-top-width: 0;
      background-color: white;
      margin-bottom: 10px;
    }
    .theme--day .button {
      color: #00C897;
      border-color: #00C897;
    }
    .theme--day .button:hover {
      color: white;
      background-color: #00C897;
    }
    .message-button--submit {
      display: initial;
      position: absolute;
      top: 9px;
      right: 9px;
    }
    .theme--day .button--warning {
      color: #6b572e;
      border-color: transparent;
      background-color: #f0c775;
    }
    .theme--day .header-bar {
      background-color: #00C897;
    }
    .theme-picker-item[data-theme="theme--day"] {
      background-color: #00C897;
    }
    .message {
        position: ;
        bottom: 0;
        left: 0px; /* Adjust the left margin as needed */
        right: 30px; /* Adjust the right margin as needed */
        width: 100%;
        padding-bottom: 20px; /* Adjust the padding as needed */
        align-items: center;
    }
  .message-input {
      -moz-appearance: none;
      -webkit-appearance: none;
      width: 100%;
      display: block;
      overflow: hidden;
      resize: none;
      font: inherit;
      color: #222;
      padding: 10px 15px 10px 10px;
      font-size: 20px;
      line-height: 30px;
      border-radius: 6px;
      border: 1px solidrgba(0,0,0,0.16);
      background-color: rgb(255 255 255);
      box-shadow: inset 0 1px 3px rgb(0 0 0 / 6%), 0 1px 1px rgb(255 255 255 / 20%);
      -moz-transition: background-color 0.1s linear;
      -o-transition: background-color 0.1s linear;
      -webkit-transition: background-color 0.1s linear;
      transition: background-color 0.1s linear;
  }

  ''';

    await controller.injectCSSCode(source: customCSS);
  }

  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  late bool cacheEnabled;
  final List<ContentBlocker> contentBlockers = [];

  @override
  bool get wantKeepAlive => true;

  final adUrlFilters = [
    '.*.doubleclick.net/.*',
    '.*.ads.pubmatic.com/.*',
    '.*.googlesyndication.com/.*',
    '.*.google-analytics.com/.*',
    '.*.adservice.google.*/.*',
    '.*.adbrite.com/.*',
    '.*.exponential.com/.*',
    '.*.quantserve.com/.*',
    '.*.scorecardresearch.com/.*',
    '.*.zedo.com/.*',
    '.*.adsafeprotected.com/.*',
    '.*.teads.tv/.*',
    '.*.outbrain.com/.*'
  ];

  @override
  void initState() {
    for (final adUrlFilter in adUrlFilters) {
      contentBlockers.add(ContentBlocker(
          trigger: ContentBlockerTrigger(
            urlFilter: adUrlFilter,
          ),
          action: ContentBlockerAction(
            type: ContentBlockerActionType.BLOCK,
          )));
    }

    contentBlockers.add(ContentBlocker(
        trigger: ContentBlockerTrigger(
          urlFilter: '.*',
        ),
        action: ContentBlockerAction(
            type: ContentBlockerActionType.CSS_DISPLAY_NONE,
            selector:
            '.smt-app-message_bar, .banner, .banners, .ads, .ad, .advert,.border-b,.info,.header-avatar,.counter-button,#owner-intro,#owners-list')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: Connectivity().checkConnectivity(),
        builder:
            (BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
          if (snapshot.hasData && snapshot.data != ConnectivityResult.none) {
            return InAppWebView(
              key: webViewKey,
              initialUrlRequest:
              URLRequest(url: WebUri('https://tlk.io/medithenai-wazayef')),
              initialSettings:
              InAppWebViewSettings(contentBlockers: contentBlockers),
              onWebViewCreated: (controller) {
                webViewController = controller;
                _injectCustomCSS(controller);
              },
              onLoadStop: (controller, url) async {
                _changeTitleText('Wazayef Room');
                // Inject custom CSS after the page has loaded
                _injectCustomCSS(controller);
              },
              onLoadError: (controller, url, code, message) {
                if (message.contains('ERR_NAME_NOT_RESOLVED')) {
                  // Handle the error here
                  // For example, show a dialog or a snack bar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to load the page. ERR_NAME_NOT_RESOLVED, Refresh the page.')),
                  );
                }
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/animations/no_internet_animation.json',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 16),
                  Text('no_internet'.tr()),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}