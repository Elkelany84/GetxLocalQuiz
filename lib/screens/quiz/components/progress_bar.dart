import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_animation_getx_local/controller/question_controller.dart';
import 'package:quiz_animation_getx_local/screens/constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xFF3F4768), width: 3),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (
            controller,
          ) {
            print(controller.animation.value);
            return Stack(
              children: [
                //LayoutBuilder provide us the available space for the container
                //constraints.maxWidth needed for our animation
                LayoutBuilder(
                  builder: (BuildContext context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "${(controller.animation.value * 20).round()} Seconds"),
                      SvgPicture.asset("assets/icons/clock.svg")
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
