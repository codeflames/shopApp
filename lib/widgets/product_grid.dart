import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/product_provider.dart';


class ProductGrid extends StatelessWidget {
  final bool showFavs;

  ProductGrid({this.showFavs});

  @override
  Widget build(BuildContext context) {
   final productData = Provider.of<Products>(context);
   final products = showFavs? productData.favouriteItem: productData.items;

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value : products[i],
          child: ProductItem(),
        ));
  }
}

