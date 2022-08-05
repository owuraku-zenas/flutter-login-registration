import 'package:http/http.dart' as http;
import 'package:project1/models/user.dart';
import 'package:project1/services/login_service.dart';

class SignUpService {
  // ignore: constant_identifier_names
  static const Base_URL = 'https://project1-auth.herokuapp.com/api';

  Future<User?> signUp(email, password, name, field) async {
    var client = http.Client();

    var uri = Uri.parse("$Base_URL/signup");
    var response = await client.post(
      uri,
      body: {
        "email": email,
        "name": name,
        "field": field,
        "password": password,
      },
    );
    // ignore: avoid_print
    print(response.body);
    if (response.statusCode == 200) {
      User? user = await LoginService().getUser(email, password);

      return user;
      // return json;
    }

    return null;
  }
}
