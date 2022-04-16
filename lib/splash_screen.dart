import 'dart:async';
import 'package:flutter/material.dart';
import 'package:one_clx/authentication/login.dart';
import 'package:one_clx/constants/constant.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => login()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/load.png',fit: BoxFit.fill, height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,),
    );
  }
}
