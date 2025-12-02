import '../../domain/repositories/bottom_nav_repository.dart';
import '../datasources/bottom_nav_local_datasource.dart';
import '../datasources/bottom_nav_network_datasource.dart';

class BottomNavRepositoryImpl implements BottomNavRepository {
  final BottomNavLocalDatasource _local;
  final BottomNavNetworkDatasource _network;

  BottomNavRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
