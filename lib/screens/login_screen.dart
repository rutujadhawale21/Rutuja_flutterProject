import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rutuja_fintech_application/screens/dashboard_screen.dart';
import 'package:rutuja_fintech_application/screens/transaction_history.dart';

import '../widgets/commom_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextController =
      TextEditingController(text: '');

  final TextEditingController passTextController =
      TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Screen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CommonTextFormField(
              controller: emailTextController,
              hintText: 'email',
              prefixIcon: Icons.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  print('Email is mandatory');
                } else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CommonTextFormField(
              controller: passTextController,
              hintText: 'pass',
              prefixIcon: Icons.lock,
              validator: (value) {
                if (value!.length < 6) {
                  log('Pass should be minimum 6 character');
                } else {
                  return null;
                }
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const DashboardScreen()));
                } else {
                  //log('validated');
                }
              },
              child: const Text('Login')),
        ]),
      ),
    );
  }
}
