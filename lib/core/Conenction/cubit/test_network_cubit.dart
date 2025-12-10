import 'package:auth_feature_1_0/core/Conenction/checkNet.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'test_network_state.dart';

class TestNetworkCubit extends Cubit<TestNetworkState> {
  TestNetworkCubit() : super(TestNetworkInitial());

  final checker = CheckConnection();

  String status = 'اضغط عشان تشيك النت';
  Future<void> testConnection() async {
    status = 'جاري الفحص...';
    emit(TestNetworkLoading());

    final result = await checker.checkMethod();
    //  تتستقبل القيمتيتن هنا
    result.fold(
      (failure) {
        status = failure.failureMessage;
        emit(FailuerNetwork(mass: failure.failureMessage));
      },
      (done) {
        status = done.doneMessage;
        emit(DoneNetwork());
      },
    );
  }
}
