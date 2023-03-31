import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../่jsonfile/price_cassava.dart';


//ราคาหลายชุด
// class PriceService {
//   Future<List<PriceCassava>?> getPrice() async {
//     var client = http.Client();
//
//     var uri = Uri.parse('https://retoolapi.dev/PYBHGl/price_cassava');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       return priceCassavaFromJson(json);
//     }
//     return null;
//   }
// }

//ราคาชุดเดียว
// class PriceService {
//   Future<List<PriceCassava>?> getPrice() async {
//     const url = 'https://retoolapi.dev/vS9EfW/price1';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       return priceCassavaFromJson(json);
//     }
//     return null;
//   }
// }

//ราคาใหม่
class PriceService {
  Future<List<PriceCassava>?> getPrice() async {
    const url = 'https://retoolapi.dev/MFjTye/data';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return priceCassavaFromJson(json);
    }
    return null;
  }
}
