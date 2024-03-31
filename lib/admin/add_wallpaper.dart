
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import '../service/database.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  final List<String> categoryitems = [
    'wildLife',
    'Foods',
    'Nature',
    'City',
    'weed '
  ];
  String? value;
  final ImagePicker _picker= ImagePicker();
  File? selectedImage;

  Future getImage()async {
    var image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path);
    });
  }
    uploaditem() async {
      if (selectedImage != null) {
        String addId = randomAlphaNumeric(10);
        Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
            "blogImages").child(addId);
        final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

        var downloadUrl = await(await task).ref.getDownloadURL();
        Map<String, dynamic> addItem = {
          "Image": downloadUrl,
          "Id": addId,
        };
        await DatabaseMethods().addWallpaper(addItem, addId, value!).then((
            value) {
          Fluttertoast.showToast(
              msg: "Wallpaper has been uploaded successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.grey[800],
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Add Wallpaper",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: 'Poppins'),
        ),
      ),
      body: Container(
        child: Column(
          children: [
           const SizedBox(
              height: 20,
            ),
            selectedImage== null?GestureDetector(
              onTap: (){
                getImage();
              },
              child: Center(
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 250,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ):Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 250,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.file(
                    selectedImage!,
                      fit:BoxFit.cover,
                      //color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    items: categoryitems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ))
                        .toList(),
                  onChanged: ((value)=>setState(() {
                    this.value=value;

                  }) ),
                  hint: Text('Select Category'),
                  value:  value,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            GestureDetector(
              onTap: () {
                uploaditem();

              },
              child: Container(
                padding:
                EdgeInsets.symmetric(vertical: 12.0),
                margin:
                EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                    BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'ADD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

}
