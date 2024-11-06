import 'package:codeedexmt/core/constants/app_colors.dart';
import 'package:codeedexmt/core/constants/app_styles.dart';
import 'package:codeedexmt/presentation/screens/home/widgets/alertdialog.dart';
import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  const Drawers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBlack,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'User Name',
              style: style1,
            ),
            accountEmail: Text(
              'john@mail.com',
              style: style1,
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: kWhite,
              child: Icon(
                Icons.person,
                color: kBlack,
              ),
            ),
            decoration: const BoxDecoration(color: kBlack),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: kWhite),
            title: Text('Profile', style: style1),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: kWhite),
            title: Text('Logout', style: style1),
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const Alertdialog();
                  });
            },
          ),
        ],
      ),
    );
  }
}
