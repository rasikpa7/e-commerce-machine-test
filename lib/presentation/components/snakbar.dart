import 'package:get/get.dart';

class Shared{

  void snakbar({required String title, required String message}){
    Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM);
  }
}