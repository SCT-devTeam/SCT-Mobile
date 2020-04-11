import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:sct_mobile/core/data/classes/invoice.dart';
import 'package:sct_mobile/core/data/models/api.dart';

Future fetchInvoices(int company_id, int customer_id) async {
  final data = {'company_id': company_id, 'customer_id': customer_id};
  final invoices = await CallApi().postData(data, 'api/invoice');

  var body = json.decode(invoices.body);

//  print(body['comp']);
//  print(body['invoices']);

//  var invoices1 = {
//    "invoices": [
//      {
//        'id': 1,
//        'customer_id': 1,
//        'invoices_qualifications': 'overdue',
//        'edition_date': '10/04/2020',
//        'payment_date': '10/04/2020',
//        'payment_delay_in_days': 1,
//        'payment_terms': 'terms',
//        'notice': 'notice!',
//        'payment_method': 'credit_card',
//        'sending_date': '10/04/2020',
//        'revived_date': '10/04/2020',
//        'last_qualification_date': '10/04/2020',
//        'chashing_date': '10/04/2020',
//        'note': 'test',
//        'original_quote': 1
//      }
//    ]
////  };
//  var test2 = json.encode(invoices1);
//  var test = json.decode(test2);
//  print(invoices);
  print(body['invoices']);
  return body['invoices'];
  return invoices.body['invoices'].stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Invoice.fromJSON(data));
//  return Customer.fromJson(reponseJson);
}
