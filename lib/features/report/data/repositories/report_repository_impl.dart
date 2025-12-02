import '../../domain/repositories/report_repository.dart';
import '../datasources/report_local_datasource.dart';
import '../datasources/report_network_datasource.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportLocalDatasource _local;
  final ReportNetworkDatasource _network;

  ReportRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
