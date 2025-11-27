import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_local_datasource.dart';
import '../datasources/onboarding_network_datasource.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDatasource _local;
  final OnboardingNetworkDatasource _network;

  OnboardingRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
