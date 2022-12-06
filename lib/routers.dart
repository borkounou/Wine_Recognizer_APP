import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wine_recognizer/models/product.dart';
import 'package:wine_recognizer/pages/admin/add_product_page.dart';
import 'package:wine_recognizer/pages/admin/admin_comment_page.dart';
import 'package:wine_recognizer/pages/auth/pages/auth_page.dart';
import 'package:wine_recognizer/pages/cart/cart_page.dart';
import 'package:wine_recognizer/pages/home/bottom_navigation_bar.dart';
import 'package:wine_recognizer/pages/home/home_page.dart';
import 'package:wine_recognizer/pages/products/popular_wine_description_page.dart';
import 'package:wine_recognizer/pages/products/reviews_comments_page.dart';
import 'package:wine_recognizer/pages/search/pages/search_screen.dart';
import 'package:wine_recognizer/pages/searcher/camera_page.dart';
import 'package:wine_recognizer/pages/searcher/image_search_result_page.dart';
import 'package:wine_recognizer/pages/searcher/image_search_wine_description.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case MyHomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MyHomePage(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case CameraPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CameraPage(),
      );
    case WineSearchResult.routeName:
      var image = routeSettings.arguments as File;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WineSearchResult(image: image),
      );

    case CartPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CartPage(),
      );

    case ImageSearchWineDetail.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ImageSearchWineDetail(),
      );

    case PopularWineDescription.routeName:
      var product = routeSettings.arguments as Product;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PopularWineDescription(product: product),
      );

    case ReviewsCommentsPage.routeName:
      var product = routeSettings.arguments as Product;

      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ReviewsCommentsPage(product: product),
      );

    case DeleteCommentsPage.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DeleteCommentsPage(product: product),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(child: Text("Screen does not exist")),
              ));
  }
}
