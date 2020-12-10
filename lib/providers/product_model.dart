import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/http_exception.dart';

class Product with ChangeNotifier{
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.price,
    this.isFavourite = false,
  });

  void _setFavValue(bool newValue){
    isFavourite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavouriteStatus(String token, String userId) async{
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url = 'https://shop-app-9e391.firebaseio.com/userFavourites/$userId/$id.json?auth=$token';
    try{
      final response = await http.put(url, body: json.encode({
        isFavourite,
      }));
      if(response.statusCode >= 400){
        _setFavValue(oldStatus);
      }
    }catch(error){
      _setFavValue(oldStatus);



    }
  }
}
