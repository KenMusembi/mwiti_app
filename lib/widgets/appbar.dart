// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mwiti_app/utils/my_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title,
            style: MyText.headline(context)!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w400)),
        centerTitle: true);
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(50.0);
  }
}
