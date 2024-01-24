import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:texnomart_clone_flutter/utils/product_holder.dart';
import 'package:texnomart_clone_flutter/utils/top_product_item.dart';

import '../presenter/pages/product_detail/product_details_page.dart';

class TopPruductsW extends StatelessWidget {
  const TopPruductsW({
    super.key,
    required this.topProducts,
  });

  final List<ProductHolder> topProducts;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return topProductItem(topProducts[index], () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                        item: topProducts[index])));
          });
        },
        childCount: topProducts.length,
      ),
    );
  }
}
