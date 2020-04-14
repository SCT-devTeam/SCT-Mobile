class User {
  final int id;
  final String gender;
  final String lastname;
  final String firstname;
  final String email;
  final String phone;
  final String pwd;
  final String api_token;
  final String notes;
  final int companies;

  User.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        gender = jsonMap['gender'],
        lastname = jsonMap['lastname'],
        firstname = jsonMap['firstname'],
        email = jsonMap['email'],
        phone = jsonMap['phone'],
        pwd = jsonMap['pwd'],
        api_token = jsonMap['api_token'],
        notes = jsonMap['notes'],
        companies = jsonMap['companies'];
}
