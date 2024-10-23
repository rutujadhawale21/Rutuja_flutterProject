import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rutuja_fintech_application/data/models/user.dart';

class HiveRepo {
  final userBoxName = 'Box';

  void registerAdapter() {
    //Hive.registerAdapter();
  }

  Future addUserToHive(User user) async {
    final userBox = await Hive.openBox<User>(userBoxName);

    if (userBox.isOpen) {
      // await userBox.put(userBox.userId!, userBox);
      userBox.close();
    } else {
      throw Exception('Box is not open');
    }
  }

  Future deleteUserFromHive(String id) async {
    final userBox = await Hive.openBox<User>(userBoxName);
    if (userBox.isOpen) {
      userBox.delete(id);
    } else {
      throw Exception('Box is not open');
    }
  }

  Future<List<User>> getAllUserFromHive() async {
    final userBox = await Hive.openBox<User>(userBoxName);
    if (userBox.isOpen) {
      return userBox.values.toList();
    } else {
      throw Exception('Box is not open');
    }
  }
}

final hiveRepoProvider = Provider<HiveRepo>((ref) => HiveRepo());
