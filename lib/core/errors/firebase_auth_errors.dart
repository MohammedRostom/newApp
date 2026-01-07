class FirebaseAuthErrorMessages {
  static String getMessage(String code) {
    switch (code) {
      case 'invalid-credential':
        return " الاميل او الباسورد غير صحيحين ";
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل';

      case 'weak-password':
        return 'كلمة المرور ضعيفة';
      case 'weak-password':
        return 'كلمة المرور ضعيفة';
      default:
        return 'حدث خطأ غير متوقع، حاول مرة أخرى';
    }
  }
}
