import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_clx/registration_forms/business_description.dart';
import 'package:swipe_to/swipe_to.dart';

class Google_Location extends StatefulWidget {
  const Google_Location({Key? key}) : super(key: key);

  @override
  State<Google_Location> createState() => _Google_LocationState();
}

class _Google_LocationState extends State<Google_Location> {
  GoogleMapController? controller;
  Set<Marker> _markers={};
  final CameraPosition initialPosition =
  CameraPosition(target: LatLng(11.342423, 77.728165));
  var typemap = MapType.normal;
  var cordinate1 = 'cordinate';
  var lat = 19.060617;
  var long = 72.848791;
  var address = "";
  Future<void> getAddress(latt, longg) async {
    List<Placemark> placemark = await placemarkFromCoordinates(latt, longg);
    print(
        '-----------------------------------------------------------------------------------------');
    //here you can see your all the relevent information based on latitude and logitude no.
    print(placemark);
    print(
        '-----------------------------------------------------------------------------------------');
    Placemark place = placemark[0];
    setState(() {
      address =
      '${place.street}, ${place.subLocality}, ${place.locality},${place.administrativeArea},${place.postalCode}, ${place.country}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffFFFFFF),
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.0,
                        0.1,
                        0.3,
                      ],
                      colors: [
                        Color(0xff385CB7),
                        Color(0xff5F89D8),
                        Color(0xffFFFFFF),
                      ]
                  )
              ),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20,45,20,10),
                      child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FGL.png?alt=media&token=9f42df4f-44dd-4395-81b6-5f1c38257596",width: 70,)
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,10),
                    child: Center(child: Text('Google Location',style: Const.appbartxt,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,30,20,2),
                    child: Align(child: Text("2 of 6 Completed",style: Const.OTPtxt,), alignment: Alignment.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,8),
                    child: SizedBox(
                      height: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: LinearProgressIndicator(
                          value: 0.4,
                          backgroundColor: Color(0xffF7F8FC),
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,10),
                    child: Center(child: Text('PIN YOUR BUSINESS LOCATION',style: Const.Normalbold,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,5,20,10),
                    child: Center(child: Text('Add Map Location For Your Business',style: Const.Normal,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        height: 200,
                        child: GoogleMap(
                          myLocationButtonEnabled: true,
                          initialCameraPosition: initialPosition,
                          mapType: typemap,
                          onMapCreated: (controller) {
                            setState(() {
                              controller = controller;
                            });
                          },
                          markers: _markers,
                          onTap: (cordinate) {
                            setState(() {
                              _markers.add(
                                  Marker(markerId: MarkerId('Home'),
                                      position: LatLng(cordinate.latitude, cordinate.longitude)
                                  ));
                              lat = cordinate.latitude;
                              long = cordinate.longitude;
                              getAddress(lat, long);
                              cordinate1 = cordinate.toString();
                            });
                            print(address);
                            print(cordinate1);
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: Text(address,style: Const.Normal,),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg1.png?alt=media&token=8aa401b4-5635-451f-af67-3dcd82117797",width: 70,),
                          Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FLefi.png?alt=media&token=6ce0a918-d370-46ac-8569-13be12e85940",),
                          SwipeTo(
                            child: Text("Swipe",style: Const.common,),
                            iconColor: Colors.transparent,
                            onLeftSwipe: () async{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Business_Description()),
                              ) ;
                              // if(address.isNotEmpty)
                              // {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => const Business_Description()),
                              //   );
                              // }else{
                              //
                              // }

                            },
                            onRightSwipe: ()async{
                              Navigator.pop(context);
                            },

                          ),
                          Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2FRight.png?alt=media&token=6f429db7-33c2-4063-865b-f0f8417a4acc",),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Flogo%2Fimg2.png?alt=media&token=b8fcb386-3ab4-4f9c-bece-bc3be039c5e5",width: 70,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
