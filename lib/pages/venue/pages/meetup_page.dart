import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trills/background.dart';
import 'package:trills/constant/constant.dart';
import 'package:trills/pages/venue/widget/carousel.dart';

class MeetupPage extends StatefulWidget {
  const MeetupPage({super.key});

  @override
  State<MeetupPage> createState() => _MeetupPageState();
}

class _MeetupPageState extends State<MeetupPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BackgroundWidget(
        Padding: const EdgeInsets.all(0),
        widget: Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: size.height / 2.3,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.5,
                        image: AssetImage('assets/images/sample_hotel.jpg'))),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Meetup",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    width: size.width - 40,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(0.2))
                        ],
                        color: const Color.fromRGBO(255, 255, 255, 0.2)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.flag,
                          color: Color.fromARGB(255, 238, 16, 0),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Turkey/Istanbul",
                          style: TextStyle(color: whiteColor),
                        ),
                      ],
                    ),
                  ),
                  CarouselDemo(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(colors: [
                                  const Color.fromRGBO(190, 45, 167, 0.26),
                                  purpleColor,
                                ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Approve",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: whiteColor),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: whiteColor,
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Material(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: const LinearGradient(colors: [
                                  Color.fromRGBO(150, 144, 176, 1),
                                  Color.fromRGBO(219, 211, 255, 0.26)
                                ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: whiteColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Skip",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(color: whiteColor),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: Colors.red,
                              backgroundImage: NetworkImage(
                                  'https://images.pexels.com/photos/623305/pexels-photo-623305.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Kimia",
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text("27",
                                    style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 77, 68, 68))),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "This user has booked",
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 77, 68, 68)),
                              ),
                              Text("Hotel Hilton",
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              Text("Wednesday , April 12, 2023",
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
