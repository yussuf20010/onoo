import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:translator_plus/translator_plus.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../tools/notes/ui/widgets/icon_button.dart';

class TranslatorApp extends StatefulWidget {
  const TranslatorApp({Key? key}) : super(key: key);

  @override
  _TranslatorAppState createState() => _TranslatorAppState();
}

class _TranslatorAppState extends State<TranslatorApp> {
  final GoogleTranslator _translator = GoogleTranslator();
  final TextEditingController _inputController = TextEditingController();
  String _translation = '';
  bool _isLoading = false;

  Future<void> _translateText() async {
    final input = _inputController.text;

    setState(() {
      _isLoading = true;
    });

    var translation = await _translator.translate(input, to: 'ar');
    setState(() {
      _translation = translation.text;
      _isLoading = false;
    });
    // print(translation.text);
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: AppColors.scaffoldBackground, // Light mode background color
        cardColor: AppColors.cardColor, // Light mode card color
        textTheme: TextTheme(),
      ),
      dark: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.scaffoldBackgrounDark, // Dark mode background color
        cardColor: AppColors.cardColorDark, // Dark mode card color
        textTheme: TextTheme(),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (lightTheme, darkTheme) {
        final theme = Theme.of(context);

        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: AppBarTheme.of(context).backgroundColor,
              leading: MyIconButton(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop(context);
                },
                icon: Icons.keyboard_arrow_left,
              ),
              title: Text(
                'mediThen_translator'.tr(), // Use localization for the title
                style: TextStyle(
                  color: theme.appBarTheme.titleTextStyle?.color, // Set the title text color based on the theme
                ),
              ),
              centerTitle: true,
            ),


              body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextField(
                      controller: _inputController,
                      decoration: InputDecoration(labelText: 'enter_to_translate'.tr(),),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5000),
                      ],
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _isLoading ? null : _translateText,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF00C897),
                          ),
                        ),
                        child: Text('translate'.tr()),
                      ),
                      if (_isLoading)
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00C897)),
                              strokeWidth: 3.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: Text(
                      _translation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
