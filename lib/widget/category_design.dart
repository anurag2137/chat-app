
import 'package:flutter/material.dart';
import 'package:wallify_ui/types/all_wallpaper.dart';

class CategoryContainerDesign extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  const CategoryContainerDesign({super.key,required this.categoryName,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllWallpaper(category: categoryName)));
      },
      child: Container(
        margin:const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20 ),
        width: MediaQuery.of(context).size.width,
        decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(20)
        ),
        child: Stack(children: [
          ClipRRect(
              borderRadius:BorderRadius.circular(20),
              child: Image.asset(imageUrl,width:MediaQuery.of(context).size.width,height: 200,fit: BoxFit.cover,)),
          Container(
            width:MediaQuery.of(context).size.width,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius:BorderRadius.circular(20),
            ),
            child:  Center(
              child: Text(
               categoryName,
                style: const TextStyle(color: Colors.white,fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),),
            ),),

        ],),
      ),
    );
  }
}
