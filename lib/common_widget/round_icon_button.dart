import 'package:flutter/material.dart';
import 'package:zeo/common/color_extention.dart';

class RoundIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String icon;
  final Color color;

  const RoundIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );

    // const SizedBox(
    //   height: 25,
    // );
    // InkWell(
    //   onTap: () {},
    //   child: Container(
    //     height: 56,
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       color: const Color(0xffDC4335) ,
    //       borderRadius: BorderRadius.circular(28),
    //     ),
    //     child: Text(
    //       "Login with Google",
    //       style: TextStyle(
    //           color:  TColor.white,
    //           fontSize: 12,
    //           fontWeight: FontWeight.w500),
    //     ),
    //   ),
    // ),
  }
}
