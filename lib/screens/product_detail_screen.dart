import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = './productdetail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productDetails = Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(productDetails.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(productDetails.imageUrl, fit: BoxFit.cover, )
            ),
            SizedBox(height: 20,),
            Card(
              elevation: 0,
              child: Column(
                children: <Widget>[
                  Text('\$${productDetails.price}'),
                  SizedBox(height: 10,),
                  Text(productDetails.description),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
