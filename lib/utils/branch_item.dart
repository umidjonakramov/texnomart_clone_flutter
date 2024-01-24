import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BranchItem(String s, String s2, Null Function() param2, {
  String address = 'Qashqadaryo viloyati, Qarshi sh, E60 \nYevropalik mashruti',
  String time = 'Du-Yak(09:00-20:00)',
}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/ic_location.png',
                  width: 25,
                  height: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        s,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(s2),
                  ],
                ),
              ],
            ),
            Icon(Icons.chevron_right),
          ],
        ),
        Divider()
      ],
    ),
  );
}
