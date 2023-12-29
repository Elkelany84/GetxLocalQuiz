import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_animation_getx_local/controller/question_controller.dart';
import 'package:quiz_animation_getx_local/screens/constants.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/bg.svg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAnswer * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
