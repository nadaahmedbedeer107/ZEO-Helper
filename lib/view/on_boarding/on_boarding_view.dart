import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zeo/common/color_extention.dart';
import 'package:zeo/common_widget/round_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();
  List pageArr = [
    {
      "title": "Helping You",
      "subtitle": "Helping you get your things done\nwith ZEO helper",
      "image": "assets/img/on_boarding_1.png",
    },
    {
      "title": "Fast Arrive",
      "subtitle": "On The Way , Fast arrive  and\nreliable ",
      "image": "assets/img/on_boarding_2.png",
    },
    {
      "title": "At Your Location",
      "subtitle":
          "Discover and choose your budget\nfirst before deciding to go ",
      "image": "assets/img/on_boarding_3.png",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: media.width,
                    height: media.width,
                    alignment: Alignment.center,
                    child: Image.asset(
                      pObj["image"].toString(),
                      width: media.width * 0.65,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.2,
                  ),
                  Text(
                    pObj["title"].toString(),
                    style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: media.width * 0.3,
                  ),
                ],
              );
            }),
        Column(

          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [



            SizedBox(
              height: media.height * 0.6,
            ),
            


            Row(
              
              //crossAxisAlignment: CrossAxisAlignment.center ,
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageArr.map((e) {

              var index = pageArr.indexOf(e);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 6,
                width: 6,
                decoration: BoxDecoration(color: index == selectPage ? TColor.primary : TColor.placeholder, borderRadius: BorderRadius.circular(4)),
              );
            }).toList(),),


            SizedBox(
              height: media.height * 0.22,
            ),


            //const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                  title: "Next",
                  onPressed: () {
                    if (selectPage >= 2) {
                      //home screen
                      print("GO Home");
                    } else {
                      //next screen

                      setState(() {
                        selectPage = selectPage + 1;
                        controller.animateToPage(selectPage,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut);
                      });
                    }
                  }),
            ),
            
          ],
        )
      ],
    ));
  }
}
