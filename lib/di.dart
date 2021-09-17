import 'package:flutter_library/core/api/request_handler.dart';
import 'package:flutter_library/core/db/db_handler.dart';
import 'package:flutter_library/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_library/features/favorites/datasources/favorites_datasource.dart';
import 'package:flutter_library/features/favorites/repository/favorites_repository.dart';
import 'package:flutter_library/features/search/bloc/search_bloc.dart';
import 'package:flutter_library/features/search/datasources/search_datasource.dart';
import 'package:flutter_library/features/search/repository/search_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> diSetup() async {
  final di = GetIt.I;

  //BLOC
  di.registerFactory<SearchBloc>(() => SearchBloc(di()));
  di.registerFactory<FavoritesBloc>(() => FavoritesBloc(di()));

  //Repository
  di.registerLazySingleton<ISearchRepository>(() => SearchRepository(di()));
  di.registerLazySingleton<IFavoriteRepository>(() => FavoriteRepository(di()));

  //Datasource
  di.registerLazySingleton<ISearchDatasource>(() => SearchDatasource(di()));
  di.registerLazySingleton<IFavoriteDatasource>(() => FavoriteDatasource(di()));

  //External
  di.registerLazySingleton<IRequestHandler>(() => RequestHandler());
  di.registerLazySingleton<IDbHandler>(() => DbHandler());
}
