import 'package:flutter/material.dart';
import 'package:sct_mobile/core/data/models/customer_repository.dart';
import 'package:sct_mobile/ui/widgets/personcard.dart';
import 'package:sct_mobile/core/data/classes/customer.dart';
import 'package:sct_mobile/ui/widgets/secondaryinput.dart';
import 'package:sct_mobile/core/data/models/api.dart';
import 'package:sct_mobile/ui/screens/customers.dart';

class NewCustomer extends StatefulWidget {
  final String title;
  NewCustomer({@required this.title});
  @override
  _NewCustomerState createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var _statusController = TextEditingController();
  var _typeController = TextEditingController();
  var _firstnameController = TextEditingController();
  var _lastnameController = TextEditingController();
  var _adresseController = TextEditingController();
  var _notesController = TextEditingController();

  final FocusNode _statusFocus = FocusNode();
  final FocusNode _typeFocus = FocusNode();
  final FocusNode _lastnameFocus = FocusNode();
  final FocusNode _firstnameFocus = FocusNode();
  final FocusNode _adresseFocus = FocusNode();
  final FocusNode _notesFocus = FocusNode();

  List<String> _types = ['individual', 'professional'];
  List<String> _status = ['prospect', 'active', 'archived', 'deleted'];
  String _selectedType;
  String _selectedStatus;

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  submit() {
    var data = {
      'customer_type': _selectedType.trim(),
      'status': _selectedStatus.trim(),
      'meeting_date': null,
      'company_name': null,
      'siret': null,
      'tva_number': null,
      'firstname': _firstnameController.text.trim(),
      'lastname': _lastnameController.text.trim(),
      'street_number': null,
      'street_name': null,
      'zipcode': null,
      'city': null,
      'note': _notesController.text.trim(),
      'default_payment_method': null,
      'company': null
    };
    CallApi().postData(data, 'api/createCustomer').then((response) {
      setState(() {
        if (response.statusCode == 200) {
          Navigator.of(context).pop();
        } else {
          print("Error from API code: ${response.statusCode}");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) => Material(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(widget.title),
            elevation: 0,
            backgroundColor: Color(0xfff7c91e),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.check),
                tooltip: '',
                onPressed: submit,
              ),
              SizedBox(width: 15.0),
            ],
          ),
          backgroundColor: Color(0xfffafafa),
          body: Container(
            key: this._formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
//              mainAxisAlignment: MainAxisAlignment.,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownButton(
                        hint: Text(
                            'Type du client'), // Not necessary for Option 1
                        value: _selectedType,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedType = newValue;
                          });
                        },
                        items: _types.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 20.0),
                      DropdownButton(
                        hint: Text(
                            'Status du client'), // Not necessary for Option 1
                        value: _selectedStatus,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedStatus = newValue;
                          });
                        },
                        items: _status.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: _firstnameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
//                    validator: this._validateEmail,
                    focusNode: _firstnameFocus,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(
                          context, _firstnameFocus, _lastnameFocus);
                    },
                    scrollPadding: EdgeInsets.all(30.0),
                    decoration: InputDecoration(
                      hintText: "Prénom du client",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff505050), width: 3.0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xfff7c91e), width: 3.0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fillColor: const Color(0xffb8bdc4).withOpacity(0.3),
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: _lastnameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
//                    validator: this._validateEmail,
                    focusNode: _lastnameFocus,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _lastnameFocus, _notesFocus);
                    },
                    scrollPadding: EdgeInsets.all(30.0),
                    decoration: InputDecoration(
                      hintText: "Nom du client",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff505050), width: 3.0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xfff7c91e), width: 3.0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fillColor: const Color(0xffb8bdc4).withOpacity(0.3),
                      filled: true,
                    ),
                  ),
//                  SizedBox(height: 15.0),
//                  TextFormField(
//                    controller: _adresseController,
//                    textInputAction: TextInputAction.done,
//                    obscureText: true,
//                    focusNode: _adresseFocus,
//                    onFieldSubmitted: (term) {
//                      _fieldFocusChange(context, _adresseFocus, _notesFocus);
//                    },
//                    keyboardType: TextInputType.visiblePassword,
////                    validator: this._validatePassword,
//                    scrollPadding: EdgeInsets.all(30.0),
//                    decoration: InputDecoration(
//                      hintText: "Adresse du client",
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: const BorderSide(
//                            color: Color(0xff505050), width: 3.0),
//                        borderRadius: BorderRadius.circular(50),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: const BorderSide(
//                            color: Color(0xfff7c91e), width: 3.0),
//                        borderRadius: BorderRadius.circular(50),
//                      ),
//                      fillColor: const Color(0xffb8bdc4).withOpacity(0.3),
//                      filled: true,
//                    ),
//                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: _notesController,
                    textInputAction: TextInputAction.done,
                    focusNode: _notesFocus,
                    onFieldSubmitted: (value) {
                      _notesFocus.unfocus();
//                      submit();
//                      _calculator();
                    },
                    keyboardType: TextInputType.text,
//                    validator: this._validatePassword,
                    scrollPadding: EdgeInsets.all(30.0),
                    decoration: InputDecoration(
                      hintText: "Notes",
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff505050), width: 3.0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xfff7c91e), width: 3.0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      fillColor: const Color(0xffb8bdc4).withOpacity(0.3),
                      filled: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
