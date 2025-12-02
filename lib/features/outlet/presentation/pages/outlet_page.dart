import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/outlet_provider.dart';

class OutletPage extends ConsumerWidget {
  const OutletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(outletNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Outlet'),
        centerTitle: true,
      ),
      body: asyncState.when(
        data: (data) => const Center(
          child: Text(
            'OutletPage is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
