import '../../domain/repositories/cashier_repository.dart';
import '../datasources/cashier_local_datasource.dart';
import '../datasources/cashier_network_datasource.dart';

class CashierRepositoryImpl implements CashierRepository {
  final CashierLocalDatasource _local;
  final CashierNetworkDatasource _network;

  CashierRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
