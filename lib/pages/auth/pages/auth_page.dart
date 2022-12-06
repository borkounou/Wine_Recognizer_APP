import 'package:flutter/material.dart';
import 'package:wine_recognizer/utils/app_styles.dart';
import 'package:wine_recognizer/utils/dimensions.dart';
import 'package:wine_recognizer/widgets/custom_button.dart';

import '../../../widgets/custom_text_field.dart';
import '../services/auth_services.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                leading: Radio(
                    activeColor: StylesApp.primaryColor,
                    value: Auth.signUp,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    }),
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  padding: EdgeInsets.all(Dimensions.height10),
                  color: StylesApp.container1Color,
                  child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: _nameController, hintText: 'Name'),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password'),
                          SizedBox(height: Dimensions.height10),
                          CustomButton(
                              text: "Sign Up",
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              }),
                        ],
                      )),
                ),
              ListTile(
                leading: Radio(
                  activeColor: StylesApp.primaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
                title: const Text(
                  "sign -in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  padding: EdgeInsets.all(Dimensions.height10),
                  color: StylesApp.container1Color,
                  child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password'),
                          SizedBox(height: Dimensions.height10),
                          CustomButton(
                              text: "Sign in",
                              onTap: () {
                                print("ok");
                                if (_signInFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              }),
                        ],
                      )),
                ),
            ],
          ),
        ),
      ),
    ));
  }
}
