import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_animation_getx_local/controller/question_controller.dart';
import 'package:quiz_animation_getx_local/models/questions.dart';
import 'package:quiz_animation_getx_local/screens/constants.dart';
import 'package:quiz_animation_getx_local/screens/quiz/components/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });
  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _Controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question!,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          ...List.generate(
              question.options!.length,
              (index) => Option(
                    index: index,
                    text: question.options![index],
                    press: () {
                      _Controller.checkAns(question, index);
                    },
                  ))
        ],
      ),
    );
  }
}
