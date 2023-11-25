import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  StoryWidget({super.key, required this.name});
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(right: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 40,
            child: CircleAvatar(
              radius: 35,
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
