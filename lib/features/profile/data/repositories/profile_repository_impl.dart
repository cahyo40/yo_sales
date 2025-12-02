import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';
import '../datasources/profile_network_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDatasource _local;
  final ProfileNetworkDatasource _network;

  ProfileRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
