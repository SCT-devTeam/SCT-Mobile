import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
//  final String _url = 'http://localhost:4000/users/';
  final String _url = 'https://sct-backend-dev.herokuapp.com/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
//        'Authorization': 'Bearer ' + _getToken()
      };

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return '?token=$token';
  }
}
