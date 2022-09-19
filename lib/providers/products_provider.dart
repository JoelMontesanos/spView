import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp/models/product.dart';


class ProductProvider extends ChangeNotifier{

  String _baseUrl = 'mobilecatalogapp.herokuapp.com';

  List<Product> on = [];

  ProductProvider(){
    print('initialization started');
    this.getOndisplayProducts();
  }

  getOndisplayProducts()async{
    var url = Uri.https(_baseUrl, '');
    var response = await http.get(url);//Answer is in text
    final lista = List.from(jsonDecode(response.body));//decoded body text into a List
    
    lista.forEach((element) {
      final Product product = Product.fromJson(element);
      on.add(product);
      notifyListeners();
    });
    notifyListeners();
  }

}