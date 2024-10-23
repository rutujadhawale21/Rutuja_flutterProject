import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rutuja_fintech_application/provider/go_router_provider.dart';

import '../utils/route_names.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final ScrollController scrollController = ScrollController();
  String result = 'No Result';
  final String _methodChannelName = 'com.bajajfinserv.in/method_channel';
  late MethodChannel _methodChannel;

  final String showDialogMethodName = 'showToast';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    context.go(RouteNames.transactionDetails.path());
                  },
                  child: const Text('Show Transactions'))
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Your Expense Profile",
                style: TextStyle(color: Colors.black),
              ),
              background: Image.network(
                fit: BoxFit.cover,
                'https://st2.depositphotos.com/1004907/7242/i/450/depositphotos_72425601-stock-photo-personal-finance-background-concept-glowing.jpg',
                width: double.infinity,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User: $index '),
                    const Row(
                      children: [
                        Text('Total expense: '),
                        Text('10000'),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
