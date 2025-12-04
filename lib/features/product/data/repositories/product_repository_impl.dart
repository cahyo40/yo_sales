import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';
import '../datasources/product_network_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDatasource _local;
  final ProductNetworkDatasource _network;

  ProductRepositoryImpl(this._local, this._network);

  // implement your methods here (network-first, local-fallback)
}
