import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library/core/navigator/navigator.dart';
import 'package:flutter_library/core/scroll/custom_scroll_behavior.dart';
import 'package:flutter_library/core/theme/theme.dart';
import 'package:flutter_library/di.dart';
import 'package:flutter_library/features/favorites/bloc/favorites_bloc.dart';
import 'package:flutter_library/features/search/bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(create: (_) => GetIt.I<SearchBloc>()),
        BlocProvider<FavoritesBloc>(create: (_) => GetIt.I<FavoritesBloc>()),
      ],
      child: MaterialApp(
        title: 'NW Library',
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.theme(),
        onGenerateRoute: CustomNavigator.onGenerateRoute,
      ),
    );
  }
}
