import 'package:flutter/material.dart';
import 'package:sct_mobile/core/data/models/customer_repository.dart';
import 'package:sct_mobile/ui/widgets/personcard.dart';
import 'package:sct_mobile/core/data/classes/customer.dart';
import 'package:sct_mobile/ui/widgets/secondaryinput.dart';

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
  var _nameController = TextEditingController();
  var _adresseController = TextEditingController();

  final FocusNode _statusFocus = FocusNode();
  final FocusNode _typeFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _adresseFocus = FocusNode();

  List<String> _types = ['Prospect', 'Actif', 'Archivé', 'Supprimé'];
  String _selectedLocation;

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
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
                onPressed: () {},
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
                  SizedBox(height: 10.0),
                  CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    child: Text('Avatar'),
                    radius: 100.0,
                  ),
                  SizedBox(height: 20.0),
                  DropdownButton(
                    hint:
                        Text('Status du client'), // Not necessary for Option 1
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                    },
                    items: _types.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _typeController,
                    autovalidate: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.url,
                    focusNode: _typeFocus,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _typeFocus, _nameFocus);
                    },
                    scrollPadding: EdgeInsets.all(30.0),
                    decoration: InputDecoration(
                      hintText: "Type de client",
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
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
//                    validator: this._validateEmail,
                    focusNode: _nameFocus,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _nameFocus, _adresseFocus);
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
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: _adresseController,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    focusNode: _adresseFocus,
                    onFieldSubmitted: (value) {
                      _adresseFocus.unfocus();
//                      submit();
//                      _calculator();
                    },
                    keyboardType: TextInputType.visiblePassword,
//                    validator: this._validatePassword,
                    scrollPadding: EdgeInsets.all(30.0),
                    decoration: InputDecoration(
                      hintText: "Adresse du client",
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
