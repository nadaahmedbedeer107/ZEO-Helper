import 'package:flutter/material.dart';
import 'package:zeo/view/login/welcome_view.dart';
//import 'package:zeo/common/color_extention.dart';
//import 'package:zeo/common_widget/round_button.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
    goWelcomePage();
  }

  void goWelcomePage()  {
     Future.delayed(const Duration(seconds: 3),(){
      
     welcomePage();
    },);
  
  }

  void welcomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomeView()));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/img/app_logo.png",
          width: media.width * 0.7,
          height: media.height * 0.7,
          fit: BoxFit.contain,
        ),
      ),

      //SizedBox(height: media.width*0.1,),
      //Padding(
      //padding: const EdgeInsets.symmetric(horizontal:25),
      //child: RoundButton,
      //),
      //SizedBox(height: media.width*0.1,),
    );
  }
}
