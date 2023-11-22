import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:machinetask/features/controllers/auth_controller.dart';
import 'package:machinetask/presentation/screens/cartScreen/cart_screen.dart';
import 'package:machinetask/presentation/screens/checkOutScreen/check_out_screen.dart';
import 'package:machinetask/presentation/screens/homeScreen/home_screen.dart';
import 'package:machinetask/presentation/screens/loginScreen/login_screen.dart';
import 'package:machinetask/presentation/screens/signUpScreen/sign_up_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'machinetask',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()), // Default route
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
        GetPage(name: '/checkout', page: () => CheckoutScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/login', page: () => LoginScreen())
      ],
      home: LoginScreen(),
    );
  }
}
