import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallify_ui/service/database.dart';

class AllWallpaper extends StatefulWidget {
  final String category;

  const AllWallpaper({super.key, required this.category});

  @override
  State<AllWallpaper> createState() => _AllWallpaperState();
}

class _AllWallpaperState extends State<AllWallpaper> {
   Stream? categoryStream;



   getOnLoad() async {
    categoryStream = await DatabaseMethods().getCategory(widget.category);
    setState(() {

    });
  }
   @override
   void initState() {
     super.initState();
     print(widget.category);
     getOnLoad();
   }

  Widget allWallpaper() {
    return StreamBuilder(
        stream: categoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          if(snapshot.data == null){
            return Center(child: CupertinoActivityIndicator(),);
          }
          return  GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 6.0,
              ),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(ds["Image"],fit: BoxFit.cover,)),
                );
              });
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50,left: 10,right: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.category,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "poppins"),
              ),
            ),
            Expanded(child: allWallpaper()),
          ],
        ),
      ),
    );
  }
}
