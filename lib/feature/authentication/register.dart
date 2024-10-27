import 'package:flutter/material.dart';

import '../../l10n/localization.dart';
import '../../shared/widget/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmepasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register() {
    // Add your registration logic here
    // For now, we'll just print the entered values to the console
    print('Username: ${_usernameController.text}');
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    print(' confirme Password: ${_confirmepasswordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.registerPage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1,
                child: Image.asset(
                  'assets/logoLight.jpeg', // Replace with the actual path to your image asset
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: intl.username),
                validator: (value) {
                  if (value!.isEmpty) {
                    return intl.inputControl(intl.username);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: intl.email),
                validator: (value) {
                  if (value!.isEmpty) {
                    return intl.inputControl(intl.email);
                  }
                  // You can add more sophisticated email validation logic here
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: intl.password),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return intl.inputControl(intl.password);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmepasswordController,
                decoration:
                    InputDecoration(labelText: intl.passwordConfirmation),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return intl.inputControl(intl.passwordConfirmation);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Login',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
