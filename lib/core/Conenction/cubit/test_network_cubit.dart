import 'package:auth_feature_1_0/core/Conenction/checKNet.dart';
import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'test_network_state.dart';

class TestNetworkCubit extends Cubit<TestNetworkState> {
  TestNetworkCubit({required this.checker}) : super(TestNetworkInitial());

  final CheckConnection checker;

  String status = 'اضغط عشان تشيك النت';
  Future<void> testConnection() async {
    status = 'جاري الفحص...';
    emit(TestNetworkLoading());

    final result = await checker.checkConnectionMethod();
    //  تتستقبل القيمتيتن هنا
    result.fold(
      (failure) {
        status = failure.failureMessage;
        emit(FailuerNetwork(mass: failure.failureMessage));
      },
      (Done) {
        status = Done.doneMessage;
        emit(DoneNetwork());
      },
    );
  }
}
