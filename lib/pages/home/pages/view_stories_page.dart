import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';

class ViewStoryPage extends StatelessWidget {
  ViewStoryPage({super.key});
  final controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      // width: MediaQuery.sizeOf(context).width,
      // height: MediaQuery.sizeOf(context).height,
      children: [],
    );
  }
}
