import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/AssetUtil.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<IntroAsset> _assetList = [];
  PageController _pageController = PageController();
  IntroAsset? item;

  void _initAsset() {
    _assetList.add(IntroAsset(Intro.keep_it_clean, "Keep it", "clean",
        "To Your Personalized Profile", Intro.first_three_dot));
    _assetList.add(IntroAsset(Intro.beauty_service, "Experience the best",
        "Beauty services", "Lorem ipsum", Intro.second_three_dot));
    _assetList.add(IntroAsset(Intro.beauty_and_spa, "Natural Beauty",
        "and Spa Salon", "Lorem ipsum", Intro.third_three_dot));
  }

  CarouselController buttonCarouselController = CarouselController();
  var initialIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initAsset();
    item = _assetList[initialIndex];
  }

  @override
  Widget build(BuildContext context) {
    item = _assetList[initialIndex];
    return SingleChildScrollView(
      child: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            CarouselSlider(
              items: _getImageList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  reverse: false,
                  height: Get.height,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  initialPage: initialIndex,
                  onPageChanged: (index, reason) {
                    setState(() {
                      initialIndex = index;
                    });
                  }),
            ),
            Positioned(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              left: 30,
              top: Get.height * 0.08,
            ),
            Positioned(
              top: Get.height * 0.2,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item?.title1 ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    item?.title2 ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                    indent: Get.width / 2 - 20,
                    endIndent: Get.width / 2 - 20,
                  ),
                  Text(
                    item?.subTitle ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            Positioned(
              top: Get.height * 0.8,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    //onTap: () => Get.off(LoginPage()),
                    child: const Text(
                      "SkIP",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Image.asset(item?.dotImage ?? ""),
                  GestureDetector(
                    onTap: () {
                      print("Clicked ----------- : $initialIndex");
                      if (initialIndex == 2) {
                        //Get.off(LoginPage());
                      } else {
                        /*_pageController.animateToPage((index + 1).toInt(),
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut);*/
                        buttonCarouselController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear);
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF49DD82),
                              Color(0xFF19B8B2),
                            ]),
                      ),
                      child: const Center(
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
        /*child: PageView(
          controller: _pageController,
          children: _getPageWidgets(),
        ),*/
      ),
    );
  }

  List<Widget> _getImageList() {
    List<Widget> itemList = [];
    _assetList.forEach((element) {
      itemList.add(
        Image.asset(
          element.image,
          width: Get.width,
          height: Get.height,
          fit: BoxFit.fill,
        ),
      );
    });
    return itemList;
  }
}

class IntroAsset {
  String image;
  String title1;
  String title2;
  String subTitle;
  String dotImage;

  IntroAsset(
      this.image, this.title1, this.title2, this.subTitle, this.dotImage);
}
