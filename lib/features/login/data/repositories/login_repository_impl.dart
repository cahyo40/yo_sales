import '../../domain/repositories/login_repository.dart';
import '../datasources/login_network_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginNetworkDatasource _network;

  LoginRepositoryImpl(this._network);

  // implement your methods here (network-first, local-fallback)
}
