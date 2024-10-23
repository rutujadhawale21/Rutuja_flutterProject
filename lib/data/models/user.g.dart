// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['userId'] as String?,
      json['userEmail'] as String?,
      json['userBalance'] as String?,
      json['monthlyLimit'] as String?,
      json['userPassword'] as String?,
      json['userTransactions'] as String?,
      json['userCurrency'] as String?,
      json['userExpense'] as String?,
      json['userName'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userPassword': instance.userPassword,
      'userTransactions': instance.userTransactions,
      'userCurrency': instance.userCurrency,
      'monthlyLimit': instance.monthlyLimit,
      'userBalance': instance.userBalance,
      'userExpense': instance.userExpense,
    };
