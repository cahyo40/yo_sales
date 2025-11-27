import '../../domain/repositories/login_repository.dart';
import '../datasources/login_local_datasource.dart';
import '../datasources/login_network_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocalDatasource _local;
  final LoginNetworkDatasource _network;

  LoginRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
