import 'package:codeedexmt/data/sources/shared_prefs.dart';
import 'package:codeedexmt/presentation/providers/auth_provider.dart';
import 'package:codeedexmt/presentation/providers/category_provider.dart';
import 'package:codeedexmt/presentation/providers/product_provider.dart';
import 'package:codeedexmt/presentation/screens/home/pages/home_screen.dart';
import 'package:codeedexmt/presentation/screens/home/pages/spalsh.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await SharedPrefsHelper.getLoginState();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),
        home: isLoggedIn ? const HomeScreen() : SplashScreen(),
      ),
    );
  }
}
