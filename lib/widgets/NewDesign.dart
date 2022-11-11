import 'dart:math';

import 'package:animated_login_signup_page_in_flutter/constants.dart';
import 'package:flutter/material.dart';

class NewDesign extends StatefulWidget {
  const NewDesign({Key? key}) : super(key: key);

  @override
  State<NewDesign> createState() => _NewDesignState();
}

class _NewDesignState extends State<NewDesign> {
  bool _isShowSignUp =false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: (){
            setState(() {
              _isShowSignUp =! _isShowSignUp;
              print(_isShowSignUp);
            });
          },
          child: Row(
            children: [
              AnimatedContainer(
                width: _isShowSignUp ? size.width*0.1:size.width*0.9,
                height: size.height,
                color: Colors.red,
                duration: defaultDuration,
                child: Center(
                    child: Transform.rotate(
                        angle: _isShowSignUp ?-90 * pi/180 : 0*pi/180,
                        alignment: Alignment.topLeft,
                        child: Text('one'))),),
              AnimatedContainer(
                width: _isShowSignUp ? size.width*0.9:size.width*0.1,
                height: size.height,
                color: Colors.blue,
                duration: defaultDuration, child: Center(child: Text('two')),),
            ],),
        ),
      ),
    );
  }
}
