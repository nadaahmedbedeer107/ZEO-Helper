import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:zeo/common/color_extention.dart';
//import 'package:zeo/view/on_boarding/startup_view.dart';
//import 'package:zeo/common/color_extention.dart';
import 'package:zeo/common_widget/round_button.dart';
import 'package:zeo/view/login/login_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/img/app_logo.png",
            width: media.width * 0.55,
            height: media.height * 0.55,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: media.height * 0.1,
          ),
          Text(
            "                ",
            style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          //Column(
          //children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(
              title: "Login",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: media.height * 20 //0.03,
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RoundButton(
              title: "Create an Account",
              type: RoundButtonType.textPrimary,
              onPressed: () {},
            ),
          ),
          //SizedBox(
          //height: media.height * 0.1,
          //),
        ],
        //)
        //],
      ),
    );
  }
}
