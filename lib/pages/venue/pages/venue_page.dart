import 'package:flutter/material.dart';
import 'package:trills/background.dart';

import '../../../all_assets.dart';

class VenuePage extends StatelessWidget {
  const VenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Venue",
                  style: const TextStyle(
                    color: Color(0xFF5F5B5B),
                    fontSize: 34,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0.04,
                  ),
                ),
                // ElevatedButton.icon(
                //     style:
                //         ElevatedButton.styleFrom(padding: EdgeInsets.all(12)),
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.sort,
                //       size: 30,
                //     ),
                //     label: Text(''))
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF4B164C),
                        fontSize: 24,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ))
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
                      return Container(
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
                                padding: EdgeInsets.all(8.0),
                                decoration: ShapeDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                      ),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
