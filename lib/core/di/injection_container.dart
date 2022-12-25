import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../networking/network_info.dart';
import '../../networking/network_info_impl.dart';
import '../../networking/remote_api_repository.dart';
import '../../networking/remote_api_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // common
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerFactory<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerFactory<RemoteApiRepository>(
      () => RemoteApiRepositoryImpl(dio: sl(), networkInfo: sl()));
}
