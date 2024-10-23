import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutuja_fintech_application/constants/constants.dart';
import 'package:rutuja_fintech_application/data/models/user.dart';
import 'package:rutuja_fintech_application/network/dio_client.dart';

class UserRepo {
  final Ref ref;

  UserRepo(this.ref);

  Future<List<User>> getAllUsers() async {
    try {
      final response =
          await ref.read(dioProvider).get(APIEndpoints.currencyAPIUrl);
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.data);
        final List<User> userList =
            decodedJson.map<User>((user) => User.UserFromJson(user)).toList();
        log(userList.toString());
        return userList;
      } else {
        throw Exception('Failed to load pockemons');
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

final userRepoProvider = Provider((ref) => UserRepo(ref));
