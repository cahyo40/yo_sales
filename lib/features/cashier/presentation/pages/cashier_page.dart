import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cashier_provider.dart';

class CashierPage extends ConsumerWidget {
  const CashierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(cashierNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashier'),
        centerTitle: true,
      ),
      body: asyncState.when(
        data: (data) => const Center(
          child: Text(
            'CashierPage is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
