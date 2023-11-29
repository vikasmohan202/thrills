import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/util/constant.dart';

import '../../../border_theme.dart';
import '../../../cache_magement.dart';
import '../../../routes.dart';
import '../login_api.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  asyncInit() async {
    setState(() {});
    await SharedPrefUtil.init();
    setState(() {});
  }

  String? phone;
  String? otp;
  @override
  void initState() {
    asyncInit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AllAssests.backgroundImage,
                height: 400,
                width: 400,
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              const Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 48,
                    color: Color.fromARGB(255, 95, 91, 91),
                    fontWeight: FontWeight.bold),
              ),
              // const Text(
              //   'Enter Your Mobile Number',
              //   style: TextStyle(
              //       fontSize: 24,
              //       color: Color.fromARGB(255, 95, 91, 91),
              //       fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(
              //   height: 40,
              // ),
              Form(
                key: _formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Mobile Number',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length == 10) {
                            return null;
                          } else {
                            return 'Enter 10 digits';
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                          });
                        },
                        onSaved: (newValue) {
                          print(phone);
                          setState(() {
                            phone = newValue;
                          });
                        },
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        decoration: inputDecoration.copyWith(
                          suffixIcon: TextButton(
                            onPressed: () => LoginAPI().sendOTP(phone!),
                            child: Text('SEND'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 1),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: const Text(
                        'OTP',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: inputDecoration,
                        validator: (value) {
                          if (value!.length > 3) {
                            return null;
                          } else {
                            return 'Enter otp';
                          }
                        },
                        onSaved: (newValue) {
                          setState(() {
                            otp = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final form = _formKey.currentState;

                  if (form!.validate()) {
                    form.save();
                    SharedPrefUtil.setValue(isLogin, true);

                    Navigator.pushReplacementNamed(context, Routes.homePage);
                  }
                },
                child: const Center(child: Text('Continue')),
              ),
              // TextButton(
              //   onPressed: () => Navigator.pushNamed(context, 'signup-page'),
              //   child: const Text.rich(
              //     TextSpan(
              //       style: TextStyle(color: Colors.black, fontSize: 18),
              //       text: 'New User? ', // Default text style
              //       children: <TextSpan>[
              //         TextSpan(
              //           text: 'Sign Up',
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
