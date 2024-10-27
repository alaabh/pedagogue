import 'package:flutter/material.dart';
import 'package:pedagogue/feature/authentication/register.dart';

import '../../l10n/localization.dart';
import '../../shared/style/app_color.dart';
import '../../shared/style/assets.dart';
import '../../shared/style/dimensions.dart';
import '../../shared/widget/custom_button.dart';
import '../../utils/resources/api/user_session.dart';
import '../../utils/service/user_service.dart';
import '../home/main_page_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(intl.loginPage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 0.65,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        200), // Set the radius to 50.0 for a circular image
                    child: Image.asset(
                      Assets.logoLight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: intl.email),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return intl.inputControl(intl.email);
                    }
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      intl.forgotPassword,
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: intl.login,
                  onPressed: () {
                    /* Navigator.push(
                     context,
                      MaterialPageRoute(
                        builder: (context) => const MainPageView(),
                      ),
                    );  */ 
                       UserService.instance
                        .login(
                      /* email: _emailController.text,
                      password: _passwordController.text, */
                      email: 'elitesport.tn@gmail.com',
                      password: 'BiBos0411+*#',
                      /*   email: 'test1@tests1com',
                      password: '123456789', */
                    )
                        .then(
                      (apiResponse) async {
                        if (apiResponse.status.name == "completed") {
                          // If login is successful, save session and navigate to MainPageView
                          
                          UserSession.instance
                              .saveUserSession(apiResponse.item!);
                          Navigator.push(
                            context,
                           MaterialPageRoute(
                              builder: (context) => const MainPageView(),
                            ),
                          ); 
                        } else {
                          // Handling cases where login fails but there is no error thrown
                          // For example, wrong credentials or account not found
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: AppColors.dangerColor,
                                content: Text(
                                    '${intl.loginFailed}: ${apiResponse.message}')),
                          );
                        }
                      },
                    ).catchError((error) {
                      // This block will run if there is an exception during the login process
                      print('${intl.loginFailed1}: $error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: AppColors.dangerColor,
                            content: Text('${intl.loginFailed2}')),
                      );
                    });
                  },
                ),
                Dimensions.verticalSpacingMedium,
                TextButton(
                  onPressed: () {
                    // Add your navigation logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: ('${intl.noAccount}  '),
                      style: const TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: intl.createAccount,
                          style: TextStyle(color: AppColors.secondaryColor),
                        )
                      ],
                    ),
                  ),
                ),
                Dimensions.verticalSpacingSmall,
                /* ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  child: Text(intl.login),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
