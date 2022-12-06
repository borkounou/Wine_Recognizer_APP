import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wine_recognizer/pages/admin/admin_page.dart';
import 'package:wine_recognizer/pages/auth/services/auth_services.dart';
import 'package:wine_recognizer/pages/home/bottom_navigation_bar.dart';
import 'package:wine_recognizer/pages/auth/pages/auth_page.dart';
import 'package:wine_recognizer/providers/image_provider.dart';
import 'package:wine_recognizer/providers/user_provider.dart';
import 'package:wine_recognizer/routers.dart';
import 'package:wine_recognizer/utils/app_styles.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => ImagesProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: StylesApp.container1Color,
            colorScheme: ColorScheme.light(primary: StylesApp.primaryColor),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == "user"
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen());
  }
}
