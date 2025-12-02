import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/report_provider.dart';

class ReportPage extends ConsumerWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(reportNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
        centerTitle: true,
      ),
      body: asyncState.when(
        data: (data) => const Center(
          child: Text(
            'ReportPage is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
