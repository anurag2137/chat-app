import 'package:flutter/material.dart';

import 'package:wallify_ui/widget/category_design.dart';
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Text(
              'Categories',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
                      ),
            ),
            SizedBox(height: 15.0,),
            CategoryContainerDesign(categoryName: 'wildLife',imageUrl: 'images/Wildlife.jpeg',),
            CategoryContainerDesign(categoryName: 'Nature',imageUrl: 'images/nature.jpeg',),
            CategoryContainerDesign(categoryName: 'food',imageUrl: 'images/food.jpeg',),
            CategoryContainerDesign(categoryName: 'city',imageUrl: 'images/city.jpeg',),



        ]
            )
          
          ),
        ),
      );
  }
}
