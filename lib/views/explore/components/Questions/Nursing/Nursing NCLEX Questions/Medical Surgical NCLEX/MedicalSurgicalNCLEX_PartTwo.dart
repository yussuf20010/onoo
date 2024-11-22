import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../QuestionsUiWidget.dart';
import 'MedicalSurgicalNCLEX_PartTwo_Questions.dart';

// Define light theme
ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  cardColor: AppColors.cardColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.scaffoldBackgrounDark,
  ),
);

// Define dark theme
ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.scaffoldBackgrounDark,
  cardColor: AppColors.cardColorDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.scaffoldBackgrounDark,
  ),
);

class MedicalSurgicalNCLEXPartTwo extends StatelessWidget {
  const MedicalSurgicalNCLEXPartTwo({super.key});


  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Medical Surgical NCLEX - Part Two',
        theme: theme,
        darkTheme: darkTheme,
        home: MedicalSurgicalNCLEXPartTwo_Sub(),
      ),
    );
  }
}

class MedicalSurgicalNCLEXPartTwo_Sub extends StatefulWidget {
  const MedicalSurgicalNCLEXPartTwo_Sub({super.key});


  @override
  _MedicalSurgicalNCLEXPartTwo_SubState createState() =>
      _MedicalSurgicalNCLEXPartTwo_SubState();
}

class _MedicalSurgicalNCLEXPartTwo_SubState
    extends State<MedicalSurgicalNCLEXPartTwo_Sub> {
  List<Map<String, dynamic>> questions = MedicalSurgicalNCLEXPartTwoQuestions;
  int currentQuestionIndex = 0;
  int score = 0;
  int remainingQuestions = 0;
  bool isAnswerSelected = false;
  bool isAnswerCorrect = false;

  @override
  void initState() {
    super.initState();
    remainingQuestions = questions.length;
    loadProgress();
  }

  void saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentQuestionIndex', currentQuestionIndex);
    prefs.setInt('score', score);
  }

  void loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int savedQuestionIndex = prefs.getInt('currentQuestionIndex') ?? 0;
    int savedScore = prefs.getInt('score') ?? 0;
    setState(() {
      currentQuestionIndex = savedQuestionIndex;
      score = savedScore;
      remainingQuestions = questions.length - currentQuestionIndex;
    });

    if (currentQuestionIndex == questions.length) {
      showResultDialog(context);
    }
  }

  void checkAnswer(int selectedAnswerIndex) {
    if (!isAnswerSelected) {
      if (selectedAnswerIndex == questions[currentQuestionIndex]['correctIndex']) {
        setState(() {
          score++;
          isAnswerCorrect = true;
        });
      } else {
        isAnswerCorrect = false;
      }
      setState(() {
        isAnswerSelected = true;
      });
      saveProgress();
    }
  }

  void showResultDialog(BuildContext context) {
    final double resultPercentage = (score / questions.length) * 100;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Completed'),
          content: Text('You scored ${resultPercentage.toStringAsFixed(2)}%.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void nextQuestion() {
    setState(() {
      if (isAnswerSelected) {
        isAnswerSelected = false;
        isAnswerCorrect = false;
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          remainingQuestions = questions.length - currentQuestionIndex;
        } else {
          showResultDialog(context);
          currentQuestionIndex = 0;
          score = 0;
          remainingQuestions = questions.length;
        }
        saveProgress();
      }
    });
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        remainingQuestions = questions.length - currentQuestionIndex;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      isAnswerSelected = false;
      isAnswerCorrect = false;
      remainingQuestions = questions.length;
      saveProgress();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Part (2) - Question ${currentQuestionIndex + 1}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(8.0),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            value: (currentQuestionIndex + 1) / questions.length,
            valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.greenAccent), // Progress bar color
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              // Replace this section with your QuestionsUiWidget
              QuestionsUiWidget(
                questions: questions,
                currentQuestionIndex: currentQuestionIndex,
                score: score,
                remainingQuestions: remainingQuestions,
                isAnswerSelected: isAnswerSelected,
                isAnswerCorrect: isAnswerCorrect,
                checkAnswer: checkAnswer,
                showResultDialog: showResultDialog,
                nextQuestion: nextQuestion,
                previousQuestion: previousQuestion,
                restartQuiz: restartQuiz,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
