import 'package:flutter/material.dart';
import 'package:trills/all_colors.dart';
import 'package:trills/background.dart';

import '../../../cache_magement.dart';
import '../../../routes.dart';
import '../../profile_detail/profile_detail_api.dart';

class GenderSelectPage extends StatefulWidget {
  const GenderSelectPage({super.key});

  @override
  State<GenderSelectPage> createState() => _GenderSelectPageState();
}

class _GenderSelectPageState extends State<GenderSelectPage> {
  void selectGender(int gender) {
    setState(() {
      selectedIndex = gender;
      selectedGender = genderList[gender];
    });
  }

  List<String> genderList = ["female", "male", "other"];
  String selectedGender = "";
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        widget: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFE8E6EA)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  TextButton(
                      onPressed: () async {
                        await CacheMangement().setCurrentScreen(1);
                        Navigator.pushReplacementNamed(
                            context, Routes.homePage);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xFF4B164C),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          // height: 0.09,
                        ),
                      ))
                ],
              ),
              SizedBox(height: 10),
              Text(
                'I am a',
                style: TextStyle(
                  // color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  // height: 0.04,
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  selectGender(0);
                },
                child: Container(
                  width: 295,
                  height: 58,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: ShapeDecoration(
                    color: selectedIndex == 0 ? AllCOlors.purple : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1,
                          color: selectedIndex == 3
                              ? Colors.red
                              : Color(0xFFE8E6EA)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Woman',
                        style: TextStyle(
                          color:
                              selectedIndex == 0 ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.check,
                          color: selectedIndex == 0
                              ? Colors.white
                              : AllCOlors.purple,
                          size: 20)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  selectGender(1);
                },
                child: Container(
                  width: 295,
                  height: 58,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: ShapeDecoration(
                    color: selectedIndex == 1 ? AllCOlors.purple : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1,
                          color: selectedIndex == 3
                              ? Colors.red
                              : Color(0xFFE8E6EA)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Man',
                        style: TextStyle(
                          color:
                              selectedIndex == 1 ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.check,
                          color: selectedIndex == 1
                              ? Colors.white
                              : AllCOlors.purple,
                          size: 20)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  selectGender(2);
                },
                child: Container(
                  width: 295,
                  height: 58,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: ShapeDecoration(
                    color: selectedIndex == 2 ? AllCOlors.purple : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1,
                          color: selectedIndex == 3
                              ? Colors.red
                              : Color(0xFFE8E6EA)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose another',
                        style: TextStyle(
                          color:
                              selectedIndex == 2 ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.check,
                          color: selectedIndex == 2
                              ? Colors.white
                              : AllCOlors.purple,
                          size: 20)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
            ]),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.only(bottom: 5),
            child: ElevatedButton(
                onPressed: () async {
                  if (selectedIndex == -1) {
                    setState(() {
                      selectedIndex = 3;
                    });
                  }
                  if (selectedIndex != -1 && selectedIndex != 3) {
                    bool done =
                        await ProfileDetailAPI().addGender(selectedGender);
                    if (done == true) {
                        await CacheMangement().setCurrentScreen(2);
                      Navigator.pushReplacementNamed(
                          context, Routes.interestPage);
                    }
                  }
                },
                child: Text('Continue')),
          )
        ],
      ),
    ));
  }
}
