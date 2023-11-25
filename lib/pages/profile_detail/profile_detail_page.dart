import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/background.dart';
import 'package:trills/pages/profile_detail/profile_detail_api.dart';
import 'package:trills/routes.dart';

import '../../border_theme.dart';
import '../../cache_magement.dart';
import '../login/login_api.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  String name = "";
  String lastName = "";
  DateTime? birthdate;
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        widget: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () async {
                      await CacheMangement().setIsCompleted(false);
                      await CacheMangement().setCurrentScreen(0);
                      Navigator.pushReplacementNamed(context, Routes.homePage);
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
           const Text(
              'Profile details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
// height: 0.04,
              ),
            ),
            // Container(
            //   width: 156,
            //   height: 156,
            //   decoration: ShapeDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(AllAssests.sampleWomen),
            //       fit: BoxFit.fill,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //   ),
            // ),
            Form(
              key: _formKey,
              child: ListView(
                // physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    // child: Text(
                    //   'First Name',
                    //   style: TextStyle(fontSize: 20),
                    // ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length > 1) {
                          return null;
                        } else {
                          return 'Enter Name';
                        }
                      },
                      onChanged: (value) {},
                      onSaved: (newValue) {
                        // print(phone);
                        // setState(() {
                        //   phone = newValue;
                        // });
                        name = newValue.toString();
                      },
                      // maxLength: 10,
                      // keyboardType: TextInputType.phone,
                      decoration:
                          inputDecoration.copyWith(labelText: 'First Name'),
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 5),
                  //   padding: const EdgeInsets.symmetric(horizontal: 12),
                  //   child: const Text(
                  //     'Last Name',
                  //     style: TextStyle(fontSize: 20),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: TextFormField(
                      // keyboardType: TextInputType.phone,
                      decoration: inputDecoration.copyWith(
                        labelText: 'Last Name',
                      ),
                      validator: (value) {
                        if (value!.length > 3) {
                          return null;
                        } else {
                          return 'Enter last Name';
                        }
                      },
                      onSaved: (newValue) {
                        lastName = newValue.toString();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    decoration:
                        inputDecoration.copyWith(labelText: 'Birth Date'),
                    onTap: () async {
                      // DatePickerDialog(
                      //     firstDate: DateTime.now(), lastDate: DateTime(2100));
                      birthdate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(
                            1950), // Set the earliest date you want to allow
                        initialDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (birthdate != null) {
                        setState(() {
                          _dateController.text =
                              birthdate.toString().split(" ")[0];
                          // birthdate = selectedDate;
                        });
                      }
                    },

                    validator: (value) {
                      if (_dateController.text.isNotEmpty) {
                        return null;
                      } else {
                        return 'Select DOB';
                      }
                    },
                    // onSaved: (newValue) {
                    //   DOB = _dateController.text;
                    // },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                final formState = _formKey.currentState;
                if (formState!.validate()) {
                  formState.save();
                  // _dateController.currentState!.text =
                  bool done = await ProfileDetailAPI()
                      .addDetails(name, birthdate.toString().split(" ")[0]);
                  if (done == true) {
                    await CacheMangement().setCurrentScreen(1);
                    await CacheMangement().setIsCompleted(false);
                    Navigator.pushReplacementNamed(context, Routes.genderPage);
                  }
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    ));
  }
}
