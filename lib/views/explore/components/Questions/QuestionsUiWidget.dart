import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QuestionsUiWidget extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int currentQuestionIndex;
  final int score;
  final int remainingQuestions;
  final bool isAnswerSelected;
  final bool isAnswerCorrect;
  final Function(int) checkAnswer;
  final Function(BuildContext) showResultDialog;
  final Function() nextQuestion;
  final Function() previousQuestion;
  final Function() restartQuiz;

  QuestionsUiWidget({
    required this.questions,
    required this.currentQuestionIndex,
    required this.score,
    required this.remainingQuestions,
    required this.isAnswerSelected,
    required this.isAnswerCorrect,
    required this.checkAnswer,
    required this.showResultDialog,
    required this.nextQuestion,
    required this.previousQuestion,
    required this.restartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            '${questions[currentQuestionIndex]['question']}',
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat-Regular',
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 20),
        Column(
          children: (questions[currentQuestionIndex]['answers'] as List<String>)
              .asMap()
              .entries
              .map((entry) {
            int answerIndex = entry.key;
            String answer = entry.value;
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (!isAnswerSelected) {
                      checkAnswer(answerIndex);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: isAnswerSelected
                        ? (answerIndex == questions[currentQuestionIndex]['correctIndex']
                        ? const Color(0xFF00C897)
                        : Colors.red)
                        : Colors.white70,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        isAnswerSelected
            ? Text(isAnswerCorrect ? 'correct'.tr() : 'wrong'.tr(),
            style: TextStyle(
                color: isAnswerCorrect
                    ? const Color(0xFF00C897)
                    : Colors.red))
            : Container(),
        Padding(
          padding: const EdgeInsets.all(13),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF00C897),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Answered Questions: ${currentQuestionIndex + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Remaining Questions: $remainingQuestions',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Correct Answers: $score',
                          style: TextStyle(color: Colors.lightGreenAccent),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Wrong Answers: ${currentQuestionIndex + 1 - score}',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                restartQuiz();
              },
              label: Text(
                'Reset'.tr(),
                style: const TextStyle(fontSize: 18),
              ),
              icon: const Icon(Icons.refresh),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C897),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                previousQuestion();
              },
              label: Text(
                'Previous'.tr(),
                style: const TextStyle(fontSize: 18),
              ),
              icon: const Icon(Icons.arrow_back),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C897),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                nextQuestion();
              },
              label: Text(
                'Next'.tr(),
                style: const TextStyle(fontSize: 18),
              ),
              icon: const Icon(Icons.arrow_forward),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C897),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
