import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'shared_pref.dart';

class UserService {
  getUser(userID) async {
    var url = Uri.parse('$baseUrl/api/users/$userID');

    Map<String, String> header = {
      "Content-type": "application/json",
    };

    try {
      http.Response response = await http
          .get(
            url,
            headers: header,
          )
          .catchError((err) {});
      if (response.statusCode != 201 && response.statusCode != 200) {
        return null;
      } else {
        var data = jsonDecode(response.body);
        await SharedPref().save("UserModel", data);
        return data;
      }
    } catch (error) {
      rethrow;
    }
  }

  signIn(email, password) async {
    var url = Uri.parse('$baseUrl/api/auth/');

    Map<String, String> header = {
      "Content-type": "application/json",
    };

    try {
      http.Response response = await http
          .post(url,
              headers: header,
              body: jsonEncode({"identifier": email, "password": password}))
          .catchError((err) {});
      if (response.statusCode != 201 && response.statusCode != 200) {
        return null;
      } else {
        var data = jsonDecode(response.body);
        await SharedPref().save("user", data);
        return data;
      }
    } catch (error) {
      rethrow;
    }
  }

  addUser(data) async {
    var url = Uri.parse('https://uae-nadhir-app.herokuapp.com/api/users/add');
    Map<String, String> header = {
      "Content-type": "application/json",
    };
    try {
      http.Response response = await http
          .post(url, headers: header, body: jsonEncode(data))
          .catchError((err) {});

      if (response.statusCode != 201 && response.statusCode != 200) {
        return null;
      } else {
        var data = jsonDecode(response.body);

        await SharedPref().save("user", data);
        return data;
      }
    } catch (error) {
      rethrow;
    }
  }
}
