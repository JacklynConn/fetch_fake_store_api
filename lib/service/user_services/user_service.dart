import 'package:flutter_part2/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<List<UserModel>> getUsers() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"));
      return userModelfromJson(response.body);
    }
}
