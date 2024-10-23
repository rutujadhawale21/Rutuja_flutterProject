import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Column(
        children: [
          ListView.separated(
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('User Name'),
                  leading: Column(
                    children: [Text('Amount'), Text('Date'), Text('Category')],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: 10)
        ],
      ),
    );
  }
}
