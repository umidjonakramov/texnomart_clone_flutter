import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texnomart_clone_flutter/utils/product_holder.dart';

Widget topProductItem(ProductHolder productHolder, void Function() onClick) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 8),
    child: GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Container(
              width: 140,
              height: 79,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Image.network(productHolder.image ?? ''))),
          const SizedBox(height: 10),
          SizedBox(
            width: 140,
            child: Text(productHolder.name ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 11)),
          ),

          Container(
            alignment: Alignment.centerLeft,
            width: 140,
            child: Image.asset("assets/icons/ic_stars.png",
                height: 10, fit: BoxFit.fill),
          ),
          Container(
            width: 140,
            decoration: BoxDecoration(
                color: const Color(0x15000000),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, left: 5.0, bottom: 2.0, right: 3),
              child: Text(productHolder.axiomMonthlyPrice ?? '',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 9)),
            ),
          ),
          SizedBox(
            width: 140,
            child: Text("${productHolder.salePrice} so'm",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 14)),
          ),
        ],
      ),
    ),
  );
}
