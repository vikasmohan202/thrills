import 'package:flutter/material.dart';
import 'package:trills/routes.dart';

import '../../../all_assets.dart';
import '../../../border_theme.dart';
import '../login_api.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String? phone;
  String? name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AllAssests.backgroundImage,
                height: 400,
                width: 400,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 48,
                    color: Color.fromARGB(255, 95, 91, 91),
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Form(
                key: _formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      // margin: EdgeInsets.only(top: 10),
                      child: const Text(
                        'Name',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: inputDecoration,
                        validator: (value) {
                          if (value!.length > 3) {
                            return null;
                          } else {
                            return 'Enter name';
                          }
                        },
                        onSaved: (newValue) {
                          setState(() {
                            name = newValue;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Mobile Number',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: inputDecoration.copyWith(),
                          validator: (value) {
                            if (value!.length == 10) {
                              return null;
                            } else {
                              return 'Enter 10 digits';
                            }
                          },
                          onSaved: (newValue) {
                            setState(() {
                              phone = newValue;
                            });
                          },
                          maxLength: 10,
                        )),
                    // Container(
                    //   margin: const EdgeInsets.only(top: 10),
                    //   padding: const EdgeInsets.symmetric(horizontal: 12),
                    //   child: const Text(
                    //     'OTP',
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: MediaQuery.sizeOf(context).width * 0.9,
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.phone,
                    //     decoration: inputDecoration,
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    // LoginAPI().login(phone, password);
                    print(name);
                    print(phone);
                    bool res = await LoginAPI().register(phone!, name!);
                    if (res) {
                      Navigator.pushReplacementNamed(context, Routes.loginPage);
                    }
                  }
                },
                child: const Center(child: Text('Continue')),
              ),
              TextButton(
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, 'login-page'),
                  child: const Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      text: 'Already Registered ? ', // Default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
