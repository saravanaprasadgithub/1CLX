import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_clx/constants/constant.dart';
import 'package:one_clx/registration_forms/publish.dart';
import 'package:swipe_to/swipe_to.dart';

class Business_Images extends StatefulWidget {
  const Business_Images({Key? key}) : super(key: key);

  @override
  State<Business_Images> createState() => _Business_ImagesState();
}

class _Business_ImagesState extends State<Business_Images> {
  final userid = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  UploadTask? task;
  List<PlatformFile> images = [];
  PlatformFile? pickedFile;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll){
          overscroll.disallowIndicator();
          return false;
        },
        child: SingleChildScrollView(
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
                    child: Image.network("https://firebasestorage.googleapis.com/v0/b/oneclx.appspot.com/o/asset%2Ficon%2FBI.png?alt=media&token=0d982904-2abe-4d03-811c-10364404ef8b",width: 70,)
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,20,20,10),
                  child: Center(child: Text('Business Images',style: Const.appbartxt,)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,60,20,2),
                  child: Align(child: Text("4 of 6 Completed",style: Const.OTPtxt,), alignment: Alignment.center,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,8),
                  child: SizedBox(
                    height: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: LinearProgressIndicator(
                        value: 0.9,
                        backgroundColor: Color(0xffF7F8FC),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F76CA)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,20,8),
                  child: Center(child: Text('ADD PHOTOS OF YOUR BUSINESS',style: Const.Normalbold,)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,5,20,8),
                  child: Center(child: Text("Business photos create your customer's first impression of your company.The best photos send a message to customers about the company's value, create brand loyalty, and sign a more professional appearance.",style: Const.Normal,textAlign: TextAlign.justify)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,5,20,8),
                  child: Center(child: Text("Upload business photos for your business website",style: Const.Normal,textAlign: TextAlign.justify)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,8,20,8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary:const Color(0xff5F89D8) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      primary: const Color(0xff5F89D8),
                    ),
                    child: Text("Upload Image",style: Const.btntxt,),
                    onPressed: () async {
                      selectFile();
                    },
                  ),
                ),
                Text("Atleast 3 images (Size : 300 x 300 Pixels)",style:Const.txt),
                SizedBox(height: 5,),
                Container(
                  height: 150,
                  // width: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.isEmpty? 1 :images.length,
                    itemBuilder: (context,index){
                      return Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            color: Color(0xffF1F1F1),
                            child: images.isNotEmpty?Image.file(File(images[index].path!),fit: BoxFit.fill,):Center(child: Text('Image',style: Const.txt,)),
                          ),
                          Positioned(
                              top: 0.0,
                              right: 0.0,
                              child:InkWell(
                                onTap: (){
                                  setState(() {
                                    images.removeAt(index);
                                  });
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    radius: 12.0,
                                    backgroundColor: Color(0xffD6D5D5),
                                    child: Icon(
                                      Icons.close,color: Const.iconclr,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                task != null ? buildUploadStatus(task!) : Container(),
                Row(
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
                          MaterialPageRoute(builder: (context) => const Publish()),
                        );
                        // if(images.length>2)
                        // {
                        //   final fileName= pickedFile!=null ? pickedFile!.name:'No File Selected';
                        //   print(fileName);
                        //   try {
                        //     for(pickedFile in images ){
                        //       await uploadFile();
                        //     }
                        //     firestoreInstance.collection("Business Details").doc(userid!.email).update(
                        //         {
                        //           'Business Images':fileName
                        //         }
                        //     ).then((value) => {
                        //       // Navigator.push(context, MaterialPageRoute(builder: (context) => const Business_Images()),),
                        //     });
                        //     await task!.whenComplete(() {
                        //       Fluttertoast.showToast(
                        //           timeInSecForIosWeb: 1,
                        //           msg: "Your files & Details Uploaded Successfully..!!!",
                        //           toastLength: Toast.LENGTH_SHORT,
                        //           gravity: ToastGravity.BOTTOM,
                        //           backgroundColor: Colors.green,
                        //           textColor: Colors.white
                        //       );
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => const Publish()),);
                        //     }
                        //     );
                        //   } catch (e) {
                        //     Fluttertoast.showToast(
                        //         timeInSecForIosWeb: 1,
                        //         msg: "Please Add Atleast 3 Images",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.BOTTOM,
                        //         backgroundColor: Colors.deepOrange,
                        //         textColor: Colors.white
                        //     );
                        //   }
                        //   return;
                        // }
                        // else{
                        //     Fluttertoast.showToast(
                        //         timeInSecForIosWeb: 1,
                        //         msg: "Please Add Atleast 3 Images",
                        //         toastLength: Toast.LENGTH_SHORT,
                        //         gravity: ToastGravity.BOTTOM,
                        //         backgroundColor: Colors.deepOrange,
                        //         textColor: Colors.white
                        //     );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.image);
    if(result==null) return;
    images = result.files;
    pickedFile = result.files.first;
    File image= File(pickedFile!.path!);
    var decodedImage = await decodeImageFromList(image.readAsBytesSync());
    print(decodedImage.width);
    print(decodedImage.height);
    if(decodedImage.width<=300&&decodedImage.height<=300){
      Fluttertoast.showToast(
          timeInSecForIosWeb: 1,
          msg: "Image Support above Width 300 & Height 300",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white
      );
    }
    else {
      setState(() {
        images = result.files;
        pickedFile = result.files.first;
      });
    }
  }
  Future uploadFile() async {
    final file = File(pickedFile!.path!);
    final path = 'Business Images/${userid!.email}/${pickedFile!.name}';
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      task=ref.putFile(file);
    });
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if(snapshot.hasData){
        final data =snapshot.data!;
        double progress = data.bytesTransferred/data.totalBytes;
        return SizedBox(
          height: 50,
          child: Stack(
            fit: StackFit.expand,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey,
                color: Colors.green,
              ),
              Center(
                child: Text(
                  '${(100 * progress).roundToDouble()}%',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    },
  );
}
