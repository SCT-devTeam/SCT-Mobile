class Customer {
  final int id;
  final String customer_type;
  final String status;
  final String meeting_date;
  final String company_name;
  final int siret;
  final String tva_number;
  final String firstname;
  final String lastname;
  final int street_number;
  final int zipcode;
  final String city;
  final String node;
  final String default_payment_method;
  final String company;

  Customer.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        customer_type = jsonMap['customer_type'],
        status = jsonMap['status'],
        meeting_date = jsonMap['meeting_date'],
        company_name = jsonMap['company_name'],
        siret = jsonMap['siret'],
        tva_number = jsonMap['tva_number'],
        firstname = jsonMap['firstname'],
        lastname = jsonMap['lastname'],
        street_number = jsonMap['street_number'],
        zipcode = jsonMap['zipcode'],
        city = jsonMap['city'],
        node = jsonMap['node'],
        default_payment_method = jsonMap['default_payment_method'],
        company = jsonMap['company'];
}
