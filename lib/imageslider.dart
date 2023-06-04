import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class LmsCarousel extends StatelessWidget {
  List imagelist = [
    'assets/images/supermarket1.jpg',
    'assets/images/supermarket2.jpg',
    'assets/images/supermarket3.jpg',
    'assets/images/supermarket4.jpg',
    'assets/images/supermarket5.jpg',
    'assets/images/supermarket6.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.amber,
        height: 200,
        child: CarouselSlider.builder(
          unlimitedMode: true,
          viewportFraction: 1,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          scrollPhysics: const BouncingScrollPhysics(),
          enableAutoSlider: true,
          autoSliderTransitionCurve: Curves.decelerate,
          autoSliderDelay: const Duration(seconds: 5),
          autoSliderTransitionTime: const Duration(milliseconds: 1000),
          itemCount: imagelist.length,
          slideBuilder: (index) {
            final image = imagelist[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        image: AssetImage(imagelist[index]),
                        fit: BoxFit.cover)),
              ),
            );
          },
          slideIndicator: CircularSlideIndicator(
            itemSpacing: 20,
            indicatorRadius: 6,
            indicatorBorderWidth: 1,
            currentIndicatorColor: Color.fromARGB(255, 6, 102, 56),
            indicatorBackgroundColor: Colors.grey,
            padding: EdgeInsets.only(bottom: 30),
          ),
        ));
  }
}
