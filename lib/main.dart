import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rutuja_fintech_application/screens/login_screen.dart';

import 'provider/go_router_provider.dart';
import 'repo/hive_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveRepo().registerAdapter();

  runApp(const ProviderScope(child: FintechApp()));
}

class FintechApp extends ConsumerWidget {
  const FintechApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouterConfig = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouterConfig,
    );
  }
}
