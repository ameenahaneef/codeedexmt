import 'package:codeedexmt/core/constants/app_colors.dart';
import 'package:codeedexmt/core/constants/app_styles.dart';
import 'package:codeedexmt/presentation/providers/auth_provider.dart';
import 'package:codeedexmt/presentation/screens/home/pages/home_screen.dart';
import 'package:codeedexmt/presentation/screens/login/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailidController = TextEditingController();
    final TextEditingController passwordiController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/[removal.ai]_b1cb7d4f-6f19-4a91-9210-e57bbcd1fee4-motorcycle-18.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.9),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Formfield(
                      labelText: 'email',
                      controller: emailidController,
                    ),
                    height10,
                    Formfield(
                      labelText: 'password',
                      controller: passwordiController,
                    ),
                    height10,
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final email = emailidController.text.trim();
                          final password = passwordiController.text.trim();
                          if (email == "john@mail.com" &&
                              password == "changeme") {
                            try {
                              await Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .login(email, password);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login Successful'),
                                  backgroundColor: kGreen,
                                ),
                              );
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login Failed: $error'),
                                  backgroundColor: kRed,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Login failed. Please check your credentials'),
                                backgroundColor: kRed,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: kWhite),
                      child: Text('Login', style: style3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
