import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/all_colors.dart';
import 'package:trills/background.dart';
import 'package:trills/pages/profile/profile_api.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  PanelController _scrollController = PanelController();

  int calculateAge(DateTime dateOfBirth) {
    final currentDate = DateTime.now();
    final age = currentDate.year - dateOfBirth.year;

    // Check if the birthdate has occurred this year or not.
    if (currentDate.month < dateOfBirth.month ||
        (currentDate.month == dateOfBirth.month &&
            currentDate.day < dateOfBirth.day)) {
      // The birthdate has not occurred this year yet, subtract 1 from age.
      return age - 1;
    }

    return age;
  }

  getUserData() async {
    var response = await ProfileAPI().getUserData();
    print(response);
    return response['user'];

    // {user:
    //{_id: 654cdeb0d8afb80bc9cb6f05,
    //interests: [karaoke, yoga],
    //phone_number: +917004177568,
    //role: user,
    //profile_completed: true,
    //name: test2,
    //DOB: 2023-11-10T00:00:00.000Z,
    //gender: female}}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error'));
            }
            if (snapshot.hasData) {
              Map data = snapshot.data as Map;
              return Stack(
                children: [
                  Image.asset(AllAssests.sampleWomen2),
                  Positioned(
                    // bottom: 70,
                    // right: 0,
                    // left: 0,
                    child: SlidingUpPanel(
                      controller: _scrollController,
                      minHeight: MediaQuery.sizeOf(context).height * 0.45,
                      maxHeight: MediaQuery.sizeOf(context).height * 0.80,
                      panel: Container(
                        // width: 375,
                        clipBehavior: Clip.hardEdge,
                        height: 939,
                        width: MediaQuery.sizeOf(context).width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: ShapeDecoration(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        child: Column(
                          // physics: NeverScrollableScrollPhysics(),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${data['name']}, ${calculateAge(DateTime.parse(data['DOB'])).toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Sk-Modernist',
                                    fontWeight: FontWeight.w700,
                                    height: 0.06,
                                  ),
                                ),
                                Container(
                                  width: 62,
                                  height: 62,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFFE8E6EA)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Image.asset(AllAssests.sendIcon),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: 'Location',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26,
                                        fontFamily: 'Sk-Modernist',
                                        fontWeight: FontWeight.w700,
                                        // height: 0.09,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '\nChicago, IL United States',
                                          style: TextStyle(
                                            color: Colors.black
                                                .withOpacity(0.699999988079071),
                                            fontSize: 16,
                                            fontFamily: 'Sk-Modernist',
                                            fontWeight: FontWeight.w400,
                                            // height: 0.11,
                                          ),
                                        )
                                      ]),
                                ),
                                Container(
                                  width: 71,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    color: Color.fromARGB(100, 75, 22, 76),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: ColorPallate.purple,
                                      ),
                                      Text(
                                        '1 km',
                                        style: TextStyle(
                                          color: Color(0xFF4B164C),
                                          fontSize: 16,
                                          fontFamily: 'Sk-Modernist',
                                          fontWeight: FontWeight.w700,
                                          // height: 0.12,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'About',
                              style: TextStyle(
                                // color: Colors.black,
                                fontSize: 26,
                                fontFamily: 'Sk-Modernist',
                                fontWeight: FontWeight.w700,
                                // height: 0.09,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..',
                              style: TextStyle(
                                color:
                                    Colors.black.withOpacity(0.699999988079071),
                                fontSize: 14,
                                fontFamily: 'Sk-Modernist',
                                fontWeight: FontWeight.w400,
                                // height: 0.11,
                              ),
                              softWrap: true,
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: data['interests'].length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 3 / 1,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      // width: 91,
                                      // height: 32,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: ColorPallate.purple),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          data['interests'][index],
                                          style: TextStyle(
                                            color: ColorPallate.purple,
                                            fontSize: 17,
                                            fontFamily: 'Sk-Modernist',
                                            fontWeight: FontWeight.w700,
                                            // height: 0.11,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(child: Text('No data'));
          }),
    );
  }
}
