import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';Widget catalogItem(String img, String title, void Function() onClick) {  return Padding(    padding: const EdgeInsets.symmetric(horizontal: 16.0),    child: InkWell(      highlightColor: const Color(0xFFfbc100).withAlpha(60),      splashColor: const Color(0xFFfbc100).withAlpha(60),      onTap: onClick,      child: Padding(        padding: const EdgeInsets.symmetric(vertical: 10.0),        child: Row(          children: [            SvgPicture.network(img, height: 35, width: 35),            const SizedBox(width: 30),            Text(              softWrap: true,              title,              style: const TextStyle(fontWeight: FontWeight.w500),            ),            const Spacer(),            SvgPicture.asset('assets/icons/ic_right_arrow.svg')          ],        ),      ),    ),  );}Widget catalogChildItem(String title, void Function() onClick) {  return Padding(    padding: const EdgeInsets.symmetric(horizontal: 16.0),    child: InkWell(      highlightColor: const Color(0xFFfbc100).withAlpha(60),      splashColor: const Color(0xFFfbc100).withAlpha(60),      onTap: onClick,      child: Padding(        padding: const EdgeInsets.symmetric(vertical: 10.0),        child: Row(          children: [            Text(              softWrap: true,              title,              style: const TextStyle(fontWeight: FontWeight.w500),            ),            const Spacer(),            SvgPicture.asset('assets/icons/ic_right_arrow.svg')          ],        ),      ),    ),  );}