import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget({
    super.key,
    required this.widget,
    this.Padding = const EdgeInsets.only(top: 0, right: 0, left: 0),
  });
  Widget widget;
  EdgeInsets Padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      // 243,239,254
      // color:             Color.fromARGB(255, 249, 216, 248),
      padding: Padding,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 252, 232, 251),
            Color.fromRGBO(245, 242, 253, 1),
          ])),
      child: widget,
    );
  }
}
