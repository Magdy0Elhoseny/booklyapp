import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getit.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getit.get<ApiService>(),
    ),
  );
  getit.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      getit.get<ApiService>(),
    ),
  );
}
