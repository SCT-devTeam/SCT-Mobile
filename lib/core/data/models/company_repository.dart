import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:sct_mobile/core/data/classes/company.dart';
import 'package:sct_mobile/core/data/models/api.dart';

Future<Stream<Company>> fetchCompany() async {
  final company = await CallApi().getData('/api/company');
//  var body = json.decode(company.body);
//  print(body['comp']);

  return company.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Company.fromJSON(data));
//  return Customer.fromJson(reponseJson);
}
