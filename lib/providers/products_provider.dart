import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sp/models/models.dart';


class ProductProvider extends ChangeNotifier{

  String _baseUrl = 'mobilecatalogapp.herokuapp.com';

  List<Product> on = [];
  List<Popular> onPopulars =[];

  ProductProvider(){
    print('initialization...');
    this.getOndisplayProducts();
    this.getPopulars();
  }

  getOndisplayProducts()async{
    print('Getting Producs...');
    var url = Uri.https(_baseUrl, '');
    var response = await http.get(url);//Answer is in text
    final lista = List.from(jsonDecode(response.body));//decoded body text into a List
    
    lista.forEach((element) {
      final Product product = Product.fromJson(element);
      on.add(product);
      notifyListeners();
    });
    notifyListeners();
    print('Products obteined');
  }

  getPopulars()async{
    print('Getting Populars Products...');
    var url = Uri.https(_baseUrl, '/populares');
    var response = await http.get(url);
    final lista = List.from(jsonDecode(response.body));
    lista.forEach((element) {
      final Popular productPopular = Popular.fromJson(element);
      onPopulars.add(productPopular);
      notifyListeners();
    });
    print('Popular Products obteined');
  }

}