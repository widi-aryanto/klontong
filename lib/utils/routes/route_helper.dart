import 'package:flutter/material.dart';
import 'package:klontong/domain/entity/detail_page_argument.dart';
import 'package:klontong/presentation/page/add_page.dart';
import 'package:klontong/presentation/page/detail_page.dart';
import 'package:klontong/presentation/page/home_page.dart';
import 'package:klontong/presentation/page/unknown_page.dart';

part 'route_name_helper.dart';

class RouteHelper {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final routeName = settings?.name;
    final arguments = settings?.arguments;

    switch (routeName) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        );
      case detailRoute:
        if (arguments is DetailPageArgument) {
          return MaterialPageRoute(
            builder: (context) => DetailPage(
              argument: arguments,
            ),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (context) => const UnknownPage(),
        );
      case addRoute:
        return MaterialPageRoute(
          builder: (context) => const AddPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const UnknownPage(),
        );
    }
  }
}