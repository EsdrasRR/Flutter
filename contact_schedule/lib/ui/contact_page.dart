import 'dart:io';

import 'package:contact_schedule/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;
  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  bool _userEdited = false;
  Contact _editedContact;
  
  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _phoneController.text = _editedContact.phone;
      _emailController.text = _editedContact.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(_editedContact.name ?? 'New Contact'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: _editedContact.img != null
                          ? FileImage(File(_editedContact.img))
                          : AssetImage('images/person.png')),
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
              onChanged: (text) {
                _userEdited = true;
                setState(() {
                  _editedContact.name = text;
                });
              },
            ),
            TextField(
              controller: _phoneController, 
              keyboardType:  TextInputType.phone,
              decoration: InputDecoration(labelText: "Phone"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.phone = text;
              },
            ),
            TextField(
              controller: _emailController,
              keyboardType:  TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.email = text;
              },
            ),
          ],
        ),
      ),
    );
  }
}
