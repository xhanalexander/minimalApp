import 'package:minimalapp/constant/constant.dart';

class FormValidator {
  
  static String? validateForms({required String? contents}) {
    if (contents == null || contents.isEmpty) {
      return Constant.formValidatorNull;
    } else {
      return null;
    }
  }
  
}