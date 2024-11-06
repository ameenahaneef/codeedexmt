import 'package:codeedexmt/presentation/providers/auth_provider.dart';
import 'package:codeedexmt/presentation/screens/login/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Alertdialog extends StatelessWidget {
  const Alertdialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await Provider.of<AuthProvider>(context, listen: false).logout();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
