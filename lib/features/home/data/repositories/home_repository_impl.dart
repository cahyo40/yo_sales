import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';
import '../datasources/home_network_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDatasource _local;
  final HomeNetworkDatasource _network;

  HomeRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
