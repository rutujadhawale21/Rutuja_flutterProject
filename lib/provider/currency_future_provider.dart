import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/user.dart';
import '../repo/user_repo.dart';

final curencyFutureProvider = FutureProvider<List<User>>((ref) async {
  return await ref.watch(userRepoProvider).getAllUsers();
});
