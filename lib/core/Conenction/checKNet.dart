import 'package:auth_feature_1_0/core/Conenction/Failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class CheckConnection {
  /// بيرجع Right(true) لو النت شغال، Left(Failure) لو مفيش نت فعلي
  Future<Either<FailureNetok, DoneNetok>> checkMethod() async {
    try {
      final response = await http
          .get(Uri.parse('https://www.gstatic.com/generate_204'))
          .timeout(const Duration(seconds: 4));

      if (response.statusCode == 204) {
        return right(DoneNetok('الإنترنت شغال ✔️')); // نت شغال
      } else {
        return left(FailureNetok('فيه شبكة بس مفيش إنترنت فعلي ❌')); // نت فاصل
      }
    } catch (_) {
      return left(FailureNetok('مفيش إنترنت ❌')); // نت فاصل
    }
  }
}
