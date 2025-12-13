class FirebaseAuthErrorMessages {
  static String getMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح';

      case 'user-disabled':
        return 'هذا الحساب تم تعطيله';

      case 'user-not-found':
        return 'لا يوجد حساب بهذا البريد الإلكتروني';

      case 'wrong-password':
        return 'كلمة المرور غير صحيحة';

      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل';

      case 'weak-password':
        return 'كلمة المرور ضعيفة';

      case 'operation-not-allowed':
        return 'هذه العملية غير مسموح بها حاليًا';

      case 'too-many-requests':
        return 'تم إرسال طلبات كثيرة، حاول لاحقًا';

      case 'network-request-failed':
        return 'تحقق من اتصال الإنترنت';

      default:
        return 'حدث خطأ غير متوقع، حاول مرة أخرى';
    }
  }
}
