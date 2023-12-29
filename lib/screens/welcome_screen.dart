import 'package:flutter/material.dart';
// import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_animation_getx_local/screens/constants.dart';
import 'package:quiz_animation_getx_local/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/icons/bg.svg",
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ), //2/6
                Text(
                  "Let's Play Quiz!",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Text("Enter Your Informations Below..."),
                const Spacer(), //1/6
                TextField(
                  decoration: InputDecoration(
                    fillColor: const Color(0xFF1C2341),
                    filled: true,
                    hintText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const Spacer(), //it will take 1/6
                InkWell(
                  onTap: () {
                    Get.to(QuizScreen());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Let's Play Quiz",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.black),
                    ), //15
                  ),
                ),
                const Spacer(
                  flex: 2,
                ), //it will take 2/6 spaces
              ],
            ),
          ))
        ],
      ),
    );
  }
}
