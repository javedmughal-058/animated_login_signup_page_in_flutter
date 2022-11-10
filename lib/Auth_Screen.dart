import 'package:animated_login_signup_page_in_flutter/widgets/login_form.dart';
import 'package:animated_login_signup_page_in_flutter/widgets/sign_up_form.dart';
import 'package:animated_login_signup_page_in_flutter/widgets/socal_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
             Positioned(
                 width: size.width*0.88,
                 height: size.height,
                 child: Container(
                   color: login_bg,
                   child: const LoginForm(),
             )),
            Positioned(
                width: size.width*0.88,
                height: size.height,
                left: size.width*0.88,
                child: Container(
                  color: signup_bg,
                  child: const SignUpForm(),
                )),
            Positioned(
                top: size.height*0.1,
                right: size.width*0.06,
                left: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 45,
                  child: ClipOval(
                    child: Image.asset("assets/mj.jpg",
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
            ),
            Positioned(
              bottom: size.width*0.1,
              width: size.width,
              right: size.width*0.06,
              child: const SocalButtns(),
            ),
          ],
        ),
      ),
    );
  }
}
