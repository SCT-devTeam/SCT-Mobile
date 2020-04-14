import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:sct_mobile/core/data/classes/customer.dart';
import 'package:sct_mobile/core/data/models/api.dart';

Future<Stream<Customer>> fetchCustomers(int company_id) async {
  final data = {'company_id': company_id};
  final customers = await CallApi().postData(data, 'api/customers');
//  var body = json.decode(customers.body);
//  print(body['comp']);
//  print(body);

//  return customers.stream
//      .transform(utf8.decoder)
//      .transform(json.decoder)
//      .expand((data) => (data as List))
//      .map((data) => Customer.fromJSON(data));
//  return Customer.fromJson(reponseJson);
}
