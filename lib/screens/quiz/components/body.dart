import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_animation_getx_local/controller/question_controller.dart';
import 'package:quiz_animation_getx_local/screens/constants.dart';
import 'package:quiz_animation_getx_local/screens/quiz/components/progress_bar.dart';
import 'package:quiz_animation_getx_local/screens/quiz/components/question_card.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(children: [
      SvgPicture.asset(
        "assets/icons/bg.svg",
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
      ),
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: ProgressBar(),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Obx(
                () => Text.rich(
                  TextSpan(
                      text: "Question ${_questionController.questionNumber}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: kSecondaryColor)),
                      ]),
                ),
              ),
            ),
            const Divider(
              thickness: 1.5,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Expanded(
                child: PageView.builder(
                    //Block swipe to next qn
                    physics: NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                          question: _questionController.questions[index],
                        )))
          ],
        ),
      )
    ]);
  }
}
