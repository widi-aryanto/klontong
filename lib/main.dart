import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:klontong/presentation/bloc/add/add_bloc.dart';
import 'package:klontong/presentation/bloc/detail/detail_bloc.dart';
import 'package:klontong/presentation/bloc/home/home_bloc.dart';
import 'package:klontong/presentation/bloc/language/language_bloc.dart';
import 'package:klontong/utils/navigation/navigation_helper.dart';
import 'package:klontong/utils/routes/route_helper.dart';
import 'package:klontong/utils/routes/route_observer_helper.dart';

import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// state navigation (provider and bloc)
      providers: [
        BlocProvider(create: (_) => di.getIt<HomeBloc>()),
        BlocProvider(create: (_) => di.getIt<DetailBloc>()),
        BlocProvider(create: (_) => di.getIt<LanguageBloc>()),
        BlocProvider(create: (_) => di.getIt<AddBloc>()),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Klontong',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            /// navigation and route
            navigatorObservers: [
              routeObserver,
            ],
            initialRoute: homeRoute,
            onGenerateRoute: RouteHelper.generateRoute,
            navigatorKey: NavigationHelper.navigatorKey,
            locale: state.selectedLanguage.value,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
          );
        },
      ),
    );
  }
}