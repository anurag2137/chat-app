import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallify_ui/widget/widget.dart';

import '../api/model.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotosModel> photos = [];
  TextEditingController searchcontroller = new TextEditingController();

  Future<void> getSearchWallpaper(String searchQuery) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"),
        headers: {
          "Authorization":
              "8dttEsepWjGKn8jKgwv8B6mL5pDh0k85FqWrK4ANslI6TxNfSY4pKfSP"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      print(jsonData['photos']);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Search',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: searchcontroller,
                decoration:  InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      onTap: () async {
                       await getSearchWallpaper(searchcontroller.text);
                      },
                      child: const Icon(
                        Icons.search_outlined ,
                        color: Color.fromARGB(225, 84, 87, 93),
                      ),
                    )),
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(child: wallpaper(photos, context))
          ],
        ),
      ),
    );
  }
}
