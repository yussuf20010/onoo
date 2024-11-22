import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news_pro/config/ad_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedGpt extends StatefulWidget {
  @override
  _MedGptState createState() => _MedGptState();

}

class _MedGptState extends State<MedGpt> {

  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  int myNumberMessges =0;
  late RewardedAd _rewardedAd;
  static const String checkMessages = 'checkMessagesKey';
  bool isRewardedAdReady = false;

  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    // Ads
    initGoogleMobileAds();
    loadRewardedAd();
   // _incrementNumberMessges();
  }



  void _sendMessage() async {
    String text = _controller.text.trim();
    if (text.isNotEmpty || text.length == 1) {
      setState(() {
        _messages.add(Message(text, true));
        _controller.clear();
      });
    }

    if (myNumberMessges > 0) {
      // decrease number of message for user
      decreaseIntToPrefs(checkMessages);

      // Send request to API
      String response = await youchatapi(text);
      if(response=='-1'){
        setState(() {
          _messages.add(Message('some error happened please try again.', false));
        });
      }else{
        setState(() {
          _messages.add(Message(response, false));
        });
      }

    } else {
      setState(() {
        _messages.add(Message(
            "You don't have message credits, Click on \"Earn Messages\" to be able to send messages.", false));
      });
    }
  }


  Future<String> spellchatapi(text) async {
    try {
      var getSpellApiInfoResponse =
      await http.get(Uri.parse('https://med-api-info.mosabry99.repl.co/'));
      Map<String, dynamic> jsonMap =
      jsonDecode(getSpellApiInfoResponse.body);
      String spellapiurl = jsonMap['spellapiurljson'];
      String spellapikey = jsonMap['spellapikeyjson'];
      var urlSpellApi = Uri.parse(spellapiurl);
      var headersSpellApi = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic $spellapikey'
      };
      var dataSpellApi =
      jsonEncode({'input': {'input': '$text'}});
      var responseSpellApi = await http.post(
          urlSpellApi, headers: headersSpellApi, body: dataSpellApi);
      if (responseSpellApi.statusCode == 200) {
        var responseBodySpellApi =
        jsonDecode(responseSpellApi.body);
        var outputdecodedSpellApi =
        responseBodySpellApi['output'];
        return outputdecodedSpellApi;
      }
    } catch (e) {
      return '';
    }
    // If both requests fail, return an empty string
    return '';
  }

// START YOUCHAT API
  Future<String> youchatapi(text) async {
    try {
      var getYouApiKeyResponse = await http.get(Uri.parse(
          'https://med-api-info.mosabry99.repl.co/'));
      Map<String, dynamic> jsonMap =
      jsonDecode(getYouApiKeyResponse.body);
      String youapikey = jsonMap['youapikeyjson'];
      var dataYouApi = jsonEncode({
        'message': text,
        'key': youapikey,
      });
      // Convert the JSON string to a Map<String, dynamic>
      var jsonData = json.decode(dataYouApi);
      // Make the HTTP request with the Map<String, dynamic> data
      var url = Uri.https('api.betterapi.net', '/youdotcom/chat', jsonData);
      var responseYouApi = await http.get(url);
      if (responseYouApi.statusCode == 200) {
        //return response.body;
        var responsebodyYouApi =
        jsonDecode(responseYouApi.body);
        var outputdecodedYouApi =
        responsebodyYouApi['message'];
        return outputdecodedYouApi;
      }
    } catch (e) {
      return spellchatapi(text);
    }
    return '';
  }








  void _incrementNumberMessges() {
    setState(() {
      setNumberMessges(); // Update the state of the widget
    });
  }

  Future<void> setNumberMessges() async {
    myNumberMessges = await getSavedInt(checkMessages) as int;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _incrementNumberMessges();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'MedGPT ',
            maxLines: 1,
            // textAlign: TextAlign.center,
            textAlign: TextAlign.left,
            style: TextStyle(color: Color(0xFF00C897)),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  Message message = _messages[index];
                  return message.isSentByUser
                      ? _buildUserMessageBubble(message.content)
                      : _buildBotMessageBubble(message.content);
                },
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'type_message_field_text'.tr(),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                FloatingActionButton(
                  backgroundColor: Color(0xFF00C897),
                  onPressed: _sendMessage,
                  child: Icon(Icons.send),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'avaialbe_messages_text'.tr(),
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  '$myNumberMessges',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: myNumberMessges == 0 ? Colors.red : Colors.green,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    showRewardedAd();
                    _incrementNumberMessges();
                  },
                  icon: Icon(Icons.message, size: 16),
                  label: Text(
                    'earn_messages_btn'.tr(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: Size(110, 30),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ],
            ),

            Text('interruption_message'.tr(), style: const TextStyle(fontSize: 8.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildUserMessageBubble(String text) {
    // // scroll down in chat
    Future.delayed(const Duration(milliseconds: 50)).then((_) => _scrollDown());
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(
            top: 5.0, bottom: 5.0, left: 50.0, right: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Color(0xFF086E7D),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBotMessageBubble(String text) {
    // scroll down in chat
    Future.delayed(const Duration(milliseconds: 50)).then((_) => _scrollDown());
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
            top: 5.0, bottom: 5.0, left: 10.0, right: 50.0),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Color(0xFF1A5F7A),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  static Future<InitializationStatus> initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }

  String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return AdConfig.androidBannerAdID;
    } else if (Platform.isIOS) {
      return AdConfig.iosBannerAdID;
    } else {
      return "Unsupported platform";
    }
  }

  void loadRewardedAd() {
    RewardedAd.load(
        adUnitId: rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          setState(() => _rewardedAd = ad);
          ad.fullScreenContentCallback =
              FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
            // when user doesn't show ad nothing will be done
            setState(() => isRewardedAdReady = false);
            loadRewardedAd();
          });
          setState(() => isRewardedAdReady = true);
        }, onAdFailedToLoad: (error) {
          print('Failed to load $error');
        }));
  }

  void showRewardedAd() {
    _rewardedAd.show(onUserEarnedReward: (AdWithoutView ad, RewardItem item) {
      setState(() {
        // Update the state of the widget
        saveIntToPrefs(checkMessages, 3);
      });
    });
  }

  static Future<void> saveIntToPrefs(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? currentNumMessages = await getSavedInt(key); // no need to cast to int
    value = value +
        (currentNumMessages ??
            0); // use null-aware operator to handle nullable int
    await prefs.setInt(key, value);
  }

  static Future<void> decreaseIntToPrefs(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? currentNumMessages = await getSavedInt(key);
    // use null-aware operator to handle nullable int
    await prefs.setInt(key, (currentNumMessages ?? 0) - 1);
  }

  static Future<int?> getSavedInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedValue = prefs.getInt(key);
    return savedValue;
  }
}

class Message {
  final String content;
  final bool isSentByUser;

  Message(this.content, this.isSentByUser);
}
