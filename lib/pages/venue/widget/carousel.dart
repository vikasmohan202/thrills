import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselDemo extends StatefulWidget {
  CarouselDemo({super.key});

  @override
  State<CarouselDemo> createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: List.generate(
              5,
              (index) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/sample_hotel.jpg'))),
                  )),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: .9,
            height: MediaQuery.of(context).size.height / 2.5,
          ),
        ),
        // ElevatedButton(
        //   onPressed: () => buttonCarouselController.nextPage(
        //       duration: Duration(milliseconds: 300), curve: Curves.linear),
        //   child: Text('→'),
        // )
      ]);
}
