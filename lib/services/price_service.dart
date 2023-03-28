import 'package:http/http.dart' as http;
import '../่jsonfile/price_cassava.dart';

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

class PriceService {
  Future<List<PriceCassava>?> getPrice() async {
    const url = 'https://retoolapi.dev/vS9EfW/price1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return priceCassavaFromJson(json);
    }
    return null;
  }
}