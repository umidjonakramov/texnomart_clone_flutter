import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ProfileCard({
  IconData? icon,
  String? data,
  IconData? rightIcon,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon,size: 24,),
            SizedBox(width: 10,),
            Text(data ?? ''),
          ],
        ),
        Icon(
          rightIcon ?? Icons.chevron_right_outlined,
          size: 18,
        )
      ],
    ),
  );
}
