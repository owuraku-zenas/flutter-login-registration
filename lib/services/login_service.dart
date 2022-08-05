import 'package:http/http.dart' as http;
import 'package:project1/models/user.dart';

class LoginService {
  // ignore: constant_identifier_names
  static const Base_URL = 'https://project1-auth.herokuapp.com/api';

  Future<User?> getUser(email, password) async {
    var client = http.Client();

    var uri = Uri.parse("$Base_URL/login");
    var response = await client.post(
      uri,
      body: {
        "email": email,
        "password": password,
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      var json = response.body;
      // ignore: avoid_print
      print(json);

      return userFromJson(json);
      // return json;
    }
    return null;
  }
}
