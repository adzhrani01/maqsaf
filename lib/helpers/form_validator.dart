

class FormValidator{

  //static String? customValidator(String? value) => value!.isEmpty ?'is empty' :null ;
  static String? phoneNumberValidator(String? value) {
    if(value == null || value.isEmpty){
      return 'الرجاء إدخال رقم الهاتف';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if(value == null || value.isEmpty){
      return 'الرجاء إدخال كلمة المرور';
    }
    return null;
  }

  static String? fieldValidator(dynamic value) {
    if(value == null || value.isEmpty){
      return 'الحقل فارغ';
    }
    return null;
  }

  static String? integerValidator(int? value) {
    if(value == null){
      return 'الحقل فارغ';
    }
    return null;
  }

  static String? objectValidator(Object? value) {
    if(value == null){
      return 'الحقل فارغ';
    }
    return null;
  }

}