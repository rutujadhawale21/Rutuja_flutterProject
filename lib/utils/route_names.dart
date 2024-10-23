class RouteNames {
  static const String login = 'Login';
  static const String dashboard = 'Dashbaord';
  static const String transactionDetails = 'Transaction Details';
  static const String accountSettings = 'Account Settings';
  static const String moneyTransfer = 'Money Transfers';
}

extension GoRouterPath on String {
  String path() => '/$this';
}
