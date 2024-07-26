import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/views/auth/auth_view.dart';
import 'package:carting/presentation/views/cars/cars_view.dart';
import 'package:carting/presentation/views/error_view.dart';
import 'package:carting/presentation/views/home/home_deliver_view.dart';
import 'package:carting/presentation/views/home/home_view.dart';
import 'package:carting/presentation/views/home/main_view.dart';
import 'package:carting/presentation/views/home/main_view_deliver.dart';
import 'package:carting/presentation/views/home/notification_view.dart';
import 'package:carting/presentation/views/orders/order_deliver_view.dart';
import 'package:carting/presentation/views/orders/order_history_view.dart';
import 'package:carting/presentation/views/orders/order_view.dart';
import 'package:carting/presentation/views/profile/profile_info_view.dart';
import 'package:carting/presentation/views/profile/profile_view.dart';
import 'package:carting/presentation/views/profile/profile_view_deliver.dart';
import 'package:carting/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

sealed class AppRouts {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRouteName.splash,
    errorBuilder: (context, state) => const ErrorView(),
    routes: [
      GoRoute(
        path: AppRouteName.errorFound,
        builder: (context, state) => const ErrorView(),
      ),
      GoRoute(
        path: AppRouteName.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRouteName.auth,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: AppRouteName.profileInfo,
        builder: (context, state) => const ProfileInfoView(),
      ),
      GoRoute(
        path: AppRouteName.notification,
        builder: (context, state) => const NotificationView(),
      ),
      mainView,
      mainViewDeliver,
    ],
  );

  static final mainView = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MainView(navigationShell: navigationShell);
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.home,
            builder: (context, state) => const HomeView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.delivery,
            builder: (context, state) => const OrderView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.profile,
            builder: (context, state) => const ProfileView(),
          ),
        ],
      ),
    ],
  );

  static final mainViewDeliver = StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return MainViewDeliver(navigationShell: navigationShell);
    },
    branches: <StatefulShellBranch>[
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.homeDeliver,
            builder: (context, state) => const HomeDeliverView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.orders,
            builder: (context, state) => const OrderDeliverView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.cars,
            builder: (context, state) => const CarsView(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: AppRouteName.profileDeliver,
            builder: (context, state) => const ProfileDeliverView(),
          ),
          GoRoute(
            path: AppRouteName.ordersHistory,
            builder: (context, state) => const OrderHistoryView(),
          ),
        ],
      ),
    ],
  );
}
