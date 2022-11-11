import 'dart:math';

import 'package:animated_login_signup_page_in_flutter/widgets/login_form.dart';
import 'package:animated_login_signup_page_in_flutter/widgets/sign_up_form.dart';
import 'package:animated_login_signup_page_in_flutter/widgets/socal_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin{
  bool _isShowSignUp =false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRoate ;
  void setUpAnimation(){
    _animationController = AnimationController(vsync: this, duration: defaultDuration);
    _animationTextRoate = Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView(){
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp ? _animationController.forward() : _animationController.reverse();
  }


  @override
  void initState() {
    // TODO: implement initState
    setUpAnimation();
    super.initState();
  }

   @override
  void dispose() {
    // TODO: implement dispose
     _animationController.dispose();
      super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                //login
                 AnimatedPositioned(
                   duration: defaultDuration,
                     width: size.width*0.88,
                     height: size.height,
                     left: _isShowSignUp ? -size.width*0.76 : 0,
                     child: Container(
                       color: login_bg,
                       child: const LoginForm(),
                 )),
                //Signup
                AnimatedPositioned(
                    duration: defaultDuration,
                    height: size.height,
                    width: size.width*0.88,
                    left: _isShowSignUp ? size.width*0.12 : size.width*0.88,
                    child: Container(
                      color: signup_bg,
                      child: const SignUpForm(),
                    )),
                //logo
                AnimatedPositioned(
                  duration: defaultDuration,
                  top: size.height*0.1,
                    left: 0,
                    right: _isShowSignUp? -size.width*0.06: size.width*0.06,
                    child: AnimatedSwitcher(
                      duration: defaultDuration,
                      child: CircleAvatar(
                        backgroundColor: _isShowSignUp ? login_bg : signup_bg,
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
                ),
                //Social Buttons
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: size.width*0.1,
                  width: size.width,
                  right: _isShowSignUp? -size.width*0.06: size.width*0.06,
                  child: const SocalButtns(),
                ),

                //LoginText
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: _isShowSignUp ? size.height/2 - 80  : size.width*0.3,
                  left: _isShowSignUp? 0 : size.width*0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style:TextStyle(
                        fontSize:_isShowSignUp?20 :32, fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    child: Transform.rotate(
                      angle: -_animationTextRoate.value * pi/180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: (){
                          if(_isShowSignUp){
                            updateView();
                          }
                          else{
                            //Login
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding * 0.75),
                          width: 160,
                          // color: Colors.amber,
                          child: const Text('Login', textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                ),

                //SignupText
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: !_isShowSignUp ? size.height/2 - 80 : size.width*0.3,
                  right: _isShowSignUp? size.width*0.44 - 80 :0,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style:TextStyle(
                        fontSize:!_isShowSignUp?20 :32, fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                    child: Transform.rotate(
                      angle: (90 -_animationTextRoate.value) * pi/180,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: (){
                          if(_isShowSignUp){
                            //Signup
                          }
                          else{
                            updateView();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding * 0.75),
                          width: 160,
                          // color: Colors.amber,
                          child: const Text('Sign up', textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
