import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
//  final String _url = 'http://localhost:4000/users/';
  final String _url = 'https://sct-backend-dev.herokuapp.com/';

  postData(data, apiUrl) async {
//    var fullUrl = _url + apiUrl + await _getToken();
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
    var company = await CallApi().getData('/api/company');
    if (company.statusCode == 200) {
//      print(compute(parseCompanies, company.body));
      int cmp_id;
      var body = json.decode(company.body);
      for (var cmp in body['comp']) {
        cmp_id = cmp['id'];
      }
      return cmp_id;
    } else {
      print("Error getting company - Status code: ${company.statusCode}");
      return null;
    }
  }

  getCustomersId(int cmp_id) async {
    var datacustomer = {'company_id': cmp_id};
    var customers = await CallApi().postData(datacustomer, '/api/customers');
    if (customers.statusCode == 200) {
      var body = json.decode(customers.body);
      print(body);
      print(customers.body);
    } else {
      print("Error customers status code: ${customers.statusCode}");
      return null;
    }
  }

  getInvoices(int company_id, int customer_id) {
    final data = {'company_id': company_id, 'customer_id': customer_id};
    CallApi().postData(data, 'api/invoice').then((response) {
      return response;
    });
//    final Stream<Invoice> stream = await fetchInvoices(6, 1);
//    print(stream);
//    stream.listen((Invoice invoice) => setState(() => _invoices.add(invoice)));
  }

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
//    return '?token=$token';
    return token;
  }
}
