import 'package:flutter_part2/models/product_models.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<ProductModel>> getAllProducts() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    List<ProductModel> products = productFromJson(response.body);
    return products;
  }
}
