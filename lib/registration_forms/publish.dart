import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/website_created.dart';

class Publish extends StatefulWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff385CB7), Color(0xff5F89D8),])),
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text('Publish',style: Const.appbartxt,),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20,100,20,10),
            child: Center(child: Text('EASILY IN MINUTES',style: Const.Normalbold,)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,5,20,10),
            child: Center(child: Text("Create a website for your business.",style: Const.Normal,textAlign: TextAlign.justify)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,20,8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary:const Color(0xff5F89D8) ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    primary: const Color(0xff5F89D8),
                  ),
                  child: Text("Previous",style: Const.btntxt,),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,20,8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary:const Color(0xff5F89D8) ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    primary: const Color(0xff5F89D8),
                  ),
                  child: Text("Publish",style: Const.btntxt,),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Website_Created()),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,0),
            child: Align(child: Text("5 of 6 Completed",style: Const.Normal,), alignment: Alignment.topLeft,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,8),
            child: Stack(
              children: [
                SizedBox(
                  height: 22,
                  child: LinearProgressIndicator(
                    value: 1.0,
                    backgroundColor: Color(0xffF0F0F0),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                  ),
                ),
                Align(child: Text("100%",style: Const.common,), alignment: Alignment.topCenter,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
