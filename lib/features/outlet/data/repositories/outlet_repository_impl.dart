import '../../domain/repositories/outlet_repository.dart';
import '../datasources/outlet_local_datasource.dart';
import '../datasources/outlet_network_datasource.dart';

class OutletRepositoryImpl implements OutletRepository {
  final OutletLocalDatasource _local;
  final OutletNetworkDatasource _network;

  OutletRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
