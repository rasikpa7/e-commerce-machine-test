import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetask/presentation/components/app_button.dart';
import 'package:machinetask/presentation/components/text_input_field.dart';
import 'package:machinetask/features/controllers/auth_controller.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'WELCOME',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 35),
          ),
          const Text(
            'We are glad to see you back',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                fontSize: 10),
          ),
          const SizedBox(
            height: 50
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email),
          ),
          const SizedBox(
            height: 10
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _password,
              labelText: 'password',
              icon: Icons.lock,
              isObscure: true,
            ),
          ),
          const SizedBox(
            height: 27
          ),
          AppButton(
              btnText: 'Login',
              function: () async => _authController.login(
                  _emailController.text.trim(), _password.text.trim())),
          const SizedBox(
            height: 13
          ),
           AppButton(
              btnText: 'Google Login',
              function: () async => _authController.googleLogin()),
          const SizedBox(
            height: 13
          ),
          InkWell(
            onTap: () {
              Get.toNamed('/signup');
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have account  ',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
