import '../../domain/repositories/history_repository.dart';
import '../datasources/history_local_datasource.dart';
import '../datasources/history_network_datasource.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryLocalDatasource _local;
  final HistoryNetworkDatasource _network;

  HistoryRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
