import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallify_ui/types/full_image.dart';

import '../api/model.dart';

Widget wallpaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      padding: EdgeInsets.all(4.0),
      crossAxisCount: 2,

      children: listPhotos.map((PhotosModel photosModel) {
        return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imagepath: photosModel.src!.portrait!)));
            },
            child: Hero(
              tag: photosModel.src!.portrait!, // Null check for portrait
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: photosModel.src!.portrait!, // Null check for portrait
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
