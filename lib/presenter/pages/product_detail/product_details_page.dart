import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/source/local/hive_helper.dart';
import '../../../utils/product_holder.dart';
import '../dashboard/dashboard_page.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductHolder item;

  const ProductDetailsPage({super.key, required this.item});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState(item);
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ProductHolder item;

  _ProductDetailsPageState(this.item);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSaved =
        HiveHelper.getAllKeysProductsFromFavourite().contains(item.id);
    item.isSaved = isSaved;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          automaticallyImplyLeading: true,
          backgroundColor: const Color(0xFFFFC300),
          shadowColor: Theme.of(context).colorScheme.shadow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          scrolledUnderElevation: 1.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 14, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      item.image ?? '',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width - 120,
                      height: 220,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mavjud",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.greenAccent,
                            fontSize: 14)),
                    Text("Kod. ${item.code}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(item.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 16)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("${item.salePrice ?? ''} so'm",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 30)),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          setState(() {
                            item.isSaved = !item.isSaved!;
                            item.isSaved == false
                                ? HiveHelper.deleteProductFromFavourite(item)
                                : HiveHelper.addProductToFavourite(item);
                            print(HiveHelper.getAllFavouriteProducts().length);
                          });
                        },
                        child: item.isSaved == true
                            ? const Icon(
                                Icons.favorite_rounded,
                                color: Color(0xFFFFC300),

                              )
                            : const Icon(
                                Icons.favorite_border_rounded,
                                color: Color(0xFFFFC300),
                              ))
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0x15000000),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Muddatli to'lov:",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 14)),
                        Text(item.axiomMonthlyPrice ?? '',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text("Sharhlar: ${item.reviewsCount}",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14)),
                    Spacer(),
                    Image.asset("assets/icons/ic_stars.png",
                        fit: BoxFit.cover, width: 100),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black38)
                  ],
                ),
                const Divider(color: Colors.black12),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("Do'konlarda mavjud",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black38)
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.black12),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("Texnik xususiyatlar",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black38)
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFffc300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () async {
                        await HiveHelper.addProductToBasket(item);
                        print(HiveHelper.getAllProductsFromBasket().length);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DashboardPage(currentPage: 2)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'В корзину ',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Icon(Icons.shopping_cart,size: 18,)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ));
  }
}
