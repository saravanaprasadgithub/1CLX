import 'package:flutter/material.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_clx/registration_forms/business_description.dart';

class Google_Location extends StatefulWidget {
  const Google_Location({Key? key}) : super(key: key);

  @override
  State<Google_Location> createState() => _Google_LocationState();
}

class _Google_LocationState extends State<Google_Location> {
  GoogleMapController? controller;
  Set<Marker> _markers={};
  final CameraPosition initialPosition =
  CameraPosition(target: LatLng(11.342423, 77.728165),zoom: 10);
  var typemap = MapType.normal;
  var cordinate1 = 'cordinate';
  var lat = 19.060617;
  var long = 72.848791;
  var address = '';
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
        title: Text('Google Location',style: Const.appbartxt,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20,10,20,10),
              child: Center(child: Text('PIN YOUR BUSINESS LOCATION',style: Const.Normalbold,)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,5,20,10),
              child: Center(child: Text('Add Map Location For Your Business',style: Const.Normal,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 350,
                child: GoogleMap(
                //  markers: ,
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(address,style: Const.Normalbold,),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,8,20,8),
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
                  padding: const EdgeInsets.fromLTRB(20,8,20,8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary:const Color(0xff5F89D8) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      primary: const Color(0xff5F89D8),
                    ),
                    child: Text("Next",style: Const.btntxt,),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Business_Description()),
                      );
                      // if(_formkey.currentState!.validate())
                      // {
                      //
                      // }else{
                      //   print("UnSuccessfull");
                      // }
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,8,20,0),
              child: Align(child: Text("2 of 6 Completed",style: Const.Normal,), alignment: Alignment.topLeft,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,8),
              child: Stack(
                children: [
                  SizedBox(
                    height: 15,
                    child: LinearProgressIndicator(
                      value: 0.4,
                      backgroundColor: Color(0xffF0F0F0),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                    ),
                  ),
                  Align(child: Text("40%",style: Const.Normal,), alignment: Alignment.topCenter,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}