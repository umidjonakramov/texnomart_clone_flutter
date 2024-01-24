import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texnomart_clone_flutter/utils/product_holder.dart';

Widget basketItem(
    void Function() onClick,
    context,
    ProductHolder product,
    void Function() onFavouriteClick,
    void Function() onDeleteClick,
    void Function() clickPlus,
    void Function() clickMinus) {
  return InkWell(
    highlightColor:
    const Color(0xFFfbc100)
        .withAlpha(60),
    splashColor: const Color(0xFFfbc100)
        .withAlpha(60),
    onTap: onClick,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Column(
        children: [
          // const Divider(color: Color(0x15000000)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        product.image ?? '',
                        height: 100,
                        width: 100,
                      ))),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160,
                    child: Text(product.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                  SizedBox(
                    width: 160,
                    child: Text("${product.salePrice ?? ''} so'm",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 14)),
                  ),
                  Container(
                    width: 160,
                    decoration: BoxDecoration(
                        color: const Color(0x15000000),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, left: 5.0, bottom: 2.0, right: 3),
                      child: Text(product.axiomMonthlyPrice.toString() ?? '',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 12)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border:
                                Border.all(color: Colors.black.withAlpha(50))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                borderRadius: BorderRadius.circular(5),
                                highlightColor:
                                    const Color(0xFFfbc100).withAlpha(60),
                                splashColor:
                                    const Color(0xFFfbc100).withAlpha(60),
                                onTap: clickMinus,
                                child: SvgPicture.asset(
                                    'assets/icons/ic_minus.svg')),
                            Text(product.count?.toString() ?? '0',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700, fontSize: 14)),
                            InkWell(
                                borderRadius: BorderRadius.circular(5),
                                highlightColor:
                                    const Color(0xFFfbc100).withAlpha(60),
                                splashColor:
                                    const Color(0xFFfbc100).withAlpha(60),
                                onTap: clickPlus,
                                child: SvgPicture.asset(
                                    'assets/icons/ic_plus.svg')),
                          ],
                        ),
                      ),
                      // const Spacer(),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomCheckbox(
                    value: true,
                    onChanged: (bool? value) {},
                  ),
                  const SizedBox(height: 85),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: onFavouriteClick,
                          child: product.isSaved == true
                              ? const Icon(Icons.favorite_rounded,
                                  color: Colors.redAccent)
                              : Icon(Icons.favorite_border_rounded,
                                  color: Colors.black.withAlpha(50))),
                      const SizedBox(width: 10),
                      InkWell(
                          borderRadius: BorderRadius.circular(10),
                          highlightColor: const Color(0xFFfbc100).withAlpha(60),
                          splashColor: const Color(0xFFfbc100).withAlpha(60),
                          onTap: onDeleteClick,
                          child: SvgPicture.asset(
                            'assets/icons/ic_trash.svg',
                            color: Colors.black.withAlpha(50),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0x15000000)),
        ],
      ),
    ),
  );
}

/*
        Column(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: onClick,
                    child: product.isSaved == true
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(Icons.favorite_border_rounded)),
                InkWell(
                    onTap: onDeleteClick,
                    child: const Icon(Icons.delete_outlined)),
              ],
            )
          ],
        ),
 */

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFFfbc100),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          onChanged(!value);
        },
        child: Center(
          child: value
              ? const Icon(
                  Icons.check,
                  size: 14.0,
                  color: Colors.black,
                )
              : Container(),
        ),
      ),
    );
  }
}

// Example Usage:
// CustomCheckbox(
//   value: true, // or false
//   onChanged: (newValue) {
//     // Handle checkbox state change
//   },
// )
