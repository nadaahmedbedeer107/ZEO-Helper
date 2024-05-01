import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:zeo/common/color_extention.dart';
import 'package:zeo/common_widget/round_button.dart';
//import 'package:zeo/view/login/new_password_view.dart';
//import 'package:otp_pin_field/otp_pin_field.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final otpPinFieldController = GlobalKey<OtpPinFieldState>();

  @override
  Widget build(BuildContext context) {
    //var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "We have sent an OTP to your Mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Please check your mobile number 01*******26\ncontinue to reset your password",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 60,
                child: OtpPinField(
                    key: otpPinFieldController,
                    autoFillEnable: true,

                    ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                    textInputAction: TextInputAction.done,

                    ///in case you want to change the action of keyboard
                    /// to clear the Otp pin Controller
                    onSubmit: (text) {
                      //print('Entered pin is $text');
                      FocusScope.of(context).requestFocus(FocusNode());

                      /// return the entered pin
                    },
                    onChange: (text) {
                      //print('Enter on change pin is $text');

                      /// return the entered pin
                    },
                    onCodeChanged: (code) {
                      //print('onCodeChanged  is $code');
                    },

                    /// to decorate your Otp_Pin_Field
                    otpPinFieldStyle: OtpPinFieldStyle(
                      /// border color for inactive/unfocused Otp_Pin_Field
                      defaultFieldBorderColor: Colors.transparent,

                      /// border color for active/focused Otp_Pin_Field
                      activeFieldBorderColor: Colors.transparent,

                      /// Background Color for inactive/unfocused Otp_Pin_Field
                      defaultFieldBackgroundColor: TColor.textfield,

                      /// Background Color for active/focused Otp_Pin_Field
                      activeFieldBackgroundColor: TColor.textfield,

                      /// Background Color for filled field pin box
                      //filledFieldBackgroundColor: Colors.green,

                      /// border Color for filled field pin box
                      //filledFieldBorderColor: Colors.green,
                    ),
                    maxLength: 4,

                    /// no of pin field
                    showCursor: true,

                    /// bool to show cursor in pin field or not
                    cursorColor: Colors.indigo,

                    /// to choose cursor color
                    upperChild: const Column(
                      children: [
                        SizedBox(height: 30),
                        Icon(Icons.flutter_dash_outlined, size: 150),
                        SizedBox(height: 20),
                      ],
                    ),
                    showCustomKeyboard: false,

                    ///bool which manage to show custom keyboard
                    // customKeyboard: Container(),
                    /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                    showDefaultKeyboard: true,

                    ///bool which manage to show default OS keyboard
                    cursorWidth: 3,

                    /// to select cursor width
                    mainAxisAlignment: MainAxisAlignment.center,

                    /// place otp pin field according to yourself

                    /// predefine decorate of pinField use  OtpPinFieldDecoration.defaultPinBoxDecoration||OtpPinFieldDecoration.underlinedPinBoxDecoration||OtpPinFieldDecoration.roundedPinBoxDecoration
                    ///use OtpPinFieldDecoration.custom  (by using this you can make Otp_Pin_Field according to yourself like you can give fieldBorderRadius,fieldBorderWidth and etc things)
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                  title: "Next",
                  onPressed: () {
                    //NewPasswordView
                    FocusScope.of(context).requestFocus(FocusNode());
                  }),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SignUpView(),
                  //   ),
                  // );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Didn’t Recieve? ",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
