import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Wallpaperimage = [
    "images/wallpaper1.jpeg",
    "images/wallpaper2.jpeg",
    "images/wallpaper3.jpeg"
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(60),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "images/boy.jpeg",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  width: 80.0,
                ),
                const Text(
                  'Wallify!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            CarouselSlider.builder(
                itemCount: Wallpaperimage.length,
                itemBuilder: (context, index, realIndex) {
                  final res = Wallpaperimage[index];
                  return buildImage(res, index);
                },
                options: CarouselOptions(
                    autoPlay: true,
                    height: MediaQuery.of(context).size.height / 1.5,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    })),
            const SizedBox(
              height: 20,
            ),
            Center(child: buildIndicator())
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 3,
        effect:const SlideEffect(
          dotHeight: 15.0,
          dotWidth: 15.0,
          activeDotColor: Colors.blue,
        ),
      );

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.only(right: 10.0),
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}
