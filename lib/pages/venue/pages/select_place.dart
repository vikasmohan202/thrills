import 'package:flutter/material.dart';
import 'package:trills/background.dart';
import 'package:trills/constant/constant.dart';
import 'package:trills/pages/home/widgets/appbar_back_button.dart';
import 'package:trills/routes.dart';

class SelectPlace extends StatefulWidget {
  const SelectPlace({super.key});

  @override
  State<SelectPlace> createState() => _SelectPlaceState();
}

class _SelectPlaceState extends State<SelectPlace> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BackgroundWidget(
        Padding: const EdgeInsets.all(20),
        widget: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customBackButton(context),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SelectPlace()));
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xFF4B164C),
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Venue",
                          style: TextStyle(
                              color: purpleColor,
                              fontSize: 34,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        const Text(
                          "Choose your dream place",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    ListView(shrinkWrap: true, children: [
                      listTile("Coffee Shop", () {}),
                      listTile("Trills Events", () {
                        
                      }),
                      listTile("Family Meetup", () {
                        Navigator.pushNamed(context, Routes.meetupPage);
                      }),
                    ]),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
              )
            ],
          ),
          bottomSheet: SizedBox(
            width: size.width,
            height: 56,
            child: FilledButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: purpleColor,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.venuePage);
                },
                child: Text(
                  "Book Now",
                  style: TextStyle(color: whiteColor, fontSize: 16),
                )),
          ),
        ));
  }

  listTile(title, onTap) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 20),
            blurRadius: 20,
            spreadRadius: 0,
            color: shadowColor)
      ]),
      child: Material(
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: TextStyle(
                color: purpleColor, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          trailing: CircleAvatar(
            radius: 15,
            backgroundColor: purpleColor,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
