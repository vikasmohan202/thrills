import 'package:flutter/material.dart';

customBackButton(context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
        height: 52,
        width: 52,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 24,
        )),
  );
}
