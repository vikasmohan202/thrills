import 'package:flutter/material.dart';
import 'package:trills/background.dart';
import 'package:trills/pages/home/widgets/appbar_back_button.dart';
import 'package:trills/pages/venue/pages/select_place.dart';
import 'package:trills/routes.dart';

import '../../../all_assets.dart';

class VenuePage extends StatelessWidget {
  const VenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      Padding: const EdgeInsets.all(20),
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          // physics: NeverScrollableScrollPhysics(),
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
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Venue",
                  style: TextStyle(
                    color: Color(0xFF5F5B5B),
                    fontSize: 34,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0.04,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.reservePage);
                        },
                        child: Container(
                          // height: 150,
                          // width: 60,
                          clipBehavior: Clip.hardEdge,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            color: Colors.white,
                          ),
                          child: Stack(
                            // alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              SizedBox(
                                height: double.maxFinite,
                                child: Image.asset(
                                  AllAssests.sampleVenue,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const ShapeDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8.0),
                                          bottomLeft: Radius.circular(8.0),
                                        ),
                                      )),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.person_add_alt_outlined,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
