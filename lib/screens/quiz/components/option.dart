import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_animation_getx_local/controller/question_controller.dart';
import 'package:quiz_animation_getx_local/screens/constants.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAnswer) {
                return kGreenColor;
              } else if (index == qnController.selectedAnswer &&
                  qnController.selectedAnswer != qnController.correctAnswer) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: getTheRightColor() == kGrayColor
                            ? Colors.transparent
                            : getTheRightColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRightColor()),
                      ),
                      child: getTheRightColor() == kGrayColor
                          ? null
                          : Icon(
                              getTheRightIcon(),
                              size: 16,
                            ))
                ],
              ),
            ),
          );
        });
  }
}
