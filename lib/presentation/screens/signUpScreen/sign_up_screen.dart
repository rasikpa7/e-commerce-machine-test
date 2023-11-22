import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:machinetask/features/controllers/auth_controller.dart';
import 'package:machinetask/presentation/components/app_button.dart';
import 'package:machinetask/presentation/components/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
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
            'SIGN UP',
            style: TextStyle(
                fontWeight: FontWeight.w900, color: Colors.black, fontSize: 35),
          ),
          const Text(
            'Register',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black87,
                fontSize: 10),
          ),
          const SizedBox(height: 50),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email),
          ),
          const SizedBox(height: 10),
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
        
          const SizedBox(height: 27),
          Obx(
            () => _authController.isRegisterUser.value == true
                ? const CircularProgressIndicator()
                : AppButton(
                    btnText: 'Register',
                    function: () async {
                      _authController.RegisterUser(
                          _emailController.text, _password.text);
                      Get.back();
                    }),
          ),
          const SizedBox(height: 13),
          InkWell(
            onTap: () {
             Get.toNamed('/login');
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have account? ',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
