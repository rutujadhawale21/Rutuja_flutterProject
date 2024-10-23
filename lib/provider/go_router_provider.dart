import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rutuja_fintech_application/screens/dashboard_screen.dart';
import 'package:rutuja_fintech_application/screens/login_screen.dart';
import 'package:rutuja_fintech_application/screens/transaction_history.dart';

import '../utils/route_names.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouteNames.login.path(),
    routes: [
      GoRoute(
        path: RouteNames.login.path(),
        name: RouteNames.login,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: RouteNames.dashboard.path(),
        name: RouteNames.dashboard,
        builder: (context, state) {
          return const DashboardScreen();
        },
      ),
      GoRoute(
        path: RouteNames.transactionDetails.path(),
        name: RouteNames.transactionDetails,
        builder: (context, state) {
          return const TransactionHistory();
        },
      ),
    ],
  );
});
