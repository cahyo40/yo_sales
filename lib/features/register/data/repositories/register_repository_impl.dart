import '../../domain/repositories/register_repository.dart';
import '../datasources/register_local_datasource.dart';
import '../datasources/register_network_datasource.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterLocalDatasource _local;
  final RegisterNetworkDatasource _network;

  RegisterRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
