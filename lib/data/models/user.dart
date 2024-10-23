import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  String? userEmail;
  @HiveField(3)
  String? userPassword;
  @HiveField(4)
  String? userTransactions;
  @HiveField(5)
  String? userCurrency;
  @HiveField(6)
  String? monthlyLimit;
  @HiveField(7)
  String? userBalance;
  @HiveField(7)
  String? userExpense;

  User(
      this.userId,
      this.userEmail,
      this.userBalance,
      this.monthlyLimit,
      this.userPassword,
      this.userTransactions,
      this.userCurrency,
      this.userExpense,
      this.userName) {}

  factory User.UserFromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
