import 'dart:convert' show jsonDecode;

class Company {
  final int id;
  final String legal_form;
  final String name;
  final int siret;
  final String email;
  final int phone;
  final int street_number;
  final String street_name;
  final int zipcode;
  final String city;
  final int capital_in_cents;
  final String insurance;
  final String bban;
  final int bban_anytmie;
  final int default_revive_delay_in_days;
  final int default_payment_delay_in_days;
  final String default_payment_terms;
  final String default_payment_method;
  final int default_down_payment_percentage;
  final int default_quote_validity_delay_in_days;
  final String default_quote_accepting_conditions;
  final String default_invoice_notice;
  final String default_quote_notice;
  final String notes;

  Company.fromJSON(Map<String, dynamic> jsonMap)
      : this.id = jsonMap['id'],
        legal_form = jsonMap['legal_form'],
        name = jsonMap['name'],
        siret = jsonMap['siret'],
        email = jsonMap['email'],
        phone = jsonMap['phone'],
        street_number = jsonMap['street_number'],
        street_name = jsonMap['street_name'],
        zipcode = jsonMap['zipcode'],
        city = jsonMap['city'],
        capital_in_cents = jsonMap['capital_in_cents'],
        insurance = jsonMap['insurance'],
        bban = jsonMap['bban'],
        bban_anytmie = jsonMap['bban_anytmie'],
        default_revive_delay_in_days = jsonMap['default_revive_delay_in_days'],
        default_payment_delay_in_days =
            jsonMap['default_payment_delay_in_days'],
        default_payment_terms = jsonMap['default_payment_terms'],
        default_payment_method = jsonMap['default_payment_method'],
        default_down_payment_percentage =
            jsonMap['default_down_payment_percentage'],
        default_quote_validity_delay_in_days =
            jsonMap['default_quote_validity_delay_in_days'],
        default_quote_accepting_conditions =
            jsonMap['default_quote_accepting_conditions'],
        default_invoice_notice = jsonMap['default_invoice_notice'],
        default_quote_notice = jsonMap['default_quote_notice'],
        notes = jsonMap['notes'];
}

class Companies {
  String result;
  int count;
  List<Company> companies;

//  Companies.fromJSON(String jsonStr) {
//    return json['comp'].map()(value) => new Company.fromJSON(value)).toList(),
//   }
}
