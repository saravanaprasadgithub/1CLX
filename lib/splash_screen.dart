import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_clx/authentication/login.dart';
import 'package:permission_handler/permission_handler.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Future<void> requestLocationPermission() async {

    final serviceStatusLocation = await Permission.locationWhenInUse.isGranted ;

    bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
      Timer(Duration(seconds: 5),
              ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => login()
              )
          )
      );
    } else if (status == PermissionStatus.denied) {
          Fluttertoast.showToast(
              timeInSecForIosWeb: 1,
              msg: "Enable Location Permission",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.deepOrange,
              textColor: Colors.white
          );
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      Fluttertoast.showToast(
          timeInSecForIosWeb: 1,
          msg: "Enable Location Permission Always",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white
      );
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }
  void initState() {
    super.initState();
    requestLocationPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/load.png"),
            fit: BoxFit.fill,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(
              color: Color(0xff385CB7),
            ),
          ),
        ),
      ),
    );
  }
}
