import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  // WARNING: The app is connected to dev hosting ! Use the same link to use the backoffice to have the same data
  final String _url =
      'https://sct-backend-prod.herokuapp.com/'; // Fixtures or setted on dev database for now. You can change the url by uncomment the other link.
//  final String _url = 'https://sct-backend-prod.herokuapp.com/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    var token = await _getToken();
    if (token == null) {
      return await http.post(fullUrl,
          body: jsonEncode(data), headers: _setHeaders());
    } else {
      return await http.post(fullUrl,
          body: jsonEncode(data), headers: _setHeadersAuth(token));
    }
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    var token = await _getToken();
    return await http.get(fullUrl, headers: _setHeadersAuth(token));
  }

  _setHeadersAuth(String token) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token,
      };
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  getCompanyId() async {
    var company = await CallApi().getData('api/company');
    if (company.statusCode == 200) {
      var cmp_id;
      var body = json.decode(company.body);
      for (var cmp in body) {
        cmp_id = cmp['id'];
      }
      return cmp_id;
    } else {
      print("Error getting company - Status code: ${company.statusCode}");
      return null;
    }
  }

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }
}
