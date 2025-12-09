part of 'test_network_cubit.dart';

@immutable
sealed class TestNetworkState {}

final class TestNetworkInitial extends TestNetworkState {}

final class TestNetworkLoading extends TestNetworkState {}

final class FailuerNetwork extends TestNetworkState {
  final String mass;

  FailuerNetwork({required this.mass});
}

final class DoneNetwork extends TestNetworkState {}
