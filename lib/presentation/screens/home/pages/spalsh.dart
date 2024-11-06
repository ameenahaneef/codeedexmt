import 'package:codeedexmt/presentation/screens/login/pages/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }),
        (route) => false,
      );
    });
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                    'assets/images/[removal.ai]_b1cb7d4f-6f19-4a91-9210-e57bbcd1fee4-motorcycle-18.png'))
          ],
        ),
      ),
    );
  }
}
