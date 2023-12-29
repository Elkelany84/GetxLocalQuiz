import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_animation_getx_local/models/questions.dart';
import 'package:quiz_animation_getx_local/screens/score/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //let's animate our progress bar
  late AnimationController _animationController;
  late Animation _animation;

  //so that we can access our animation outside
  Animation get animation => _animation;

  PageController _pageController = PageController();

  PageController get pageController => _pageController;

  final List<Question> _questions = sampleData
      .map((question) => Question(
          id: question["id"],
          question: question["question"],
          options: question["options"],
          answer: question["answer_index"]))
      .toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  int? _correctAnswer;

  int get correctAnswer => _correctAnswer!;

  int? _selectedAnswer;

  int get selectedAnswer => _selectedAnswer!;

  RxInt _questionNumber = 1.obs;

  int get questionNumber => _questionNumber.value;

  int _numOfCorrectAnswers = 0;

  int get numOfCorrectAnswers => _numOfCorrectAnswers;

  //called immediately after the widget is allocated memory
  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            //update like setstate
            update();
          });

    //start our animation
    //once 20s is completed go to next question
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    // TODO: implement onInit
    super.onInit();
  }

  //called just before the controller is deleted from the memory
  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    // TODO: implement onClose
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex) {
    //it will run when user pressed any option
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;
    if (_correctAnswer == _selectedAnswer) _numOfCorrectAnswers++;
    _animationController.stop();
    update();

    //once user select answer after 3 seconds , it will go to next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      //reset the counter
      _animationController.reset();
      //start it again
      //once timer is finished go to next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
